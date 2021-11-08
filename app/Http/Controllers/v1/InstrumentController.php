<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Instrument;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;


class InstrumentController extends Controller
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
                $data = Instrument::select('mst_instruments.*', 'c.company_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_instruments.mst_companies_id')
                    ->where('mst_instruments.is_active', 1)
                    ->where('mst_instruments.selected_year', $loggedInUserData['selected_year'])
                    ->where('mst_instruments.mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('mst_instruments.id', 'desc')
                    ->get();
            } else {
                $data = Instrument::select('mst_instruments.*', 'c.company_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_instruments.mst_companies_id')
                    ->where('mst_instruments.is_active', 1)
                    ->orderBy('mst_instruments.id', 'desc')
                    ->get();
            }

            return Helper::response("Instrument List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'instrument_name' => 'required|max:255',
                'make' => 'required|max:255',
                'instrument_code' => 'required|max:50',
                'model' => 'required|max:50'
            ];

            $messages = [
                'instrument_name.required' => 'The Instrument Name field is required',
                'instrument_name.max' => 'The Instrument Name must be less than or equal to 255 characters',
                'make.required' => 'The Make field is required',
                'make.max' => 'The Make Name must be less than or equal to 255 characters',
                'instrument_code.required' => 'The Instrument code field is required',
                'instrument_code.max' => 'The Instrument code must be less than or equal to 50 characters',
                'model.required' => 'The Model field is required',
                'model.max' => 'The MNodel Name must be less than or equal to 50 characters'
                
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['instrument_name'] = $input['instrument_name'];
            $input_data['instrument_code'] = $input['instrument_code'];
            $input_data['model'] = $input['model'];
            $input_data['last_service_date'] = (isset($input['last_service_date']) && $input['last_service_date']!='') ? date('Y-m-d', strtotime($input['last_service_date']))  : '';
            $input_data['service_due_date'] = (isset($input['service_due_date']) && $input['service_due_date']!='') ? date('Y-m-d', strtotime($input['service_due_date']))  : '';
            $input_data['last_calibration_date'] = (isset($input['last_calibration_date']) && $input['last_calibration_date']!='') ? date('Y-m-d', strtotime($input['last_calibration_date']))  : '';
            $input_data['calibration_due_date'] = (isset($input['calibration_due_date']) && $input['calibration_due_date']!='') ? date('Y-m-d', strtotime($input['calibration_due_date']))  : '';
            $input_data['selected_year'] = $loggedInUserData['selected_year'];
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['make'] = $input['make'];
            $input_data['is_active'] = 1;
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Instrument Created with details : " . json_encode($input_data));

            $data = Instrument::create($input_data);
            return Helper::response("Instrument Added Successfully", Response::HTTP_OK, true, $data);
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
            $departmentData = Instrument::find($id);
            return Helper::response("Instrument Data Shown Successfully", Response::HTTP_OK, true, $departmentData);
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
                'instrument_name' => 'required|max:255',
                'make' => 'required|max:255',
                'instrument_code' => 'required|max:50',
                'model' => 'required|max:50'
            ];

            $messages = [
                'instrument_name.required' => 'The Instrument Name field is required',
                'instrument_name.max' => 'The Instrument Name must be less than or equal to 255 characters',
                'make.required' => 'The Make field is required',
                'make.max' => 'The Make Name must be less than or equal to 255 characters',
                'instrument_code.required' => 'The Instrument code field is required',
                'instrument_code.max' => 'The Instrument code must be less than or equal to 50 characters',
                'model.required' => 'The Model field is required',
                'model.max' => 'The MNodel Name must be less than or equal to 50 characters'
                
            ];

            $validator = Validator::make($request->all(), $rules, $messages);


            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['instrument_name'] = $input['instrument_name'];
            $input_data['instrument_code'] = $input['instrument_code'];
            $input_data['model'] = $input['model'];
            $input_data['last_service_date'] = (isset($input['last_service_date']) && $input['last_service_date']!='') ? date('Y-m-d', strtotime($input['last_service_date']))  : '';
            $input_data['service_due_date'] = (isset($input['service_due_date']) && $input['service_due_date']!='') ? date('Y-m-d', strtotime($input['service_due_date']))  : '';
            $input_data['last_calibration_date'] = (isset($input['last_calibration_date']) && $input['last_calibration_date']!='') ? date('Y-m-d', strtotime($input['last_calibration_date']))  : '';
            $input_data['calibration_due_date'] = (isset($input['calibration_due_date']) && $input['calibration_due_date']!='') ? date('Y-m-d', strtotime($input['calibration_due_date']))  : '';
            $input_data['selected_year'] = $loggedInUserData['selected_year'];
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['make'] = $input['make'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Instrument updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $department = Instrument::find($id);
            $department->update($input_data);

            return Helper::response("Instrument updated successfully", Response::HTTP_OK, true, $department);
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
            $department = Instrument::find($id);

            Log::info("Instrument deleted with : " . json_encode(array('id' => $id)));

            if (!empty($department)) {
                $department->delete();
                return Helper::response("Instrument deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Instrument not exists", Response::HTTP_NOT_FOUND, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
