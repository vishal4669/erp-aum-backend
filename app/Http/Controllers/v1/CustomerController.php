<?php

namespace App\Http\Controllers\v1;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
use DB;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        DB::beginTransaction();
        try{

            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string|max:255',
                'middle_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'username' => 'required|string|max:255',
                'password' => 'required|string|min:6',
                'blood_group' => 'string|max:50'
            ]);

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            
            $data = Customer::create([
                    // 'mst_companies_id' => $loggedInUserData['company_id'],
                    'company_name' => $request->get('first_name'),
                    'gst_number' => $request->get('gst_number'),
                    'contact_person_name' => $request->get('contact_person_name'),
                    'tally_alias_name' => $request->get('tally_alias_name'),
                    'username' => $request->get('username'),
                    'password' => ($request->get('password')) ? Hash::make($request->get('password')) : '',
                    'birth_date' => $request->get('birth_date'),
                    'contact_type' => $request->get('contact_type'),
                    'priority' => $request->get('priority'),
                    'notes' => $request->get('notes'),
                    'notes' => $request->get('notes'),
                    'logo' => $request->get('logo'),
                    'home_street_1' => $request->get('home_street_1'),
                    'home_street_2' => $request->get('home_street_2'),
                    'home_area' => $request->get('home_area'),
                    'home_pin' => $request->get('home_pin'),
                    'home_city' => $request->get('home_city'),
                    'home_state' => $request->get('home_state'),
                    'home_country' => $request->get('home_country'),
                    'home_landline' => $request->get('home_landline'),
                    'home_contact_no' => $request->get('home_contact_no'),
                    'home_qc_contact_no' => $request->get('home_qc_contact_no'),
                    'home_email' => $request->get('home_email'),
                    'home_pan_card' => $request->get('home_pan_card'),
                    'other_street_1' => $request->get('other_street_1'),
                    'other_street_2' => $request->get('other_street_2'),
                    'other_area' => $request->get('other_area'),
                    'other_pin' => $request->get('other_pin'),
                    'other_city' => $request->get('other_city'),
                    'other_state' => $request->get('other_state'),
                    'other_country' => $request->get('other_country'),
                    'other_website' => $request->get('other_website'),
                    'other_contact_no' => $request->get('other_contact_no'),
                    'other_qc_email' => $request->get('other_qc_email'),
                    'other_qa_email' => $request->get('other_qa_email'),
                    'other_pan_card_copy' => $request->get('other_pan_card_copy'),
                    'education_details' => $request->get('education_details'),
                    'prev_details' => $request->get('prev_details'),
                    'company_vat_no' => $request->get('company_vat_no'),
                    'company_tin_no' => $request->get('company_tin_no'),
                    'company_service_tax_no' => $request->get('company_service_tax_no'),
                    'company_cst_no' => $request->get('company_cst_no'),
                    'company_cust_discount' => $request->get('company_cust_discount'),
                    'selected_year' => $loggedInUserData['selected_year'],
                    'is_active' => 1,
                    'updated_by' => $loggedInUserData['logged_in_user_id']
                ]);

            DB::commit();
            Log::info("Customer Created with details : ".json_encode($request->all()));
            return Helper::response("Customer added Successfully", Response::HTTP_CREATED, true,$data);  

        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }     

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show(Customer $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function edit(Customer $customer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Customer $customer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Customer $customer)
    {
        //
    }
}
