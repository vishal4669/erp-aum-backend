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
                'aum_serial_no'
            )
                ->with(
                    'customer_data:id,company_name,user_name',
                    'customer_data.customer_contact_data:id,mst_customer_id,street_1,street_2,area,pin,city,state,country'
                )
                ->with('original_manufacturer:id,company_name')
                ->with('supplier:id,company_name')
                ->with('sample_data:id,booking_id,product_id,batch_no as lot_batch_no,batch_size_qty_rec,sample_quantity as sample_qty_rec,sample_condition as condition_of_sample', 'sample_data.product_data:id,product_name as name_of_sample,product_generic,pharmacopeia_id,generic_product_id', 'sample_data.product_data.generic_product_data:id,product_name as generic_name', 'sample_data.product_data.pharmacopiea_data:id,pharmacopeia_name')
                ->with('tests_data:id,booking_id,test_name as test_parameter,label_claim,result,max_limit,product_details,test_date_time as date_of_performance_test,method as method_used,approved,approval_date_time,parent,parent_child,p_sr_no')
                ->where('id', $id)
                ->get()->toarray();

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

                $can_coa_print = 1;
                $can_roa_print = 1;
                foreach ($data[0]['tests_data'] as $key => $item) {
                    if ($item['approved'] != "Approved") {
                        $can_coa_print = 0;
                    }
                    if ($item['approved'] != "Assigned") {
                        $can_roa_print = 0;
                    }
                }
                if ($type == "Roa_print") {
                    if ($can_roa_print == 1) {
                        if ($print_allows->roa_print_count != 1) {
                            $print_allows->update(array('roa_print_count' => 1));
                            return Helper::response("Roa Print Generated Successfully", Response::HTTP_OK, true, $data);
                        } else {
                            return Helper::response("Roa Print already Generated", Response::HTTP_OK, true);
                        }
                    } else {
                        $msg = "All the Tests Must Be 'Assigned' For Roa Print.";
                        return Helper::response($msg, Response::HTTP_OK, false);
                    }
                } else {
                    if ($can_coa_print == 1) {
                        $rules = [
                            'tests_data.*.result' => 'required',
                            'tests_data.*.approval_date_time' => 'required',
                        ];
                        $msg = [
                            'tests_data.*.result.required' => 'Tests Results Must Be Required For' . $type . '',
                            'tests_data.*.approval_date_time.required' => 'Tests Approval Date Time Must Be Required For' . $type . '',
                        ];
                        $validator = Validator::make($data[0], $rules, $msg);

                        if ($validator->fails()) {
                            $data = array();
                            return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
                        }

                        if ($print_allows->coa_print == null) {
                            $coa_print_Arr = array(
                                $type
                            );
                            $print_allows->update(array('coa_print' => $coa_print_Arr, 'coa_print_count' => $print_allows->coa_print_count + 1));
                            return Helper::response($type . " Generated Successfully", Response::HTTP_OK, true, $data);
                        } else {
                            $coa_print_Arr = $print_allows->coa_print;
                            if (in_array($type, $coa_print_Arr) == false) {
                                if (count($coa_print_Arr) >= 3) {
                                    $msg = "Coa Generation is already finished.";
                                    return Helper::response($msg, Response::HTTP_OK, true);
                                } else {
                                    array_push($coa_print_Arr, $type);
                                    $print_allows->update(array('coa_print' => $coa_print_Arr, 'coa_print_count' => $print_allows->coa_print_count + 1));
                                    if (count($coa_print_Arr) == 3) {
                                        $print_allows->update(array('booking_type' => 'Report'));
                                    }
                                    return Helper::response($type . " Generated Successfully", Response::HTTP_OK, true, $data);
                                }
                            } else {
                                $msg = $type . " Already Generated.";
                                return Helper::response($msg, Response::HTTP_OK, false);
                            }
                        }
                    } else {
                        $msg = "All the Tests Must Be 'Approved' For Coa Print.";
                        return Helper::response($msg, Response::HTTP_OK, false);
                    }
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
                'aum_serial_no'
            )
                ->with(
                    'customer_data:id,company_name,user_name',
                    'customer_data.customer_contact_data:id,mst_customer_id,street_1,street_2,area,pin,city,state,country'
                )
                ->with('original_manufacturer:id,company_name')
                ->with('supplier:id,company_name')
                ->with('sample_data:id,booking_id,product_id,batch_no as lot_batch_no,batch_size_qty_rec,sample_quantity as sample_qty_rec,sample_condition as condition_of_sample', 'sample_data.product_data:id,product_name as name_of_sample,product_generic,pharmacopeia_id,generic_product_id', 'sample_data.product_data.generic_product_data:id,product_name as generic_name', 'sample_data.product_data.pharmacopiea_data:id,pharmacopeia_name')
                ->with('tests_data:id,booking_id,test_name as test_parameter,label_claim,result,max_limit,product_details,test_date_time as date_of_performance_test,method as method_used,approved,parent,parent_child,p_sr_no')
                ->where('id', $id)
                ->get()->toarray();

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
