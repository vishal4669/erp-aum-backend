<?php

namespace App\Http\Controllers\v1;

use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
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
                'manufacturer_id as original_manufacturer',
                'mfg_date as date_of_manufacturing',
                'supplier_id as supplier',
                'exp_date as date_of_expiry',
                'receipte_date',
                'coa_release_date as report_issue_date',
            )
                ->with('original_manufacturer:id,company_name')
                ->with('supplier:id,company_name')
                ->with('sample_data:id,booking_id,product_id,batch_no as lot_batch_no,batch_size_qty_rec,sample_quantity as sample_qty_rec,sample_condition as condition_of_sample', 'sample_data.product_data:id,product_name as name_of_sample,product_generic,generic_product_id', 'sample_data.product_data.generic_product_data:id,product_name as generic_name')
                ->with('tests_data:id,booking_id,test_name as test_parameter,label_claim,result,max_limit,product_details,test_date_time as date_of_performance_test,method as method_used,approved')
                ->where('id', $id)
                ->get()->toarray();

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
                        return Helper::response("Roa Print Generated Successfully", Response::HTTP_CREATED, true, $data);
                    } else {
                        return Helper::response("Roa Print already Generated", Response::HTTP_CREATED, true);
                    }
                }
                else
                {
                    $msg = "All the Tests Must Be 'Assigned' For Roa Print.";
                    return Helper::response($msg, Response::HTTP_OK, false);
                }
            } else {
                if ($can_coa_print == 1) {

                    if ($print_allows->coa_print == null) {
                        $coa_print_Arr = array(
                            $type
                        );
                        $print_allows->update(array('coa_print' => $coa_print_Arr, 'coa_print_count' => $print_allows->coa_print_count + 1));
                        return Helper::response($type . " Generated Successfully", Response::HTTP_CREATED, true, $data);
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
                                return Helper::response($type . " Generated Successfully", Response::HTTP_CREATED, true, $data);
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
