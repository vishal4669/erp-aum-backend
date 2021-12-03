<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

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
            $loggedInUserData = Helper::getUserData();

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if(!$is_dropdown){
                $data = Group::select('mst_groups.*', 'g.group_name as parent_name')
                        ->leftjoin('mst_groups as g', 'g.id', '=', 'mst_groups.parent_group')
                        ->where('mst_groups.is_active',1)
                        // ->where('mst_groups.selected_year', $loggedInUserData['selected_year'])
                        ->where('mst_groups.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_groups.id', 'desc')
                        ->get();
            } else {
                $data = Group::select('mst_groups.*', 'g.group_name as parent_name')
                        ->leftjoin('mst_groups as g', 'g.id', '=', 'mst_groups.parent_group')
                        ->where('mst_groups.is_active',1)
                        ->where('mst_groups.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_groups.id', 'desc')
                        ->get();
            }

            
            return Helper::response("Group List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
        
    }

    /**
     * Display a listing of the resource parents.
     *
     * @return \Illuminate\Http\Response
     */

    public function listParentGroups(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Group::where('is_active',1)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->get();
            return Helper::response("Parent Group List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'group_name' => 'required|max:255',
                'group_code' => 'required|max:255'
            ];

            $messages = [
                'group_name.required' => 'The Group Name field is required',
                'group_code.required' => 'The Group Code field is required',
                'group_name.max' => 'The Group Name must be less than or equal to 255 characters',
                'group_code.max' => 'The Group Code must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_code'] = $input['group_code'];  
            $input_data['parent_group'] = $input['parent_group'];  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Group Created with details : ".json_encode($input_data));

            $data = Group::create($input_data);
            return Helper::response("Group Added Successfully", Response::HTTP_OK, true, $data);  
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
            return Helper::response("Group Data Shown Successfully", Response::HTTP_OK, true, $companyData);
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

            $rules = [
                'group_name' => 'required|max:255',
                'group_code' => 'required|max:255'
            ];

            $messages = [
                'group_name.required' => 'The Group Name field is required',
                'group_code.required' => 'The Group Code field is required',
                'group_name.max' => 'The Group Name must be less than or equal to 255 characters',
                'group_code.max' => 'The Group Code must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_name'] = $input['group_name'];  
            $input_data['group_code'] = $input['group_code'];  
            $input_data['parent_group'] = $input['parent_group']; 
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Group updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $group = Group::find($id);
            $group->update($input_data);

            return Helper::response("Group updated successfully", Response::HTTP_OK, true, $group); 
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

            Log::info("Group deleted with : ".json_encode(array('id' => $id)));

            if(!empty($group)){
                $group->delete();
                return Helper::response("Group deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Group not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}

