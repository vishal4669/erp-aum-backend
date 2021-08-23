<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Helpers\Helper;
use Auth;
use Log;
use JWTAuth;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
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
                $data = Company::where('is_active',1)->where('selected_year', $loggedInUserData['selected_year'])->orderBy('id', 'desc')->get();
            } else {
                $data = Company::where('is_active',1)->orderBy('id', 'desc')->get();
            }
            
            return Helper::response("Company List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'company_name' => 'required|string',
            ];

            $messages = [
                'company_name.required' => 'The Company Name field is required'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['company_name'] = $input['company_name']; 
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Company Created with details : ".json_encode($input_data));

            $data = Company::create($input_data);
            return Helper::response("Company added Successfully", Response::HTTP_OK, true,$data);  
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
        Log::info("Fetch company details : ".json_encode(array('id' => $id)));
        try{

            $companyData = Company::find($id);
            return Helper::response("Company Data Shown Successfully", Response::HTTP_OK, true, $companyData);
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
                'company_name' => 'required|string',
            ];

            $messages = [
                'company_name.required' => 'The Company Name field is required'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );
            
            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['company_name'] = $input['company_name'];         
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Company updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $company = Company::find($id);
            $company->update($input_data);

            return Helper::response("Company updated successfully", Response::HTTP_OK, true, $company); 
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
            $company = Company::find($id);

            Log::info("Company deleted with : ".json_encode(array('id' => $id)));

            if(!empty($company)){
                $company->delete();
                return Helper::response("Company deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Company not exists", Response::HTTP_OK, true, $data);   
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }    
        
    }
}

