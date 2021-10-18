<?php

namespace App\Http\Controllers\v1;

use App\Models\Machine;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;

class MachineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if(!$is_dropdown){
                $data = Machine::select('mst_machines.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_machines.mst_companies_id')
                        ->where('mst_machines.is_active',1)
                        ->where('mst_machines.selected_year', $loggedInUserData['selected_year'])
                        ->where('mst_machines.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_machines.id', 'desc')
                        ->get();
            } else {
                $data = Machine::select('mst_machines.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_machines.mst_companies_id')
                        ->where('mst_machines.is_active',1)
                        ->orderBy('mst_machines.id', 'desc')
                        ->get();
            }
            
            return Helper::response("Machine List Shown Successfully", Response::HTTP_OK, true, $data);

        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{

            $rules = [
                'machine_name' => 'required|max:255',
            ];

            $messages = [
                'machine_name.required' => 'Machine Name field is required.',
                'machine_name.max' => 'Machine Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['machine_name'] = $input['machine_name'];
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];              
            $input_data['is_active'] = 1;

            Log::info("Machine Created with details : ".json_encode($input_data));

            $data = Machine::create($input_data);
            return Helper::response("Machine Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Machine  $machine
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        Log::info("Fetch Machine details : ".json_encode(array('id' => $id)));
        try{
            $bankData = Machine::select('mst_machines.*', 'c.company_name')
            ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_machines.mst_companies_id')->where('mst_machines.id', $id)->first();
            return Helper::response("Machine Data Shown Successfully", Response::HTTP_OK, true, $bankData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Machine  $machine
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Machine  $machine
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $rules = [
                'machine_name' => 'required|max:255',
            ];

            $messages = [
                'machine_name.required' => 'Machine Name field is required.',
                'machine_name.max' => 'Machine Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['machine_name'] = $input['machine_name'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Machine updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $machine = Machine::find($id);
            $machine->update($input_data);

            return Helper::response("Machine updated successfully", Response::HTTP_OK, true, $machine); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Machine  $machine
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $data = array();
            $machine = Machine::find($id);

            Log::info("Machine deleted with : ".json_encode(array('id' => $id)));

            if(!empty($machine)){
                $machine->delete();
                return Helper::response("Machine deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Machine does not exist", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }
    }
}
