<?php

namespace App\Http\Controllers\v1;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use Auth;
use DB;
use App\Models\MstProduct;
use App\Models\MstProductSample;
use App\Models\MstSampleParameter;
use App\Models\MstProductParent;


class MstProductController extends Controller
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
            $is_dropdown = (isset($request->is_dropdown) && $request->is_dropdown == 1) ? 1 : 0;
            $is_generic = (isset($request->is_generic) && $request->is_generic == 1) ? 1 : 0;

            if (!$is_dropdown && !$is_generic) {
                $data = MstProduct::select('id', 'product_name', 'product_generic', 'marker_specification', 'is_generic', 'is_active', 'pharmacopiea_id', 'generic_product_id')->with('pharmacopiea:id,pharmacopeia_name', 'generic:id,product_name')
                    ->where('is_active', 1)
                    ->where('selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('id', 'desc')
                    ->paginate(10);
            } elseif ($is_dropdown) {
                $data = MstProduct::select('id', 'product_name', 'product_generic', 'marker_specification', 'is_generic', 'is_active', 'pharmacopiea_id', 'generic_product_id')->with('pharmacopiea:id,pharmacopeia_name', 'generic:id,product_name')
                    ->where('is_active', 1)
                    ->where('selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('id', 'desc')
                    ->get();
            }
            if ($is_generic) {
                $data = MstProduct::select('id', 'product_name', 'product_generic', 'marker_specification', 'is_generic', 'is_active', 'pharmacopiea_id', 'generic_product_id')->with('pharmacopiea:id,pharmacopeia_name', 'generic:id,product_name')
                    ->where('is_generic', 1)
                    ->where('is_active', 1)
                    ->where('selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('id', 'desc')
                    ->get();
            }

            $data_arr = $data->isEmpty();

            if ($data_arr) {

                return Helper::response("Product List is Empty", Response::HTTP_OK, true, $data);
            } else {

                return Helper::response("Product List Shown Successfully", Response::HTTP_OK, true, $data);
            }
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
    public function param_list()
    {
        try {

            $paramData = MstSampleParameter::all();

            return Helper::response("Parameter Data Shown Successfully", Response::HTTP_OK, true, $paramData);
        } catch (Exception $e) {
            $paramData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $paramData);
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function parent_list()
    {
        try {
            $parentData = MstProductParent::orderBy('id', 'desc')->get();

            return Helper::response("Parameter Data Shown Successfully", Response::HTTP_OK, true, $parentData);
        } catch (Exception $e) {
            $parentData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $parentData);
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            $validator = Validator::make($request->all(), [
                "product_name" => 'required|string|max:255',
                "product_generic" => 'required|string|max:255',
                "pharmacopiea_id" => 'required|integer',
            ]);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $loggedInUserData = Helper::getUserData();
            $data = MstProduct::create([
                "mst_companies_id" => $loggedInUserData['company_id'],
                "product_name" => ($request->get('product_name')) ? $request->get('product_name') : '',
                "product_generic" => ($request->get('product_generic')) ? $request->get('product_generic') : '',
                "marker_specification" => ($request->get('marker_specification')) ? $request->get('marker_specification') : '',
                "pharmacopiea_id" => ($request->get('pharmacopiea_id')) ? $request->get('pharmacopiea_id') : 0,
                "generic_product_id" => ($request->get('generic_product_id')) ? $request->get('generic_product_id') : 0,
                "packing_detail" => ($request->get('packing_detail')) ? $request->get('packing_detail') : '',
                "sample_description" => ($request->get('sample_description')) ? $request->get('sample_description') : '',
                "hsn_code" => ($request->get('hsn_code')) ? $request->get('hsn_code') : '',
                "is_generic" => ($request->get('is_generic')) ? $request->get('is_generic') : 0,
                "is_active" => ($request->get('is_active')) ? $request->get('is_active') : 1,
                "selected_year" => $loggedInUserData['selected_year'],
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ]);

            $mst_product_id = $data->id;

            $this->addupdateProductSample($request->sample_details, $mst_product_id);

            DB::commit();
            Log::info("Products Created with details : " . json_encode($request->all()));
            return Helper::response("Products added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function addupdateProductSample($samples, $product_id)
    {

        if (!empty($samples) || $samples != NULL || $samples != "") {

            $loggedInUserData = Helper::getUserData();
            $sample_count = count($samples);

            if ($sample_count) {

                // Delete all old   
                $sampledata = MstProductSample::where('mst_product_id', $product_id);
                $sampledata->delete();

                foreach ($samples as $sample) {
                    if (
                        !empty($sample['by_pass'])

                    ) {
                        if (
                            !empty($sample['parent']) or
                            !empty($sample['mst_sample_parameter_id']) or
                            !empty($sample['parameter_name']) or
                            !empty($sample['label_claim']) or
                            !empty($sample['min_limit']) or
                            !empty($sample['max_limit']) or
                            !empty($sample['amount']) or
                            !empty($sample['method']) or
                            !empty($sample['description']) or
                            !empty($sample['division']) or
                            !empty($sample['nabl']) or
                            !empty($sample['formula'])
                        ) {

                            $is_exists = MstSampleParameter::where('parameter_name', '=', $sample['parameter_name'])->first();
                            $parameter_id = NULL;

                            if ($sample['parameter_name'] != '') {

                                if ($is_exists == null) {

                                    $parameterArray = array(
                                        'mst_companies_id' => $loggedInUserData['company_id'],
                                        'parameter_name' => ($sample['parameter_name']) ? $sample['parameter_name'] : '',
                                        'is_active' => 1,
                                        'selected_year' => $loggedInUserData['selected_year'],
                                        'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                                        'updated_by' => $loggedInUserData['logged_in_user_id']
                                    );

                                    $parameters = MstSampleParameter::create($parameterArray);
                                    $parameter_id = $parameters->id;
                                } else {
                                    $parameter_id = $is_exists->id;
                                }
                            }

                            $sample_data = array(
                                'mst_product_id' => $product_id,
                                'by_pass' => (isset($sample['by_pass'])) ? $sample['by_pass'] : 2,
                                'parent' => (isset($sample['parent'])) ? $sample['parent'] : '',
                                'mst_sample_parameter_id' => $parameter_id,
                                'label_claim' => (isset($sample['label_claim'])) ? $sample['label_claim'] : '',
                                'min_limit' => (isset($sample['min_limit'])) ? $sample['min_limit'] : '',
                                'max_limit' => (isset($sample['max_limit'])) ? $sample['max_limit'] : '',
                                'amount' => (isset($sample['amount'])) ? $sample['amount'] : '',
                                'method' => (isset($sample['method'])) ? $sample['method'] : '',
                                'description' => (isset($sample['description'])) ? $sample['description'] : '',
                                'division' => (isset($sample['division'])) ? $sample['division'] : '',
                                'nabl' => (isset($sample['nabl'])) ? $sample['nabl'] : '',
                                'formula' => (isset($sample['formula'])) ? $sample['formula'] : '',
                                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                                'updated_by' => $loggedInUserData['logged_in_user_id']
                            );

                            MstProductSample::create($sample_data);
                        }
                    }
                }
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\MstProduct  $mstProduct
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = MstProduct::with('samples', 'samples.parameter', 'samples.parent')->find($id);

        return Helper::response("This Product Shown Successfully", Response::HTTP_OK, true, $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\MstProduct  $mstProduct
     * @return \Illuminate\Http\Response
     */
    public function edit(MstProduct $mstProduct)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\MstProduct  $mstProduct
     * @return \Illuminate\Http\Response
     */
    public function update(MstProduct $mstProduct, Request $request, $id)
    {
        try {

            $validator1 = Validator::make($request->all(), [
                "product_name" => 'required|string|max:255',
                "product_generic" => 'required|string|max:255',
                "pharmacopiea_id" => 'required|integer',
            ]);

            if ($validator1->fails()) {
                $data1 = array();
                return Helper::response($validator1->errors()->all(), Response::HTTP_OK, false, $data1);
            }

            $loggedInUserData = Helper::getUserData();
            $input_data = [
                "mst_companies_id" => $loggedInUserData['company_id'],
                "product_name" => ($request->get('product_name')) ? $request->get('product_name') : '',
                "product_generic" => ($request->get('product_generic')) ? $request->get('product_generic') : '',
                "marker_specification" => ($request->get('marker_specification')) ? $request->get('marker_specification') : '',
                "pharmacopiea_id" => ($request->get('pharmacopiea_id')) ? $request->get('pharmacopiea_id') : 0,
                "generic_product_id" => ($request->get('generic_product_id')) ? $request->get('generic_product_id') : 0,
                "packing_detail" => ($request->get('packing_detail')) ? $request->get('packing_detail') : '',
                "sample_description" => ($request->get('sample_description')) ? $request->get('sample_description') : '',
                "hsn_code" => ($request->get('hsn_code')) ? $request->get('hsn_code') : '',
                "is_generic" => ($request->get('is_generic')) ? $request->get('is_generic') : 0,
                "is_active" => ($request->get('is_active')) ? $request->get('is_active') : 1,
                "selected_year" => $loggedInUserData['selected_year'],
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ];

            $product_id = $id;
            $this->addupdateProductSample($request->sample_details, $product_id);


            Log::info("Product updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $product = MstProduct::find($id);
            $product->update($input_data);

            return Helper::response("Product updated successfully", Response::HTTP_OK, true, $product);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\MstProduct  $mstProduct
     * @return \Illuminate\Http\Response
     */
    public function destroy(MstProduct $mstProduct, $id)
    {
        //
        try {
            $data = array();
            $mst_product = MstProduct::find($id);
            $mst_sample = MstProductSample::where("mst_product_id", $id);

            Log::info("Customer deleted with : " . json_encode(array('id' => $id)));

            if (!empty($mst_product)) {
                $mst_product->delete();
                if (!empty($mst_sample)) {
                    $mst_sample->delete();
                }
                return Helper::response("Products and Product_sample deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Products not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
