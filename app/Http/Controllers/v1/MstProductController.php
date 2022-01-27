<?php

namespace App\Http\Controllers\v1;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Models\Machine;
use Auth;
use DB;
use App\Models\MstProduct;
use App\Models\MstSampleParameter;
use App\Models\MstProductSample;
use App\Models\MstProductParent;
use App\Models\Pharmacopeia;
use App\Models\Test;
use App\Models\ViewMethod;
use App\Models\ViewProduct;
use App\Models\ViewProductSamples;
use Illuminate\Support\Arr;
use JWTAuth;


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

            if ($is_dropdown) {
                $data = ViewProduct::select(
                    'id',
                    'product_name'
                )->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->orderBy('id', 'desc')
                    ->get();
            } elseif ($is_generic) {

                $data = ViewProduct::select(
                    'id',
                    'generic_product_name',
                    'is_active'
                )->groupby('generic_product_name')
                    ->where('is_active', 1)
                    ->wherenotnull('generic_product_name')
                    ->where('deleted_at', NULL)
                    ->orderBy('id', 'desc')
                    ->get();
            } else {
                $data = ViewProduct::select(
                    'id',
                    'pharmacopeia_id',
                    'product_name',
                    'product_generic',
                    'generic_product_name',
                    'sample_description',
                    'packing_detail',
                    'marker_specification',
                    'created_at',
                    'updated_at',
                    'pharmacopeia_name',
                    'entered_by',
                    'modified_by'
                )
                    ->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
                // ->each(function ($item) {
                //     $item->append('pharmacopeia_name');
                // });
            }

            $data_empty = $data->isEmpty();

            if ($data_empty) {

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
    public function exportlist()
    {
        try {

            $loggedInUserData = Helper::getUserData();
            $exportData = MstProduct::select(
                'id',
                'product_name',
                'product_generic',
                'packing_detail',
                'sample_description',
                'marker_specification',
                'created_by',
                'updated_by',
                'created_at',
                'updated_at',
                'pharmacopeia_id',
                'generic_product_id'
            )
                ->with(
                    'pharmacopeia:id,pharmacopeia_name',
                    'generic:id,product_name as generic_product_name',
                    'created_by:id,first_name,middle_name,last_name',
                    'updated_by:id,first_name,middle_name,last_name'
                )
                ->where('is_active', 1)
                ->where('mst_companies_id', $loggedInUserData['company_id'])
                ->orderBy('id', 'desc')
                ->get();

            $exportData_Arr = $exportData->toArray();
            $len = count($exportData_Arr);
            $i = 0;

            for ($i = 0; $i < $len; $i++) {

                if ($exportData_Arr[$i]['generic_product_id'] == null) {

                    $exportData_Arr[$i]['generic'] = array(
                        'id' => '',
                        'generic_product_name' => ''
                    );
                } else {

                    $exportData_Arr[$i]['generic'] = $exportData_Arr[$i]['generic'];
                }

                if ($exportData_Arr[$i]['created_by'] == null) {

                    $exportData_Arr[$i]['created_by'] = array(
                        "id" => "",
                        "first_name" => "",
                        "middle_name" => "",
                        "last_name" => ""
                    );
                } else {

                    $exportData_Arr[$i]['created_by'] = $exportData_Arr[$i]['created_by'];
                }

                if ($exportData_Arr[$i]['updated_by'] == null) {

                    $exportData_Arr[$i]['updated_by'] = array(
                        "id" => "",
                        "first_name" => "",
                        "middle_name" => "",
                        "last_name" => ""
                    );
                } else {

                    $exportData_Arr[$i]['updated_by'] = $exportData_Arr[$i]['updated_by'];
                }

                if ($exportData_Arr[$i]['pharmacopeia'] == null) {

                    $exportData_Arr[$i]['pharmacopeia'] = array(
                        "id" => "",
                        "pharmacopeia_name" => ""
                    );
                } else {

                    $exportData_Arr[$i]['pharmacopeia'] = $exportData_Arr[$i]['pharmacopeia'];
                }
            }

            return Helper::response("Export Data Shown Successfully", Response::HTTP_OK, true, $exportData_Arr);
        } catch (Exception $e) {
            $exportData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $exportData_Arr);
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
            $loggedInUserData = Helper::getUserData();
            $rules = [
                "product_name" => 'required|string|max:255',
                "product_generic" => 'required|string|max:255',
                "pharmacopeia_id" => 'required|integer',
                "sample_details.*.amount" => 'nullable|numeric|between:0,999999999999999999999999999.99',
                "sample_details.*.min_limit" => 'regex:/^NLT\s[0-9](?:.%)?/i',
                "sample_details.*.max_limit" => 'regex:/^NMT\s[0-9](?:.%)?/i'
            ];

            $messages = [
                "sample_details.*.min_limit.regex" => "Please Enter Valid Min Limit As 'NLT 1.00%'",
                "sample_details.*.max_limit.regex" => "Please Enter Valid Max Limit As 'NMT 1.00%'"
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $data = MstProduct::create([
                "mst_companies_id" => $loggedInUserData['company_id'],
                "product_name" => ($request->get('product_name')) ? $request->get('product_name') : NULL,
                "product_generic" => ($request->get('product_generic')) ? $request->get('product_generic') : NULL,
                "marker_specification" => ($request->get('marker_specification')) ? $request->get('marker_specification') : NULL,
                "pharmacopeia_id" => ($request->get('pharmacopeia_id')) ? $request->get('pharmacopeia_id') : NULL,
                "generic_product_name" => ($request->get('generic_product_name')) ? $request->get('generic_product_name') : NULL,
                "packing_detail" => ($request->get('packing_detail')) ? $request->get('packing_detail') : NULL,
                "sample_description" => ($request->get('sample_description')) ? $request->get('sample_description') : NULL,
                "hsn_code" => ($request->get('hsn_code')) ? $request->get('hsn_code') : NULL,
                "is_active" => ($request->get('is_active')) ? $request->get('is_active') : 1,
                "selected_year" => $loggedInUserData['selected_year'],
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_at' => NULL
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

        if (!empty($samples)) {

            $loggedInUserData = Helper::getUserData();
            $sample_count = count($samples);

            if ($sample_count) {

                // Delete all old
                $sampledata = MstProductSample::where('mst_product_id', $product_id);
                $sampledata->forceDelete();

                foreach ($samples as $sample) {
                    if (
                        !empty($sample['by_pass'])

                    ) {
                        if (
                            !empty($sample['parent']) or
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

                            $sample_data = array(
                                'mst_product_id' => $product_id,
                                'by_pass' => (isset($sample['by_pass'])) ? $sample['by_pass'] : 2,
                                'parent' => (isset($sample['parent'])) ? $sample['parent'] : 0,
                                'mst_sample_parameter_id' => (isset($sample['parameter_name'])) ? $sample['parameter_name'] : 0,
                                'label_claim' => (isset($sample['label_claim'])) ? $sample['label_claim'] : '',
                                'min_limit' => (isset($sample['min_limit'])) ? $sample['min_limit'] : '',
                                'max_limit' => (isset($sample['max_limit'])) ? $sample['max_limit'] : '',
                                'amount' => (isset($sample['amount'])) ? $sample['amount'] : 0,
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
        } else {
            $sampledata = MstProductSample::where('mst_product_id', $product_id);
            $sampledata->forceDelete();
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
        try {
            $loggedInUserData = Helper::getUserData();
            $data = ViewProduct::with('samples')->where('id', $id)
                ->where('deleted_at', NULL)->get();

            return Helper::response("This Product Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /** 
     * Copy From Generic
     * Get Samples Details From 'mst_products_samples' For Entered "generic_product_name" 
     * Where "generic_product_name" is lastly used in mstproducts
     */
    public function copy_fromGeneric(Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                'generic_product_name' => 'required'
            ]);
            if ($validation->fails()) {
                $data = array();
                return Helper::response($validation->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $product_id = ViewProduct::select('id', 'sample_description')->where('generic_product_name', $request->generic_product_name)->where('deleted_at', Null)->orderBy('id', 'DESC')->first();
            $pro_id = $product_id->id;
            $sample_description = $product_id->sample_description;
            $data = ViewProductSamples::where('mst_product_id', $pro_id)->get()->toarray();
            $product_detail = array(
                'sample_description' => $sample_description
            );
            array_push($data, $product_detail);
            return Helper::response("Samples Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
    /** 
     * Add Form => Fetch methods where products pharmacopeia & methods pharmacopeia type are equal.
     * request => pharmacopiea_id.
     * response => method dropdown.
     */
    public function method_dropdown(Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                'pharmacopiea_id' => 'required'
            ]);
            if ($validation->fails()) {
                $data = array();
                return Helper::response($validation->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $data = ViewMethod::select('id', 'name', 'type', 'date', 'deleted_at')
                ->where('type', $request->pharmacopiea_id)
                ->where('deleted_at', null)
                ->where('is_active', 1)
                ->orderBy('id', 'desc')
                ->get();
            return Helper::response("Samples Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
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
                "pharmacopeia_id" => 'required|integer',
                "sample_details.*.amount" => 'nullable|numeric|between:0,999999999999999999999999999.99',
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
                "pharmacopeia_id" => ($request->get('pharmacopeia_id')) ? $request->get('pharmacopeia_id') : 0,
                "generic_product_name" => ($request->get('generic_product_name')) ? $request->get('generic_product_name') : '',
                "packing_detail" => ($request->get('packing_detail')) ? $request->get('packing_detail') : '',
                "sample_description" => ($request->get('sample_description')) ? $request->get('sample_description') : '',
                "hsn_code" => ($request->get('hsn_code')) ? $request->get('hsn_code') : '',
                "is_active" => ($request->get('is_active')) ? $request->get('is_active') : 1,
                "selected_year" => $loggedInUserData['selected_year'],
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
