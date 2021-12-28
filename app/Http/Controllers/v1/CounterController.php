<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\BookingTest;
use App\Helpers\Helper;
use App\Http\Controllers\v1\AssignTestsController;
use App\Http\Controllers\v1\EmployeeController;

class CounterController extends Controller
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

        // using AssignTestsController
            $assign_test_data = new AssignTestsController;
            $PendingTests_Count = $assign_test_data->index($count_request = "Pending");
            $Analitics_count = $assign_test_data->statusWiseTests($request,$count_request = "Assigned");
            $ForApproval_count = $assign_test_data->statusWiseTests($request,$count_request = "ForApproval");
            $Approved_count = $assign_test_data->statusWiseTests($request,$count_request = "Approved");
            $Rejected_count = $assign_test_data->statusWiseTests($request,$count_request = "Rejected");

        // using EmployeeController
            $employee_data = new EmployeeController;
            $hr_count = $employee_data->index($request,$is_dashboard_hr = 1);
            $hr_count = json_encode($hr_count);
            $hr_count = json_decode($hr_count);
            $hr_count = count($hr_count->original->data);
            
            $all_count = array(
                "PendingTests_Count" => $PendingTests_Count,
                "Analitics_count" => $Analitics_count,
                "ForApproval_count" => $ForApproval_count,
                "Approved_count" => $Approved_count,
                "Rejected_count" => $Rejected_count,
                "Hr_count" => $hr_count
            );
            
            return Helper::response("Count Data Shown Successfully", Response::HTTP_OK, true, $all_count);
        } catch (Exception $e) {
            $exportData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $all_count);
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
