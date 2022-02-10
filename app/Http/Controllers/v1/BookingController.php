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
use App\Mail\BookingStatus;
use App\Models\BookingAuditDetail;
use App\Models\MstProduct;
use App\Models\Pharmacopeia;
use App\Models\User;
use Auth;
use DB;
use Carbon\Carbon;
use Illuminate\Validation\Rule;
use Mockery\Undefined;
use App\Mail\BookingSuccessfull;
use App\Models\ModelViews\ViewBooking;
use Illuminate\Support\Facades\Mail;

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
                            'bookings.booking_type', 'bookings.coa_print_count',
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
                            'bookings.booking_type', 'bookings.coa_print_count',
                            // 'bookings.booking_type', 'bookings.coa_print_count', 'samples.product_type',
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

    public function booking_numbers($report_type = '', $receipte_date = '', $booking_type = '', $recheck = 0)
    {
        $booking_table = Booking::all();

        if ($booking_table->isEmpty()) {
            //if this is first entry of booking then booking no should be
            //ARL/COA/$report_type/yy-mm-dd/001
            $aum_serial_no = 1;
            $last_booking_id = 1;
            $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
            $formate_receipte_date = date('ymd', strtotime($receipte_date));
            if ($booking_type == 'W') {
                $booking_no = ("W/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
            } elseif ($booking_type == 'Temp') {
                $booking_no = ("ARL/COA/T/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
            } else {
                $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
            }
        } else {
            if (!isset(Booking::where('report_type', $report_type)->latest()->first()->booking_no)) {

                //check if this $report_type is using first time in the booking then 
                //booking number starting from 1 
                $last_booking_id = 1;
                $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
                $formate_receipte_date = date('ymd', strtotime($receipte_date));
                if ($booking_type == 'W') {
                    $booking_no = ("W/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                } elseif ($booking_type == 'Temp') {
                    $booking_no = ("ARL/COA/T/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                } else {
                    $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                }
            } else {
                //if this $report_type is used in booking before then increment a number but before increment check for following condition

                if (isset(Booking::where('booking_type', $booking_type)->where('receipte_date', $receipte_date)->where('report_type', $report_type)->latest()->first()->booking_no)) {
                    //check if this $receipte_date and this $report type is already exist then get last matched booking and increment booking no with 1 

                    $latest_booking_no = Booking::where('booking_type', $booking_type)->where('receipte_date', $receipte_date)->where('report_type', $report_type)->latest()->first()->booking_no; //is_receipte_date_exist
                    $latest_data = $latest_booking_no;
                    $findlaststr = explode("/", $latest_data);
                    $last_booking_id = end($findlaststr) + 1;
                    $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
                    $formate_receipte_date = date('ymd', strtotime($receipte_date));
                    if ($booking_type == 'W') {
                        $booking_no = ("W/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    } elseif ($booking_type == 'Temp') {
                        $booking_no = ("ARL/COA/T/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    } else {
                        $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    }
                } else {
                    //if this $receipte_date and $report_type not insert before then start booking no with 1

                    $last_booking_id = 1;
                    $str_pad_booking_id = str_pad($last_booking_id, 3, '0', STR_PAD_LEFT);
                    $formate_receipte_date = date('ymd', strtotime($receipte_date));
                    if ($booking_type == 'W') {
                        $booking_no = ("W/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    } elseif ($booking_type == 'Temp') {
                        $booking_no = ("ARL/COA/T/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    } else {
                        $booking_no = ("ARL/COA/" . $report_type . '/' . $formate_receipte_date . '/' . $str_pad_booking_id);
                    }
                }
            }
        }

        //Aum serial No
        if (isset(Booking::latest()->first()->aum_serial_no)) {
            $serial_no = Booking::latest()->first()->aum_serial_no;
            $aum_serial_no = $serial_no + 1;
        } else {
            $aum_serial_no = 1;
        }

        //ULR No
        $year = Carbon::now()->format('y');
        if ($booking_table->isEmpty()) {
            $str_pad = str_pad(1, 7, '0', STR_PAD_LEFT);
            $ulr_no = "TC9192" . $year . "0" . $str_pad . "F";
        } else {
            $old_number = Booking::latest()->first()->ulr_no;
            $new_number = explode(0, $old_number, 2);
            $new_number = explode("F", $new_number[1]);
            $new_number = $new_number[0] + 1;
            $str_pad = str_pad($new_number, 7, '0', STR_PAD_LEFT);
            $ulr_no = "TC9192" . $year . "0" . $str_pad . "F";
        }
        // TC9192(code) 21(year) 0(location) 00000001F(number)
        $number = array(
            'booking_no' => $booking_no,
            'aum_serial_no' => $aum_serial_no,
            'ulr_no' => $ulr_no
        );
        if ($recheck == 1) {
            return $number;
        } else {
            return Helper::response("last booking no is generated Successfully", Response::HTTP_CREATED, true, $number);
        }
    }

    public function contact_type($type = '', $data = '', $is_return = '')
    {
        $loggedInUserData = Helper::getUserData();
        $contact_type_data = Customer::select('id', 'company_name')
            ->where('contact_type', $type)
            ->where('is_active', 1)
            ->where('mst_companies_id', $loggedInUserData['company_id'])
            ->orderBy('id', 'desc')
            ->get();

        if ($data != '') {
            if ($data['customer_id']['id'] != '') {
                if ($data['customer_id']['deleted_at'] == '' || $data['customer_id']['deleted_at'] == null) {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Customer')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Customer'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Customer')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['customer_id']);
                    $data['contact_type_Customer'] = $contact_type_data;
                }
            } else {
                $contact_type_data = Customer::select('id', 'company_name')
                    ->where('contact_type', 'Customer')
                    ->where('is_active', 1)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
                $contact_type_data = $contact_type_data->toArray();
                $data['contact_type_Customer'] = $contact_type_data;
            }
        }
        if ($data != '') {
            if ($data['manufacturer_id']['id'] != '') {
                if ($data['manufacturer_id']['deleted_at'] == '') {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Manufacturer')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Manufacturer'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Manufacturer')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['manufacturer_id']);
                    $data['contact_type_Manufacturer'] = $contact_type_data;
                }
            } else {
                $contact_type_data = Customer::select('id', 'company_name')
                    ->where('contact_type', 'Manufacturer')
                    ->where('is_active', 1)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
                $contact_type_data = $contact_type_data->toArray();
                $data['contact_type_Manufacturer'] = $contact_type_data;
            }
        }
        if ($data != '') {
            if ($data['supplier_id']['id'] != '') {
                if ($data['supplier_id']['deleted_at'] == '') {
                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Supplier')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    $data['contact_type_Supplier'] = $contact_type_data;
                } else {

                    $contact_type_data = Customer::select('id', 'company_name')
                        ->where('contact_type', 'Supplier')
                        ->where('is_active', 1)
                        ->where('mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('id', 'desc')
                        ->get();
                    $contact_type_data = $contact_type_data->toArray();
                    array_push($contact_type_data, $data['supplier_id']);
                    $data['contact_type_Supplier'] = $contact_type_data;
                }
            } else {
                $contact_type_data = Customer::select('id', 'company_name')
                    ->where('contact_type', 'Supplier')
                    ->where('is_active', 1)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
                $contact_type_data = $contact_type_data->toArray();
                $data['contact_type_Supplier'] = $contact_type_data;
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
                    'samples:id,booking_id,batch_no,product_id',
                    'samples.product_id:id,product_name,generic_product_id',
                    'tests:booking_id,test_name,amount',
                    'audit:booking_id,comments',
                    'created_by:id,first_name,middle_name,last_name',
                    'updated_by:id,first_name,middle_name,last_name'
                )
                ->where('is_active', 1)
                ->where('mst_companies_id', $loggedInUserData['company_id'])
                ->orderBy('id', 'desc')
                ->get();

            $exportData_Arr = $exportData->toArray();

            $len = count($exportData_Arr);
            $i = 0;
            for ($i = 0; $i < $len; $i++) {
                if (!empty($exportData_Arr[$i]['samples'])) {
                    if ($exportData_Arr[$i]['samples'][0]['product_id'] != null || $exportData_Arr[$i]['samples'][0]['product_id'] != "" || !empty($exportData_Arr[$i]['samples'][0]['product_id'])) {
                        $generic_id = $exportData_Arr[$i]['samples'][0]['product_id']['generic_product_id'];
                        if ($generic_id != 0 && $generic_id != "") {
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
                } else {
                    $exportData_Arr[$i]['samples'] = array(
                        "id" => "",
                        "booking_id" => "",
                        "batch_no" => "",
                        "product_id" => array(
                            "id" => "",
                            "generic_product_id" => ""
                        )
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
                if (empty($exportData_Arr[$i]['audit'])) {
                    $exportData_Arr[$i]['audit'] = array(
                        "booking_id" => "",
                        "comments" => "",
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
     * Show the form for creating a new resource.
     *if manufacturer_id and supplier_id not exist in customer table then insert in 
     *customer table as corresponding to the contact_type
     * @return \Illuminate\Http\Response
     */
    public function uniqcustomer($request)
    {
        //
        $loggedInUserData = Helper::getUserData();
        // dd($request->manufacturer_id);
        $is_manufacturer_exist = Customer::where('company_name', $request['manufacturer_id'])
            ->where('contact_type', 'Manufacturer')
            ->get('id')->toarray();
        $is_supplier_exist = Customer::where('company_name', $request['supplier_id'])
            ->where('contact_type', 'Supplier')
            ->get('id')->toarray();

        $manufacturer_id = 0;
        $supplier_id = 0;

        if (empty($is_manufacturer_exist) == true) {

            // not exist"
            $manufacturer_data = Customer::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'company_name' => $request['manufacturer_id'],
                'contact_type' => 'Manufacturer',
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                'updated_at' => NULL
            ]);

            $manufacturer_id = $manufacturer_data['id'];
        } else {

            //exist
            $manufacturer_id = $is_manufacturer_exist[0]['id'];
        }

        if (empty($is_supplier_exist) == true) {
            // not exist
            $supplier_data = Customer::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'company_name' => $request['supplier_id'],
                'contact_type' => 'Supplier',
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                'updated_at' => NULL
            ]);

            $supplier_id = $supplier_data['id'];
        } else {

            //exist
            $supplier_id = $is_supplier_exist[0]['id'];
        }

        $uniqcustomer_arr = array(

            'manufacturer_id' => $manufacturer_id,
            'supplier_id' => $supplier_id

        );

        return $uniqcustomer_arr;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (isset($request->check_customer_active) && $request->check_customer_active == 0) {
            //validate if customer is active or not if inactive then throw an error
            return Helper::response("Customer is Inactive Please Change Customer", Response::HTTP_OK, false);
        }
        //recheck booking no 
        $recheck_number = $this->booking_numbers(
            $request->report_type,
            $request->receipte_date,
            $request->booking_type,
            $recheck = 1
        );
        //recheked numbers
        $booking_no = $recheck_number['booking_no'];
        $aum_serial_no = $recheck_number['aum_serial_no'];
        $ulr_no = $recheck_number['ulr_no'];

        //validations
        $rules = [
            "report_type" => "required|max:55",
            "booking_type" => "required|max:55",
            "receipte_date" => "required",
            "customer_id" => "required",
            // 'invoice_date' => 'required_if:booking_type,Invoice',
            // 'invoice_no' => 'required_if:booking_type,Invoice|max:55',
            'booking_no'  => 'max:255',
            'reference_no'  => 'max:255',
            'd_format'  => 'max:255',
            'project_name'  => 'max:255',
            'mfg_lic_no'  => 'max:155',
            // 'aum_serial_no'  => 'unique:bookings|max:55',
            'dispatch_date_time' => 'required_if:is_report_dispacthed,0|max:100',
            'dispatch_mode' => 'required_if:is_report_dispacthed,1|max:155',
            'dispatch_details' => 'required_if:is_report_dispacthed,1|max:255',
            'mfg_date'  => 'required|date',
            'exp_date'    => 'required|date_format:Y-m-d|after:mfg_date',
            'booking_sample_details.product_id'  => 'required|Integer',
            'booking_sample_details.sampling_date_from'  => 'nullable|date',
            'booking_sample_details.sampling_date_to'    => 'nullable|date_format:Y-m-d|after:booking_sample_details.*.sampling_date_from',
            'booking_tests.*.amount'    => 'nullable|numeric|between:0,999999999999999999999999999.99',
            // 'booking_sample_details.batch_no'  => 'nullable|unique:booking_sample_details',
            'booking_sample_details.packsize'  => 'max:55',
            // 'booking_sample_details.*.request_quantity'  => 'nullable',
            'booking_sample_details.sample_code'  => 'max:100',
            'booking_sample_details.sample_location'  => 'max:150',
            'booking_sample_details.sample_packaging'  => 'max:255',
            'booking_sample_details.sample_type'  => 'max:60',
            'booking_sample_details.sample_drawn_by'  => 'max:255',
            'booking_sample_details.sample_quantity'  => 'nullable',
            // 'booking_sample_details.*.batch_size_qty_rec'  => 'nullable',
            'booking_tests.*.p_sr_no'  => 'max:10',
            'booking_tests.*.test_name'  => 'max:255',
            'booking_tests.*.label_claim'  => 'max:155',
            'booking_tests.*.label_claim_percentage'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
            // 'booking_tests.*.label_claim_result'  => 'max:255',
            // 'booking_tests.*.label_claim_unit'  => 'max:60',
            // 'booking_tests.*.mean'  => 'max:150',
            // 'booking_tests.*.unit'  => 'max:60',
            'booking_tests.*.amount'  => 'nullable|numeric|between:0,999999999999999999999999999.99',
            'booking_tests.*.division'  => 'max:255',
            "booking_tests.*.min_limit" => 'nullable|regex:/^NLT\s[0-9](?:.%)?/i',
            "booking_tests.*.max_limit" => 'nullable|regex:/^NMT\s[0-9](?:.%)?/i'
            // 'booking_tests.*.method'  => 'max:255',
            // 'booking_tests.*.approved'  => 'max:20',

        ];
        $massage = [
            "report_type.required" => "The Report Type Field Is Required.",
            "booking_type.required" => "The Booking Type Field Is Required.",
            "receipte_date.required" => "The Receipte Date Field Is Required.",
            "customer_id.required" => "The Customer Name Field Is Required.",
            'invoice_date.required_if' => 'The Invoice Date Field Is Required.',
            'invoice_no.required_if' => 'The Invoice No Field Is Required.',
            'dispatch_date_time.required_if' => 'The Dispatch Date Time Field Is Required.',
            'dispatch_mode.required_if' => 'The Dispatch Mode Field Is Required.',
            'dispatch_details.required_if' => 'The Dispatch Details Field Is Required.',
            "booking_no.unique" => "The Booking No Field Must Be Unique.",
            "mfg_date.required" => "The Mfg Date Field Is Required.",
            "exp_date.required" => "The Exp Date Field Is Required.",
            'booking_sample_details.batch_no.unique'  => 'booking sample details of batch_no has already been taken.',
            'booking_sample_details.product_id.required'  => 'The Product Name Field Is Required.',
            'booking_sample_details.sampling_date_to.after'    => 'Sampling Date To Must Be A Date After Sampling Date From.',
            'booking_tests.*.amount.numeric'  => 'booking tests details of amount must be numeric value.',
            "booking_tests.*.min_limit.regex" => "Please Enter Valid Min Limit As 'NLT 1.00%'",
            "booking_tests.*.max_limit.regex" => "Please Enter Valid Max Limit As 'NMT 1.00%'"
        ];

        $validator = Validator::make($request->all(), $rules, $massage);
        if ($validator->fails()) {
            $data = array();
            return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
        }

        //start db transaction
        DB::beginTransaction();
        try {
            $loggedInUserData = Helper::getUserData();
            //create new customer if manufacturer and suppiler are uniq
            $newCustomer = $this->uniqcustomer($request->all());
            //static dropdown
            $static_dropdown = config('global.booking_dropdown');
            $booking_data = Booking::create([
                "mst_companies_id" => $loggedInUserData['company_id'],

                "booking_type" => (isset($request->booking_type) && isset($static_dropdown['booking_type'][$request->booking_type]) ? $static_dropdown['booking_type'][$request->booking_type] : NULL),

                "report_type" => (isset($request->report_type) && isset($static_dropdown['report_type'][$request->report_type]) ? $request->report_type : NULL),

                "receipte_date" => (isset($request->receipte_date) ? date('Y-m-d', strtotime($request->receipte_date)) : NULL),

                "booking_no" => (isset($request->booking_no) ? $booking_no : ''),

                "customer_id" => (isset($request->customer_id) ? $request->customer_id : ''),

                "reference_no" => (isset($request->reference_no) ? $request->reference_no : ''),

                "remarks" => (isset($request->remarks) ? $request->remarks : ''),

                "manufacturer_id" => (isset($request->manufacturer_id) ? $newCustomer['manufacturer_id'] : ''),

                "supplier_id" => (isset($request->supplier_id) ? $newCustomer['supplier_id'] : ''),

                "mfg_date" => (isset($request->mfg_date) ? date('Y-m-d', strtotime($request->mfg_date)) : NULL),

                "mfg_options" => (isset($request->mfg_options) && isset($static_dropdown['common_options'][$request->mfg_options]) ? $static_dropdown['common_options'][$request->mfg_options] : NULL),

                "exp_date" => (isset($request->exp_date) ? date('Y-m-d', strtotime($request->exp_date))  : NULL),

                "exp_options" => (isset($request->exp_options) && isset($static_dropdown['common_options'][$request->exp_options]) ? $static_dropdown['common_options'][$request->exp_options] : NULL),

                "analysis_date" => (isset($request->analysis_date) ? date('Y-m-d', strtotime($request->analysis_date))  : NULL),

                "aum_serial_no" => (isset($request->aum_serial_no) ? $aum_serial_no : ''),

                "d_format" => (isset($request->d_format) ? $request->d_format : ''),

                "d_format_options" => (isset($request->d_format_options) && isset($static_dropdown['common_options'][$request->d_format_options]) ? $static_dropdown['common_options'][$request->d_format_options] : NULL),

                "grade" => (isset($request->grade) ? $request->grade : ''),

                "grade_options" => (isset($request->grade_options) && isset($static_dropdown['common_options'][$request->grade_options]) ? $static_dropdown['common_options'][$request->grade_options] : NULL),

                "project_name" => (isset($request->project_name) ? $request->project_name : ''),

                "project_options" => (isset($request->project_options) && isset($static_dropdown['common_options'][$request->project_options]) ? $static_dropdown['common_options'][$request->project_options] : NULL),

                "mfg_lic_no" => (isset($request->mfg_lic_no) ? $request->mfg_lic_no : ''),

                "is_report_dispacthed" => (isset($request->is_report_dispacthed) && isset($static_dropdown['yes-no'][$request->is_report_dispacthed]) ? $static_dropdown['yes-no'][$request->is_report_dispacthed] : NULL),

                "dispatch_date_time" => (isset($request->dispatch_date_time) ? $request->dispatch_date_time : ''),

                "dispatch_mode" => (isset($request->dispatch_mode) ? $request->dispatch_mode : ''),

                "dispatch_details" => (isset($request->dispatch_details) ? $request->dispatch_details : ''),

                "signature" => (isset($request->signature) && isset($static_dropdown['yes-no'][$request->signature]) ? $static_dropdown['yes-no'][$request->signature] : NULL),

                "verified_by" => (isset($request->verified_by) && isset($static_dropdown['verified_by'][$request->verified_by]) ? $static_dropdown['verified_by'][$request->verified_by] : NULL),

                "nabl_scope" => (isset($request->nabl_scope) && isset($static_dropdown['yes-no'][$request->nabl_scope]) ? $static_dropdown['yes-no'][$request->nabl_scope] : NULL),
                "ulr_no" => (isset($request->ulr_no) ? $ulr_no : NULL),

                "cancel" => (isset($request->cancel) && isset($static_dropdown['cancel'][$request->cancel]) ? $static_dropdown['cancel'][$request->cancel] : NULL),

                "cancel_remarks" => (isset($request->cancel_remarks) ? $request->cancel_remarks : ''),

                "priority" => (isset($request->priority) && isset($static_dropdown['priority'][$request->priority])  ? $static_dropdown['priority'][$request->priority] : NULL),

                "discipline" => (isset($request->discipline) && isset($static_dropdown['discipline'][$request->discipline]) ? $static_dropdown['discipline'][$request->discipline] : NULL),

                "booking_group" => (isset($request->booking_group) && isset($static_dropdown['booking_group'][$request->booking_group]) ? $static_dropdown['booking_group'][$request->booking_group] : NULL),

                "statement_of_conformity" => (isset($request->statement_of_conformity) && isset($static_dropdown['statement_of_conformity'][$request->statement_of_conformity]) ? $static_dropdown['statement_of_conformity'][$request->statement_of_conformity] : NULL),

                "is_active" => 1,
                "created_by" => $loggedInUserData['logged_in_user_id'],
                "selected_year" => $loggedInUserData['selected_year'],
                "updated_at" => NULL,
            ]);
            //callback function to add booking samples details
            if (!empty($request->booking_sample_details)) {
                $this->addupdateBookingSample($request->booking_sample_details, $booking_data->id, $static_dropdown);
            }
            //callback function to add booking tests
            if (!empty($request->booking_tests)) {
                $this->addupdateBookingTests($request->booking_tests, $booking_data->id, $static_dropdown);
            }

            DB::commit();
            return Helper::response("Booking added Successfully", Response::HTTP_CREATED, true, $booking_data);
        } catch (Exception $e) {
            DB::rollback();
            $booking_data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $booking_data);
        }
    }

    public function addupdateBookingSample($booking_samples, $booking_id, $static_dropdown)
    {
        $loggedInUserData = Helper::getUserData();

        $booking_sample_data = array(
            "mst_companies_id" => $loggedInUserData['company_id'],
            "booking_id" => (isset($booking_id) ? $booking_id : 0),

            "product_id"    => (isset($booking_samples['product_id']) ? $booking_samples['product_id'] : 0),

            "batch_no"  => (isset($booking_samples['batch_no']) ? $booking_samples['batch_no'] : ''),

            "packsize"  => (isset($booking_samples['packsize']) ? $booking_samples['packsize'] : ''),

            "request_quantity"  => (isset($booking_samples['request_quantity']) ? $booking_samples['request_quantity'] : ''),

            "sample_code"   => (isset($booking_samples['sample_code']) ? $booking_samples['sample_code'] : ''),

            "sample_description"    => (isset($booking_samples['sample_description']) ? $booking_samples['sample_description'] : ''),

            "sample_quantity"   => (isset($booking_samples['sample_quantity']) ? $booking_samples['sample_quantity'] : ''),

            "sample_location"   => (isset($booking_samples['sample_location']) ? $booking_samples['sample_location'] : ''),

            "sample_packaging"  => (isset($booking_samples['sample_packaging']) ? $booking_samples['sample_packaging'] : ''),

            "sample_type"   => (isset($booking_samples['sample_type']) ? $booking_samples['sample_type'] : ''),

            "sampling_date_from"    => (isset($booking_samples['sampling_date_from']) ? date('Y-m-d', strtotime($booking_samples['sampling_date_from'])) : NULL),

            "sampling_date_from_options"    => (isset($booking_samples['sampling_date_from_options']) && isset($static_dropdown['common_options'][$booking_samples['sampling_date_from_options']]) ? $static_dropdown['common_options'][$booking_samples['sampling_date_from_options']] : NULL),

            "sampling_date_to"  => (isset($booking_samples['sampling_date_to']) ? date('Y-m-d', strtotime($booking_samples['sampling_date_to'])) : NULL),

            "sampling_date_to_options"  => (isset($booking_samples['sampling_date_to_options']) && isset($static_dropdown['common_options'][$booking_samples['sampling_date_to_options']]) ? $static_dropdown['common_options'][$booking_samples['sampling_date_to_options']] : NULL),

            "sample_received_through"   => (isset($booking_samples['sample_received_through']) && isset($static_dropdown['sample_received_through'][$booking_samples['sample_received_through']]) ? $static_dropdown['sample_received_through'][$booking_samples['sample_received_through']] : NULL),

            "chemist"   => (isset($booking_samples['chemist']) && isset($static_dropdown['chemist'][$booking_samples['chemist']]) ? $static_dropdown['chemist'][$booking_samples['chemist']] : NULL),

            "sample_condition"  => (isset($booking_samples['sample_condition']) ? $booking_samples['sample_condition'] : ''),

            "is_sample_condition"   => (isset($booking_samples['is_sample_condition']) && isset($static_dropdown['yes-no'][$booking_samples['is_sample_condition']]) ? $static_dropdown['yes-no'][$booking_samples['is_sample_condition']] : 0),

            "batch_size_qty_rec"    => (isset($booking_samples['batch_size_qty_rec']) ? $booking_samples['batch_size_qty_rec'] : ''),

            "notes" => (isset($booking_samples['notes']) ? $booking_samples['notes'] : ''),

            "sample_drawn_by"   => (isset($booking_samples['sample_drawn_by']) ? $booking_samples['sample_drawn_by'] : ''),

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

    public function addupdateBookingTests($booking_tests, $booking_id, $static_dropdown)
    {
        if (!empty($booking_tests)) {

            $loggedInUserData = Helper::getUserData();
            $tests_count = count($booking_tests);

            if ($tests_count) {

                // Delete all old
                $testdata = BookingTest::where('booking_id', $booking_id);
                $testdata->forceDelete();

                foreach ($booking_tests as $key => $tests) {

                    if (
                        !empty($tests['parent_id']) or
                        !empty($tests['product_details']) or
                        !empty($tests['test_name']) or
                        !empty($tests['label_claim']) or
                        !empty($tests['label_claim_percentage']) or
                        !empty($tests['min_limit']) or
                        !empty($tests['max_limit']) or
                        !empty($tests['amount'])
                    ) {
                        $tests_data = array(
                            "mst_companies_id" => $loggedInUserData['company_id'],
                            "booking_id" => (isset($booking_id) ? $booking_id : 0),
                            "parent_child" => (isset($tests['parent_child']) && isset($static_dropdown['parent_child'][$tests['parent_child']]) ? $static_dropdown['parent_child'][$tests['parent_child']] : NULL),
                            "p_sr_no" => (isset($tests['p_sr_no']) ? $tests['p_sr_no'] : ''),
                            "by_pass" => (isset($tests['by_pass']) && isset($static_dropdown['yes-no'][$tests['by_pass']]) ? $static_dropdown['yes-no'][$tests['by_pass']] : 0),
                            "parent" => (isset($tests['parent_id']) ? $tests['parent_id'] : 0),
                            "product_details" => (isset($tests['product_details']) ? $tests['product_details'] : ''),
                            "test_name" => (isset($tests['test_id']) ? $tests['test_id'] : 0),
                            "label_claim" => (isset($tests['label_claim']) ? $tests['label_claim'] : ''),
                            "label_claim_percentage" => (isset($tests['label_claim_percentage']) ? $tests['label_claim_percentage'] : ''),
                            "min_limit" => (isset($tests['min_limit']) ? $tests['min_limit'] : ''),
                            "max_limit" => (isset($tests['max_limit']) ? $tests['max_limit'] : ''),
                            "amount" => (isset($tests['amount']) ? $tests['amount'] : 0),
                            "selected_year" => $loggedInUserData['selected_year'],
                            "is_active" => (isset($tests['is_active']) ? $tests['is_active'] : 1),
                            'created_by' => $loggedInUserData['logged_in_user_id'], //edited
                            'updated_by' => $loggedInUserData['logged_in_user_id']
                        );
                        BookingTest::create($tests_data);
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
        )->with('all_pharmacopeia:id,pharmacopeia_name', 'all_generic:id,product_name as generic_product_name')
            ->where('is_active', 1)
            ->where('mst_companies_id', $loggedInUserData['company_id'])
            ->orderBy('id', 'desc')
            ->get()->toarray();

        if ($data['samples'][0]['get_product']['deleted_at'] == null || $data['samples'][0]['get_product']['deleted_at'] == '') {
            $data['products'] = $product_data;
        } else {
            $product_arr = array(
                'id' => $data['samples'][0]['get_product']['id'],
                'product_name' => $data['samples'][0]['get_product']['product_name'],
                'product_generic' => $data['samples'][0]['get_product']['product_generic'],
                "pharmacopeia_id" => $data['samples'][0]['get_product']['pharmacopeia_id']['id'],
                "generic_product_id" => $data['samples'][0]['get_product']['generic_product_id'],
                "all_pharmacopeia" => array(
                    "id" => $data['samples'][0]['get_product']['pharmacopeia_id']['id'],
                    "pharmacopeia_name" => $data['samples'][0]['get_product']['pharmacopeia_id']['pharmacopeia_name']
                ),
                "all_generic" => array(
                    "id" => $data['samples'][0]['get_product']['generic_product_id'],
                    "generic_product_name" => $data['samples'][0]['get_product']['generic_product_name']
                ),
            );
            array_push($product_data, $product_arr);
            $data['products'] = $product_data;
        }
        foreach ($data['products'] as $key => $item) {

            if ($item['all_generic'] == '' && $item['all_generic'] == null) {

                $data['products'][$key]['all_generic'] = array(
                    "id" => '',
                    "generic_product_name" => ''
                );
            }
            if ($item['all_pharmacopeia'] == '' && $item['all_pharmacopeia'] == null) {
                $data['products'][$key]['all_pharmacopeia'] = array(
                    "id" => '',
                    "pharmacopeia_name" => ''
                );
            }
        }
        return $data;
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $data = ViewBooking::with('samples', 'tests')->where('id', $id)
                ->get()->each(function ($item) {
                    $item->append('customer_dropdown', 'manufacturer_dropdown', 'supplier_dropdown');
                    $item['samples']->append('product_dropdown');
                    $item['tests']->append('parent_name','test_name','method_name','unit_name','chemist_dropdown');
                })->toarray();
            return Helper::response("Booking data shown successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $pending_assigned_tests = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $pending_assigned_tests);
        }
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
        // return Helper::response("DEBuG", Response::HTTP_OK, true, $request->all());
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
                'booking_sample_details.*.batch_no'  => 'nullable',
                'booking_sample_details.*.packsize'  => 'max:55',
                'booking_sample_details.*.request_quantity'  => 'nullable',
                'booking_sample_details.*.sample_code'  => 'max:100',
                'booking_sample_details.*.sample_location'  => 'max:150',
                'booking_sample_details.*.sample_packaging'  => 'max:255',
                'booking_sample_details.*.sample_type'  => 'max:60',
                'booking_sample_details.*.sample_drawn_by'  => 'max:255',
                'booking_sample_details.*.sample_quantity'  => 'nullable',
                'booking_sample_details.*.batch_size_qty_rec'  => 'nullable',
                'booking_tests.*.result'  => 'required_if:booking_tests.*.approved,ForApproval,Approved,Rejected',
                'booking_tests.*.test_date_time'  => 'required_if:booking_tests.*.approved,ForApproval,Approved,Rejected',
                'booking_tests.*.approval_date_time'  => 'required_if:booking_tests.*.approved,Approved,Rejected',
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
                'booking_tests.*.chemist_name'  => 'required_if:booking_tests.*.approved,Assigned,ForApproval,Approved,Rejected',

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
                'booking_sample_details.*.product_id.required'  => 'The Product Name Field Is Required.',
                'booking_sample_details.*.sampling_date_to.after'    => 'Sampling Date To Must Be A Date After Sampling Date From.',
                'booking_tests.*.amount.numeric'  => 'booking tests details of amount must be numeric value.',
                'booking_tests.*.chemist_name.required_if'  => 'Chemist Name is Required in a Tests If Approved Status is in Assigned, ForApproval, Approved, Rejected.',
                'booking_tests.*.result.required_if'  => 'Result Field is Required in a Tests If Approved Status is in ForApproval, Approved, Rejected.',
                'booking_tests.*.test_date_time.required_if'  => 'Test Date Time Field is Required in a Tests If Approved Status is in ForApproval, Approved, Rejected.',
                'booking_tests.*.approval_date_time.required_if'  => 'Approval Date Time Field is Required in a Tests If Approved Status is in Approved or Rejected.',

            ];

            $validator = Validator::make($request->all(), $rules, $massage);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            //callback function for manufacturer_id, supplier_id
            $uniqcustomer_arr = $this->uniqcustomer($request);
            //callback function end

            $loggedInUserData = Helper::getUserData();
            $booking_data = [
                "mst_companies_id"  => $loggedInUserData['company_id'],
                "booking_type"  => (isset($request->booking_type) ? $request->booking_type : ''),
                "report_type"   => (isset($request->report_type) ? $request->report_type : ''),
                "invoice_date" => (isset($request->invoice_date) ? date('Y-m-d', strtotime($request->invoice_date)) : NULL),
                "invoice_no" => (isset($request->invoice_no) ? $request->invoice_no : NULL),
                "receipte_date" => (isset($request->receipte_date) ? date('Y-m-d', strtotime($request->receipte_date)) : NULL),
                "booking_no"    => (isset($request->booking_no) ? $request->booking_no : ''),
                "customer_id"   => (isset($request->customer_id) ? $request->customer_id : 0),
                "reference_no"  => (isset($request->reference_no) ? $request->reference_no : ''),
                "remarks"   => (isset($request->remarks) ? $request->remarks : ''),
                "manufacturer_id"   => (isset($uniqcustomer_arr['manufacturer_id']) ? $uniqcustomer_arr['manufacturer_id'] : 0),
                "supplier_id"   => (isset($uniqcustomer_arr['supplier_id']) ? $uniqcustomer_arr['supplier_id'] : 0),
                "mfg_date"  => (isset($request->mfg_date) ? date('Y-m-d', strtotime($request->mfg_date)) : NULL),
                "mfg_options"   => (isset($request->mfg_options) ? $request->mfg_options : ''),
                "exp_date"  => (isset($request->exp_date) ? date('Y-m-d', strtotime($request->exp_date)) : NULL),
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
            // $this->statusWiseMail($request->all(), $id);
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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function statusWiseMail($mail_data, $id)
    {
        //
        // if (!empty($mail_data['booking_tests'])) {
        //     $is_status_changed = 1;
        //     foreach($mail_data['booking_tests'] as $test)
        //     {

        //     }
        //     $is_mail_data = True;
        //     $email_data = $this->show($id, $is_mail_data);
        //     $send_email_to = $email_data['customer_id']['user_name'];
        //     Mail::to(users: $send_email_to)->send(new BookingStatus($mail_data));
        // }
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
                Log::info("Booking deleted with : " . json_encode(array('id' => $id)));
                return Helper::response("Booking deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Booking not exists", Response::HTTP_NOT_FOUND, false, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
