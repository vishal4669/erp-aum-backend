<?php

namespace App\Http\Controllers\v1;

use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Models\Country;
use App\Models\State;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Mockery\Generator\StringManipulation\Pass\Pass;

class BookingPrintController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function roa_coa_print(Request $request, $id, $type = null)
    {
        //
        try {

            $print_allows = booking::find($id);
            $data = Booking::select(
                'id',
                'booking_no as certificate_no',
                'coa_release_date',
                'created_at as sample_received_date',
                'mfg_lic_no as party_mfg_licence_no',
                'reference_no as client_ref_no',
                'customer_id',
                'manufacturer_id as original_manufacturer',
                'mfg_date as date_of_manufacturing',
                'supplier_id as supplier',
                'exp_date as date_of_expiry',
                'receipte_date',
                'coa_release_date as report_issue_date',
                'statement_ofconformity',
                'report_type',
                'aum_serial_no',
                'nabl_scope',
                'roa_print',
                'booking_group'
            )
                ->with(
                    'customer_data:id,company_name,user_name',
                    'customer_data.customer_contact_data:id,mst_customer_id,street_1,street_2,area,pin,city,state,country'
                )
                ->with('original_manufacturer:id,company_name')
                ->with('supplier:id,company_name')
                ->with('sample_data:id,booking_id,product_id,batch_no as lot_batch_no,batch_size_qty_rec,sample_quantity as sample_qty_rec,sample_condition as condition_of_sample', 'sample_data.product_data:id,product_name as name_of_sample,product_generic,pharmacopeia_id,generic_product_id,sample_description', 'sample_data.product_data.generic_product_data:id,product_name as generic_name', 'sample_data.product_data.pharmacopiea_data:id,pharmacopeia_name')
                ->with('tests_data:id,booking_id,test_name as test_parameter,label_claim,result,max_limit,product_details,test_date_time as date_of_performance_test,method as method_used,approved,approval_date_time,parent,parent_child,p_sr_no,approval_date_time', 'tests_data.parent_data:id,machine_name as parent_name','tests_data.chemist_detail:id,first_name,middle_name,last_name')
                ->with('latest_test_date_time:id,booking_id,test_date_time')
                ->where('id', $id)
                ->get()->toarray();

            $rules = [
                'tests_data.*.max_limit' => 'required_without:sample_data.*.product_data.sample_description',
                'sample_data.*.product_data.sample_description' => 'required_without:tests_data.*.max_limit',
                'tests_data.*.result' => 'required',
            ];
            $msg = [
                'tests_data.*.max_limit.required_without' => 'The Tests Data Max Limit field is Required When Sample Description is Not Present',
                'sample_data.*.product_data.sample_description.required_without' => 'The Sample Data Sample Description field is Required When Tests Data Max Limit is Not Present',
                'tests_data.*.result.required' => "Test Result Must Be Required For COA/ROA."
            ];

            if (!empty($data[0]['tests_data'])) {
                $state_id = $data[0]['customer_data']['customer_contact_data']['state'];
                $country_id = $data[0]['customer_data']['customer_contact_data']['country'];
                if ($state_id != null && $state_id != 0 && $state_id != '') {
                    $state_data = State::select('id', 'state_name')->where('id', $state_id)->get()->toarray();
                    $data[0]['customer_data']['customer_contact_data']['state'] = $state_data;
                } else {
                    $data[0]['customer_data']['customer_contact_data']['state'] = array(
                        "id" => "",
                        "state_name" => ""
                    );
                }
                if ($country_id != null && $country_id != 0 && $country_id != '') {
                    $country_data = Country::select('id', 'country_name')->where('id', $country_id)->get()->toarray();
                    $data[0]['customer_data']['customer_contact_data']['country'] = $country_data;
                } else {
                    $data[0]['customer_data']['customer_contact_data']['country'] = array(
                        "id" => "",
                        "country_name" => ""
                    );
                }
    
                $can_roa_print = 1;
                $can_coa_print = 1;
                foreach ($data[0]['tests_data'] as $key => $item) {
                    if ($item['approved'] != "Approved") {
                        $can_coa_print = 0;
                    }
                    if ($item['approved'] == "Pending") {
                        $can_roa_print = 0;
                    }
                }
                $check_type = ['ROA_PRINT_1','NABL_ROA_PRINT_1','NABL_ROA_PRINT_2','Check_Roa'];
                $is_present = in_array($type,$check_type);

                if ($is_present == true) {                   
                    $validator = Validator::make($data[0], $rules, $msg);

                    if ($validator->fails()) {
                        $data = array();
                        return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
                    }
                    if ($can_roa_print == 1) {
                        if ($print_allows->roa_print_count != 1) {
                            if ($type == "Check_Roa") {
                                return Helper::response("You Can Proceed For Print, Show, PDF", Response::HTTP_OK, true);
                            } else {
                                $print_allows->update(array('roa_print_count' => 1, 'roa_print' => $type));
                                return Helper::response("Roa Print Generated Successfully", Response::HTTP_OK, true, $data);
                            }
                        } else {
                            if ($type == "Check_Roa") {
                                return Helper::response("Roa Print is Already Generated But You Can Proceed For Show, PDF Only.", Response::HTTP_OK, true);
                            } else {
                                return Helper::response("Roa Print is Already Generated", Response::HTTP_OK, false);
                            }
                        }
                    } else {
                        $msg = "All the Tests Can Be 'Assigned' or 'ForApproval' or 'Approved' & Can not be 'Pending' For Roa Print.";
                        return Helper::response($msg, Response::HTTP_OK, false);
                    }
                
                } 
                // dd("COA");
                if($type === "COA_PRINT" OR $type === "NABL_PRINT" OR $type === "COA_AYUSH " OR $type === "Check_Coa" )
                print_r("============================");
                dd($type);
                    if ($can_coa_print == 1) {
                        $rules['tests_data.*.approval_date_time'] = "required";
                        $rules['tests_data.*.date_of_performance_test'] = "required";
                        $msg["tests_data.*.approval_date_time.required"] = "Test Approval Date Time Must Be Required.";
                        $msg["tests_data.*.date_of_performance_test.required"] = "Date Of Performance of the Test are Required.";

                        $validator = Validator::make($data[0], $rules, $msg);

                        if ($validator->fails()) {
                            $data = array();
                            return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
                        }

                        if (($print_allows->coa_print == null || $print_allows->coa_print == '') && $print_allows->coa_print_count == 0) {
                            if ($type == "Check_Coa") {
                                return Helper::response("You Can Proceed For Coa, Nabl, Ayush Print, Show, PDF", Response::HTTP_OK, true);
                            } else {
                                $print_allows->update(array('coa_print' => $type, 'coa_print_count' => 1, 'booking_type' => 'Report'));
                                return Helper::response($type . " Generated Successfully", Response::HTTP_OK, true, $data);
                            }
                        } else {
                            if ($type == "Check_Coa") {
                                $msg = "Coa Print is Already Generated But You Can Preceed For Show, PDF Only.";
                                return Helper::response($msg, Response::HTTP_OK, true);
                            } else {
                                $msg = $type . " Print is Already Generated.";
                                return Helper::response($msg, Response::HTTP_OK, false);
                            }
                        }
                    } else {
                        $msg = "All the Tests Must Be 'Approved' For Coa Print.";
                        return Helper::response($msg, Response::HTTP_OK, false);
                    }
                
            

                return Helper::response("Data Shown Successfully For Roa/Coa", Response::HTTP_OK, true, $data);
            } else {
                return Helper::response("No Tests Data Available For Roa/Coa", Response::HTTP_OK, false);
            }
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function roa_coa_show(Request $request, $id)
    {
        //
        try {

            $data = Booking::select(
                'id',
                'booking_no as certificate_no',
                'coa_release_date',
                'created_at as sample_received_date',
                'mfg_lic_no as party_mfg_licence_no',
                'reference_no as client_ref_no',
                'customer_id',
                'manufacturer_id as original_manufacturer',
                'mfg_date as date_of_manufacturing',
                'supplier_id as supplier',
                'exp_date as date_of_expiry',
                'receipte_date',
                'coa_release_date as report_issue_date',
                'statement_ofconformity',
                'report_type',
                'aum_serial_no',
                'nabl_scope',
                'roa_print',
                'booking_group'
            )
                ->with(
                    'customer_data:id,company_name,user_name',
                    'customer_data.customer_contact_data:id,mst_customer_id,street_1,street_2,area,pin,city,state,country'
                )
                ->with('original_manufacturer:id,company_name')
                ->with('supplier:id,company_name')
                ->with('sample_data:id,booking_id,product_id,batch_no as lot_batch_no,batch_size_qty_rec,sample_quantity as sample_qty_rec,sample_condition as condition_of_sample', 'sample_data.product_data:id,product_name as name_of_sample,product_generic,pharmacopeia_id,generic_product_id,sample_description', 'sample_data.product_data.generic_product_data:id,product_name as generic_name', 'sample_data.product_data.pharmacopiea_data:id,pharmacopeia_name')
                ->with('tests_data:id,booking_id,test_name as test_parameter,label_claim,result,max_limit,product_details,test_date_time as date_of_performance_test,method as method_used,approved,parent,parent_child,p_sr_no,approval_date_time,chemist_name', 'tests_data.parent_data:id,machine_name as parent_name', 'tests_data.chemist_detail:id,first_name,middle_name,last_name')
                ->with('latest_test_date_time:id,booking_id,test_date_time')
                ->where('id', $id)
                ->get()->toarray();

            $rules = [
                'tests_data.*.result' => 'required',
                'tests_data.*.approval_date_time' => 'required',
            ];
            $msg = [
                'tests_data.*.result.required' => 'Tests Result Must Be Required.',
                'tests_data.*.approval_date_time.required' => 'Tests Approval Date Time Must Be Required.',
            ];
            $validator = Validator::make($data[0], $rules, $msg);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            if (!empty($data[0]['tests_data'])) {
                $state_id = $data[0]['customer_data']['customer_contact_data']['state'];
                $country_id = $data[0]['customer_data']['customer_contact_data']['country'];
                if ($state_id != null && $state_id != 0 && $state_id != '') {
                    $state_data = State::select('id', 'state_name')->where('id', $state_id)->get()->toarray();
                    $data[0]['customer_data']['customer_contact_data']['state'] = array(
                        "id" => $state_data[0]['id'],
                        "state_name" => $state_data[0]['state_name']
                    );
                } else {
                    $data[0]['customer_data']['customer_contact_data']['state'] = array(
                        "id" => "",
                        "state_name" => ""
                    );
                }
                if ($country_id != null && $country_id != 0 && $country_id != '') {
                    $country_data = Country::select('id', 'country_name')->where('id', $country_id)->get()->toarray();
                    $data[0]['customer_data']['customer_contact_data']['country'] = array(
                        "id" => $country_data[0]['id'],
                        "country_name" => $country_data[0]['country_name']
                    );
                } else {
                    $data[0]['customer_data']['customer_contact_data']['country'] = array(
                        "id" => "",
                        "country_name" => ""
                    );
                }

                return Helper::response("Data Shown Successfully For Roa/Coa", Response::HTTP_OK, true, $data);
            } else {
                return Helper::response("No Tests Data Available For Roa/Coa", Response::HTTP_OK, false);
            }
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
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
