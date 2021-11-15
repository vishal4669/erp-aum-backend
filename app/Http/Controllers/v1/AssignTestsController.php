<?php

namespace App\Http\Controllers\v1;


use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Booking;
use Log;
use App\Helpers\Helper;
use App\Models\BookingTest;

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
            // $not_assign_booking = BookingTest::where('chemist_name',NULL)->get(['booking_id','id'])->toarray();
            $data = Booking::select('id', 'aum_serial_no', 'receipte_date', 'report_type', 'booking_no','customer_id')
                ->with(
                    'customer_id:id,company_name',
                    'samples:id,booking_id,product_id',
                    'samples.product_detail:id,product_name,pharmacopeia_id',
                    'samples.product_detail.pharmacopiea_detail:id,pharmacopeia_name',
                    'tests_detail:id,booking_id,p_sr_no,test_name,chemist_name'
                )->get()->toarray();

            /* if chemist name is null then in the array booking_tests return tests data for our scenerio to assign tests
            else chemist name already assigned then booking_tests array is empty*/
            $pending_assigned_data = [];
            foreach($data as $key=>$item)
            {
               if(!empty($item['tests_detail']))
               {
                   array_push($pending_assigned_data,$item);
               }
            }
            // dd($pending_assigned_data[0]['tests_detail']);
            // foreach($pending_assigned_data[])      

            return Helper::response("Assign Tests Controller List Shown Successfully", Response::HTTP_OK, true, $pending_assigned_data);
  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $pending_assigned_data);
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
