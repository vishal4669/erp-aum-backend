<?php

namespace App\Http\Controllers\v1;


use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Booking;
use Log;
use App\Helpers\Helper;
use App\Models\BookingTest;
use Carbon\Carbon;
use Exception;

use function PHPSTORM_META\type;

class AssignTestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        try {

            $data = Booking::select('id', 'aum_serial_no', 'receipte_date', 'report_type', 'booking_no', 'customer_id')
                ->with(
                    'customer_id:id,company_name',
                    'samples:id,booking_id,product_id',
                    'samples.product_detail:id,product_name,pharmacopeia_id',
                    'samples.product_detail.pharmacopiea_detail:id,pharmacopeia_name',
                    'tests_detail:id,booking_id,p_sr_no,test_name,chemist_name'
                )->orderBy('id', 'desc')->get()->toarray();

            /* if chemist name is null then in the array booking_tests return tests data for our scenerio to assign tests
            else chemist name already assigned then booking_tests array is empty*/
            $pending_assigned_data = [];
            foreach ($data as $key => $item) {
                // print_r($item);
                if (!empty($item['tests_detail'])) {
                    array_push($pending_assigned_data, $item);
                }
            }
            /* booking have multiple tests but multiple tests have one booking so what we need here 
            as per scenerio each tests must have their booking data.*/
            $pending_assigned_tests = [];
            foreach ($pending_assigned_data as $key => $item) {
                foreach ($item['tests_detail'] as $key2 => $item2) {
                    $new_tests_arr = array(
                        'aum_serial_no' => isset($item['aum_serial_no']) ? $item['aum_serial_no'] : '',
                        'p_sr_no' => isset($item2['p_sr_no']) ? $item2['p_sr_no'] : '',
                        'report_type' => isset($item['report_type']) ? $item['report_type'] : '',
                        'receipte_date' => isset($item['receipte_date']) ? $item['receipte_date'] : '',
                        'booking_no' => isset($item['booking_no']) ? $item['booking_no'] : '',
                        'customer_name' => isset($item['customer_id']['company_name']) ? $item['customer_id']['company_name'] : '',
                        'sample_name' => isset($item['samples'][0]['product_detail']['product_name']) ? $item['samples'][0]['product_detail']['product_name'] : '',
                        'pharmacopeia' => isset($item['samples'][0]['product_detail']['pharmacopiea_detail']['pharmacopeia_name']) ? $item['samples'][0]['product_detail']['pharmacopiea_detail']['pharmacopeia_name'] : '',
                        'test_id' => isset($item2['id']) ? $item2['id'] : '',
                        'test_name' => isset($item2['test_name']) ? $item2['test_name'] : '',
                    );
                    array_push($pending_assigned_tests, $new_tests_arr);
                }
            }

            return Helper::response("Assign Tests List Shown Successfully", Response::HTTP_OK, true, $pending_assigned_tests);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $pending_assigned_tests);
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function statusWiseTests(Request $request)
    {
        //
        try {
            $approved_status = $request->approved_status;
            if ($approved_status == "ForApproval") {
                $data = BookingTest::select("id", "approved", "booking_id", "result", "p_sr_no", "test_name", "chemist_name", "assigned_date")
                    ->with(
                        'booking_detail:id,aum_serial_no,report_type,receipte_date,booking_no,customer_id',
                        'booking_detail.customer_id:id,company_name'
                    )
                    ->with(
                        'booking_samples_detail:id,booking_id,product_id',
                        'booking_samples_detail.product_detail:id,product_name,pharmacopeia_id',
                        'booking_samples_detail.product_detail.pharmacopiea_detail:id,pharmacopeia_name'
                    )
                    ->where('booking_tests.result', "!=", '')
                    ->orderBy('booking_tests.assigned_date', 'desc')
                    ->get()->toarray();
            } else {
                $data = BookingTest::select("id", "approved", "booking_id", "p_sr_no", "test_name", "chemist_name", "assigned_date")
                    ->with(
                        'booking_detail:id,aum_serial_no,report_type,receipte_date,booking_no,customer_id',
                        'booking_detail.customer_id:id,company_name'
                    )
                    ->with(
                        'booking_samples_detail:id,booking_id,product_id',
                        'booking_samples_detail.product_detail:id,product_name,pharmacopeia_id',
                        'booking_samples_detail.product_detail.pharmacopiea_detail:id,pharmacopeia_name'
                    )
                    ->where('approved', $approved_status)
                    ->orderBy('booking_tests.assigned_date', 'desc')
                    ->get()->toarray();
            }

            return Helper::response("Status Wise Tests List Shown Successfully", Response::HTTP_OK, true, $data);
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
    public function assign_tests_chemist(Request $request)
    {
        //
        try {
            if (!empty($request->all())) {
                $data = $request->all();

                foreach ($data['test_id'] as $item) {

                    $test_id = $item;
                    $chemist_name = $data['chemist_name'];
                    $assign_tests_chemist = BookingTest::find($test_id);
                    $date = Carbon::now();

                    if ($assign_tests_chemist != null) {
                        $assign_tests_chemist->update(array('assigned_date' => $date, 'approved' => 'Assigned', 'chemist_name' => $chemist_name, "updated_at" => $date));
                    }
                }
            }
            return Helper::response("Assign tests to chemist Successfully", Response::HTTP_OK, true);
        } catch (Exception $e) {
            $exportData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false);
        }
    }

    /**
     * Display the specified resource.
     * Get test data(with[booking,samples]) for Analytics
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show_test($id)
    {
        //
        try {
            $data = BookingTest::select(
                'id',
                'booking_id',
                'parent',
                'test_name',
                'min_limit',
                'result',
                'unit',
                'result2',
                'label_claim',
                'max_limit',
                'method'
            )->with('booking_detail:id,booking_type,receipte_date,report_type,booking_no')
                ->with('booking_samples_detail:id,booking_id,product_id,batch_no', 'booking_samples_detail.product_detail:id,product_name,generic_product_id', 'booking_samples_detail.product_detail.generic_product_id:id,product_name')
                ->where('id', $id)->get()->toarray();

            return Helper::response("Fetch assign tests data for analytics Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $exportData = array();
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
     * Update test result in booking test.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update_test_result(Request $request, $id)
    {
        //
        try {
            //code...

            $data = BookingTest::find($id);
            $datetime = Carbon::now();
            if ($data != null) {
                $data->update(array(
                    //forapproved
                    'result' => $request->result,
                    'method' => $request->method,
                    'unit'   => $request->unit,
                    'approved' => "ForApproval",
                    'updated_at' => $datetime
                ));
            }

            return Helper::response("Update test result in booking test Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $exportData = array();
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
        //
    }
}
