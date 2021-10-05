<?php

namespace App\Http\Controllers\v1;

use App\Models\Customer;
use App\Models\CustomerContactInfo;
use App\Models\CustomerContactPerson;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Helpers\Helper;
use Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use DB;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use JWTAuth;
use Symfony\Component\HttpFoundation\File\File;


class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $loggedInUserData = Helper::getUserData();
            $is_dropdown = (isset($request->is_dropdown) && $request->is_dropdown == 1) ? 1 : 0;
            if (!$is_dropdown) {
                $data = Customer::leftJoin('mst_customers_contact_info as c_info', 'c_info.mst_customer_id', '=', 'mst_customers.id')
                    ->where('c_info.contact_info_type', '1')
                    ->select('mst_customers.id', 'company_name', 'contact_person_name', 'contact_type', 'tally_alias_name', 'c_info.contact_no', 'is_active')
                    ->where('mst_customers.selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('mst_customers.id', 'desc')
                    ->paginate(10);
            } elseif ($is_dropdown) {
                $data = Customer::leftJoin('mst_customers_contact_info as c_info', 'c_info.mst_customer_id', '=', 'mst_customers.id')
                    ->where('c_info.contact_info_type', '1')
                    ->select('mst_customers.id', 'company_name', 'contact_person_name', 'contact_type', 'tally_alias_name', 'c_info.contact_no', 'is_active')
                    ->where('is_active', 1)
                    ->orderBy('mst_customers.id', 'desc')
                    ->get();
            }

            $data_arr = $data->isEmpty();

            if ($data_arr) {
                return Helper::response("Customer List is Empty", Response::HTTP_OK, true, $data);
            } else {
                return Helper::response("Customer List Shown Successfully", Response::HTTP_OK, true, $data);
            }
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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

        $req = $request->all();
        $someArray = json_decode($req['contact_person_data'], true);
        $req['contact_person_data'] = $someArray;
        DB::beginTransaction();
        try {
            $rules = [

                'company_name' => 'required|string|max:255',
                'gst_number' => 'nullable|max:15|regex:/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/',
                'user_name' => 'required|email|max:255',
                'password' => 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,15}$/',
                'customer_contact_info.home_contact_info.*.home_pan_card' => 'nullable|regex:/[A-Z]{5}[0-9]{4}[A-Z]{1}/',
                'logo' => 'nullable|image|mimes:jpeg,png,jpg,svg|max:2048',
                'company_tin_no' => ['nullable', 'regex:/^(9\d{2})([ \-]?)([7]\d|8[0-8])([ \-]?)(\d{4})$/'],
                'customer_contact_info.other_contact_info.*.street_1' => 'nullable|max:100',
                'customer_contact_info.other_contact_info.*.street_1' => 'nullable|max:100',
                'customer_contact_info.other_contact_info.*.street_2' => 'nullable|max:100',
                'customer_contact_info.home_contact_info.*.street_1' => 'nullable|max:100',
                'customer_contact_info.home_contact_info.*.street_2' => 'nullable|max:100',
                'customer_contact_info.home_contact_info.*.email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.other_qc_email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy' => 'nullable|mimes:jpeg,png,jpg,pdf|max:2048',
                'customer_contact_info.home_contact_info.*.contact_no' => 'nullable|min:10|max:10',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no' => 'nullable|min:10|max:10',
                'customer_contact_info.home_contact_info.*.home_landline' => 'nullable|regex:/^[0-9]\d{2,4}-\d{6,8}$/',
                'customer_contact_info.other_contact_info.*.contact_no' => 'nullable|min:10|max:10',
                'contact_person_data.*.contact_person_mobile' => 'nullable|min:10|max:10',
                'contact_person_data.*.contact_person_email' => 'nullable|email',
            ];

            $messages = [
                'company_name.required' => 'Company name field is required.',
                'company_name.max' => 'Company name should not me greater than 255 characters.',
                'gst_number.regex' => 'it is invalid GST (Goods and Services Tax) number',
                'user_name.required' => 'User name field is required.',
                'user_name.email' => 'Please enter valid email for User name',
                'user_name.max' => 'User name should not me greater than 255 characters.',
                'password.required' => 'password field is required.',
                'password.regex' => 'password invalid : minimum eight max 15 characters, only one uppercase letter,at least one lowercase letter, one number and one special character:',
                'customer_contact_info.home_contact_info.*.home_pan_card.regex' => 'Please enter valid Pan example:"ABCDE7190K" 10 digit number',
                'logo.image' => 'please select image file for logo',
                'logo.mimes' => 'image type must be jpeg,png,jpg,svg',
                'logo.max' => 'image size must be less than 2048 kb',
                'company_tin_no.regex' => 'Please enter valid Tin number <u>example</u>: "900700000" or "900 70 0000" or "900-70-0000"',
                'customer_contact_info.home_contact_info.*.email.email' => 'Please enter valid email for Account/Admin E-mail',
                'customer_contact_info.other_contact_info.*.email.email' => 'Please enter valid email QA E-mail',
                'customer_contact_info.other_contact_info.*.other_qc_email.email' => 'Please enter valid email for other_qc_email',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy.mimes' => 'File type must be jpeg,png,jpg,pdf for pan card copy',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy.max' => 'image size must be less than 2048 kb',
                'customer_contact_info.home_contact_info.*.street_1.max' => 'please enter maximum 100 words for home street_1',
                'customer_contact_info.home_contact_info.*.street_2.max' => 'please enter maximum 100 words for home street_2',
                'customer_contact_info.other_contact_info.*.street_1.max' => 'please enter maximum 100 words for other street_1',
                'customer_contact_info.other_contact_info.*.street_2.max' => 'please enter maximum 100 words for other street_2',
                'customer_contact_info.home_contact_info.*.contact_no.min' => 'please enter minimum 10 digits for home account/admin contact no',
                'customer_contact_info.home_contact_info.*.contact_no.max' => 'please enter maximum 10 digits for home account/admin contact no',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no.min' => 'please enter minimum 10 digits for home qc contact no',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no.max' => 'please enter maximum 10 digits for home qc contact no',
                'customer_contact_info.home_contact_info.*.home_landline.regex' => 'please enter valid landline number for home "xxx-xxxxxxxx"',
                'customer_contact_info.other_contact_info.*.contact_no.min' => 'please enter minimum 10 digits for other QA Contact No',
                'customer_contact_info.other_contact_info.*.contact_no.max' => 'please enter maximum 10 digits for other QA Contact No',
                'contact_person_data.*.contact_person_mobile.min' => 'please enter minimum 10 digits for contact person mobile no',
                'contact_person_data.*.contact_person_mobile.max' => 'please enter maximum 10 digits for contact person mobile no',
                'contact_person_data.*.contact_person_email.email' => 'Please enter valid email for contact person',
            ];

            $validator = Validator::make($req, $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }


            $imageName = '';
            $loggedInUserData = Helper::getUserData();
            if ($request->logo != "") {
                $files = $request->file('logo');
                $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
                $files->move(public_path('images/customers/logo'), $imageName);
                $data['logo'] = $imageName;
            }

            $data = Customer::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'company_name' => $request->get('company_name'),
                'gst_number' => $request->get('gst_number'),
                'contact_person_name' => $request->get('contact_person_name'),
                'tally_alias_name' => $request->get('tally_alias_name'),
                'user_name' => $request->get('user_name'),
                'password' => ($request->get('password')) ? Hash::make($request->get('password')) : '',
                'birth_date' => $request->get('birth_date'),
                'contact_type' => $request->get('contact_type'),
                'priority' => $request->get('priority'),
                'notes' => $request->get('notes'),
                'logo' => ($request->file('logo')) ? $imageName : '',
                'education_details' => $request->get('education_details'),
                'prev_details' => $request->get('prev_details'),
                'company_tin_no' => $request->get('company_tin_no'),
                'company_service_tax_no' => $request->get('company_service_tax_no'),
                'company_cust_discount' => $request->get('company_cust_discount'),
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => $request->get('is_active'),
                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                'updated_at' => NULL
            ]);


            $customer_id = $data->id;
            $all_req = $request->all();

            // //add customer contact-information
            $this->addupdateCustomerContactInfo($all_req, $request->customer_contact_info, $customer_id);
            $this->addupdateCustomerContactPerson($req['contact_person_data'], $customer_id);

            DB::commit();
            Log::info("Customer Created with details : " . json_encode($request->all()));
            return Helper::response("Customer added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        Log::info("Fetch customer details : " . json_encode(array('id' => $id)));
        try {

            $customerData = Customer::with(['contact_info', 'contact_person'])->find($id);

            //homecustom arr key
            $customerData['contact_info'][0]['homestreet'] = $customerData['contact_info'][0]['street_1'];
            $customerData['contact_info'][0]['pincode'] = $customerData['contact_info'][0]['pin'];
            $customerData['contact_info'][0]['country_id'] = $customerData['contact_info'][0]['country'];
            $customerData['contact_info'][0]['admin_contact'] = $customerData['contact_info'][0]['contact_no'];
            $customerData['contact_info'][0]['admin_email'] = $customerData['contact_info'][0]['email'];
            $customerData['contact_info'][0]['homestreet2'] = $customerData['contact_info'][0]['street_2'];
            $customerData['contact_info'][0]['state_id'] = $customerData['contact_info'][0]['state'];
            $customerData['contact_info'][0]['landline'] = $customerData['contact_info'][0]['home_landline'];
            $customerData['contact_info'][0]['qc_contact'] = $customerData['contact_info'][0]['home_qc_contact_no'];
            $customerData['contact_info'][0]['pancard_no'] = $customerData['contact_info'][0]['home_pan_card'];
            //othercustom arr key
            $customerData['contact_info'][1]['street'] = $customerData['contact_info'][1]['street_1'];
            $customerData['contact_info'][1]['area1'] = $customerData['contact_info'][1]['area'];
            $customerData['contact_info'][1]['pincode1'] = $customerData['contact_info'][1]['pin'];
            $customerData['contact_info'][1]['corr_country_id'] = $customerData['contact_info'][1]['country'];
            $customerData['contact_info'][1]['qa_contact'] = $customerData['contact_info'][1]['contact_no'];
            $customerData['contact_info'][1]['qa_email'] = $customerData['contact_info'][1]['email'];
            $customerData['contact_info'][1]['street2'] = $customerData['contact_info'][1]['street_2'];
            $customerData['contact_info'][1]['city1'] = $customerData['contact_info'][1]['city'];
            $customerData['contact_info'][1]['corr_state_id'] = $customerData['contact_info'][1]['state'];
            $customerData['contact_info'][1]['website'] = $customerData['contact_info'][1]['other_website'];
            $customerData['contact_info'][1]['qc_email'] = $customerData['contact_info'][1]['other_qc_email'];


            unset(
                $customerData['contact_info'][0]['street_1'],
                $customerData['contact_info'][0]['pin'],
                $customerData['contact_info'][0]['country'],
                $customerData['contact_info'][0]['contact_no'],
                $customerData['contact_info'][0]['email'],
                $customerData['contact_info'][0]['street_2'],
                $customerData['contact_info'][0]['state'],
                $customerData['contact_info'][0]['home_landline'],
                $customerData['contact_info'][0]['home_qc_contact_no'],
                $customerData['contact_info'][0]['home_pan_card'],

                $customerData['contact_info'][1]['street_1'],
                $customerData['contact_info'][1]['area'],
                $customerData['contact_info'][1]['pin'],
                $customerData['contact_info'][1]['country'],
                $customerData['contact_info'][1]['contact_no'],
                $customerData['contact_info'][1]['email'],
                $customerData['contact_info'][1]['street_2'],
                $customerData['contact_info'][1]['city'],
                $customerData['contact_info'][1]['state'],
                $customerData['contact_info'][1]['other_website'],
                $customerData['contact_info'][1]['other_qc_email'],

            );


            foreach ($customerData['contact_person'] as $conatct_person) {
                $conatct_person['contact_person_name'] = $conatct_person['name'];
                $conatct_person['contact_person_mobile'] = $conatct_person['mobile'];
                $conatct_person['contact_person_email'] = $conatct_person['email'];
                $conatct_person['mst_departments_id'] = $conatct_person['department'];
                $conatct_person['mst_positions_id'] = $conatct_person['position'];
                unset(
                    $conatct_person['name'],
                    $conatct_person['mobile'],
                    $conatct_person['email'],
                    $conatct_person['department'],
                    $conatct_person['position']
                );
            }
            return Helper::response("Customer Data Shown Successfully", Response::HTTP_OK, true, $customerData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $req = $request->all();
        $someArray = json_decode($req['contact_person_data'], true);
        $req['contact_person_data'] = $someArray;
        $apipass = Customer::where('id', $id)->value('password');
        $apilogo = Customer::where('id', $id)->value('logo');
        $apipan = CustomerContactInfo::where('mst_customer_id', $id)->where('contact_info_type', 2)->value('other_pan_card_copy');

        $passrule = '';
        $logorule = '';
        $panrule = '';

        if ($request->password == $apipass) {
            $passrule = 'required';
            $password = $request->get('password');
        } else {
            $passrule = 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,15}$/';
            $password = Hash::make($request->get('password'));
        }

        if ($request->logo == $apilogo || $request->logo == "null") {
            $logorule = '';
        } else {
            $logorule = 'nullable|image|mimes:jpeg,png,jpg,svg|max:2048';
        }

        $reqpan = $req['customer_contact_info']['other_contact_info'][0]['other_pan_card_copy'];

        if ($reqpan == $apipan || $reqpan == null || $reqpan == "null" || $reqpan == "undefined") {
            $panrule = '';
        } else {
            $panrule = 'nullable|mimes:jpeg,png,jpg,svg,pdf|max:2048';
        }



        try {
            $rules1 = [

                'company_name' => 'required|string|max:255',
                'gst_number' => 'nullable|max:15|regex:/^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/',
                'user_name' => 'required|email|max:255',
                'password' => $passrule,
                'customer_contact_info.home_contact_info.*.home_pan_card' => 'nullable|regex:/[A-Z]{5}[0-9]{4}[A-Z]{1}/',
                'logo' => $logorule,
                'company_tin_no' => ['nullable', 'regex:/^(9\d{2})([ \-]?)([7]\d|8[0-8])([ \-]?)(\d{4})$/'],
                'customer_contact_info.home_contact_info.*.email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.other_qc_email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy' => $panrule,
                'customer_contact_info.home_contact_info.*.contact_no' => 'nullable|min:10|max:10',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no' => 'nullable|min:10|max:10',
                'customer_contact_info.home_contact_info.*.home_landline' => 'nullable|regex:/^[0-9]\d{2,4}-\d{6,8}$/',
                'customer_contact_info.other_contact_info.*.contact_no' => 'nullable|min:10|max:10',
                'contact_person_data.*.contact_person_mobile' => 'nullable|min:10|max:10',
                'contact_person_data.*.contact_person_email' => 'nullable|email',
                'customer_contact_info.other_contact_info.*.street_1' => 'nullable|max:100',
                'customer_contact_info.other_contact_info.*.street_2' => 'nullable|max:100',
                'customer_contact_info.home_contact_info.*.street_1' => 'nullable|max:100',
                'customer_contact_info.home_contact_info.*.street_2' => 'nullable|max:100',
            ];

            $messages1 = [
                'company_name.required' => 'Company name field is required.',
                'company_name.max' => 'Company name should not me greater than 255 characters.',
                'gst_number.regex' => 'it is invalid GST (Goods and Services Tax) number',
                'user_name.required' => 'User name field is required.',
                'user_name.max' => 'User name should not me greater than 255 characters.',
                'password.required' => 'password field is required.',
                'password.regex' => 'password invalid : minimum eight max 15 characters, only one uppercase letter,at least one lowercase letter, one number and one special character:',
                'customer_contact_info.home_contact_info.*.home_pan_card.regex' => 'Please enter valid Pan example:"ABCDE7190K" 10 digit number',
                'logo.image' => 'please select image file for logo',
                'logo.mimes' => 'image type must be jpeg,png,jpg,svg',
                'logo.max' => 'image size must be less than 2048 kb',
                'user_name.email' => 'Please enter valid email for User name',
                'customer_contact_info.home_contact_info.*.email.email' => 'Please enter valid email for Account/Admin E-mail',
                'company_tin_no.regex' => 'Please enter valid Tin number <u>example</u>: "900700000" or "900 70 0000" or "900-70-0000"',
                'customer_contact_info.home_contact_info.*.street_1.max' => 'please enter maximum 100 words for home street_1',
                'customer_contact_info.home_contact_info.*.street_2.max' => 'please enter maximum 100 words for home street_2',
                'customer_contact_info.other_contact_info.*.street_1.max' => 'please enter maximum 100 words for other street_1',
                'customer_contact_info.other_contact_info.*.street_2.max' => 'please enter maximum 100 words for other street_2',
                'customer_contact_info.other_contact_info.*.email.email' => 'Please enter valid other QA E-mail',
                'customer_contact_info.other_contact_info.*.other_qc_email.email' => 'Please enter valid other qc email',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy.image' => 'please select image file for Pancard copy',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy.mimes' => 'File type must be jpeg,png,jpg,pdf for pan card copy',
                'customer_contact_info.other_contact_info.*.other_pan_card_copy.max' => 'image size must be less than 2048 kb for Pancard copy',
                'customer_contact_info.home_contact_info.*.contact_no.min' => 'please enter minimum 10 digits for home Account/Admin Contact No',
                'customer_contact_info.home_contact_info.*.contact_no.max' => 'please enter maximum 10 digits for home Account/Admin Contact No',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no.min' => 'please enter minimum 10 digits for home qc contact no',
                'customer_contact_info.home_contact_info.*.home_qc_contact_no.max' => 'please enter maximum 10 digits for home qc contact no',
                'customer_contact_info.home_contact_info.*.home_landline.regex' => 'please enter valid landline number for home example: "xxx-xxxxxxxx"',
                'customer_contact_info.other_contact_info.*.contact_no.min' => 'please enter minimum 10 digits for other QA Contact No',
                'customer_contact_info.other_contact_info.*.contact_no.max' => 'please enter maximum 10 digits for other QA Contact No',
                'contact_person_data.*.contact_person_mobile.min' => 'please enter minimum 10 digits for contact person mobile no',
                'contact_person_data.*.contact_person_mobile.max' => 'please enter maximum 10 digits for contact person mobile no',
                'contact_person_data.*.contact_person_email.email' => 'Please enter valid email for contact person',
            ];

            $validator1 = Validator::make($req, $rules1, $messages1);

            if ($validator1->fails()) {
                $data1 = array();
                return Helper::response($validator1->errors()->all(), Response::HTTP_OK, false, $data1);
            }

            $imageName = NULL;
            $loggedInUserData = Helper::getUserData();
            if ($apilogo !== $request->get('logo') && $request->logo !== "null") {
                if ($request->logo != "" || $request->logo != null) {
                    $files = $request->file('logo');
                    $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
                    $files->move(public_path('images/customers/logo'), $imageName);
                    $data['logo'] = $imageName;
                }
            }

            $bithdate = $request->get('birth_date');
            if ($bithdate != "null" && $bithdate != null) {
                $birth_date = $request->get('birth_date');
            } else {
                $birth_date = NUll;
            }

            $input_data = [
                'mst_companies_id' => $loggedInUserData['company_id'],
                'company_name' => $request->get('company_name'),
                'gst_number' => $request->get('gst_number'),
                'contact_person_name' => $request->get('contact_person_name'),
                'tally_alias_name' => $request->get('tally_alias_name'),
                'user_name' => $request->get('user_name'),
                'password' => $password,
                'birth_date' => $birth_date,
                'contact_type' => $request->get('contact_type'),
                'priority' => $request->get('priority'),
                'notes' => $request->get('notes'),
                'logo' => ($request->file('logo')) ? $imageName : $request->get('logo'),
                'education_details' => $request->get('education_details'),
                'prev_details' => $request->get('prev_details'),
                'company_tin_no' => $request->get('company_tin_no'),
                'company_service_tax_no' => $request->get('company_service_tax_no'),
                'company_cust_discount' => $request->get('company_cust_discount'),
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => (int)$request->get('is_active'),
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ];

            $customer_id = $id;
            $all_req = $request->all();
            // //add customer contact-information
            $this->addupdateCustomerContactInfo($all_req, $request->get('customer_contact_info'), $customer_id);
            $this->addupdateCustomerContactPerson($req['contact_person_data'], $customer_id);

            Log::info("Customer updated with details : " . json_encode(array('data' => $input_data, 'id' => $customer_id)));

            $old_logo = Customer::find($id);

            // if ($old_logo->logo != null || $old_logo->logo != '') {
            //     unlink("images\customers\logo\\" . $old_logo->logo);
            // }

            $customer = Customer::find($customer_id);
            $customer->update($input_data);



            return Helper::response("Customer updated successfully", Response::HTTP_OK, true, $customer);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function addupdateCustomerContactInfo($all_req, $contact_data, $customer_id)
    {
        $home_contact_infos = $contact_data['home_contact_info'][0];
        $other_contact_infos = $contact_data['other_contact_info'][0];
        $files = $all_req['customer_contact_info']['other_contact_info'][0]['other_pan_card_copy'];
        if ($home_contact_infos['state'] == "null") {
            $h_state = 0;
        } else {
            $h_state = $home_contact_infos['state'];
        }
        if ($other_contact_infos['state'] == "null") {
            $o_state = 0;
        } else {
            $o_state = $other_contact_infos['state'];
        }
        if ($home_contact_infos['country'] == "null") {
            $h_country = 0;
        } else {
            $h_country = $home_contact_infos['country'];
        }
        if ($other_contact_infos['country'] == "null") {
            $o_country = 0;
        } else {
            $o_country = $other_contact_infos['country'];
        }
        if (!empty($contact_data)) {
            if (!empty($home_contact_infos)) {
                $loggedInUserData = Helper::getUserData();

                // check if data already present for the customer contact info
                $home_contact_count = count($home_contact_infos);

                if ($home_contact_count) {
                    if ($home_contact_infos['contact_info_type'] == 1) {
                        $home_contactArray = array(
                            'mst_customer_id' => $customer_id,
                            'street_1' => (isset($home_contact_infos['street_1'])) ? $home_contact_infos['street_1'] : '',
                            'street_2' => (isset($home_contact_infos['street_2'])) ? $home_contact_infos['street_2'] : '',
                            'area' => (isset($home_contact_infos['area'])) ? $home_contact_infos['area'] : '',
                            'pin' => (isset($home_contact_infos['pin'])) ? $home_contact_infos['pin'] : '',
                            'city' => (isset($home_contact_infos['city'])) ? $home_contact_infos['city'] : '',
                            'state' => (isset($home_contact_infos['state'])) ? $h_state : 0,
                            'country' => (isset($home_contact_infos['country'])) ? $o_country : 0,
                            'home_landline' => (isset($home_contact_infos['home_landline'])) ? $home_contact_infos['home_landline'] : '',
                            'home_pan_card' => (isset($home_contact_infos['home_pan_card'])) ? $home_contact_infos['home_pan_card'] : '',
                            'contact_info_type' => (isset($home_contact_infos['contact_info_type'])) ? $home_contact_infos['contact_info_type'] : '',
                            'contact_no' => (isset($home_contact_infos['contact_no'])) ? $home_contact_infos['contact_no'] : '',
                            'home_qc_contact_no' => (isset($home_contact_infos['home_qc_contact_no'])) ? $home_contact_infos['home_qc_contact_no'] : '',
                            'email' => (isset($home_contact_infos['email'])) ? $home_contact_infos['email'] : '',
                            'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                            'updated_by' => $loggedInUserData['logged_in_user_id']
                        );

                        $Data = CustomerContactInfo::where('mst_customer_id', $customer_id)->where('contact_info_type', 1);
                        $countPerAdd = $Data->count();
                        if ($countPerAdd > 0) {
                            $home_contactArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
                            $Data->update($home_contactArray);
                        } else {
                            $home_contactArray['created_by'] = $loggedInUserData['logged_in_user_id'];
                            CustomerContactInfo::create($home_contactArray);
                        }
                    }
                }
            }


            if (!empty($contact_data)) {

                if (!empty($other_contact_infos)) {

                    $loggedInUserData = Helper::getUserData();
                    $files = $all_req['customer_contact_info']['other_contact_info'][0]['other_pan_card_copy'];
                    $apipan = CustomerContactInfo::where('mst_customer_id', $customer_id)->where('contact_info_type', 2)->value('other_pan_card_copy');



                    if ($apipan != $files) {
                        if (array_key_exists("other_pan_card_copy", $all_req['customer_contact_info']['other_contact_info'][0])) {
                            if ($files !== null  && $files !== "undefined") {
                                $imageName = date('YmdHis') . "." . $files->getClientOriginalExtension();
                                $files->move(public_path('images/customers/pancard_copy'), $imageName);
                                $othercontactArray['other_pan_card_copy'] = $imageName;
                            }
                        }
                    }

                    if ($files == null || $files == "undefined") {
                        $imageName = $apipan;
                    }

                    // check if data already present for the customer
                    $other_contact_count = count($other_contact_infos);

                    if ($other_contact_count) {

                        if ($other_contact_infos['contact_info_type'] == 2) {
                            $othercontactArray = array(
                                'mst_customer_id' => $customer_id,
                                'street_1' => (isset($other_contact_infos['street_1'])) ? $other_contact_infos['street_1'] : '',
                                'street_2' => (isset($other_contact_infos['street_2'])) ? $other_contact_infos['street_2'] : '',
                                'area' => (isset($other_contact_infos['area'])) ? $other_contact_infos['area'] : '',
                                'pin' => (isset($other_contact_infos['pin'])) ? $other_contact_infos['pin'] : '',
                                'city' => (isset($other_contact_infos['city'])) ? $other_contact_infos['city'] : '',
                                'state' => (isset($other_contact_infos['state'])) ? $o_state : 0,
                                'country' => (isset($other_contact_infos['country'])) ? $o_country : 0,
                                'other_website' => (isset($other_contact_infos['other_website'])) ? $other_contact_infos['other_website'] : '',
                                'other_qc_email' => (isset($other_contact_infos['other_qc_email'])) ? $other_contact_infos['other_qc_email'] : '',
                                'contact_info_type' => (isset($other_contact_infos['contact_info_type'])) ? $other_contact_infos['contact_info_type'] : '',
                                'contact_no' => (isset($other_contact_infos['contact_no'])) ? $other_contact_infos['contact_no'] : '',
                                'email' => (isset($other_contact_infos['email'])) ? $other_contact_infos['email'] : '',
                                'other_pan_card_copy' => (isset($files)) ? $imageName : $files,
                                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                                'updated_by' => $loggedInUserData['logged_in_user_id']
                            );

                            $Data = CustomerContactInfo::where('mst_customer_id', $customer_id)->where('contact_info_type', 2);
                            $countPerAdd = $Data->count();
                            if ($countPerAdd > 0) {

                                $old_image = CustomerContactInfo::where('mst_customer_id', $customer_id)->where('contact_info_type', 2)->first();

                                // if ($old_image->other_pan_card_copy != null || $old_image->other_pan_card_copy != '') {

                                //     unlink("images\customers\pancard_copy\\" . $old_image->other_pan_card_copy);
                                // }

                                $othercontactArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
                                $Data->update($othercontactArray);
                            } else {
                                $othercontactArray['created_by'] = $loggedInUserData['logged_in_user_id'];
                                CustomerContactInfo::create($othercontactArray);
                            }
                        }
                    }
                }
            }
        }
    }


    public function addupdateCustomerContactPerson($contact_person_data, $customer_id)
    {

        if (!empty($contact_person_data)) {

            // Delete all old   
            $customercontactperson = CustomerContactPerson::where('mst_customer_id', $customer_id);
            $customercontactperson->forceDelete();

            $loggedInUserData = Helper::getUserData();

            // check if data already present for the customers contact person
            $contact_person_count = count($contact_person_data);
            if ($contact_person_count) {

                foreach ($contact_person_data as $contact_data) {
                    if (
                        !empty($contact_data['contact_person_name']) or
                        !empty($contact_data['contact_person_mobile']) or
                        !empty($contact_data['contact_person_email']) or
                        !empty($contact_data['mst_departments_id']) or
                        !empty($contact_data['mst_positions_id'])
                    ) {
                        $contactpersonArray = array(
                            'mst_customer_id' => $customer_id,
                            'name' => (isset($contact_data['contact_person_name'])) ? $contact_data['contact_person_name'] : '',
                            'mobile' => (isset($contact_data['contact_person_mobile'])) ? $contact_data['contact_person_mobile'] : '',
                            'email' => (isset($contact_data['contact_person_email'])) ? $contact_data['contact_person_email'] : '',
                            'department' => (isset($contact_data['mst_departments_id'])) ? (int)$contact_data['mst_departments_id'] : 0,
                            'position' => (isset($contact_data['mst_positions_id'])) ? (int)$contact_data['mst_positions_id'] : 0,
                            'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                            'updated_by' => $loggedInUserData['logged_in_user_id']
                        );
                        CustomerContactPerson::create($contactpersonArray);
                    }
                }
            }
        } else {
            $customercontactperson = CustomerContactPerson::where('mst_customer_id', $customer_id);
            $customercontactperson->forceDelete();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        try {
            $data = array();
            $customer = Customer::find($id);
            $CustomerContactInfo = CustomerContactInfo::where("mst_customer_id", $id);
            $CustomerContactPerson = CustomerContactPerson::where("mst_customer_id", $id);

            Log::info("Customer deleted with : " . json_encode(array('id' => $id)));

            if (!empty($customer)) {
                $customer->delete();
                if (!empty($CustomerContactInfo)) {
                    $CustomerContactInfo->delete();
                }
                if (!empty($CustomerContactPerson)) {
                    $CustomerContactPerson->delete();
                }
                return Helper::response("Customer deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Customer not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
