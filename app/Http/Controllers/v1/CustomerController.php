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
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

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

            $rules = [
                'company_name' => 'required|string|max:255',
                'gst_number' => 'nullable|regex:/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/',
                'user_name' => 'required|string|max:255',
                'password' => 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/',
                'logo' => 'image|mimes:jpeg,png,jpg,svg|max:2048',
            ];

            $messages = [
                'company_name.required' => 'Company name field is required.',
                'company_name.max' => 'Company name should not me greater than 255 characters.',
                'gst_number.regex' => 'it is invalid GST (Goods and Services Tax) number',
                'user_name.required' => 'User name field is required.',
                'user_name.max' => 'User name should not me greater than 255 characters.',
                'password.required' => 'password field is required.',
                'password.regex' => 'Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:',
                'logo.mimes' => 'image type must be jpeg,png,jpg,svg',
                'logo.max' => 'image size must be less than 2048 kb',
                
            ];
            $validator = Validator::make( $request->all(), $rules, $messages );

            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            $files = $request->file('logo');
            $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
            $files->move(public_path('images\customers\logo'), $imageName);

            $data = Customer::create([
                    'mst_companies_id' => $loggedInUserData['company_id'],
                    'company_name' => $request->get('company_name'),
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
                    'logo' => $imageName,
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
                    'created_by'=>1,//edited
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
