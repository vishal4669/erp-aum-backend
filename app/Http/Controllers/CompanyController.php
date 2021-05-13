<?php    

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Helpers\Helper;
use Auth;
use Log;
    

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
            $data = Company::all();
            return Helper::response("Company List Shown Successfully",200,true,$data);
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
            $input_data['company_name'] = $input['company_name']; 
            $input_data['current_year'] = date('Y');  
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = Auth::user()->id;

            Log::info("Company Created with details : ".json_encode($input_data));

            $data = Company::create($input_data);
            return Helper::response("Company List Shown Successfully",200,true,$data);  
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
            return Helper::response("Company Data Shown Successfully",200,true,$companyData);
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
            $input_data['company_name'] = $input['company_name'];         
            $input_data['updated_by'] = Auth::user()->id; 

            Log::info("Company updated with details : ".json_encode(array('data' => $input_data, 'id' => $id));

            $company = Company::find($id);
            $company->update($input_data);

            return Helper::response("Company updated successfully",200,true,$company); 
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

            Log::info("Company deleted with : ".json_encode(array('id' => $id));


            if(!empty($company)){
                $company->delete();
                return Helper::response("Company deleted successfully",200,true,$data); 
            }  

            return Helper::response("Company not exists",404,false,$data);   
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }     
        
    }

}

