<?php

namespace App\Http\Controllers\v1;

use App\Models\Location;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;

class LocationController extends Controller
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
                $data = Location::select('mst_locations.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_locations.mst_companies_id')
                        ->where('mst_locations.is_active',1)
                        // ->where('mst_locations.selected_year', $loggedInUserData['selected_year'])
                        ->where('mst_locations.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_locations.id', 'desc')
                        ->get();
            } else {
                $data = Location::select('mst_locations.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_locations.mst_companies_id')
                        ->where('mst_locations.is_active',1)
                        ->orderBy('mst_locations.id', 'desc')
                        ->get();
            }
            
            return Helper::response("Location List Shown Successfully", Response::HTTP_OK, true, $data);

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
                'location_name' => 'required|max:255',
            ];

            $messages = [
                'location.required' => 'Location Name field is required.',
                'location.max' => 'Location Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['location_name'] = $input['location_name'];
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];              
            $input_data['is_active'] = 1;

            Log::info("Location Created with details : ".json_encode($input_data));

            $data = Location::create($input_data);
            return Helper::response("Location Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        Log::info("Fetch Location details : ".json_encode(array('id' => $id)));
        try{
            $locationData = Location::select('mst_locations.*', 'c.company_name')
            ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_locations.mst_companies_id')->where('mst_locations.id', $id)->first();
            return Helper::response("Location Data Shown Successfully", Response::HTTP_OK, true, $locationData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        } 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $rules = [
                'location_name' => 'required|max:255',
            ];

            $messages = [
                'location_name.required' => 'Location Name field is required.',
                'location.max' => 'Location Name should not be greater than 255 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['location_name'] = $input['location_name'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Location updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $location = Location::find($id);
            $location->update($input_data);

            return Helper::response("Location updated successfully", Response::HTTP_OK, true, $location); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $data = array();
            $location = Location::find($id);

            Log::info("Location deleted with : ".json_encode(array('id' => $id)));

            if(!empty($location)){
                $location->delete();
                return Helper::response("Location deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Location does not exist", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }
    }
}
