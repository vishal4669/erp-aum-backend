<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Ledger;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class LedgerController extends Controller
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
                $data = Ledger::select('mst_ledgers.*', 'c.company_name', 'g.group_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_ledgers.mst_companies_id')
                        ->leftjoin('mst_groups as g', 'g.id', '=', 'mst_ledgers.mst_groups_id')
                        ->where('mst_ledgers.is_active',1)
                        ->where('mst_ledgers.selected_year', $loggedInUserData['selected_year'])
                        ->where('mst_ledgers.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_ledgers.id', 'desc')
                        ->get();
            } else {
                $data = Ledger::select('mst_ledgers.*', 'c.company_name', 'g.group_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_ledgers.mst_companies_id')
                        ->leftjoin('mst_groups as g', 'g.id', '=', 'mst_ledgers.mst_groups_id')
                        ->where('mst_ledgers.is_active',1)
                        ->orderBy('mst_ledgers.id', 'desc')
                        ->get();
            }

            
            return Helper::response("Ledger List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'ledger_name' => 'required|max:255',
                'ledger_opening_balance' => 'required|numeric',
                'ledger_contact_type' => 'required',
            ];

            $messages = [
                'ledger_name.required' => 'The Ledger Name field is required.',
                'ledger_name.max' => 'The Ledger Name must be less than or equal to 255 characters.',
                'ledger_opening_balance.required' => 'The Ledger Opening Balance field is required.',
                'ledger_opening_balance.numeric' => 'The Ledger Opening Balance should be a valid number.',
                'ledger_contact_type.required' => 'The Ledger Contact Type field is required.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['ledger_name'] = $input['ledger_name'];  
            $input_data['ledger_opening_balance'] = $input['ledger_opening_balance'];  
            $input_data['ledger_contact_type'] = $input['ledger_contact_type'];  
            $input_data['mst_groups_id'] = $input['mst_groups_id'];  
            $input_data['balance_type'] = $input['balance_type'];  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Ledger Created with details : ".json_encode($input_data));

            $data = Ledger::create($input_data);
            return Helper::response("Ledger Added Successfully", Response::HTTP_OK, true, $data);  
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
        Log::info("Fetch ledger details : ".json_encode(array('id' => $id)));
        try{
            $ledgerData = Ledger::find($id);
            return Helper::response("Ledger Data Shown Successfully", Response::HTTP_OK, true, $ledgerData);
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
                'ledger_name' => 'required|max:255',
                'ledger_opening_balance' => 'required|numeric',
                'ledger_contact_type' => 'required',
            ];

            $messages = [
                'ledger_name.required' => 'The Ledger Name field is required.',
                'ledger_name.max' => 'The Ledger Name must be less than or equal to 255 characters.',
                'ledger_opening_balance.required' => 'The Ledger Opening Balance field is required.',
                'ledger_opening_balance.numeric' => 'The Ledger Opening Balance should be a valid number.',
                'ledger_contact_type.required' => 'The Ledger Contact Type field is required.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $input = $request->all();
            $input_data['ledger_name'] = $input['ledger_name'];  
            $input_data['ledger_opening_balance'] = $input['ledger_opening_balance'];  
            $input_data['ledger_contact_type'] = $input['ledger_contact_type'];  
            $input_data['mst_groups_id'] = $input['mst_groups_id']; 
            $input_data['balance_type'] = $input['balance_type'];   
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Ledger updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $ledger = Ledger::find($id);
            $ledger->update($input_data);

            return Helper::response("Ledger updated successfully", Response::HTTP_OK, true, $ledger); 
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
            $ledger = Ledger::find($id);

            Log::info("Ledger deleted with : ".json_encode(array('id' => $id)));

            if(!empty($ledger)){
                $ledger->delete();
                return Helper::response("Ledger deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Ledger not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}

