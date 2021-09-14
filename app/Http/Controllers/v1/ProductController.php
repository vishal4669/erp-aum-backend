<?php

namespace App\Http\Controllers\v1;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use Auth;
use DB;
use App\Models\Product;
use App\Models\Productdetails;
use App\Models\Productparameters;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        //
        DB::beginTransaction();
        try {
            $rules = [
                "product_name" => 'required|string|max:255',
                "amount" => '',
                "method" => '',
                "description" => '',
                "division" => '',
                "nabl" => '',
                "formula" => '',
            ];

            $messages = [];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $loggedInUserData = Helper::getUserData();
            $data = Product::create([
                "mst_companies_id" => $loggedInUserData['company_id'],
                "product_name" => ($request->get('product_name')) ? $request->get('product_name') : '',
                "product_generic" => ($request->get('product_generic')) ? $request->get('product_generic') : '',
                "marker_specification" => ($request->get('marker_specification')) ? $request->get('marker_specification') : '',
                "pharmacopiea_id" => $request->get('pharmacopiea_id'),
                "generic_product_id" => $request->get('generic_product_id'),
                "packing_detail" => ($request->get('packing_detail')) ? $request->get('packing_detail') : '',
                "sample_description" => ($request->get('sample_description')) ? $request->get('sample_description') : '',
                "hsn_code" => ($request->get('hsn_code')) ? $request->get('hsn_code') : '',
                "is_generic" => $request->get('is_generic'),
                "is_active" => $request->get('is_active'),
                "selected_year" => $loggedInUserData['selected_year'],
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ]);


            $product_id = $data->id;

            //add_productparameters
            $this->add_productparameters($request->product_details);
            // // add Product-Details
            $this->add_productdetails($request->product_details, $product_id);

            DB::commit();
            Log::info("Products Created with details : " . json_encode($request->all()));
            return Helper::response("Products added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
    //add_product parameters
    public function add_productparameters($product_details)
    {
        // dd($product_details);
        if (!empty($product_details) || $product_details != NULL || $product_details != "") {

            // Delete all old   
            // $customercontactperson = CustomerContactPerson::where('mst_customer_id', $customer_id);
            // $customercontactperson->forceDelete();

            $loggedInUserData = Helper::getUserData();

            // check if data already present for the customers contact person
            $product_details_count = count($product_details);

            if ($product_details_count) {

                foreach ($product_details as $product_data) {
                    $parametername = Productparameters::where('parameter_name', '=', $product_data['product_sample_parameter_id'])->first();
                    if ($parametername === null) {
                        // parametername does not exist
                        if (
                            !empty($product_data['product_sample_parameter_id'])
                        ) {
                            $parameterArray = array(
                                'mst_companies_id' => $loggedInUserData['company_id'],
                                'parameter_name' => (isset($product_data['product_sample_parameter_id'])) ? $product_data['product_sample_parameter_id'] : NULL,
                                'is_active' => 1,
                                'selected_year' => $loggedInUserData['selected_year'],
                                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                                'updated_by' => $loggedInUserData['logged_in_user_id']
                            );
                            Productparameters::create($parameterArray);
                        }
                    }
                }
            }
        }
    }
    //add_productdetails 
    public function add_productdetails($product_details, $product_id)
    {
        // dd($product_details);
        if (!empty($product_details) || $product_details != NULL || $product_details != "") {

            // Delete all old   
            // $customercontactperson = CustomerContactPerson::where('mst_customer_id', $customer_id);
            // $customercontactperson->forceDelete();

            $loggedInUserData = Helper::getUserData();

            // check if data already present for the customers contact person
            $product_details_count = count($product_details);

            if ($product_details_count) {

                foreach ($product_details as $product_data) {
                    if (
                        !empty($product_data['parent']) or
                        !empty($product_data['by_pass']) or
                        !empty($product_data['product_sample_parameter_id']) or
                        !empty($product_data['label_claim']) or
                        !empty($product_data['min_limit']) or
                        !empty($product_data['max_limit']) or
                        !empty($product_data['amount']) or
                        !empty($product_data['method']) or
                        !empty($product_data['description']) or
                        !empty($product_data['division']) or
                        !empty($product_data['nabl']) or
                        !empty($product_data['formula'])
                    ) {
                        $product_sample_parameter_id = Productparameters::select('id')->where('parameter_name', $product_data['product_sample_parameter_id'])->get();
                        $data = $product_sample_parameter_id->toArray();
                        $contactpersonArray = array(
                            'product_id' => $product_id,
                            'by_pass' => (isset($product_data['by_pass'])) ? $product_data['by_pass'] : NULL,
                            'parent' => (isset($product_data['parent'])) ? $product_data['parent'] : '',
                            'product_sample_parameter_id' => (isset($data[0]['id'])) ? $data[0]['id'] : NULL,
                            'label_claim' => (isset($product_data['label_claim'])) ? $product_data['label_claim'] : '',
                            'min_limit' => (isset($product_data['min_limit'])) ? $product_data['min_limit'] : '',
                            'max_limit' => (isset($product_data['max_limit'])) ? $product_data['max_limit'] : '',
                            'amount' => (isset($product_data['amount'])) ? $product_data['amount'] : '',
                            'method' => (isset($product_data['method'])) ? $product_data['method'] : '',
                            'description' => (isset($product_data['description'])) ? $product_data['description'] : '',
                            'division' => (isset($product_data['division'])) ? $product_data['division'] : '',
                            'nabl' => (isset($product_data['nabl'])) ? $product_data['nabl'] : '',
                            'formula' => (isset($product_data['formula'])) ? $product_data['formula'] : '',
                            'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                            'updated_by' => $loggedInUserData['logged_in_user_id']
                        );

                        Productdetails::create($contactpersonArray);
                    }
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
