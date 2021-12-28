<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\User;
use App\Helpers\Helper;
use App\Models\Position;
use Auth;
use Log;
use JWTAuth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\UserAddressDetail;
use App\Models\UserCompanyInfo;
use App\Models\UserAssignRight;
use App\Models\UserDocDetail;
use App\Models\UserEduDetail;
use App\Models\UserEmpDetail;
use File;
use DB;
use Illuminate\Validation\Rule;

class EmployeeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request, $is_dashboard_hr = '')
    {

        try {

            $loggedInUserData = Helper::getUserData();
            $is_dropdown = (isset($request->is_dropdown) && $request->is_dropdown == 1) ? 1 : 0;
            $is_reporting_authority = (isset($request->is_reporting_authority) && $request->is_reporting_authority == 1) ? 1 : 0;
            $is_chemist = (isset($request->is_chemist) && $request->is_chemist == 1) ? 1 : 0;
            $is_resigned  = (isset($request->is_resigned) && $request->is_resigned  == 1) ? 1 : 0;
            $is_dashboard_hr  = (isset($request->is_dashboard_hr) && $request->is_dashboard_hr  == 1 || $is_dashboard_hr == 1) ? 1 : 0;
            if ($is_dropdown) {
                if ($is_resigned == 0 || $is_reporting_authority == 0) {
                    $data = Employee::with(['address', 'right', 'company', 'company.reporting_authority_name:id,first_name,middle_name,last_name', 'education', 'employment', 'document'])
                        ->where('users.is_resigned', 0)
                        ->where('users.is_active', 1)
                        ->Where('users.is_approved', "Approved")
                        ->where('users.mst_companies_id', $loggedInUserData['company_id']);

                    if ($is_reporting_authority) {
                        $data  = $data->where('users.is_reporting_authority', 1);
                    }
                } else {
                    $data = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])
                        ->where('users.is_resigned', 0)
                        ->where('users.is_active', 1)
                        ->Where('users.is_approved', "Approved")
                        ->where('users.mst_companies_id', $loggedInUserData['company_id']);
                    if ($is_reporting_authority) {
                        $data  = $data->where('users.is_reporting_authority', 1);
                    }
                }
                $data  = $data->orderBy('users.id', 'desc')
                    ->get();
            } elseif ($is_chemist) {

                $chemist_id = Position::where('position_title', 'Chemist')->get('id');
                $chemist_id = $chemist_id->toarray();
                $data =  Employee::join('user_company_info as company', 'company.users_id', 'users.id')
                    ->where('company.mst_positions_id', $chemist_id[0]['id'])
                    ->where('users.is_active', 1)
                    ->where('users.mst_companies_id', $loggedInUserData['company_id'])
                    ->get(['users.id', 'users.first_name', 'users.middle_name', 'users.last_name']);
            } elseif ($is_resigned) {
                //deleted data not require
                $data = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])
                    ->where('users.is_resigned', 1)
                    ->where('deleted_at', NULL) //deleted data not require condition
                    //  ->where('users.is_active', 1) not needed is active condition
                    //->where('users.selected_year', $loggedInUserData['selected_year'])
                    ->where('users.mst_companies_id', $loggedInUserData['company_id']);
                if ($is_reporting_authority) {
                    $data  = $data->where('users.is_reporting_authority', 1);
                }
                $data  = $data->orderBy('users.id', 'desc')
                    ->get();
            } elseif ($is_dashboard_hr) {
                $data = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])
                    ->where('users.is_resigned', 0)
                    ->where('users.is_approved', "Pending")
                    ->where('users.is_active', 0)
                    ->where('users.mst_companies_id', $loggedInUserData['company_id']);
                if ($is_reporting_authority) {
                    $data  = $data->where('users.is_reporting_authority', 1);
                }
                $data  = $data->orderBy('users.id', 'desc')
                    ->get()->toarray();
            } else {
                //deleted data not require
                $data = Employee::with('address', 'right', 'company', 'education', 'employment', 'document')
                    ->where('users.is_resigned', 0)
                    ->where('users.mst_companies_id', $loggedInUserData['company_id']);
                if ($is_reporting_authority) {
                    $data  = $data->where('users.is_reporting_authority', 1);
                }
                $data  = $data->orderBy('users.id', 'desc')
                    ->get();
            }

            return Helper::response("Employee List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        $req = $request->all();
        // need to uncomment when add employee with frontend using form instead of postman
        $education = json_decode($req['education'], true);
        $employment = json_decode($req['employment'], true);

        // $education  = $request->education;
        // $employment = $request->employment; 
        $req['education'] = $education;
        $req['employment'] = $employment;
        DB::beginTransaction();
        try {
            $rules = [

                // Employee Form Fields
                'first_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'middle_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'last_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'birth_date' => 'required|date',
                'mobile' => 'required|min:10|max:10',
                'phone' => 'nullable|min:10|max:10',

                // Address form fields
                'address.0.mst_countries_id' => 'required',
                'address.0.mst_states_id' => 'required',
                'address.0.street1' => 'required|max:255',
                'address.0.street2' => 'required|max:255',
                'address.0.email' => 'nullable|email',
                'address.0.emergency_contact_name' => 'required|max:255',
                'address.1.emergency_contact_number' => 'required|min:10|max:10',

                // Company Info form fields
                'company.mst_companies_id' => 'required',
                'company.mst_departments_id' => 'required',
                'company.mst_positions_id' => 'required',
                'company.join_date' => 'nullable|date',
                'company.resign_date' => 'nullable|date',
                'company.username' => 'required|unique:user_company_info,username,NULL,id,deleted_at,NULL|max:255',
                'company.password' => 'required',

                // documents related messages
                'document.aadhar_card_photo' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'document.election_card_photo' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'document.pan_card_photo' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'document.passport_photo' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'document.driving_license_photo' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'document.pan_card_number' => 'nullable|regex:/[A-Z]{5}[0-9]{4}[A-Z]{1}/',
                'document.aadhar_number' => 'nullable|regex:/^[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}$/',
                'document.election_card_number' => 'nullable|regex:/^([a-zA-Z]){3}([0-9]){7}?$/',
                'document.passport_number' => 'nullable|regex:/^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$/',
                //'document.driving_license_number' => 'nullable|regex:/^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$/',

                // employee photo and signature
                'signature' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'photo' => 'nullable|mimes:jpeg,jpg,png',

                // education validation
                'education.*.from_year' => 'nullable|digits:4',
                'education.*.to_year' => 'nullable|digits:4',

                // employment validation
                'employment.*.emp_from_year' => 'nullable|digits:4',
                'employment.*.emp_to_year' => 'nullable|digits:4',
            ];

            $messages = [
                'first_name.required' => 'Employee First Name field is required.',
                'first_name.max' => 'Employee First Name should not me greater than 255 characters.',
                'first_name.regex' => 'Only Allowed Letters & Spaces in Employee First Name',
                'middle_name.required' => 'Employee Middle Name field is required.',
                'middle_name.max' => 'Employee Middle Name should not me greater than 255 characters.',
                'middle_name.regex' => 'Only Allowed Letters & Spaces in Employee Middle Name',
                'last_name.required' => 'Employee Last Name field is required.',
                'last_name.max' => 'Employee Last Name should not me greater than 255 characters.',
                'last_name.regex' => 'Only Allowed Letters & Spaces in Employee Last Name',
                'birth_date.required' => 'Birth Date field is required.',
                'birth_date.date' => 'Please enter valid date for Employee Date Of Birth.',
                'mobile.required' => 'Mobile field is required.',
                'mobile.min' => 'Mobile Number should not be less than 10 characters.',
                'mobile.max' => 'Mobile Number should not be greater than 10 characters.',
                'phone.min' => 'Phone Number should not be less than 10 characters.',
                'phone.max' => 'Phone Number should not me greater than 10 characters.',

                // address form messages
                'address.0.mst_countries_id.required' => 'Permanent Address Country field is required.',
                'address.0.mst_states_id.required' => 'Permanent Address State field is required.',
                'address.0.street1.required' => 'Permanent Address Street 1 is required',
                'address.0.street1.max' => 'please enter maximum 255 words for Permanent Address Street 1',
                'address.0.street2.required' => 'Permanent Address Street 2 is required',
                'address.0.street2.max' => 'please enter maximum 255 words for Permanent Address Street 2',
                'address.0.email' => 'Please enter valid email for address Email',
                'address.0.emergency_contact_name.required' => 'Emergency Contact Name field is required.',
                'address.0.emergency_contact_name.max' => 'Emergency Contact Name should not me greater than 255 characters.',
                'address.1.emergency_contact_number.required' => 'Emergency Contact Number field is required.',
                'address.1.emergency_contact_number.min' => 'Emergency Contact Number should not be less than 10 characters.',
                'address.1.emergency_contact_number.max' => 'Emergency Contact Number should not me greater than 10 characters.',

                // for company form messages
                'company.mst_companies_id.required' => 'Employee Company field is required.',
                'company.mst_departments_id.required' => 'Company Department field is required.',
                'company.mst_positions_id.required' => 'Company Position field is required.',
                'company.join_date.date' => 'Please enter valid date for Employee Company Join Date.',
                'company.resign_date.date' => 'Please enter valid date for Employee Company Resign Date.',
                'company.username.required' => 'User Name field is required.',
                'company.username.unique' => 'Username is Already Taken Please enter Different Username Manually.',
                'company.password.required' => 'Password Field is Required.',

                //documents related messages
                'document.aadhar_card_photo.mimes' => 'The Aadhar Card must be a file of type: jpeg, jpg, png, pdf.',
                'document.election_card_photo.mimes' => 'The Election Card must be a file of type: jpeg, jpg, png, pdf.',
                'document.pan_card_photo.mimes' => 'The Pan Card must be a file of type: jpeg, jpg, png, pdf.',
                'document.passport_photo.mimes' => 'The Passport must be a file of type: jpeg, jpg, png, pdf.',
                'document.driving_license_photo.mimes' => 'The Driving License must be a file of type: jpeg, jpg, png, pdf.',
                'document.pan_card_number.regex' => 'Invalid Pan Number Format.',
                'document.aadhar_number.regex' => 'Invalid Aadhar Number Format.',
                'document.election_card_number.regex' => 'Invalid Election Card Number Format.',
                'document.passport_number.regex' => 'Invalid Passport Number Format.',
                //'document.driving_license_number.regex' => 'Passport Number Format is Invalid, Support Following Format [A2190457].',

                //documents related messages
                'signature.mimes' => 'The Employee Signature must be a file of type: jpeg, jpg, png, pdf.',
                'photo.mimes' => 'The Employee Photo must be a file of type: jpeg, jpg, png.',

                // education related messages
                'education.*.from_year.digits' => '"From Year" Must Be 4 Digits In Education Details.',
                'education.*.to_year.digits' => '"To Year" Must Be 4 Digits In Education Details.',

                // employment related messages
                'employment.*.emp_from_year.digits' => '"From Year" Must Be 4 Digits In Employment Details.',
                'employment.*.emp_to_year.digits' => '"To Year" Must Be 4 Digits In Employment Details.',
            ];

            $validator = Validator::make($req, $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            $username = '';
            $password = '';
            if (!empty($request->company)) {
                $username = $request->company['username'];
                $password = base64_encode($request->company['password']);
            }

            $data = Employee::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'title' => $request->get('title'),
                'first_name' => $request->get('first_name'),
                'middle_name' => $request->get('middle_name'),
                'last_name' => $request->get('last_name'),
                'username' => $username,
                'password' => $password,
                'blood_group' => $request->get('blood_group'),
                'gender' => $request->get('gender'),
                'birth_date' => $request->get('birth_date'),
                'marital_status' => $request->get('marital_status'),
                'machine_code' => $request->get('machine_code'),
                'phone' => $request->get('phone'),
                'mobile' => $request->get('mobile'),
                'notes' => $request->get('notes'),
                'attendance' => $request->get('attendance'),
                'booking_action' => $request->get('booking_action'),
                'booking_sms' => $request->get('booking_sms'),
                'booking_email' => $request->get('booking_email'),
                'is_resigned' => $request->get('is_resigned'),
                'booking_copy' => $request->get('booking_copy'),
                'booking_rate' => $request->get('booking_rate'),
                'nationality' => $request->get('nationality'),
                'religion' => $request->get('religion'),
                'caste' => $request->get('caste'),
                'is_reporting_authority' => $request->get('is_reporting_authority'),
                'deposit' => $request->get('deposit'),
                'selected_year' => $loggedInUserData['selected_year'],
                'is_admin' => 0,
                'is_approved' => "Pending",
                'is_active' => 0,
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_at' => NULL
            ]);

            //Added user id
            $users_id = $data->id;

            // Upload Signature and Photo for the employee
            $photo_file_name = $signature_file_name = '';
            $random_string = Helper::generateRandomString();

            $photo = (isset($request['photo']) && !empty($request['photo'])) ? $request['photo'] : '';
            if (!empty($photo)) {
                $photo_file_name = 'photo_' . $users_id . "_" . $random_string . "." . $photo->getClientOriginalExtension();
                $photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $photo_file_name);
            }

            $signature = (isset($request['signature']) && !empty($request['signature'])) ? $request['signature'] : '';
            if (!empty($signature)) {
                $signature_file_name = 'signature_' . $users_id . "_" . $random_string . "." . $signature->getClientOriginalExtension();
                $signature->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $signature_file_name);
            }

            $userData = Employee::find($users_id);
            $userData->photo = ($photo_file_name && $photo_file_name != '') ? config('constants.EMPLOYEE_DOCUMENTS_URL') . '/' . $photo_file_name : $userData->photo;
            $userData->signature = ($signature_file_name && $signature_file_name != '') ? config('constants.EMPLOYEE_DOCUMENTS_URL') . '/' . $signature_file_name : $userData->signature;
            $userData->save();

            //Update User related details
            if (isset($request->address)) {
                $this->addUpdateUserAddressDetails($request->address, $users_id);
            }
            if (isset($request->education)) {
                $this->addUserEducationDetails($education, $users_id);
            }
            if (isset($request->employment)) {
                $this->addUserEmploymentDetails($employment, $users_id);
            }
            if (isset($request->company)) {
                $this->addUpdateUserCompanyDetails($request->company, $users_id, $password);
            }
            if (isset($request->document)) {
                $this->addUpdateUserDocumentDetails($request->document, $users_id);
            }
            DB::commit();
            Log::info("Employee Created with details : " . json_encode($request->all()));

            return Helper::response("Employee added Successfully", Response::HTTP_CREATED, true, $userData);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        Log::info("Fetch employee details : " . json_encode(array('id' => $id)));
        try {
            $employeeData = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])->find($id);
            return Helper::response("Employee Data Shown Successfully", Response::HTTP_OK, true, $employeeData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        $req = $request->all();
        // need to uncomment when add employee with frontend using form instead of postman
        $education = json_decode($req['education'], true);
        $employment = json_decode($req['employment'], true);

        // $education  = $request->education;
        // $employment = $request->employment;
        $req['education'] = $education;
        $req['employment'] = $employment;
        try {
            $employee = Employee::find($id);
            if ($request['photo'] == $employee->photo || $request['photo'] == null) {
                $photo_rule = '';
            } else {
                $photo_rule = 'nullable|mimes:jpeg,jpg,png';
            }
            if ($request['signature'] == $employee->signature || $request['signature'] == null) {
                $signature_rule = '';
            } else {
                $signature_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }

            $rules = [

                // Employee Form Fields
                'first_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'middle_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'last_name' => 'required|regex:/^[a-zA-Z\s]+$/u|max:255',
                'birth_date' => 'required|date',
                'mobile' => 'required|min:10|max:10',
                'phone' => 'nullable|min:10|max:10',

                // employee photo and signature
                'photo' => $photo_rule,
                'signature' => $signature_rule,

                // Address form fields
                'address.0.mst_countries_id' => 'required',
                'address.0.mst_states_id' => 'required',
                'address.0.street1' => 'required|max:255',
                'address.0.street2' => 'required|max:255',
                'address.0.email' => 'nullable|email',
                'address.0.emergency_contact_name' => 'required|max:255',
                'address.1.emergency_contact_number' => 'required|min:10|max:10',

                // Company Info form fields
                'company.mst_companies_id' => 'required',
                'company.mst_departments_id' => 'required',
                'company.mst_positions_id' => 'required',
                'company.join_date' => 'nullable|date',
                'company.username' => [Rule::unique('user_company_info','username')->ignore($id, 'users_id')],
                // 'company.password' => 'required',

                // documents related messages
                'document.pan_card_number' => 'nullable|regex:/[A-Z]{5}[0-9]{4}[A-Z]{1}/',
                'document.aadhar_number' => 'nullable|regex:/^[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}$/',
                'document.election_card_number' => 'nullable|regex:/^([a-zA-Z]){3}([0-9]){7}?$/',
                'document.passport_number' => 'nullable|regex:/^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$/',
                //'document.driving_license_number' => 'nullable|regex:/^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$/',


                // education validation
                'education.*.from_year' => 'nullable|digits:4',
                'education.*.to_year' => 'nullable|digits:4',

                // employment validation
                'employment.*.emp_from_year' => 'nullable|digits:4',
                'employment.*.emp_to_year' => 'nullable|digits:4',
            ];

            $messages = [
                'first_name.required' => 'Employee First Name field is required.',
                'first_name.max' => 'Employee First Name should not me greater than 255 characters.',
                'first_name.regex' => 'Only Allowed Letters & Spaces in Employee First Name',
                'middle_name.required' => 'Employee Middle Name field is required.',
                'middle_name.max' => 'Employee Middle Name should not me greater than 255 characters.',
                'middle_name.regex' => 'Only Allowed Letters & Spaces in Employee Middle Name',
                'last_name.required' => 'Employee Last Name field is required.',
                'last_name.max' => 'Employee Last Name should not me greater than 255 characters.',
                'last_name.regex' => 'Only Allowed Letters & Spaces in Employee Last Name',
                'birth_date.required' => 'Birth Date field is required.',
                'birth_date.date' => 'Please enter valid date for Employee Date Of Birth.',
                'mobile.required' => 'Mobile field is required.',
                'mobile.min' => 'Mobile Number should not be less than 10 characters.',
                'mobile.max' => 'Mobile Number should not be greater than 10 characters.',
                'phone.min' => 'Phone Number should not be less than 10 characters.',
                'phone.max' => 'Phone Number should not me greater than 10 characters.',

                // address form messages
                'address.0.mst_countries_id.required' => 'Permanent Address Country field is required.',
                'address.0.mst_states_id.required' => 'Permanent Address State field is required.',
                'address.0.street1.required' => 'Permanent Address Street 1 is required',
                'address.0.street1.max' => 'please enter maximum 255 words for Permanent Address Street 1',
                'address.0.street2.required' => 'Permanent Address Street 2 is required',
                'address.0.street2.max' => 'please enter maximum 255 words for Permanent Address Street 2',
                'address.0.email' => 'Please enter valid email for address Email',
                'address.0.emergency_contact_name.required' => 'Emergency Contact Name field is required.',
                'address.0.emergency_contact_name.max' => 'Emergency Contact Name should not me greater than 255 characters.',
                'address.1.emergency_contact_number.required' => 'Emergency Contact Number field is required.',
                'address.1.emergency_contact_number.min' => 'Emergency Contact Number should not be less than 10 characters.',
                'address.1.emergency_contact_number.max' => 'Emergency Contact Number should not me greater than 10 characters.',

                // for company form messages
                'company.mst_companies_id.required' => 'Employee Company field is required.',
                'company.mst_departments_id.required' => 'Company Department field is required.',
                'company.mst_positions_id.required' => 'Company Position field is required.',
                'company.join_date.date' => 'Please enter valid date for Employee Company Join Date.',
                'company.username.required' => 'User Name field is required.',
                'company.username.unique' => 'Username is Already Taken Please Enter Different Username.',
                'company.password.required' => 'Password Field is Required.',

                //documents related messages
                'document.pan_card_number.regex' => 'Invalid Pan Number Format.',
                'document.aadhar_number.regex' => 'Invalid Aadhar Number Format.',
                'document.election_card_number.regex' => 'Invalid Election Card Number Format.',
                'document.passport_number.regex' => 'Invalid Passport Number Format.',
                //'document.driving_license_number.regex' => 'Passport Number Format is Invalid, Support Following Format [A2190457].',

                //documents related messages
                'signature.mimes' => 'The Employee Signature must be a file of type: jpeg, jpg, png, pdf.',
                'photo.mimes' => 'The Employee Photo must be a file of type: jpeg, jpg, png.',

                // education related messages
                'education.*.from_year.digits' => '"From Year" Must Be 4 Digits In Education Details.',
                'education.*.to_year.digits' => '"To Year" Must Be 4 Digits In Education Details.',

                // employment related messages
                'employment.*.emp_from_year.digits' => '"From Year" Must Be 4 Digits In Employment Details.',
                'employment.*.emp_to_year.digits' => '"To Year" Must Be 4 Digits In Employment Details.',
            ];

            $document_arr = $request->document;
            foreach ($document_arr as $key => $item) {
                if (is_object($item) == 1) {
                    $rules['document.' . $key . ''] = 'nullable|mimes:jpeg,jpg,png,pdf';
                    $messages['document.' . $key . '.mimes'] = 'The ' . $key . ' must be a file of type: jpeg, jpg, png, pdf.';
                }
            }

            $validator = Validator::make($req, $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            $is_approved = "Pending";
            if (
                isset($request->is_approved) &&
                ($request->is_approved == "Approved" || $request->is_approved == "Rejected")
            ) {
                $is_approved = $request->is_approved;
            }
            $username = '';
            $password = '';
            if (!empty($request->company)) {
                $username = $request->company['username'];
                if ($employee->password !== base64_encode($request->company['password'])) {
                    $password = base64_encode($request->company['password']);
                } else {
                    $password = $employee->password;
                }
            }

            $input_data = [
                'title' => $request->get('title'),
                'first_name' => $request->get('first_name'),
                'middle_name' => $request->get('middle_name'),
                'last_name' => $request->get('last_name'),
                'username' => $username,
                'password' => $password,
                'blood_group' => $request->get('blood_group'),
                'gender' => $request->get('gender'),
                'birth_date' => $request->get('birth_date'),
                'marital_status' => $request->get('marital_status'),
                'machine_code' => $request->get('machine_code'),
                'phone' => $request->get('phone'),
                'mobile' => $request->get('mobile'),
                'notes' => $request->get('notes'),
                'attendance' => $request->get('attendance'),
                'booking_action' => $request->get('booking_action'),
                'booking_sms' => $request->get('booking_sms'),
                'booking_email' => $request->get('booking_email'),
                'is_resigned' => $request->get('is_resigned'),
                'booking_copy' => $request->get('booking_copy'),
                'booking_rate' => $request->get('booking_rate'),
                'nationality' => $request->get('nationality'),
                'religion' => $request->get('religion'),
                'caste' => $request->get('caste'),
                'reporting_authority' => $request->get('reporting_authority'),
                'deposit' => $request->get('deposit'),
                'is_approved' =>  $is_approved,
                'is_active' => ($is_approved == 'Approved') ? 1 : 0,
                'selected_year' => $loggedInUserData['selected_year'],
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ];

            Log::info("Employee updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $photo_file_name = $signature_file_name = '';
            $random_string = Helper::generateRandomString();


            $photo = (isset($request['photo']) && !empty($request['photo'])) ? $request['photo'] : '';
            if (!empty($photo)) {
                if ($employee->photo !== $photo && $request['photo'] !== null) {
                    $photo_file_name = 'photo_' . $id . "_" . $random_string . "." . $photo->getClientOriginalExtension();
                    $photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $photo_file_name);
                }
            }

            $signature = (isset($request['signature']) && !empty($request['signature'])) ? $request['signature'] : '';
            if (!empty($signature)) {
                if ($employee->signature !== $signature && $request['signature'] !== null) {
                    $signature_file_name = 'signature_' . $id . "_" . $random_string . "." . $signature->getClientOriginalExtension();
                    $signature->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $signature_file_name);
                }
            }

            $employee->photo = ($photo_file_name && $photo_file_name != '') ? config('constants.EMPLOYEE_DOCUMENTS_URL') . '/' . $photo_file_name : $employee->photo;
            $employee->signature = ($signature_file_name && $signature_file_name != '') ? config('constants.EMPLOYEE_DOCUMENTS_URL') . '/' . $signature_file_name : $employee->signature;


            $employee->update($input_data);

            //Update User related details
            if (isset($request->address)) {
                $this->addUpdateUserAddressDetails($request->address, $id);
            }
            if (isset($request->education)) {
                $this->addUserEducationDetails($education, $id);
            }
            if (isset($request->employment)) {
                $this->addUserEmploymentDetails($employment, $id);
            }
            if (isset($request->company)) {
                $this->addUpdateUserCompanyDetails($request->company, $id, $password);
            }
            if (isset($request->document)) {
                $this->addUpdateUserDocumentDetails($request->document, $id);
            }

            return Helper::response("Employee updated successfully", Response::HTTP_OK, true, $employee);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
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
        try {
            $users = Employee::find($id);
            $user_AddressDetail = UserAddressDetail::where("users_id", $id);
            $user_AssignRight = UserAssignRight::where("users_id", $id);
            $user_CompanyInfo = UserCompanyInfo::where("users_id", $id);
            $user_DocDetail = UserDocDetail::where("users_id", $id);
            $user_EduDetail = UserEduDetail::where("users_id", $id);
            $user_EmpDetail = UserEmpDetail::where("users_id", $id);

            // dd($users);
            if (!empty($users)) {
                $users->delete();
                if (!empty($user_AddressDetail)) {
                    $user_AddressDetail->delete();
                }
                if (!empty($user_AssignRight)) {
                    $user_AssignRight->delete();
                }
                if (!empty($user_CompanyInfo)) {
                    $user_CompanyInfo->delete();
                }
                if (!empty($user_DocDetail)) {
                    $user_DocDetail->delete();
                }
                if (!empty($user_EduDetail)) {
                    $user_EduDetail->delete();
                }
                if (!empty($user_EmpDetail)) {
                    $user_EmpDetail->delete();
                }
                Log::info("Users deleted with : " . json_encode(array('id' => $id)));
                return Helper::response("Employee deleted successfully", Response::HTTP_OK, true, $data);
            }
            return Helper::response("Employee not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Update employee address details
     *
     * @param  int  $users_id
     * @param  array  $request
     * @return \Illuminate\Http\Response
     */
    function addUpdateUserAddressDetails($address_data, $users_id = '')
    {
        if (!empty($address_data)) {
            $loggedInUserData = Helper::getUserData();

            // check if data already present for the user
            $address_count = count($address_data);

            if ($address_count) {
                foreach ($address_data as $address) {

                    $addressArray = array(
                        'users_id' => $users_id,
                        'mst_countries_id' => (isset($address['mst_countries_id'])) ? $address['mst_countries_id'] : 0,
                        'mst_states_id' => (isset($address['mst_states_id'])) ? $address['mst_states_id'] : 0,
                        'street1' => (isset($address['street1'])) ? $address['street1'] : '',
                        'street2' => (isset($address['street2'])) ? $address['street2'] : '',
                        'area' => (isset($address['area'])) ? $address['area'] : '',
                        'city' => (isset($address['city'])) ? $address['city'] : '',
                        'pincode' => (isset($address['pincode'])) ? $address['pincode'] : '',
                        'email' => (isset($address['email'])) ? $address['email'] : '',
                        'emergency_contact_name' => (isset($address['emergency_contact_name'])) ? $address['emergency_contact_name'] : '',
                        'emergency_contact_number' => (isset($address['emergency_contact_number'])) ? $address['emergency_contact_number'] : '',
                        'website' => (isset($address['website'])) ? $address['website'] : '',
                    );

                    if (isset($address['address_type'])) {
                        switch ($address['address_type']) {
                            case '1': // for permanent address
                                $perAddressData = UserAddressDetail::where('users_id', $users_id)->where('address_type', 1);
                                $countPerAdd = $perAddressData->count();
                                if ($countPerAdd > 0) {
                                    $addressArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
                                    $perAddressData->update($addressArray);
                                } else {
                                    $addressArray['address_type'] = 1;
                                    $addressArray['created_by'] = $loggedInUserData['logged_in_user_id'];
                                    UserAddressDetail::create($addressArray);
                                }

                                break;
                            case '2': // for correspondence address
                                $corrAddressData = UserAddressDetail::where('users_id', $users_id)->where('address_type', 2);
                                $countCorAdd = $corrAddressData->count();

                                if ($countCorAdd > 0) {
                                    $addressArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
                                    $corrAddressData->update($addressArray);
                                } else {
                                    $addressArray['address_type'] = 2;
                                    $addressArray['created_by'] = $loggedInUserData['logged_in_user_id'];
                                    UserAddressDetail::create($addressArray);
                                }

                                break;
                        }
                    }
                }
            }
        }
    }

    /**
     * Update employee education details
     *
     * @param  int  $users_id
     * @param  array  $request
     * @return \Illuminate\Http\Response
     */
    function addUserEducationDetails($edu_data, $users_id = '')
    {
        // return isset($edu_data[0]['from_year']);
        if (!empty($edu_data)) {
            $loggedInUserData = Helper::getUserData();

            // Delete all old
            $educationDetails = UserEduDetail::where('users_id', $users_id);
            $educationDetails->forceDelete();

            // check if data already present for the user

            $education_count = count($edu_data);

            if ($education_count) {
                foreach ($edu_data as $education_data) {

                    if (isset($education_data['degree']) && $education_data['degree'] != '') {
                        Log::info("Single Education Data : " . json_encode($education_data));

                        $eduArray = array(
                            'users_id' => $users_id,
                            'degree' => (isset($education_data['degree'])) ? $education_data['degree'] : '',
                            'university' => (isset($education_data['university'])) ? $education_data['university'] : '',
                            'from_year' => ($education_data['from_year'] != "") ? $education_data['from_year'] : NULL,
                            'to_year' => ($education_data['to_year'] !== "") ? $education_data['to_year'] : NULL,
                            'percentage_grade' => (isset($education_data['percentage_grade'])) ? $education_data['percentage_grade'] : '',
                            'specialization' => (isset($education_data['specialization'])) ? $education_data['specialization'] : '',
                            'is_active' => 1,
                            'created_by' => $loggedInUserData['logged_in_user_id']
                        );

                        UserEduDetail::create($eduArray);
                    }
                }
            }
        }
    }

    /**
     * Update employee employment details
     *
     * @param  int  $users_id
     * @param  array  $request
     * @return \Illuminate\Http\Response
     */
    function addUserEmploymentDetails($employment_data, $users_id = '')
    {

        if (!empty($employment_data)) {
            $loggedInUserData = Helper::getUserData();

            // Delete all old
            $employmentDetails = UserEmpDetail::where('users_id', $users_id);
            $employmentDetails->forceDelete();

            // check if data already present for the user
            $employment_count = count($employment_data);

            if ($employment_count) {

                foreach ($employment_data as $emp_data) {

                    if (isset($emp_data['organisation']) && $emp_data['organisation'] != '') {
                        $empArray = array(
                            'users_id' => $users_id,
                            'organisation' => (isset($emp_data['organisation'])) ? $emp_data['organisation'] : '',
                            'designation' => (isset($emp_data['designation'])) ? $emp_data['designation'] : '',
                            'emp_from_year' => ($emp_data['emp_from_year'] !== "") ? $emp_data['emp_from_year'] : NULL,
                            'emp_to_year' => ($emp_data['emp_to_year'] !== "") ? $emp_data['emp_to_year'] : NULL,
                            'annual_ctc' => (isset($emp_data['annual_ctc'])) ? $emp_data['annual_ctc'] : '',
                            'is_active' => 1,
                            'created_by' => $loggedInUserData['logged_in_user_id']
                        );

                        UserEmpDetail::create($empArray);
                    }
                }
            }
        }
    }

    /**
     * Update employee company details
     *
     * @param  int  $users_id
     * @param  array  $request
     * @return \Illuminate\Http\Response
     */
    function addUpdateUserCompanyDetails($company_data, $users_id = '', $password = "")
    {
        if (!empty($company_data) && isset($company_data['mst_companies_id']) && $company_data['mst_companies_id'] != '') {

            $loggedInUserData = Helper::getUserData();

            $companyArray = array(
                'users_id' => $users_id,
                'mst_companies_id' => (isset($company_data['mst_companies_id'])) ? $company_data['mst_companies_id'] : '',
                'reporting_authority_id' => (isset($company_data['reporting_authority_id'])) ? $company_data['reporting_authority_id'] : NULL,
                'mst_departments_id' => (isset($company_data['mst_departments_id'])) ? $company_data['mst_departments_id'] : '',
                'mst_positions_id' => (isset($company_data['mst_positions_id'])) ? $company_data['mst_positions_id'] : '',
                'join_date' => (isset($company_data['join_date'])) ? $company_data['join_date'] : NULL,
                'resign_date' => (isset($company_data['resign_date'])) ? $company_data['resign_date'] : NULL,
                'bank_name' => (isset($company_data['bank_name'])) ? $company_data['bank_name'] : '',
                'bank_branch_name' => (isset($company_data['bank_branch_name'])) ? $company_data['bank_branch_name'] : '',
                'bank_acc_number' => (isset($company_data['bank_acc_number'])) ? $company_data['bank_acc_number'] : '',
                'salary_per_month' => (isset($company_data['salary_per_month'])) ? $company_data['salary_per_month'] : '',
                'username' => (isset($company_data['username'])) ? $company_data['username'] : '',
                'password' => (isset($password)) ? $password : '',
                'in_time' => (isset($company_data['in_time'])) ? $company_data['in_time'] : '',
                'out_time' => (isset($company_data['out_time'])) ? $company_data['out_time'] : '',
                'email_username' => (isset($company_data['email_username'])) ? $company_data['email_username'] : '',
                'email_password' => (isset($company_data['email_password'])) ? $company_data['email_password'] : '',
                'incoming_mail_type' => (isset($company_data['incoming_mail_type'])) ? $company_data['incoming_mail_type'] : '',
                'incoming_mail_server' => (isset($company_data['incoming_mail_server'])) ? $company_data['incoming_mail_server'] : '',
                'incoming_mail_server_port' => (isset($company_data['incoming_mail_server_port'])) ? $company_data['incoming_mail_server_port'] : '',
                'outgoing_mail_server' => (isset($company_data['outgoing_mail_server'])) ? $company_data['outgoing_mail_server'] : '',
                'outgoing_mail_server_port' => (isset($company_data['outgoing_mail_server_port'])) ? $company_data['outgoing_mail_server_port'] : '',
                'is_active' => 1,
            );

            $companyData = UserCompanyInfo::where('users_id', $users_id);
            $countCompanyData = $companyData->count();

            if ($countCompanyData > 0) {
                $companyArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
                $companyData->update($companyArray);
            } else {
                $companyArray['created_by'] = $loggedInUserData['logged_in_user_id'];
                UserCompanyInfo::create($companyArray);
            }
        }
    }

    /**
     * Update employee documents details
     *
     * @param  int  $users_id
     * @param  array  $request
     * @return \Illuminate\Http\Response
     */
    function addUpdateUserDocumentDetails($document_data, $users_id = '')
    {

        // already exists data
        $userDoc = UserDocDetail::where('users_id', $users_id);
        $countDocumentData = $userDoc->count();

        // to get the old data
        $userDocData = UserDocDetail::where('users_id', $users_id)->first();

        $loggedInUserData = Helper::getUserData();
        $random_string = Helper::generateRandomString();

        $documentArray = array(
            'users_id' => $users_id,
            'aadhar_number' => (isset($document_data['aadhar_number'])) ? $document_data['aadhar_number'] : '',
            'election_card_number' => (isset($document_data['election_card_number'])) ? $document_data['election_card_number'] : '',
            'pan_card_number' => (isset($document_data['pan_card_number'])) ? $document_data['pan_card_number'] : '',
            'passport_number' => (isset($document_data['passport_number'])) ? $document_data['passport_number'] : '',
            'driving_license_number' => (isset($document_data['driving_license_number'])) ? $document_data['driving_license_number'] : '',
            'is_active' => 1,
        );

        $documents = UserDocDetail::where('users_id', $users_id)->get()->toarray();

        $aadhar_card_photo = (isset($document_data['aadhar_card_photo']) && !empty($document_data['aadhar_card_photo'])) ? $document_data['aadhar_card_photo'] : '';
        if (!empty($aadhar_card_photo)) {
            if (!empty($documents)) {
                $check_aadhar = $documents[0]['aadhar_card_photo'] !== $aadhar_card_photo && $document_data['aadhar_card_photo'] !== NULL;
            } else {
                $check_aadhar = $document_data['aadhar_card_photo'] !== NULL;
            }
            if ($check_aadhar) {
                $aadhar_card_photo_file_name = 'aadhar_card_' . $users_id . "_" . $random_string . "." . $aadhar_card_photo->getClientOriginalExtension();
                $aadhar_card_photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $aadhar_card_photo_file_name);
                $documentArray["aadhar_card_photo"] = $aadhar_card_photo_file_name;

                if ($countDocumentData > 0) {
                    if (isset($userDocData->aadhar_card_photo) && $userDocData->aadhar_card_photo != '' && File::exists(public_path('images/employee/documents/' . $userDocData->aadhar_card_photo))) {
                        File::delete(public_path('images/employee/documents/' . $userDocData->aadhar_card_photo));
                    }
                }
            } else {
                $documentArray["aadhar_card_photo"] = $document_data['aadhar_card_photo'];
            }
        }

        $election_card_photo = (isset($document_data['election_card_photo']) && !empty($document_data['election_card_photo'])) ? $document_data['election_card_photo'] : '';
        if (!empty($election_card_photo)) {
            if (!empty($documents)) {
                $check_election = $documents[0]['election_card_photo'] !== $election_card_photo && $document_data['election_card_photo'] !== NULL;
            } else {
                $check_election = $document_data['election_card_photo'] !== NULL;
            }
            if ($check_election) {
                $election_card_photo_file_name = 'election_card_' . $users_id . "_" . $random_string . "." . $election_card_photo->getClientOriginalExtension();
                $election_card_photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $election_card_photo_file_name);
                $documentArray["election_card_photo"] = $election_card_photo_file_name;

                if ($countDocumentData > 0) {
                    if (isset($userDocData->election_card_photo) && $userDocData->election_card_photo != '' && File::exists(public_path('images/employee/documents/' . $userDocData->election_card_photo))) {
                        File::delete(public_path('images/employee/documents/' . $userDocData->election_card_photo));
                    }
                }
            } else {
                $documentArray["election_card_photo"] = $document_data['election_card_photo'];
            }
        }

        $pan_card_photo = (isset($document_data['pan_card_photo']) && !empty($document_data['pan_card_photo'])) ? $document_data['pan_card_photo'] : '';

        if (!empty($pan_card_photo)) {
            if (!empty($documents)) {
                $check_pan_card = $documents[0]["pan_card_photo"] !== $pan_card_photo && $document_data['pan_card_photo'] !== NULL;
            } else {
                $check_pan_card = $document_data['pan_card_photo'] !== NULL;
            }
            if ($check_pan_card) {
                $pan_card_photo_file_name = 'pan_card_' . $users_id . "_" . $random_string . "." . $pan_card_photo->getClientOriginalExtension();
                $pan_card_photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $pan_card_photo_file_name);
                $documentArray["pan_card_photo"] = $pan_card_photo_file_name;

                if ($countDocumentData > 0) {
                    if (isset($userDocData->pan_card_photo) && $userDocData->pan_card_photo != '' && File::exists(public_path('images/employee/documents/' . $userDocData->pan_card_photo))) {
                        File::delete(public_path('images/employee/documents/' . $userDocData->pan_card_photo));
                    }
                }
            } else {
                $documentArray["pan_card_photo"] = $document_data['pan_card_photo'];
            }
        }

        $passport_photo = (isset($document_data['passport_photo']) && !empty($document_data['passport_photo'])) ? $document_data['passport_photo'] : '';
        if (!empty($passport_photo)) {
            if (!empty($documents)) {
                $check_passport = $documents[0]["passport_photo"] !== $passport_photo && $document_data['passport_photo'] !== NULL;
            } else {
                $check_passport = $document_data['passport_photo'] !== NULL;
            }
            if ($check_passport) {
                $passport_photo_file_name = 'passport_' . $users_id . "_" . $random_string . "." . $passport_photo->getClientOriginalExtension();
                $passport_photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $passport_photo_file_name);
                $documentArray["passport_photo"] = $passport_photo_file_name;

                if ($countDocumentData > 0) {
                    if (isset($userDocData->passport_photo) && $userDocData->passport_photo != '' && File::exists(public_path('images/employee/documents/' . $userDocData->passport_photo))) {
                        File::delete(public_path('images/employee/documents/' . $userDocData->passport_photo));
                    }
                }
            } else {
                $documentArray["passport_photo"] = $document_data['passport_photo'];
            }
        }

        $driving_license_photo = (isset($document_data['driving_license_photo']) && !empty($document_data['driving_license_photo'])) ? $document_data['driving_license_photo'] : '';

        if (!empty($driving_license_photo)) {
            if (!empty($documents)) {
                $check_driving_license = $documents[0]["driving_license_photo"] !== $driving_license_photo && $document_data['driving_license_photo'] !== NULL;
            } else {
                $check_driving_license = $document_data['driving_license_photo'] !== NULL;
            }
            if ($check_driving_license) {
                $driving_license_photo_file_name = 'driving_license_' . $users_id . "_" . $random_string . "." . $driving_license_photo->getClientOriginalExtension();
                $driving_license_photo->move(config('constants.EMPLOYEE_DOCUMENTS_BASEPATH'), $driving_license_photo_file_name);
                $documentArray["driving_license_photo"] = $driving_license_photo_file_name;

                if ($countDocumentData > 0) {
                    if (isset($userDocData->driving_license_photo) && $userDocData->driving_license_photo != '' && File::exists(public_path('images/employee/documents/' . $userDocData->driving_license_photo))) {
                        File::delete(public_path('images/employee/documents/' . $userDocData->driving_license_photo));
                    }
                }
            } else {
                $documentArray["driving_license_photo"] = $document_data['driving_license_photo'];
            }
        }

        if ($countDocumentData > 0) {
            $documentArray['updated_by'] = $loggedInUserData['logged_in_user_id'];
            $userDoc->update($documentArray);
        } else {
            $documentArray['created_by'] = $loggedInUserData['logged_in_user_id'];
            UserDocDetail::create($documentArray);
        }
    }
}
