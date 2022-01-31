<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Test;
use App\Helpers\Helper;
use App\Models\MstSampleParameter;
use App\Models\MstTestParameter;
use App\Models\ViewTest;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
use DB;


class TestController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        try {
            $loggedInUserData = Helper::getUserData();

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;
            $is_parent = (isset($request->is_parent)) ? $request->is_parent : false;
            $is_parameter = (isset($request->is_parameter)) ? $request->is_parameter : false;
            $is_test_parent = (isset($request->is_test_parent)) ? $request->is_test_parent : false;

            if ($is_dropdown) {
                // Can Use this for Export,Listing
                $data = ViewTest::select('id', 'procedure_name')
                    ->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->get()->toarray();
            } elseif ($is_parent) {
                // Can Use this for ParentDropdown for product,booking
                $data = ViewTest::select('id', 'procedure_name')
                    ->whereIn('procedure_name', ['Related', 'Assay'])
                    ->orwhere('procedure_name', 'like', 'by%')
                    ->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->get()->toarray();
            } elseif ($is_parameter) {
                // Can Use this for ParameterDropdown
                $data = ViewTest::select('id', 'procedure_name','price')
                    ->where('procedure_name','!=','Related')
                    ->where('procedure_name','!=','Assay')
                    ->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->orderBy('procedure_name','asc')
                    ->get()->toarray();
            } elseif ($is_test_parent) {
                // Can Use this for Parent Dropdown in Procedure add
                $data = ViewTest::select('id', 'procedure_name')
                    ->whereNotNull('price')
                    ->where('procedure_name', 'not like', 'Related')
                    ->where('procedure_name', 'not like', 'Assay')
                    ->where('deleted_at', NULL)
                    ->where('is_active', 1)
                    ->orderBy('procedure_name', 'asc')
                    ->get()->toarray();
            } else {
                $data = ViewTest::select('id', 'procedure_name', 'price', 'test_procedure', 'test_code', 'parent_id')
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->where('is_active', 1)
                    ->where('procedure_name', 'not like', 'Related')
                    ->where('procedure_name', 'not like', 'Assay')
                    ->where('deleted_at', NULL)
                    ->orderBy('id', 'desc')
                    ->get()->each(function ($item) {
                        $item->append('parent_name');
                    })->toarray();

                /*  ->get()->each(function ($item) {
                        $item->append('parent_name', 'parent_dropdown');
                    })->toarray();*/
            }


            return Helper::response("Test List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {

            $rules = [
                'procedure_name' => 'required|max:255',
                'price' => 'nullable|numeric|between:0,9999999999999999999999.99',
                //'test_code' => 'required|max:50',
                //'test_category' => 'required|max:255',
                'test_procedure' => 'required'
            ];

            $messages = [
                'procedure_name.required' => 'The Procedure Name field is required',
                'procedure_name.max' => 'The Test Procedure Name must be less than or equal to 255 characters',
                'price.numeric' => 'The Test Price must be number',
                'price.between' => 'The Test Price must be number "120 OR 120.10"',
                //'test_code.required' => 'The Test Code field is required',
                //  'test_code.max' => 'The Test Code must be less than or equal to 50 characters',
                //'test_category.required' => 'The Test Category field is required',
                //  'test_category.max' => 'The Test Category must be less than or equal to 255 characters',
                'test_procedure.required' => 'The Test Procedure field is required'
            ];

            $validator = Validator::make($request->all(), $rules, $messages);


            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            $input = $request->all();
            $data = Test::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'procedure_name' => $input['procedure_name'],
                'price' => (isset($input['price']) ? $input['price'] : NULL),
                'test_code' => $input['test_code'],
                'test_category' => $input['test_category'],
                'test_procedure' => $input['test_procedure'],
                'parent_id' => (isset($input['parent_id']) && $input['parent_id'] != '' && $input['parent_id'] != null) ? $input['parent_id'] : 0,
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_at' => NULL
            ]);
            if (isset($request->test_parameter)) {
                $this->testParameter($request->test_parameter, $data->id);
            }
            DB::commit();
            Log::info("Test Created with details : " . json_encode($data));

            return Helper::response("Test Added Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     *Call Back Function For Tests Parameters.
     *
     * @param  $testParams_Data
     * @return
     */

    public function testParameter($testParams_data, $test_id = "")
    {
        $loggedInUserData = Helper::getUserData();
        if (!empty($testParams_data)) {
            $delete_exist_test = MstTestParameter::where('mst_test_id', $test_id);
            if ($delete_exist_test != null) {
                $delete_exist_test->delete();
            }

            foreach ($testParams_data as $key => $item) {

                if (
                    !empty($item['test_parameter_name']) or
                    !empty($item['test_alpha']) or
                    !empty($item['formula']) or
                    !empty($item['type']) or
                    !empty($item['unit']) or
                    !empty($item['sort'])
                ) {
                    $testParams_arr = array(
                        'mst_companies_id' => $loggedInUserData['company_id'],
                        "mst_test_id" => $test_id,
                        "test_by_pass" => (isset($item['test_by_pass'])) ? $item['test_by_pass'] : null,
                        "test_parameter_name"   => (isset($item['test_parameter_name'])) ? $item['test_parameter_name'] : '',
                        "test_alpha"    => (isset($item['test_alpha'])) ? $item['test_alpha'] : '',
                        "formula"   => (isset($item['formula'])) ? $item['formula'] : null,
                        "type"  => (isset($item['type'])) ? $item['type'] : '',
                        "unit"  => (isset($item['unit'])) ? $item['unit'] : null,
                        "value" => (isset($item['value'])) ? $item['value'] : '',
                        "sort"  => (isset($item['sort'])) ? $item['sort'] : '',
                        'is_active' => 1,
                        "created_by" => $loggedInUserData['logged_in_user_id'],
                        "updated_by" => $loggedInUserData['logged_in_user_id'],
                        "selected_year" => $loggedInUserData['selected_year'],
                    );

                    MstTestParameter::create($testParams_arr);
                }
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        Log::info("Fetch Test details : " . json_encode(array('id' => $id)));
        try {

            $testData = ViewTest::with('parameters')->where('id', $id)
                ->get()
                ->each(function ($item) {
                    $item->append('parent_name', 'parent_dropdown');
                });
            return Helper::response("Test Data Shown Successfully", Response::HTTP_OK, true, $testData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request, $id)
    {
        try {

            $rules = [
                'procedure_name' => 'required|max:255',
                'price' => 'nullable|numeric|between:0,9999999999999999999999.99',
                //'test_code' => 'required|max:50',
                //'test_category' => 'required|max:255',
                'test_procedure' => 'required'
            ];

            $messages = [
                'procedure_name.required' => 'The Procedure Name field is required',
                'procedure_name.max' => 'The Test Procedure Name must be less than or equal to 255 characters',
                'price.numeric' => 'The Test Price must be number',
                'price.between' => 'The Test Price must be number "120 OR 120.10"',
                //'test_code.required' => 'The Test Code field is required',
                //  'test_code.max' => 'The Test Code must be less than or equal to 50 characters',
                //'test_category.required' => 'The Test Category field is required',
                //  'test_category.max' => 'The Test Category must be less than or equal to 255 characters',
                'test_procedure.required' => 'The Test Procedure field is required'
            ];

            $validator = Validator::make($request->all(), $rules, $messages);


            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['procedure_name'] = $input['procedure_name'];
            $input_data['price'] = (isset($input['price']) ? $input['price'] : NULL);
            $input_data['test_code'] = $input['test_code'];
            $input_data['test_category'] = $input['test_category'];
            $input_data['test_procedure'] = $input['test_procedure'];
            $input_data['parent_id'] = (isset($input['parent_id']) && $input['parent_id'] != '' && $input['parent_id'] != null) ? $input['parent_id'] : 0;
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id'];

            if (isset($request->test_parameter)) {
                $this->testParameter($request->test_parameter, $id);
            }

            Log::info("Category updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $test = Test::find($id);
            $test->update($input_data);

            return Helper::response("Test updated successfully", Response::HTTP_OK, true, $test);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        try {
            $data = array();
            $test = Test::find($id);
            $test_params = MstTestParameter::where('mst_test_id', $id);
            Log::info("Test deleted with : " . json_encode(array('id' => $id)));

            if (!empty($test)) {
                $test->delete();
                if (!empty($test_params)) {
                    $test_params->delete();
                }
                return Helper::response("Test deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Test not exists", Response::HTTP_NOT_FOUND, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
