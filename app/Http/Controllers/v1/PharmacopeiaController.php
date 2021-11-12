<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Pharmacopeia;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class PharmacopeiaController extends Controller
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
                $data = Pharmacopeia::where('is_active',1)->where('selected_year', $loggedInUserData['selected_year'])->where('mst_companies_id', $loggedInUserData['company_id'])->orderBy('id', 'desc')->get();
            } else {
                $data = Pharmacopeia::where('is_active',1)->where('mst_companies_id', $loggedInUserData['company_id'])->orderBy('id', 'desc')->get();
            }
            
            return Helper::response("Pharmacopeia List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'pharmacopeia_name' => 'required|string|max:255',
                'vol_no' => 'required|integer',
                'pharmacopeia_year' => 'required|integer',
                'pharmacopeia_edition' => 'required|string',
            ];

            $messages = [
                'pharmacopeia_name.required' => 'The Pharmacopeia Name field is required.',
                'vol_no.required' => 'The Volume Number field is required.',
                'vol_no.integer' => 'The Volume Number should be a valid number.',
                'pharmacopeia_year.required' => 'The Pharmacopeia Year field is required.',
                'pharmacopeia_year.integer' => 'The Pharmacopeia Year should be a valid number.',
                'pharmacopeia_edition.required' => 'The Pharmacopeia Edition field is required.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];  
            $input_data['pharmacopeia_name'] = $input['pharmacopeia_name'];  
            $input_data['vol_no'] = $input['vol_no'];   
            $input_data['pharmacopeia_year'] = $input['pharmacopeia_year'];
            $input_data['pharmacopeia_edition'] = $input['pharmacopeia_edition'];  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
           
            Log::info("Pharmacopeia Created with details : ".json_encode($input_data));

            $data = Pharmacopeia::create($input_data);
            return Helper::response("Pharmacopeia Added Successfully", Response::HTTP_OK, true, $data);  
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
        Log::info("Fetch pharmacopeia details : ".json_encode(array('id' => $id)));
        try{
            $companyData = Pharmacopeia::find($id);
            return Helper::response("Pharmacopeia Data Shown Successfully", Response::HTTP_OK, true, $companyData);
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
                'pharmacopeia_name' => 'required|string|max:255',
                'vol_no' => 'required|integer',
                'pharmacopeia_year' => 'required|integer',
                'pharmacopeia_edition' => 'required|string',
            ];

            $messages = [
                'pharmacopeia_name.required' => 'The Pharmacopeia Name field is required.',
                'vol_no.required' => 'The Volume Number field is required.',
                'vol_no.integer' => 'The Volume Number should be a valid number.',
                'pharmacopeia_year.required' => 'The Pharmacopeia Year field is required.',
                'pharmacopeia_year.integer' => 'The Pharmacopeia Year should be a valid number.',
                'pharmacopeia_edition.required' => 'The Pharmacopeia Edition field is required.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );
            
            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }


            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['pharmacopeia_name'] = $input['pharmacopeia_name'];  
            $input_data['vol_no'] = $input['vol_no'];   
            $input_data['pharmacopeia_year'] = $input['pharmacopeia_year'];
            $input_data['pharmacopeia_edition'] = $input['pharmacopeia_edition'];  
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Pharmacopeia updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $pharmacopeia = Pharmacopeia::find($id);
            $pharmacopeia->update($input_data);

            return Helper::response("Pharmacopeia updated successfully", Response::HTTP_OK, true, $pharmacopeia); 
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
            $pharmacopeia = Pharmacopeia::find($id);

            Log::info("Pharmacopeia deleted with : ".json_encode(array('id' => $id)));

            if(!empty($pharmacopeia)){
                $pharmacopeia->delete();
                return Helper::response("Pharmacopeia deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Pharmacopeia not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Display a listing of the resource with specific fields.
     *
     * @return \Illuminate\Http\Response
     */

    public function exportPharmacopieaData(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();
            $data = Pharmacopeia::where('is_active',1)->where('mst_companies_id', $loggedInUserData['company_id'])->orderBy('id', 'desc')->get(['pharmacopeia_name', 'vol_no', 'pharmacopeia_year', 'pharmacopeia_edition']);
            return Helper::response("Export Parmacopeia List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
        
    }

}

