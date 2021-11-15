<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;


class DepartmentController extends Controller
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

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if (!$is_dropdown) {
                $data = Department::select('mst_departments.*', 'c.company_name', 'b.branch_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_departments.mst_companies_id')
                    ->leftjoin('mst_branches as b', 'b.id', '=', 'mst_departments.mst_branches_id')
                    ->where('mst_departments.is_active', 1)
                    ->where('mst_departments.selected_year', $loggedInUserData['selected_year'])
                    ->where('mst_departments.mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('mst_departments.id', 'desc')
                    ->get();
            } else {
                $data = Department::select('mst_departments.*', 'c.company_name', 'b.branch_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_departments.mst_companies_id')
                    ->leftjoin('mst_branches as b', 'b.id', '=', 'mst_departments.mst_branches_id')
                    ->where('mst_departments.is_active', 1)
                    ->where('mst_departments.mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('mst_departments.id', 'desc')
                    ->get();
            }

            return Helper::response("Department List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        try {

            $rules = [
                'mst_branches_id' => 'required',
                'department_name' => 'required|max:255',
            ];

            $messages = [
                'mst_branches_id.required' => 'The Branch Name field is required',
                'department_name.required' => 'The Department Name field is required',
                'department_name.max' => 'The Department Name must be less than or equal to 255 characters'
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['department_name'] = $input['department_name'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['mst_branches_id'] = $input['mst_branches_id'];
            $input_data['is_active'] = 1;
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Department Created with details : " . json_encode($input_data));

            $data = Department::create($input_data);
            return Helper::response("Department Added Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        Log::info("Fetch department details : " . json_encode(array('id' => $id)));
        try {
            $departmentData = Department::find($id);
            return Helper::response("Department Data Shown Successfully", Response::HTTP_OK, true, $departmentData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
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
        try {

            $rules = [
                'mst_branches_id' => 'required',
                'department_name' => 'required|max:255',
            ];

            $messages = [
                'mst_branches_id.required' => 'The Branch Name field is required',
                'department_name.required' => 'The Department Name field is required',
                'department_name.max' => 'The Department Name must be less than or equal to 255 characters'
            ];

            $validator = Validator::make($request->all(), $rules, $messages);


            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['department_name'] = $input['department_name'];
            $input_data['mst_branches_id'] = $input['mst_branches_id'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Department updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $department = Department::find($id);
            $department->update($input_data);

            return Helper::response("Department updated successfully", Response::HTTP_OK, true, $department);
        } catch (Exception $e) {
            $data = array();
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
        try {
            $data = array();
            $department = Department::find($id);

            Log::info("Department deleted with : " . json_encode(array('id' => $id)));

            if (!empty($department)) {
                $department->delete();
                return Helper::response("Department deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Department not exists", Response::HTTP_NOT_FOUND, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
