<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class BranchController extends Controller
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
                $data = Branch::select('mst_branches.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_branches.mst_companies_id')
                        ->where('mst_branches.is_active',1)
                        ->where('mst_branches.selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('mst_branches.id', 'desc')
                        ->get();
            } else {
                $data = Branch::select('mst_branches.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_branches.mst_companies_id')
                        ->where('mst_branches.is_active',1)
                        ->orderBy('mst_branches.id', 'desc')
                        ->get();
            }
            
            return Helper::response("Branch List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'branch_name' => 'required|max:255',
                'mst_companies_id' => 'required',
                'branch_type' => 'required',
                'branch_code' => 'required',
                'branch_office_no' => 'required|integer',
                'branch_pin' => 'required|integer',
                'branch_phone' => 'required|integer',
                'branch_mobile' => 'required|integer',
                'branch_email' => 'required|email',
                'branch_complex_name' => 'required',
                'branch_city' => 'required',
                'branch_state' => 'required',
                'branch_country' => 'required',
                'branch_establish_year' => 'integer',
                'branch_fax' => 'integer'
            ];

            $messages = [
                'branch_name.required' => 'The Branch Name field is required.',
                'branch_name.max' => 'The Branch Name must be less than or equal to 255 characters',
                'mst_companies_id.required' => 'The Company Name field is required.',
                'branch_type.required' => 'The Branch Type field is required.',
                'branch_code.required' => 'The Branch Code field is required.',
                'branch_office_no.required' => 'The Branch Office Number field is required.',
                'branch_office_no.integer' => 'The Branch Office Number should be a valid number.',
                'branch_phone.required' => 'The Branch Phone Number field is required.',
                'branch_phone.integer' => 'The Branch Phone Number should be a valid number.',
                'branch_mobile.required' => 'The Branch Mobile Number field is required.',
                'branch_mobile.integer' => 'The Branch Mobile Number should be a valid number.',
                'branch_pin.integer' => 'The Branch Pin should be a valid number.',
                'branch_pin.required' => 'The Branch Pin field is required.',
                'branch_email.required' => 'The Branch Email field is required.',
                'branch_email.email' => 'The Branch Email should be a valid email.',                
                'branch_complex_name.required' => 'The Branch Complex Name field is required.',      
                'branch_city.required' => 'The Branch City field is required.',      
                'branch_state.required' => 'The Branch State field is required.',      
                'branch_country.required' => 'The Branch Country field is required.',
                'branch_establish_year.integer' => 'The Branch Established Year should be a valid number.',
                'branch_fax.integer' => 'The Branch Fax should be a valid number.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $input['mst_companies_id'];
            $input_data['branch_name'] = $input['branch_name'];  
            $input_data['branch_type'] = $input['branch_type'];  
            $input_data['branch_code'] = $input['branch_code'];  
            $input_data['branch_office_no'] = $input['branch_office_no'];  
            $input_data['branch_complex_name'] = $input['branch_complex_name'];  
            $input_data['branch_street_name'] = $input['branch_street_name'];  
            $input_data['branch_land_mark'] = $input['branch_land_mark'];  
            $input_data['branch_area'] = $input['branch_area'];  
            $input_data['branch_city'] = $input['branch_city'];  
            $input_data['branch_state'] = $input['branch_state'];  
            $input_data['branch_country'] = $input['branch_country'];  
            $input_data['branch_pin'] = $input['branch_pin'];  
            $input_data['branch_phone'] = $input['branch_phone'];  
            $input_data['branch_fax'] = $input['branch_fax'];  
            $input_data['branch_mobile'] = $input['branch_mobile'];  
            $input_data['branch_email'] = $input['branch_email'];  
            $input_data['branch_establish_year'] = $input['branch_establish_year'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];              
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Branch Created with details : ".json_encode($input_data));

            $data = Branch::create($input_data);
            return Helper::response("Branch Added Successfully", Response::HTTP_OK, true, $data);  
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
        Log::info("Fetch branch details : ".json_encode(array('id' => $id)));
        try{
            $branchData = Branch::select('mst_branches.*', 'c.company_name')
            ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_branches.mst_companies_id')->where('mst_branches.id', $id)->first();
            return Helper::response("Branch Data Shown Successfully", Response::HTTP_OK, true, $branchData);
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
                'branch_name' => 'required|max:255',
                'mst_companies_id' => 'required',
                'branch_type' => 'required',
                'branch_code' => 'required',
                'branch_office_no' => 'required|integer',
                'branch_pin' => 'required|integer',
                'branch_phone' => 'required|integer',
                'branch_mobile' => 'required|integer',
                'branch_email' => 'required|email',
                'branch_complex_name' => 'required',
                'branch_city' => 'required',
                'branch_state' => 'required',
                'branch_country' => 'required',
                'branch_establish_year' => 'integer',
                'branch_fax' => 'integer'
            ];

            $messages = [
                'branch_name.required' => 'The Branch Name field is required.',
                'branch_name.max' => 'The Branch Name must be less than or equal to 255 characters',
                'mst_companies_id.required' => 'The Company Name field is required.',
                'branch_type.required' => 'The Branch Type field is required.',
                'branch_code.required' => 'The Branch Code field is required.',
                'branch_office_no.required' => 'The Branch Office Number field is required.',
                'branch_office_no.integer' => 'The Branch Office Number should be a valid number.',
                'branch_phone.required' => 'The Branch Phone Number field is required.',
                'branch_phone.integer' => 'The Branch Phone Number should be a valid number.',
                'branch_mobile.required' => 'The Branch Mobile Number field is required.',
                'branch_mobile.integer' => 'The Branch Mobile Number should be a valid number.',
                'branch_pin.integer' => 'The Branch Pin should be a valid number.',
                'branch_pin.required' => 'The Branch Pin field is required.',
                'branch_email.required' => 'The Branch Email field is required.',
                'branch_email.email' => 'The Branch Email should be a valid email.',                
                'branch_complex_name.required' => 'The Branch Complex Name field is required.',      
                'branch_city.required' => 'The Branch City field is required.',      
                'branch_state.required' => 'The Branch State field is required.',      
                'branch_country.required' => 'The Branch Country field is required.',
                'branch_establish_year.integer' => 'The Branch Established Year should be a valid number.',
                'branch_fax.integer' => 'The Branch Fax should be a valid number.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $input['mst_companies_id'];
            $input_data['branch_name'] = $input['branch_name'];  
            $input_data['branch_type'] = $input['branch_type'];  
            $input_data['branch_code'] = $input['branch_code'];  
            $input_data['branch_office_no'] = $input['branch_office_no'];  
            $input_data['branch_complex_name'] = $input['branch_complex_name'];  
            $input_data['branch_street_name'] = $input['branch_street_name'];  
            $input_data['branch_land_mark'] = $input['branch_land_mark'];  
            $input_data['branch_area'] = $input['branch_area'];  
            $input_data['branch_city'] = $input['branch_city'];  
            $input_data['branch_state'] = $input['branch_state'];  
            $input_data['branch_country'] = $input['branch_country'];  
            $input_data['branch_pin'] = $input['branch_pin'];  
            $input_data['branch_phone'] = $input['branch_phone'];  
            $input_data['branch_fax'] = $input['branch_fax'];  
            $input_data['branch_mobile'] = $input['branch_mobile'];  
            $input_data['branch_email'] = $input['branch_email'];  
            $input_data['branch_establish_year'] = $input['branch_establish_year'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Branch updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $branch = Branch::find($id);
            $branch->update($input_data);

            return Helper::response("Branch updated successfully", Response::HTTP_OK, true, $branch); 
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
            $branch = Branch::find($id);

            Log::info("Branch deleted with : ".json_encode(array('id' => $id)));

            if(!empty($branch)){
                $branch->delete();
                return Helper::response("Branch deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Branch not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }
}

