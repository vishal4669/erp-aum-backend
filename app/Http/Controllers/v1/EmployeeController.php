<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Helpers\Helper;
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

class EmployeeController extends Controller
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
            $is_reporting_authority = (isset($request->is_reporting_authority) && $request->is_reporting_authority == 1) ? 1 : 0;

            if ($is_dropdown) {
                $data = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])
                    ->where('users.is_resigned', 0)
                    ->where('users.is_active', 1);
                // ->where('users.mst_companies_id', $loggedInUserData['company_id']);
                if ($is_reporting_authority) {
                    $data  = $data->where('users.is_reporting_authority', 1);
                }
                $data  = $data->orderBy('users.id', 'desc')
                    ->get();
            } else {
                $data = Employee::with(['address', 'right', 'company', 'education', 'employment', 'document'])
                    ->where('users.is_active', 1)
                    ->where('users.selected_year', $loggedInUserData['selected_year']);
                //  ->where('users.mst_companies_id', $loggedInUserData['company_id']);
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

        try {

            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                // 'email' => 'required|string|email|unique:users',
                'password' => 'required|string|min:6',
                'mobile' => 'required'
            ]);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $data = Employee::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'title' => $request->get('title'),
                'first_name' => $request->get('first_name'),
                'middle_name' => $request->get('middle_name'),
                'last_name' => $request->get('last_name'),
                'email' => $request->get('email'),
                'username' => $request->get('email'),
                'password' => ($request->get('password')) ? Hash::make($request->get('password')) : '',
                'blood_group' => $request->get('blood_group'),
                'gender' => $request->get('gender'),
                'birth_date' => $request->get('birth_date'),
                'marital_status' => $request->get('marital_status'),
                'machine_code' => $request->get('machine_code'),
                'phone' => $request->get('phone'),
                'mobile' => $request->get('mobile'),
                'notes' => $request->get('notes'),
                'attendance' => $request->get('attendance'),
                'signature' => $request->get('signature'),
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
                'is_active' => 1,
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ]);

            //Added user id
            $users_id = $data->id;

            // Update User related details
            $this->addUpdateUserAddressDetails($request->address, $users_id);
            $this->addUserEducationDetails($request->education, $users_id);
            $this->addUserEmploymentDetails($request->employment, $users_id);
            $this->addUpdateUserCompanyDetails($request->company, $users_id);


            Log::info("Employee Created with details : " . json_encode($request->all()));

            return Helper::response("Employee added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
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
        Log::info("Fetch company details : " . json_encode(array('id' => $id)));
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
        try {

            $validator = Validator::make($request->all(), [
                'first_name' => 'required|string|max:255',
                'middle_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users,email,' . $id,
                'password' => 'required|string|min:6',
            ]);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input_data = [
                'title' => $request->get('title'),
                'first_name' => $request->get('first_name'),
                'middle_name' => $request->get('middle_name'),
                'last_name' => $request->get('last_name'),
                'email' => $request->get('email'),
                'username' => $request->get('email'),
                'password' => Hash::make($request->get('password')),
                'blood_group' => $request->get('blood_group'),
                'gender' => $request->get('gender'),
                'birth_date' => $request->get('birth_date'),
                'marital_status' => $request->get('marital_status'),
                'machine_code' => $request->get('machine_code'),
                'phone' => $request->get('phone'),
                'mobile' => $request->get('mobile'),
                'notes' => $request->get('notes'),
                'attendance' => $request->get('attendance'),
                'signature' => $request->get('signature'),
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
                'selected_year' => $loggedInUserData['selected_year'],
                'updated_by' => $loggedInUserData['logged_in_user_id']
            ];

            // Update User related details
            $this->addUpdateUserAddressDetails($request->get('address'), $id);
            $this->addUserEducationDetails($request->get('education'), $id);
            $this->addUserEmploymentDetails($request->get('employment'), $id);
            $this->addUpdateUserCompanyDetails($request->get('company'), $id);

            Log::info("Employee updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $employee = Employee::find($id);
            $employee->update($input_data);

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
            $data = array();
            $company = Employee::find($id);

            Log::info("Employee deleted with : " . json_encode(array('id' => $id)));

            if (!empty($company)) {
                $company->delete();
                return Helper::response("Employee deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Employee not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Update users address details
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
     * Update users education details
     *
     * @param  int  $users_id
     * @param  array  $request 
     * @return \Illuminate\Http\Response
     */
    function addUserEducationDetails($edu_data, $users_id = '')
    {
        // dd($edu_data);
        if (!empty($edu_data)) {
            $loggedInUserData = Helper::getUserData();

            // Delete all old   
            $educationDetails = UserEduDetail::where('users_id', $users_id);
            $educationDetails->delete();

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
                            'from_year' => (isset($education_data['from_year'])) ? $education_data['from_year'] : '',
                            'to_year' => (isset($education_data['to_year'])) ? $education_data['to_year'] : '',
                            'percentage' => (isset($education_data['percentage_grade'])) ? $education_data['percentage_grade'] : '',
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
     * Update users employment details
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
            $employmentDetails->delete();

            // check if data already present for the user
            $employment_count = count($employment_data);

            if ($employment_count) {
                foreach ($employment_data as $employment_data) {

                    if (isset($employment_data['organisation']) && $employment_data['organisation'] != '') {

                        $empArray = array(
                            'users_id' => $users_id,
                            'organisation' => (isset($employment_data['organisation'])) ? $employment_data['organisation'] : '',
                            'designation' => (isset($employment_data['designation'])) ? $employment_data['designation'] : '',
                            'emp_from_year' => (isset($employment_data['emp_from_year'])) ? $employment_data['emp_from_year'] : '',
                            'emp_to_year' => (isset($employment_data['emp_to_year'])) ? $employment_data['emp_to_year'] : '',
                            'annual_ctc' => (isset($employment_data['annual_ctc'])) ? $employment_data['annual_ctc'] : '',
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
     * Update users company details
     *
     * @param  int  $users_id
     * @param  array  $request 
     * @return \Illuminate\Http\Response
     */
    function addUpdateUserCompanyDetails($company_data, $users_id = '')
    {

        if (!empty($company_data) && isset($company_data['mst_companies_id']) && $company_data['mst_companies_id'] != '') {

            $loggedInUserData = Helper::getUserData();

            $companyArray = array(
                'users_id' => $users_id,
                'mst_companies_id' => (isset($company_data['mst_companies_id'])) ? $company_data['mst_companies_id'] : '',
                'reporting_authority_id' => (isset($company_data['reporting_authority_id'])) ? $company_data['reporting_authority_id'] : '',
                'mst_departments_id' => (isset($company_data['mst_departments_id'])) ? $company_data['reporting_authority_id'] : '',
                'mst_positions_id' => (isset($company_data['mst_positions_id'])) ? $company_data['mst_positions_id'] : '',
                'join_date' => (isset($company_data['join_date'])) ? $company_data['join_date'] : '',
                'resign_date' => (isset($company_data['resign_date'])) ? $company_data['resign_date'] : '',
                'bank_name' => (isset($company_data['bank_name'])) ? $company_data['bank_name'] : '',
                'bank_branch_name' => (isset($company_data['bank_branch_name'])) ? $company_data['bank_branch_name'] : '',
                'salary_per_month' => (isset($company_data['salary_per_month'])) ? $company_data['salary_per_month'] : '',
                'bank_acc_number' => (isset($company_data['bank_acc_number'])) ? $company_data['bank_acc_number'] : '',
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
}
