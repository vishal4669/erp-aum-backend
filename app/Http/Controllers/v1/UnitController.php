<?php

namespace App\Http\Controllers\v1;

use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;

class UnitController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if(!$is_dropdown){
                $data = Unit::select('mst_units.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_units.mst_companies_id')
                        ->where('mst_units.is_active',1)
                        ->where('mst_units.selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('mst_units.id', 'desc')
                        ->get();
            } else {
                $data = Unit::select('mst_units.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_units.mst_companies_id')
                        ->where('mst_units.is_active',1)
                        ->orderBy('mst_units.id', 'desc')
                        ->get();
            }
            
            return Helper::response("Unit List Shown Successfully", Response::HTTP_OK, true, $data);

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
                'unit_name' => 'required|max:255',
            ];

            $messages = [
                'unit.required' => 'Unit Name field is required.',
                'unit.max' => 'Unit Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['unit_name'] = $input['unit_name'];
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];              
            $input_data['is_active'] = 1;

            Log::info("Unit Created with details : ".json_encode($input_data));

            $data = Unit::create($input_data);
            return Helper::response("Unit Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        Log::info("Fetch Unit details : ".json_encode(array('id' => $id)));
        try{
            $unitData = Unit::select('mst_units.*', 'c.company_name')
            ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_units.mst_companies_id')->where('mst_units.id', $id)->first();
            return Helper::response("Unit Data Shown Successfully", Response::HTTP_OK, true, $unitData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Unit  $unit
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $rules = [
                'unit_name' => 'required|max:255',
            ];

            $messages = [
                'unit_name.required' => 'Unit Name field is required.',
                'unit.max' => 'Unit Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['unit_name'] = $input['unit_name'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Unit updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $unit = Unit::find($id);
            $unit->update($input_data);

            return Helper::response("Unit updated successfully", Response::HTTP_OK, true, $unit); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $data = array();
            $unit = Unit::find($id);

            Log::info("Unit deleted with : ".json_encode(array('id' => $id)));

            if(!empty($unit)){
                $unit->delete();
                return Helper::response("Unit deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Unit does not exist", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }
    }
}
