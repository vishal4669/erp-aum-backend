<?php

namespace App\Http\Controllers\v1;

use App\Models\Formula;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Models\Customer;
use App\Models\Employee;
use DB;
use Log;
use Illuminate\Support\Facades\Validator;
use function PHPUnit\Framework\isEmpty;

class FormulaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        try {
            $loggedInUserData = Helper::getUserData();
            $is_dropdown = (isset($request->is_dropdown) && $request->is_dropdown == 1 ? 1 : 0);
            if ($is_dropdown) {
                $data = DB::table('view_formulas')
                    ->select('id', 'formula_name', 'formula_type', 'deleted_at');
            } else {
                $data = DB::table('view_formulas')->select('*')
                    ->where('mst_companies_id', $loggedInUserData['company_id']);
            }
            $data = $data->where('deleted_at', null)
                ->where('is_active', 1)
                ->orderBy('id', 'desc')
                ->get();
            Log::info("Formula list details : " . json_encode($request->all()));
            return Helper::response("Formula List Shown Successfully", Response::HTTP_OK, True, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function export(Request $request)
    {
        //
        try {
            $loggedInUserData = Helper::getUserData();
            $data = Formula::where('mst_companies_id', $loggedInUserData['company_id'])
                ->where('is_active', 1)
                ->orderBy('id', 'desc')
                ->get();

            Log::info("Formula Exportlist details : " . json_encode($request->all()));
            return Helper::response("Formula Exportlist Shown Successfully", Response::HTTP_OK, True, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function uniq_username(Request $request)
    {
        //
        $username = $request->username;
        $id = $request->id;

        if ($id == '' || $id = null) {
            $check_employee = Employee::where("username", $username)->get();
            $check_customer = Customer::where("user_name", $username)->get();
            if ($check_employee->isEmpty() == false || $check_customer->isEmpty() == false) {
                //if username already exist in employee or customer table
                return true;
            }
        } else {
            $check_employee = Employee::whereNotIn('id', $id)->where("username", $username)->get();
            $check_customer = Customer::whereNotIn('id', $id)->where("user_name", $username)->get();
            if ($check_employee->isEmpty() == false || $check_customer->isEmpty() == false) {
                //if username already exist in employee or customer table
                return true;
            }
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
        //
        try {
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'formula_name' => 'required',
                'formula_type' => 'max:155',
            ];

            $messages = [
                'formula_name.required' => "Formula Name is Required",
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $data = Formula::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'formula_name' => (isset($request->formula_name) ? $request->formula_name : NULL),
                'formula_type' => (isset($request->formula_type) ? $request->formula_type : NULL),
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'updated_at' => Null
            ]);

            DB::commit();
            Log::info("Formula Created with details : " . json_encode($request->all()));

            return Helper::response("Formula added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function show(Formula $formula, $id)
    {
        //
        try {
            $formulaData = Formula::find($id);

            Log::info("Fetch Formula details : " . json_encode(array('id' => $id)));
            return Helper::response("Formula Data Shown Successfully", Response::HTTP_OK, true, $formulaData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function edit(Formula $formula)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        try {
            $loggedInUserData = Helper::getUserData();
            $rules = [
                'formula_name' => 'required',
                'formula_type' => 'max:155',
            ];

            $messages = [
                'formula_name.required' => "Formula Name is Required",
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $data = [
                'mst_companies_id' => $loggedInUserData['company_id'],
                'formula_name' => (isset($request->formula_name) ? $request->formula_name : NULL),
                'formula_type' => (isset($request->formula_type) ? $request->formula_type : NULL),
                'updated_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
            ];
            $update_formula = Formula::find($id);
            $update_formula->update($data);
            DB::commit();
            Log::info("Formula Updated with details : " . json_encode($request->all()));

            return Helper::response("Formula updated Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Formula  $formula
     * @return \Illuminate\Http\Response
     */
    public function destroy(Formula $formula, $id)
    {
        //
        try {
            $formulaData = Formula::find($id);
            if ($formulaData !== null) {
                $formulaData->delete();
            }
            Log::info("Delete Formula details : " . json_encode(array('id' => $id)));
            return Helper::response("Formula Data Deleted Successfully", Response::HTTP_OK, true, $formulaData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
