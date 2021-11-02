<?php

namespace App\Http\Controllers\v1;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\BookingSampleDetail;
use App\Models\BookingTest;
use App\Models\Customer;
use App\Models\Position;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use App\Helpers\Helper;
use App\Models\BookingAuditDetail;
use App\Models\MstProduct;
use App\Models\Pharmacopeia;
use App\Models\User;
use Auth;
use DB;
use Carbon\Carbon;
use Illuminate\Validation\Rule;
use Mockery\Undefined;

use function PHPUnit\Framework\isEmpty;

class BookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        try {

            $loggedInUserData = Helper::getUserData();
            $is_dropdown = (isset($request->is_dropdown) && $request->is_dropdown == 1) ? 1 : 0;
            if (!$is_dropdown) {
                $data = Booking::leftjoin('booking_sample_details as samples', 'samples.booking_id', '=', 'bookings.id')
                    ->leftjoin('mst_products', 'mst_products.id', '=', 'samples.product_id')
                    ->select(
                        [
                            'bookings.id', 'bookings.aum_serial_no', 'bookings.booking_no',
                            'bookings.booking_type',
                            DB::raw('DATE_FORMAT(bookings.receipte_date, "%Y-%m-%d") as receipte_date'),
                            'bookings.is_active', 'mst_products.product_name', 'mst_products.product_generic'
                        ]
                    )
                    ->where('bookings.is_active', 1)
                    ->where('bookings.selected_year', $loggedInUserData['selected_year'])
                    ->where('bookings.mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
                // ->paginate(10);
            } elseif ($is_dropdown) {
                $data = Booking::leftjoin('booking_sample_details as samples', 'samples.booking_id', '=', 'bookings.id')
                    ->leftjoin('mst_products', 'mst_products.id', '=', 'samples.product_id')
                    ->select(
                        [
                            'bookings.id', 'bookings.aum_serial_no', 'bookings.booking_no',
                            'bookings.booking_type', 'samples.product_type',
                            DB::raw('DATE_FORMAT(bookings.receipte_date, "%Y-%m-%d") as receipte_date'),
                            'bookings.is_active', 'mst_products.product_name'
                        ]
                    )
                    ->where('bookings.is_active', 1)
                    ->orderBy('id', 'desc')
                    ->get();
            }


            $data_arr = $data->isEmpty();

            if ($data_arr) {

                return Helper::response("Booking List is Empty", Response::HTTP_OK, true, $data);
            } else {

                return Helper::response("Booking List Shown Successfully", Response::HTTP_OK, true, $data);
            }
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function last_booking_no($report_type = '', $receipte_date = '')
    {

        $booking_table = Booking::all();

        if ($booking_table->isEmpty()) {
            $aum_serial_no = 1;
            $last_booking_id = 1;
            $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
            $formate_receipte_date = date('ymd', strtotime($receipte_date));
            $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
        } {
            if (!isset(Booking::where('report_type', $report_type)->latest()->first()->booking_no)) {
                $last_booking_id = 1;
                $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
                $formate_receipte_date = date('ymd', strtotime($receipte_date));
                $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
            } else {
                $latest_booking_no = Booking::where('report_type', $report_type)->latest()->first()->booking_no;
                $latest_data = $latest_booking_no;
                $findlaststr = explode("/", $latest_data);
                $last_booking_id = end($findlaststr) + 1;
                $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
                $formate_receipte_date = date('ymd', strtotime($receipte_date));
                $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
            }
            if (isset(Booking::latest()->first()->aum_serial_no)) {
                $serial_no = Booking::latest()->first()->aum_serial_no;
                $aum_serial_no = $serial_no + 1;
            } else {
                $aum_serial_no = 1;
            }
        }

        $number = array(
            'booking_no' => $booking_no,
            'aum_serial_no' => $aum_serial_no
        );
        return Helper::response("last booking no is generated Successfully", Response::HTTP_CREATED, true, $number);
    }

    public function contact_type($type = '', $data = '', $is_return = '')
    {
        $loggedInUserData = Helper::getUserData();
        $contact_type_data = Customer::select('id', 'company_name')
            ->where('contact_type', $type)
            ->where('is_active', 1)
            ->where('selected_year', $loggedInUserData['selected_year'])
            ->orderBy('id', 'desc')
            ->get();

        if ($data != '') {
            if ($data['customer_id']['id'] != '') {
                if ($data['customer_id']['deleted_at'] == '') {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Customer')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Customer'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Customer')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['customer_id']);
                    $data['contact_type_Customer'] = $contact_type_data;
                }
            } else {
                $data['contact_type_Customer'] = array([
                    "id" =>  "",
                    "company_name" => ""
                ]);
            }
        }
        if ($data != '') {
            if ($data['manufacturer_id']['id'] != '') {
                if ($data['manufacturer_id']['deleted_at'] == '') {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Manufacturer')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Manufacturer'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Manufacturer')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['manufacturer_id']);
                    $data['contact_type_Manufacturer'] = $contact_type_data;
                }
            } else {
                $data['contact_type_Manufacturer'] = array([
                    "id" =>  "",
                    "company_name" => ""
                ]);
            }
        }
        if ($data != '') {
            if ($data['supplier_id']['id'] != '') {
                if ($data['supplier_id']['deleted_at'] == '') {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Supplier')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Supplier'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Supplier')
                        ->where('is_active', 1)
                        ->where('selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['supplier_id']);
                    $data['contact_type_Supplier'] = $contact_type_data;
                }
            } else {
                $data['contact_type_Supplier'] = array([
                    "id" =>  "",
                    "company_name" => ""
                ]);
            }
        }
        if ($is_return == true) {
            return $data;
        } else {
            return Helper::response("company name list Successfully", Response::HTTP_CREATED, true, $contact_type_data);
        }
    }

    public function exportlist()
    {
        try {

            $loggedInUserData = Helper::getUserData();
            $exportData = Booking::select(
                'id',
                'aum_serial_no',
                'booking_no',
                'receipte_date',
                'customer_id',
                'nabl_scope',
                'created_by',
                'created_at',
                'updated_by',
                'updated_at',
            )
                ->with(
                    'customer_id:id,company_name',
                    'samples:id,booking_id,product_id,batch_no',
                    'samples.product_id:id,generic_product_id',
                    'tests:booking_id,test_name,amount',
                    'audit:booking_id,comments',
                    'created_by:id,first_name,middle_name,last_name',
                    'updated_by:id,first_name,middle_name,last_name'
                )
                ->where('is_active', 1)
                ->where('selected_year', $loggedInUserData['selected_year'])
                ->orderBy('id', 'desc')
                ->get();

            $exportData_Arr = $exportData->toArray();
            $len = count($exportData_Arr);
            $i = 0;
            for ($i = 0; $i < $len; $i++) {

                if ($exportData_Arr[$i]['samples'][0]['product_id'] != null) {
                    $generic_id = $exportData_Arr[$i]['samples'][0]['product_id']['generic_product_id'];
                    if ($generic_id != 0 and $generic_id != '') {
                        $product_id = $exportData_Arr[$i]['samples'][0]['product_id']['id'];
                        $generic_product_name = MstProduct::where('id', '=', $generic_id)->get(['product_name']);
                        $generic_product_name = $generic_product_name->toArray();
                        $exportData_Arr[$i]['samples'][0]['product_id']['generic_product_name'] = $generic_product_name[0]['product_name'];
                    } else {
                        $exportData_Arr[$i]['samples'][0]['product_id']['generic_product_name'] = '';
                    }
                } else {
                    $exportData_Arr[$i]['samples'][0]['product_id'] = array(
                        'id' => '',
                        'generic_product_id' => '',
                        'generic_product_name' => ''
                    );
                }
                if ($exportData_Arr[$i]['customer_id'] == null) {
                    $exportData_Arr[$i]['customer_id'] = array(
                        "id" => "",
                        "company_name" => ""
                    );
                }

                if ($exportData_Arr[$i]['created_by'] == null) {
                    $exportData_Arr[$i]['created_by'] = array(
                        "id" => "",
                        "first_name" => "",
                        "middle_name" => "",
                        "last_name" => ""
                    );
                }
                if ($exportData_Arr[$i]['updated_by'] == null) {
                    $exportData_Arr[$i]['updated_by'] = array(
                        "id" => "",
                        "first_name" => "",
                        "middle_name" => "",
                        "last_name" => ""
                    );
                }
            }



            return Helper::response("Export Data Shown Successfully", Response::HTTP_OK, true, $exportData_Arr);
        } catch (Exception $e) {
            $exportData = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $exportData_Arr);
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

        if (!isset(Booking::where('booking_no', $request->booking_no)->latest()->first()->booking_no)) {
            $last_booking_id = 1;
            $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
            $receipte_date = date('ymd', strtotime($request->receipte_date));
            $booking_no = ("ARL/COA/" . $request->report_type . '/' . $receipte_date . '/' . $str_pad_booking_id);
        } else {
            $latest_booking_no = Booking::where('report_type', $request->report_type)->latest()->first()->booking_no;
            $latest_data = $latest_booking_no;
            $findlaststr = explode("/", $latest_data);
            $last_booking_id = end($findlaststr) + 1;
            $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
            $receipte_date = date('ymd', strtotime($request->receipte_date));
            $booking_no = ("ARL/COA/" . $request->report_type . '/' . $receipte_date . '/' . $str_pad_booking_id);
        }

        if (isset(Booking::where('aum_serial_no', $request->aum_serial_no)->latest()->first()->aum_serial_no)) {
            $serial_no = Booking::latest()->first()->aum_serial_no;
            $request->aum_serial_no = $serial_no + 1;
        } else {
            $request->aum_serial_no = $request->aum_serial_no;
        }
        DB::beginTransaction();
        try {
            $rules = [
                "report_type" => "required|max:55",
                "booking_type" => "required|max:55",
                "receipte_date" => "required",
                "customer_id" => "required",
                'invoice_date' => 'required_if:booking_type,Invoice',
                'invoice_no' => 'required_if:booking_type,Invoice|max:55',
                'booking_no'  => 'max:255',
                'reference_no'  => 'max:55',
                'aum_serial_no'  => 'max:55',
                'd_format'  => 'max:255',
                'project_name'  => 'max:255',
                'mfg_lic_no'  => 'max:155',
                // 'aum_serial_no'  => 'unique:bookings',
                'dispatch_date_time' => 'required_if:is_report_dispacthed,1|max:100',
                'dispatch_mode' => 'required_if:is_report_dispacthed,1|max:155',
                'dispatch_details' => 'required_if:is_report_dispacthed,1|max:255',
                'mfg_date'  => 'required|date',
                'exp_date'    => 'required|date_format:Y-m-d|after:mfg_date',
                'booking_sample_details.*.product_id'  => 'required|Integer',
                'booking_sample_details.*.sampling_date_from'  => 'nullable|date',
                'booking_sample_details.*.sampling_date_to'    => 'nullable|date_format:Y-m-d|after:booking_sample_details.*.sampling_date_from',
                'booking_tests.*.amount'    => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_sample_details.*.batch_no'  => 'nullable|numeric|digits_between:0,25',
                'booking_sample_details.*.packsize'  => 'max:55',
                'booking_sample_details.*.request_quantity'  => 'nullable|numeric',
                'booking_sample_details.*.sample_code'  => 'max:100',
                'booking_sample_details.*.sample_location'  => 'max:150',
                'booking_sample_details.*.sample_packaging'  => 'max:255',
                'booking_sample_details.*.sample_type'  => 'max:60',
                'booking_sample_details.*.sample_drawn_by'  => 'max:255',
                'booking_sample_details.*.sample_quantity'  => 'nullable|numeric',
                'booking_sample_details.*.batch_size_qty_rec'  => 'nullable|numeric|digits_between:0,25',
                'booking_tests.*.p_sr_no'  => 'max:10',
                'booking_tests.*.label_claim'  => 'max:155',
                'booking_tests.*.percentage_of_label_claim'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_tests.*.label_claim_result'  => 'max:255',
                'booking_tests.*.label_claim_unit'  => 'max:60',
                'booking_tests.*.mean'  => 'max:150',
                'booking_tests.*.unit'  => 'max:60',
                'booking_tests.*.amount'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_tests.*.division'  => 'max:255',
                'booking_tests.*.method'  => 'max:255',
                'booking_tests.*.approved'  => 'max:20',
            ];
            $massage = [
                "report_type.required" => "The Report Type Field Is Required.",
                "booking_type.required" => "The Booking Type Field Is Required.",
                "receipte_date.required" => "The Receipte Date Field Is Required.",
                "customer_id.required" => "The Customer Id Field Is Required.",
                'invoice_date.required_if' => 'The Invoice Date Field Is Required.',
                'invoice_no.required_if' => 'The Invoice No Field Is Required.',
                'dispatch_date_time.required_if' => 'The Dispatch Date Time Field Is Required.',
                'dispatch_mode.required_if' => 'The Dispatch Mode Field Is Required.',
                'dispatch_details.required_if' => 'The Dispatch Details Field Is Required.',
                "booking_no.unique" => "The Booking No Field Must Be Unique.",
                "mfg_date.required" => "The Mfg Date Field Is Required.",
                "exp_date.required" => "The Exp Date Field Is Required.",
                'booking_sample_details.*.batch_size_qty_rec.digits_between'  => 'booking sample details of batch_size_qty_rec must be between 0 and 25 digits',
                'booking_sample_details.*.sample_quantity.numeric'  => 'booking sample details of sample quantity must be numeric value.',
                'booking_sample_details.*.batch_size_qty_rec.numeric'  => 'booking sample details of batch size qty rec must be numeric value.',
                'booking_sample_details.*.request_quantity.numeric'  => 'booking sample details of request quantity must be numeric value.',
                'booking_sample_details.*.batch_no.numeric'  => 'booking sample details of batch_no must be numeric value.',
                'booking_sample_details.*.batch_no.digits_between'  => 'booking sample details of batch_no must be between 0 and 25 digits.',
                'booking_sample_details.*.product_id.required'  => 'The Product Name Field Is Required.',
                'booking_sample_details.*.sampling_date_to.after'    => 'Sampling Date To Must Be A Date After Sampling Date From.',
                'booking_tests.*.amount.numeric'  => 'booking tests details of amount must be numeric value.',
            ];

            $validator = Validator::make($request->all(), $rules, $massage);
            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $loggedInUserData = Helper::getUserData();

            $booking_data = Booking::create([
                "mst_companies_id"  => $loggedInUserData['company_id'],
                "booking_type"  => (isset($request->booking_type) ? $request->booking_type : ''),
                "report_type"   => (isset($request->report_type) ? $request->report_type : ''),
                "dispatch_date_time" => (isset($request->dispatch_date_time) ? $request->dispatch_date_time : NULL),
                "dispatch_mode"    => (isset($request->dispatch_mode) ? $request->dispatch_mode : NULL),
                "dispatch_details"    => (isset($request->dispatch_details) ? $request->dispatch_details : NULL),
                "receipte_date" => (isset($request->receipte_date) ? date('Y-m-d', strtotime($request->receipte_date)) : NULL),
                "booking_no"    => (isset($request->booking_no) ? $request->booking_no : ''),
                "customer_id"   => (isset($request->customer_id) ? $request->customer_id : 0),
                "reference_no"  => (isset($request->reference_no) ? $request->reference_no : ''),
                "remarks"   => (isset($request->remarks) ? $request->remarks : ''),
                "manufacturer_id"   => (isset($request->manufacturer_id) ? $request->manufacturer_id : 0),
                "supplier_id"   => (isset($request->supplier_id) ? $request->supplier_id : 0),
                "mfg_date"  => (isset($request->mfg_date) ? date('Y-m-d', strtotime($request->mfg_date)) : NULL),
                "mfg_options"   => (isset($request->mfg_options) ? $request->mfg_options : NULL),
                "exp_date"  => (isset($request->exp_date) ? date('Y-m-d', strtotime($request->exp_date)) : ''),
                "exp_options"   => (isset($request->exp_options) ? $request->exp_options : ''),
                "analysis_date" => (isset($request->analysis_date) ? date('Y-m-d', strtotime($request->analysis_date)) : NULL),
                "aum_serial_no"    => (isset($request->aum_serial_no) ? $request->aum_serial_no : 0),
                "d_format"  => (isset($request->d_format) ? $request->d_format : ''),
                "d_format_options"  => (isset($request->d_format_options) ? $request->d_format_options : ''),
                "grade" => (isset($request->grade) ? $request->grade : ''),
                "grade_options" => (isset($request->grade_options) ? $request->grade_options : ''),
                "project_name"  => (isset($request->project_name) ? $request->project_name : ''),
                "project_options"   => (isset($request->project_options) ? $request->project_options : ''),
                "mfg_lic_no"    => (isset($request->mfg_lic_no) ? $request->mfg_lic_no : ''),
                "is_report_dispacthed"  => (isset($request->is_report_dispacthed) ? $request->is_report_dispacthed : 0),
                "signature" => (isset($request->signature) ? $request->signature : 0),
                "verified_by"   => (isset($request->verified_by) ? $request->verified_by : ''),
                "nabl_scope"    => (isset($request->nabl_scope) ? $request->nabl_scope : 0),
                "cancel"    => (isset($request->cancel) ? $request->cancel : ''),
                "cancel_remarks"    => (isset($request->cancel_remarks) ? $request->cancel_remarks : ''),
                "priority"  => (isset($request->priority) ? $request->priority : ''),
                "discipline"    => (isset($request->discipline) ? $request->discipline : ''),
                "booking_group" => (isset($request->booking_group) ? $request->booking_group : ''),
                "statement_ofconformity"    => (isset($request->statement_ofconformity) ? $request->statement_ofconformity : ''),
                // "coa_release_date"    => (isset($request->coa_release_date) ? date('Y-m-d', strtotime($request->coa_release_date)) : NULL),
                // "block"    => (isset($request->block) ? $request->block : NULL),
                "invoice_date" => (isset($request->invoice_date) ? date('Y-m-d', strtotime($request->invoice_date)) : NULL),
                "invoice_no" => (isset($request->invoice_no) ? $request->invoice_no : NULL),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
                "created_by"    => $loggedInUserData['logged_in_user_id'],
                "updated_at" => NULL
            ]);

            $this->addupdateBookingSample($request->booking_sample_details, $booking_data->id);
            $this->addupdateBookingTests($request->booking_tests, $booking_data->id);
            if ($request->booking_type == "Report") {
                $this->addupdateAuditDetails($request->booking_audit_details, $booking_data->id);
            }
            DB::commit();
            Log::info("Booking Created with details : " . json_encode($request->all()));
            return Helper::response("Booking added Successfully", Response::HTTP_CREATED, true, $booking_data);
        } catch (Exception $e) {
            DB::rollback();
            $booking_data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $booking_data);
        }
    }

    public function addupdateBookingSample($booking_samples, $booking_id)
    {


        if (!empty($booking_samples)) {

            $loggedInUserData = Helper::getUserData();
            $booking_sample_data = array(
                "booking_id" => (isset($booking_id) ? $booking_id : 0),
                "product_id"    => (isset($booking_samples[0]['product_id']) ? $booking_samples[0]['product_id'] : 0),
                "batch_no"  => (isset($booking_samples[0]['batch_no']) ? $booking_samples[0]['batch_no'] : 0),
                "packsize"  => (isset($booking_samples[0]['packsize']) ? $booking_samples[0]['packsize'] : ''),
                "request_quantity"  => (isset($booking_samples[0]['request_quantity']) ? $booking_samples[0]['request_quantity'] : 0),
                "sample_code"   => (isset($booking_samples[0]['sample_code']) ? $booking_samples[0]['sample_code'] : ''),
                "sample_description"    => (isset($booking_samples[0]['sample_description']) ? $booking_samples[0]['sample_description'] : ''),
                "sample_quantity"   => (isset($booking_samples[0]['sample_quantity']) ? $booking_samples[0]['sample_quantity'] : 0),
                "sample_location"   => (isset($booking_samples[0]['sample_location']) ? $booking_samples[0]['sample_location'] : ''),
                "sample_packaging"  => (isset($booking_samples[0]['sample_packaging']) ? $booking_samples[0]['sample_packaging'] : ''),
                "sample_type"   => (isset($booking_samples[0]['sample_type']) ? $booking_samples[0]['sample_type'] : ''),
                "sampling_date_from"    => (isset($booking_samples[0]['sampling_date_from']) ? date('Y-m-d', strtotime($booking_samples[0]['sampling_date_from'])) : NULL),
                "sampling_date_from_options"    => (isset($booking_samples[0]['sampling_date_from_options']) ? $booking_samples[0]['sampling_date_from_options'] : ''),
                "sampling_date_to"  => (isset($booking_samples[0]['sampling_date_to']) ? date('Y-m-d', strtotime($booking_samples[0]['sampling_date_to'])) : NULL),
                "sampling_date_to_options"  => (isset($booking_samples[0]['sampling_date_to_options']) ? $booking_samples[0]['sampling_date_to_options'] : ''),
                "sample_received_through"   => (isset($booking_samples[0]['sample_received_through']) ? $booking_samples[0]['sample_received_through'] : ''),
                "chemist"   => (isset($booking_samples[0]['chemist']) ? $booking_samples[0]['chemist'] : 1),
                "sample_condition"  => (isset($booking_samples[0]['sample_condition']) ? $booking_samples[0]['sample_condition'] : ''),
                "is_sample_condition"   => (isset($booking_samples[0]['is_sample_condition']) ? $booking_samples[0]['is_sample_condition'] : 0),
                "batch_size_qty_rec"    => (isset($booking_samples[0]['batch_size_qty_rec']) ? $booking_samples[0]['batch_size_qty_rec'] : 0),
                "notes" => (isset($booking_samples[0]['notes']) ? $booking_samples[0]['notes'] : ''),
                "sample_drawn_by"   => (isset($booking_samples[0]['sample_drawn_by']) ? $booking_samples[0]['sample_drawn_by'] : ''),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
            );
            $sample_detail_exist = BookingSampleDetail::where('booking_id', $booking_id)->get();
            if (count($sample_detail_exist) > 0) {
                $booking_sample_data['updated_by'] = $loggedInUserData['logged_in_user_id'];
                $update_table = BookingSampleDetail::where('booking_id', $booking_id);
                $update_table->update($booking_sample_data);
            } else {
                $booking_sample_data['created_by'] = $loggedInUserData['logged_in_user_id'];
                $booking_sample_data['updated_at'] = NULL;
                BookingSampleDetail::create($booking_sample_data);
            }
        }
    }

    public function addupdateBookingTests($booking_tests, $booking_id)
    {

        if (!empty($booking_tests)) {

            $loggedInUserData = Helper::getUserData();
            $tests_count = count($booking_tests);

            if ($tests_count) {

                // Delete all old
                $testdata = BookingTest::where('booking_id', $booking_id);
                $testdata->forceDelete();

                foreach ($booking_tests as $tests) {
                    // print_r("=====4");
                    if (!empty($tests['by_pass']) and !empty($tests['parent_child'])) {
                        // print_r("=====5");
                        if (
                            !empty($tests['p_sr_no']) or
                            !empty($tests['parent_id']) or
                            !empty($tests['product_details']) or
                            !empty($tests['test_name']) or
                            !empty($tests['label_claim']) or
                            !empty($tests['min_limit']) or
                            !empty($tests['max_limit']) or
                            !empty($tests['result']) or
                            !empty($tests['label_claim_result']) or
                            !empty($tests['label_claim_unit']) or
                            !empty($tests['result2']) or
                            !empty($tests['mean']) or
                            !empty($tests['na_content']) or
                            !empty($tests['final_na_content']) or
                            !empty($tests['na_content']) or
                            !empty($tests['unit']) or
                            !empty($tests['expanded_uncertanity']) or
                            !empty($tests['amount']) or
                            !empty($tests['division']) or
                            !empty($tests['method']) or
                            !empty($tests['test_time']) or
                            !empty($tests['test_date_time']) or
                            !empty($tests['approval_date_time']) or
                            !empty($tests['approved']) or
                            !empty($tests['percentage_of_label_claim']) or
                            !empty($tests['chemsit_name'])
                        ) {
                            // print_r("=====6");
                            $tests_data = array(
                                "booking_id" => (isset($booking_id) ? $booking_id : 0),
                                "parent_child" => (isset($tests['parent_child']) ? $tests['parent_child'] : ''),
                                "p_sr_no" => (isset($tests['p_sr_no']) ? $tests['p_sr_no'] : ''),
                                "by_pass" => (isset($tests['by_pass']) ? $tests['by_pass'] : 0),
                                "parent" => (isset($tests['parent_id']) ? $tests['parent_id'] : 0),
                                "product_details" => (isset($tests['product_details']) ? $tests['product_details'] : ''),
                                "test_name" => (isset($tests['test_name']) ? $tests['test_name'] : ''),
                                "label_claim" => (isset($tests['label_claim']) ? $tests['label_claim'] : ''),
                                "min_limit" => (isset($tests['min_limit']) ? $tests['min_limit'] : ''),
                                "max_limit" => (isset($tests['max_limit']) ? $tests['max_limit'] : ''),
                                "result" => (isset($tests['result']) ? $tests['result'] : ''),
                                "label_claim_result" => (isset($tests['label_claim_result']) ? $tests['label_claim_result'] : ''),
                                "label_claim_unit" => (isset($tests['label_claim_unit']) ? $tests['label_claim_unit'] : ''),
                                "result2" => (isset($tests['result2']) ? $tests['result2'] : ''),
                                "mean" => (isset($tests['mean']) ? $tests['mean'] : ''),
                                "na_content" => (isset($tests['na_content']) ? $tests['na_content'] : ''),
                                "final_na_content" => (isset($tests['final_na_content']) ? $tests['na_content'] : ''),
                                "unit" => (isset($tests['unit']) ? $tests['unit'] : ''),
                                "expanded_uncertanity" => (isset($tests['expanded_uncertanity']) ? $tests['expanded_uncertanity'] : ''),
                                "amount" => (isset($tests['amount']) ? $tests['amount'] : 0),
                                "division" => (isset($tests['division']) ? $tests['division'] : ''),
                                "method" => (isset($tests['method']) ? $tests['method'] : ''),
                                "division" => (isset($tests['division']) ? $tests['division'] : ''),
                                "test_time" => (isset($tests['test_time']) ? $tests['test_time'] : NULL),
                                "test_date_time" => (isset($tests['test_date_time']) ? $tests['test_date_time'] : NULL),
                                "approval_date_time" => (isset($tests['approval_date_time']) ? $tests['approval_date_time'] : NULL),
                                "approved" => (isset($tests['approved']) ? $tests['approved'] : ''),
                                "percentage_of_label_claim" => (isset($tests['percentage_of_label_claim']) ? $tests['percentage_of_label_claim'] : NULL),
                                "chemist_name" => (isset($tests['chemist_name']) ? $tests['chemist_name'] : NULL),
                                "selected_year" => $loggedInUserData['selected_year'],
                                "is_active" => (isset($tests['is_active']) ? $tests['is_active'] : 1),
                                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                                'updated_by' => $loggedInUserData['logged_in_user_id']
                            );
                            // print_r("=====7");
                            BookingTest::create($tests_data);
                        }
                    }
                }
            }
        } else {

            $sampledata = BookingTest::where('booking_id', $booking_id);
            $sampledata->forceDelete();
        }
    }

    public function addupdateAuditDetails($audit_details, $booking_id)
    {

        if (!empty($audit_details)) {

            $loggedInUserData = Helper::getUserData();
            $booking_audit_data = array(
                "booking_id" => (isset($booking_id) ? $booking_id : 0),
                "audit_remarks" => (isset($audit_details['audit_remarks']) ? $audit_details['audit_remarks'] : ''),
                "reason" => (isset($audit_details['reason']) ? $audit_details['reason'] : ''),
                "comments" => (isset($audit_details['comments']) ? $audit_details['comments'] : ''),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
            );

            $audit_detail_exist = BookingAuditDetail::where('booking_id', $booking_id)->get();
            if (count($audit_detail_exist) > 0) {
                $booking_audit_data['updated_by'] = $loggedInUserData['logged_in_user_id'];
                $update_table = BookingAuditDetail::where('booking_id', $booking_id);
                $update_table->update($booking_audit_data);
            } else {
                $booking_audit_data['created_by'] = $loggedInUserData['logged_in_user_id'];
                $booking_audit_data['updated_at'] = NULL;
                BookingAuditDetail::create($booking_audit_data);
            }
        }
    }

    public function get_products($data)
    {
        $loggedInUserData = Helper::getUserData();
        $product_data = MstProduct::select(
            'id',
            'product_name',
            'product_generic',
            'marker_specification',
            'is_generic',
            'is_active',
            'pharmacopeia_id',
            'generic_product_id'
        )->with('pharmacopeia:id,pharmacopeia_name', 'generic:id,product_name')
            ->where('is_active', 1)
            ->orderBy('id', 'desc')
            ->get()->toarray();

        if ($data['samples'][0]['get_product']['deleted_at'] == null) {
            $data['products'] = $product_data;
        } else {
            $product_arr = array(
                'id' => $data['samples'][0]['get_product']['id'],
                'product_name' => $data['samples'][0]['get_product']['product_name'],
                'product_generic' => $data['samples'][0]['get_product']['product_generic'],
                "pharmacopeia_id" => $data['samples'][0]['get_product']['pharmacopeia_id']['id'],
                "generic_product_id" => $data['samples'][0]['get_product']['generic_product_id'],
                "pharmacopeia" => array(
                    "id" => $data['samples'][0]['get_product']['pharmacopeia_id']['id'],
                    "pharmacopeia_name" => $data['samples'][0]['get_product']['pharmacopeia_id']['pharmacopeia_name']
                ),
                "generic" => array(
                    "id" => $data['samples'][0]['get_product']['generic_product_id'],
                    "product_name" => $data['samples'][0]['get_product']['generic_product_name']
                ),
            );
            array_push($product_data, $product_arr);
            $data['products'] = $product_data;
        }
        return $data;
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show(booking $booking, $id)
    {
        //
        $loggedInUserData = Helper::getUserData();
        $data = Booking::with(
            'customer_id:id,company_name,deleted_at',
            'manufacturer_id:id,company_name,deleted_at',
            'supplier_id:id,company_name,deleted_at',
            'samples',
            'samples.get_product:id,product_name,generic_product_id,product_generic,pharmacopeia_id,deleted_at',
            // 'samples.pharmacopiea_id:id,pharmacopeia_name',
            'tests',
            'tests.parent',
            'audit',
            'created_by:id,first_name,middle_name,last_name',
            'updated_by:id,first_name,middle_name,last_name'
        )
            ->find($id);
        $data = $data->toArray();
        if ($data['samples'][0]['get_product'] == null or $data['samples'][0]['get_product'] == 0) {
            $data['samples'][0]['get_product'] = array(
                'id' => '',
                "product_name" => "",
                "product_generic" => "",
                'generic_product_id' => '',
                'generic_product_name' => '',
                'pharmacopeia_id' => array(
                    "id" => "",
                    "pharmacopeia_name" => ""
                ),
                'deleted_at' => ""
            );
        } else {
            $generic_id = $data['samples'][0]['get_product']['generic_product_id'];
            if ($generic_id != 0) {
                $product_id = $data['samples'][0]['get_product']['id'];
                $generic_product_name = MstProduct::where('id', '=', $generic_id)->get(['product_name']);
                $data['samples'][0]['get_product']['generic_product_name'] = $generic_product_name[0]['product_name'];
            } else {
                $data['samples'][0]['get_product']['generic_product_name'] = "";
            }

            $pharmacopiea_id = $data['samples'][0]['get_product']['pharmacopeia_id'];
            if ($pharmacopiea_id != null) {
                $pharmacopiea_id = Pharmacopeia::where('id', $pharmacopiea_id)->get(['id', 'pharmacopeia_name'])->toArray();
                if ($data['samples'][0]['get_product']['pharmacopeia_id'] == null) {
                    $data['samples'][0]['get_product']['pharmacopeia_id'] = array(
                        "id" => "",
                        "pharmacopeia_name" => ""
                    );
                } else {
                    $data['samples'][0]['get_product']['pharmacopeia_id'] = array(
                        'id' => $pharmacopiea_id[0]['id'],
                        'pharmacopeia_name' => $pharmacopiea_id[0]['pharmacopeia_name'],
                    );
                }
            }
        }


        $data['invoice_date'] = \Carbon\Carbon::parse($data['invoice_date'])->format('Y-m-d');
        $data['receipte_date'] = \Carbon\Carbon::parse($data['receipte_date'])->format('Y-m-d');
        $data['mfg_date'] = \Carbon\Carbon::parse($data['mfg_date'])->format('Y-m-d');
        $data['exp_date'] = \Carbon\Carbon::parse($data['exp_date'])->format('Y-m-d');
        $data['analysis_date'] = \Carbon\Carbon::parse($data['analysis_date'])->format('Y-m-d');
        $data['samples'][0]['sampling_date_from'] = \Carbon\Carbon::parse($data['samples'][0]['sampling_date_from'])->format('Y-m-d');
        $data['samples'][0]['sampling_date_to'] = \Carbon\Carbon::parse($data['samples'][0]['sampling_date_to'])->format('Y-m-d');



        if ($data['customer_id'] == null or $data['customer_id'] == 0) {
            $data['customer_id'] = array(
                "id" => "",
                "company_name" => ""
            );
        }
        if ($data['supplier_id'] == null) {
            $data['supplier_id'] = array(
                "id" => "",
                "company_name" => ""
            );
        }
        if ($data['manufacturer_id'] == null) {
            $data['manufacturer_id'] = array(
                "id" => "",
                "company_name" => ""
            );
        }
        if ($data['created_by'] == null) {
            $data['created_by'] = array(
                "id" => "",
                "first_name" => "",
                "middle_name" => "",
                "last_name" => ""
            );
        }
        if ($data['updated_by'] == null) {
            $data['updated_by'] = array(
                "id" => "",
                "first_name" => "",
                "middle_name" => "",
                "last_name" => ""
            );
        }

        $len = count($data['tests']);
        $i = 0;
        for ($i = 0; $i < $len; $i++) {
            if (!isset($data['tests'][$i]['parent'])) {
                $data['tests'][$i]['parent'] = array(
                    "id" => "",
                    "parent_name" => ""
                );
            }
            if (isset($data['tests'][$i]['parent']['id'])) {
                $data['tests'][$i]['parent_id'] = $data['tests'][$i]['parent']['id'];
            } else {
                $data['tests'][$i]['parent_id'] = '';
            }

            if (isset($data['tests'][$i]['chemist_name'])) {
                $c_id = $data['tests'][$i]['chemist_name'];
                $chemist_name = User::where('id', $c_id)->withTrashed()->get(['id', 'first_name', 'middle_name', 'last_name', 'deleted_at'])->toarray();
                if (!empty($chemist_name)) {

                    $chemist_Arr = array(
                        "id" => $chemist_name[0]['id'],
                        "first_name" => $chemist_name[0]['first_name'],
                        "middle_name" => $chemist_name[0]['middle_name'],
                        "last_name" => $chemist_name[0]['last_name'],
                        "deleted_at" => $chemist_name[0]['deleted_at']
                    );
                    $data['tests'][$i]['chemist'] = $chemist_Arr;
                } else {
                    $data['tests'][$i]['chemist'] = array(
                        "id" => "",
                        "first_name" => "",
                        "middle_name" => "",
                        "last_name" => "",
                        "deleted_at" => ""
                    );
                }
            } else {
                $data['tests'][$i]['chemist'] = array(
                    "id" => "",
                    "first_name" => "",
                    "middle_name" => "",
                    "last_name" => "",
                    "deleted_at" => ""
                );
            }
        }
        $chemist_id = Position::where('position_title', 'Chemist')->get('id');
        $chemist_id = $chemist_id->toarray();
        $chemist_data =  Employee::join('user_company_info as company', 'company.users_id', 'users.id')
            ->where('company.mst_positions_id', $chemist_id[0]['id'])
            ->where('users.is_active', 1)
            ->get(['users.id', 'users.first_name', 'users.middle_name', 'users.last_name', 'users.deleted_at'])->toarray();
        // dd($chemist_data);
        if ($chemist_data) {

            $tests_len = count($data['tests']);
            for ($i = 0; $i < $tests_len; $i++) {
                    if ($data['tests'][$i]['chemist']['deleted_at'] == '') {
                        $data['chemist_dropdown'] = $chemist_data;
                    } else {
                        array_push($chemist_data, $data['tests'][$i]['chemist']);
                        $data['chemist_dropdown'] = $chemist_data;
                    }
            }
        } else {
            $data['chemist_dropdown'] = array(
                "id" => "",
                "first_name" => "",
                "middle_name" => "",
                "last_name" => "",
                "deleted_at" => ""
            );
        }
        $data = $this->contact_type($type = '', $data, true);
        $data = $this->get_products($data);
        return Helper::response("This Booking Shown Successfully", Response::HTTP_OK, true, $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit(booking $booking)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {

            $rules = [
                "report_type" => "required",
                "booking_type" => "required",
                'invoice_date' => 'required_if:booking_type,Invoice',
                'invoice_no' => 'required_if:booking_type,Invoice',
                'dispatch_date_time' => 'required_if:is_report_dispacthed,1',
                'dispatch_mode' => 'required_if:is_report_dispacthed,1',
                'dispatch_details' => 'required_if:is_report_dispacthed,1',
                "receipte_date" => "required",
                "customer_id" => "required",
                'mfg_date'  => 'required|date',
                'exp_date'    => 'required|date_format:Y-m-d|after:mfg_date',
                'booking_sample_details.*.product_id'  => 'required|Integer',
                'booking_sample_details.*.sampling_date_from'  => 'nullable|date',
                'booking_sample_details.*.sampling_date_to'    => 'nullable|date_format:Y-m-d|after:booking_sample_details.*.sampling_date_from',
                'booking_tests.*.amount'    => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_sample_details.*.batch_no'  => 'nullable|numeric|digits_between:0,25',
                'booking_sample_details.*.packsize'  => 'max:55',
                'booking_sample_details.*.request_quantity'  => 'nullable|numeric',
                'booking_sample_details.*.sample_code'  => 'max:100',
                'booking_sample_details.*.sample_location'  => 'max:150',
                'booking_sample_details.*.sample_packaging'  => 'max:255',
                'booking_sample_details.*.sample_type'  => 'max:60',
                'booking_sample_details.*.sample_drawn_by'  => 'max:255',
                'booking_sample_details.*.sample_quantity'  => 'nullable|numeric',
                'booking_sample_details.*.batch_size_qty_rec'  => 'nullable|numeric|digits_between:0,25',
                'booking_tests.*.p_sr_no'  => 'max:10',
                'booking_tests.*.label_claim'  => 'max:155',
                'booking_tests.*.percentage_of_label_claim'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_tests.*.label_claim_result'  => 'max:255',
                'booking_tests.*.label_claim_unit'  => 'max:60',
                'booking_tests.*.mean'  => 'max:150',
                'booking_tests.*.unit'  => 'max:60',
                'booking_tests.*.amount'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
                'booking_tests.*.division'  => 'max:255',
                'booking_tests.*.method'  => 'max:255',
                'booking_tests.*.approved'  => 'max:20',
            ];
            $massage = [
                "report_type.required" => "The Report Type Field Is Required.",
                "booking_type.required" => "The Booking Type Field Is Required.",
                "receipte_date.required" => "The Receipte Date Field Is Required.",
                "customer_id.required" => "The Customer Id Field Is Required.",
                'invoice_date.required_if' => 'The Invoice Date Field Is Required.',
                'invoice_no.required_if' => 'The Invoice No Field Is Required.',
                'dispatch_date_time.required_if' => 'The Dispatch Date Time Field Is Required.',
                'dispatch_mode.required_if' => 'The Dispatch Mode Field Is Required.',
                'dispatch_details.required_if' => 'The Dispatch Details Field Is Required.',
                "booking_no.unique" => "The Booking No Field Must Be Unique.",
                "mfg_date.required" => "The Mfg Date Field Is Required.",
                "exp_date.required" => "The Exp Date Field Is Required.",
                'booking_sample_details.*.sample_quantity.numeric'  => 'booking sample details of sample quantity must be numeric value.',
                'booking_sample_details.*.batch_size_qty_rec.numeric'  => 'booking sample details of batch size qty rec must be numeric value.',
                'booking_sample_details.*.batch_size_qty_rec.digits_between'  => 'booking sample details of batch_size_qty_rec must be between 0 and 25 digits',
                'booking_sample_details.*.request_quantity.numeric'  => 'booking sample details of request quantity must be numeric value.',
                'booking_sample_details.*.batch_no.numeric'  => 'booking sample details of batch_no must be numeric value.',
                'booking_sample_details.*.batch_no.digits_between'  => 'booking sample details of batch_no must be between 0 and 25 digits.',
                'booking_sample_details.*.product_id.required'  => 'The Product Name Field Is Required.',
                'booking_sample_details.*.sampling_date_to.after'    => 'Sampling Date To Must Be A Date After Sampling Date From.',
                'booking_tests.*.amount.numeric'  => 'booking tests details of amount must be numeric value.',


            ];

            $validator = Validator::make($request->all(), $rules, $massage);
            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();
            $booking_data = [
                "mst_companies_id"  => $loggedInUserData['company_id'],
                "booking_type"  => (isset($request->booking_type) ? $request->booking_type : ''),
                "report_type"   => (isset($request->report_type) ? $request->report_type : ''),
                "invoice_date" => (isset($request->invoice_date) ? date('Y-m-d', strtotime($request->invoice_date)) : NULL),
                "invoice_no" => (isset($request->invoice_no) ? $request->invoice_no : NULL),
                "receipte_date" => (isset($request->receipte_date) ? date('Y-m-d', strtotime($request->receipte_date)) : ''),
                "booking_no"    => (isset($request->booking_no) ? $request->booking_no : ''),
                "customer_id"   => (isset($request->customer_id) ? $request->customer_id : 0),
                "reference_no"  => (isset($request->reference_no) ? $request->reference_no : ''),
                "remarks"   => (isset($request->remarks) ? $request->remarks : ''),
                "manufacturer_id"   => (isset($request->manufacturer_id) ? $request->manufacturer_id : 0),
                "supplier_id"   => (isset($request->supplier_id) ? $request->supplier_id : 0),
                "mfg_date"  => (isset($request->mfg_date) ? date('Y-m-d', strtotime($request->mfg_date)) : ''),
                "mfg_options"   => (isset($request->mfg_options) ? $request->mfg_options : ''),
                "exp_date"  => (isset($request->exp_date) ? date('Y-m-d', strtotime($request->exp_date)) : ''),
                "exp_options"   => (isset($request->exp_options) ? $request->exp_options : ''),
                "analysis_date" => (isset($request->analysis_date) ? date('Y-m-d', strtotime($request->analysis_date)) : ''),
                "aum_serial_no"    => (isset($request->aum_serial_no) ? $request->aum_serial_no : 0),
                "d_format"  => (isset($request->d_format) ? $request->d_format : ''),
                "d_format_options"  => (isset($request->d_format_options) ? $request->d_format_options : ''),
                "grade" => (isset($request->grade) ? $request->grade : ''),
                "grade_options" => (isset($request->grade_options) ? $request->grade_options : ''),
                "project_name"  => (isset($request->project_name) ? $request->project_name : ''),
                "project_options"   => (isset($request->project_options) ? $request->project_options : ''),
                "mfg_lic_no"    => (isset($request->mfg_lic_no) ? $request->mfg_lic_no : ''),
                "is_report_dispacthed"  => (isset($request->is_report_dispacthed) ? $request->is_report_dispacthed : 0),
                "dispatch_date_time" => (isset($request->dispatch_date_time) ? $request->dispatch_date_time : NULL),
                "dispatch_mode"    => (isset($request->dispatch_mode) ? $request->dispatch_mode : NULL),
                "dispatch_details"    => (isset($request->dispatch_details) ? $request->dispatch_details : NULL),
                "signature" => (isset($request->signature) ? $request->signature : 0),
                "verified_by"   => (isset($request->verified_by) ? $request->verified_by : ''),
                "nabl_scope"    => (isset($request->nabl_scope) ? $request->nabl_scope : 0),
                "cancel"    => (isset($request->cancel) ? $request->cancel : ''),
                "cancel_remarks"    => (isset($request->cancel_remarks) ? $request->cancel_remarks : ''),
                "priority"  => (isset($request->priority) ? $request->priority : ''),
                "discipline"    => (isset($request->discipline) ? $request->discipline : ''),
                "booking_group" => (isset($request->booking_group) ? $request->booking_group : ''),
                "statement_ofconformity"    => (isset($request->statement_ofconformity) ? $request->statement_ofconformity : ''),
                "coa_release_date"    => (isset($request->coa_release_date) ? date('Y-m-d', strtotime($request->coa_release_date)) : NULL),
                "block"    => (isset($request->block) ? $request->block : NULL),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
                "updated_by"    => $loggedInUserData['logged_in_user_id'],
            ];

            $this->addupdateBookingSample($request->booking_sample_details, $id);
            $this->addupdateBookingTests($request->booking_tests, $id);
            $this->addupdateAuditDetails($request->booking_audit_details, $id);

            $booking_table = Booking::find($id);
            $booking_table->update($booking_data);

            DB::commit();
            Log::info("Booking Created with details : " . json_encode($request->all()));
            return Helper::response("Booking updated Successfully", Response::HTTP_CREATED, true, $booking_data);
        } catch (Exception $e) {
            $booking_table = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $booking_table);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(booking $booking, $id)
    {
        //
        try {
            $data = array();
            $booking = Booking::find($id);
            $sample_details = BookingSampleDetail::where("booking_id", $id);
            $booking_tests = BookingTest::where("booking_id", $id);
            $booking_audit = BookingAuditDetail::where("booking_id", $id);

            Log::info("Booking deleted with : " . json_encode(array('id' => $id)));

            if (!empty($booking)) {
                $booking->delete();
                if (!empty($sample_details)) {
                    $sample_details->delete();
                }
                if (!empty($booking_tests)) {
                    $booking_tests->delete();
                }
                if (!empty($booking_audit)) {
                    $booking_audit->delete();
                }
                return Helper::response("Booking deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Booking not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
