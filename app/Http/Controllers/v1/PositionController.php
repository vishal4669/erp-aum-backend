<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Position;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class PositionController extends Controller
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
                $data = Position::select('mst_positions.*', 'c.company_name', 'd.department_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_positions.mst_companies_id')
                        ->leftjoin('mst_departments as d', 'd.id', '=', 'mst_positions.mst_departments_id')
                        ->where('mst_positions.is_active',1)
                        // ->where('mst_positions.selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('mst_positions.id', 'desc')
                        ->get();
            } else {
                $data = Position::select('mst_positions.*', 'c.company_name', 'd.department_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_positions.mst_companies_id')
                        ->leftjoin('mst_departments as d', 'd.id', '=', 'mst_positions.mst_departments_id')
                        ->where('mst_positions.is_active',1)
                        ->where('mst_positions.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_positions.id', 'desc')
                        ->get();
            }

            
            return Helper::response("Position List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{

            $rules = [
                'position_title' => 'required|string|max:255',
            ];

            $messages = [
                'position_title.required' => 'The Position Title field is required',
                'position_title.max' => 'The Position Title must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }


            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['position_title'] = $input['position_title'];  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['mst_departments_id'] = $input['mst_departments_id'];
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Position Created with details : ".json_encode($input_data));

            $data = Position::create($input_data);
            return Helper::response("Position Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        Log::info("Fetch position details : ".json_encode(array('id' => $id)));
        try{
            $positionData = Position::find($id);
            return Helper::response("Position Data Shown Successfully", Response::HTTP_OK, true, $positionData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'position_title' => 'required|string|max:255',
            ];

            $messages = [
                'position_title.required' => 'The Position Title field is required',
                'position_title.max' => 'The Position Title must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $input = $request->all();
            $input_data['position_title'] = $input['position_title']; 
            $input_data['mst_departments_id'] = $input['mst_departments_id'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Position updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $position = Position::find($id);
            $position->update($input_data);

            return Helper::response("Position updated successfully", Response::HTTP_OK, true, $position); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{
            $data = array();
            $position = Position::find($id);

            Log::info("Position deleted with : ".json_encode(array('id' => $id)));

            if(!empty($position)){
                $position->delete();
                return Helper::response("Position deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Position not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}

