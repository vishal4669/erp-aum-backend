<?php    

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Helpers\Helper;
use Auth;
use Log;
    

class GroupController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        try{
            $data = Group::all();
            return Helper::response("Group List Shown Successfully",200,true,$data);
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
    public function create()
    {
        
        
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
            $input = $request->all();
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_code'] = $input['group_code'];  
            $input_data['parent_group'] = $input['parent_group'];  
            $input_data['current_year'] = date('Y');  
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = Auth::user()->id;

            Log::info("Group Created with details : ".json_encode($input_data));

            $data = Group::create($input_data);
            return Helper::response("Group Added Successfully",200,true,$data);  
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
        Log::info("Fetch group details : ".json_encode(array('id' => $id)));
        try{
            $companyData = Group::find($id);
            return Helper::response("Group Data Shown Successfully",200,true,$companyData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
            $input = $request->all();
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_code'] = $input['group_code'];  
            $input_data['parent_group'] = $input['parent_group'];         
            $input_data['current_year'] = date('Y');  
            $input_data['is_active'] = 1;  
            $input_data['updated_by'] = Auth::user()->id; 

            Log::info("Group updated with details : ".json_encode(array('data' => $input_data, 'id' => $id));

            $group = Group::find($id);
            $group->update($input_data);

            return Helper::response("Group updated successfully",200,true,$group); 
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
            $group = Group::find($id);

            Log::info("Group deleted with : ".json_encode(array('id' => $id));

            if(!empty($group)){
                $group->delete();
                return Helper::response("Group deleted successfully",200,true,$data); 
            }  

            return Helper::response("Group not exists",404,false,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}

