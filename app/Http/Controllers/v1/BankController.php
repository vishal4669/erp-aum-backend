<?php

namespace App\Http\Controllers\v1;

use App\Models\Bank;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;

class BankController extends Controller
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
                $data = Bank::select('mst_banks.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_banks.mst_companies_id')
                        ->where('mst_banks.is_active',1)
                        ->where('mst_banks.selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('mst_banks.id', 'desc')
                        ->get();
            } else {
                $data = Bank::select('mst_banks.*', 'c.company_name')
                        ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_banks.mst_companies_id')
                        ->where('mst_banks.is_active',1)
                        ->orderBy('mst_banks.id', 'desc')
                        ->get();
            }
            
            return Helper::response("Bank List Shown Successfully", Response::HTTP_OK, true, $data);

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
        //
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
                'bank_name' => 'required|min:3|max:255',
                'customer_id' => 'max:20',
                'account_no' => 'required|max:20',
                'micr_code' => 'required|digits:9',
                'ifsc_code' => 'required|min:11|max:11',
            ];

            $messages = [
                'bank_name.required' => 'Bank Name field is required.',
                'customer_id.required' => 'Customer ID field is required.',
                'account_no.required' => 'Account No. field is required.',
                'micr_code.required' => 'MICR code field is required.',
                'micr_code.digits' => 'MICR code field should be 9 digits.',
                'ifsc_code.required' => 'IFSC Code field is required.',
                'ifsc_code.min' => 'IFSC Code must be 11 characters.',
                'ifsc_code.max' => 'IFSC Code must be 11 characters.',       
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['bank_name'] = $input['bank_name'];  
            $input_data['branch_name'] = $input['branch_name'];  
            $input_data['customer_id'] = $input['customer_id'];  
            $input_data['account_no'] = $input['account_no'];  
            $input_data['micr_code'] = $input['micr_code'];  
            $input_data['ifsc_code'] = $input['ifsc_code'];
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];              
            $input_data['is_active'] = 1;

            Log::info("Bank Created with details : ".json_encode($input_data));

            $data = Bank::create($input_data);
            return Helper::response("Bank Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        Log::info("Fetch Bank details : ".json_encode(array('id' => $id)));
        try{
            $bankData = Bank::select('mst_banks.*', 'c.company_name')
            ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_banks.mst_companies_id')->where('mst_banks.id', $id)->first();
            return Helper::response("Bank Data Shown Successfully", Response::HTTP_OK, true, $bankData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function edit(Bank $bank)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try{
            $rules = [
                'bank_name' => 'required|min:3|max:255',
                'customer_id' => 'max:20',
                'account_no' => 'required|max:20',
                'micr_code' => 'required|digits:9',
                'ifsc_code' => 'required|min:11|max:11',
            ];

            $messages = [
                'bank_name.required' => 'Bank Name field is required.',
                'customer_id.required' => 'Customer ID field is required.',
                'account_no.required' => 'Account No. field is required.',
                'micr_code.required' => 'MICR code field is required.',
                'micr_code.digits' => 'MICR code field should be 9 digits.',
                'ifsc_code.required' => 'IFSC Code field is required.',
                'ifsc_code.min' => 'IFSC Code must be 11 characters.',
                'ifsc_code.max' => 'IFSC Code must be 11 characters.',
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['bank_name'] = $input['bank_name'];  
            $input_data['branch_name'] = $input['branch_name'];  
            $input_data['customer_id'] = $input['customer_id'];  
            $input_data['account_no'] = $input['account_no'];  
            $input_data['micr_code'] = $input['micr_code'];  
            $input_data['ifsc_code'] = $input['ifsc_code'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Bank updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $bank = Bank::find($id);
            $bank->update($input_data);

            return Helper::response("Bank updated successfully", Response::HTTP_OK, true, $bank); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Bank  $bank
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $data = array();
            $bank = Bank::find($id);

            Log::info("Bank deleted with : ".json_encode(array('id' => $id)));

            if(!empty($bank)){
                $bank->delete();
                return Helper::response("Bank deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Bank does not exist", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }
}
