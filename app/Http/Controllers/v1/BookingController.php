<?php

namespace App\Http\Controllers\v1;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\BookingSampleDetail;
use App\Models\BookingTest;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use App\Helpers\Helper;
use Auth;
use DB;
use Carbon\Carbon;
use Illuminate\Validation\Rule;

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
            // $is_generic = (isset($request->is_generic) && $request->is_generic == 1) ? 1 : 0;

            if (!$is_dropdown) {

                $data = Booking::join('booking_sample_details as samples', 'samples.booking_id', '=', 'bookings.id')
                    ->join('mst_products', 'mst_products.id', '=', 'samples.product_id')
                    ->select(
                        [
                            'bookings.id', 'bookings.aum_serial_no', 'bookings.booking_no',
                            'bookings.booking_type',
                            DB::raw('DATE_FORMAT(bookings.receipte_date, "%d-%b-%Y") as receipte_date'),
                            'bookings.is_active', 'mst_products.product_name'
                        ]
                    )
                    ->where('bookings.is_active', 1)
                    ->where('bookings.selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('id', 'desc')
                    ->paginate(10);
            } elseif ($is_dropdown) {

                $data = Booking::join('booking_sample_details as samples', 'samples.booking_id', '=', 'bookings.id')
                    ->join('mst_products', 'mst_products.id', '=', 'samples.product_id')
                    ->select(
                        [
                            'bookings.id', 'bookings.aum_serial_no', 'bookings.booking_no',
                            'bookings.booking_type',
                            DB::raw('DATE_FORMAT(bookings.receipte_date, "%d-%b-%Y") as receipte_date'),
                            'bookings.is_active', 'mst_products.product_name'
                        ]
                    )
                    ->where('bookings.is_active', 1)
                    ->where('bookings.selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('id', 'desc')
                    ->get();
            }

            $data_arr = $data->isEmpty();

            if ($data_arr) {

                return Helper::response("Booking List is Empty", Response::HTTP_OK, true, $data);
            } else {

                return Helper::response("Booking List Shown Successfully", Response::HTTP_OK, true, $data);
            }
        } catch (\Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    public function last_booking_no($report_type)
    {

        $booking_id = Booking::all();
        
        if ($booking_id->isEmpty()) {

            $last_booking_id = 1;
            $aum_serial_no = 1;
        } {
            $booking_id = Booking::where('report_type', $report_type)->latest()->first()->booking_no;
            $serial_no = Booking::latest()->first()->aum_serial_no;

            $latest_data = $booking_id;
            $findlaststr = explode("/", $latest_data);
            $last_booking_id = end($findlaststr) + 1;
            $aum_serial_no = $serial_no + 1;
        }
        $booking_no = ("ARL/COA/" . $report_type . '/' . Carbon::now()->format('Ymd') . '/' . $last_booking_id);

        return Helper::response("last booking no is generated Successfully", Response::HTTP_CREATED, true, $booking_no);
    }

    public function contact_type($type = '')
    {
        //
        $loggedInUserData = Helper::getUserData();
        $contact_type_data = Customer::select('id', 'company_name')
            ->where('contact_type', $type)
            ->where('is_active', 1)
            ->where('selected_year', $loggedInUserData['selected_year'])
            ->orderBy('id', 'desc')
            ->get();
        return Helper::response("company name list Successfully", Response::HTTP_CREATED, true, $contact_type_data);
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

        //
        DB::beginTransaction();
        try {
            $rules = [
                "report_type" => "required",
                "booking_type" => "required",
                "receipt date" => "required",
                "customer_id" => "required",
                'booking_no'  => 'required,unique:bookings',
                'mfg_date'  => 'required|date',
                'exp_date'    => 'required|date_format:Y-m-d|after:mfg_date',
            ];
            $massage = [
                "report_type" => "Please select 'Report type'",
                "customer_id" => "Please select 'Customer'",
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
                "signature" => (isset($request->signature) ? $request->signature : 0),
                "verified_by"   => (isset($request->verified_by) ? $request->verified_by : ''),
                "nabl_scope"    => (isset($request->nabl_scope) ? $request->nabl_scope : 0),
                "cancel"    => (isset($request->cancel) ? $request->cancel : ''),
                "cancel_remarks"    => (isset($request->cancel_remarks) ? $request->cancel_remarks : ''),
                "priority"  => (isset($request->priority) ? $request->priority : ''),
                "discipline"    => (isset($request->discipline) ? $request->discipline : ''),
                "booking_group" => (isset($request->booking_group) ? $request->booking_group : ''),
                "statement_ofconformity"    => (isset($request->statement_ofconformity) ? $request->statement_ofconformity : ''),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
                "created_by"    => $loggedInUserData['logged_in_user_id'],

            ]);

            $this->addupdateBookingSample($request->booking_sample_details, $booking_data->id);
            $this->addupdateBookingTests($request->booking_tests, $booking_data->id);

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

        if (!empty($booking_samples) || $booking_samples != NULL || $booking_samples != "") {

            $loggedInUserData = Helper::getUserData();
            $booking_sample_data = BookingSampleDetail::create([
                "booking_id" => (isset($booking_id) ? $booking_id : 0),
                "product_id"    => (isset($booking_samples['product_id']) ? $booking_samples['product_id'] : 0),
                "generic_name"  => (isset($booking_samples['generic_name']) ? $booking_samples['generic_name'] : ''),
                "product_type"  => (isset($booking_samples['product_type']) ? $booking_samples['product_type'] : ''),
                "pharmacopiea_id"   => (isset($booking_samples['pharmacopiea_id']) ? $booking_samples['pharmacopiea_id'] : 0),
                "batch_no"  => (isset($booking_samples['batch_no']) ? $booking_samples['batch_no'] : 0),
                "packsize"  => (isset($booking_samples['packsize']) ? $booking_samples['packsize'] : ''),
                "request_quantity"  => (isset($booking_samples['request_quantity']) ? $booking_samples['request_quantity'] : 0),
                "sample_code"   => (isset($booking_samples['sample_code']) ? $booking_samples['sample_code'] : ''),
                "sample_description"    => (isset($booking_samples['sample_description']) ? $booking_samples['sample_description'] : ''),
                "sample_quantity"   => (isset($booking_samples['sample_quantity']) ? $booking_samples['sample_quantity'] : 0),
                "sample_location"   => (isset($booking_samples['sample_location']) ? $booking_samples['sample_location'] : ''),
                "sample_packaging"  => (isset($booking_samples['sample_packaging']) ? $booking_samples['sample_packaging'] : ''),
                "sample_type"   => (isset($booking_samples['sample_type']) ? $booking_samples['sample_type'] : ''),
                "sampling_date_from"    => (isset($booking_samples['sampling_date_from']) ? date('Y-m-d', strtotime($booking_samples['sampling_date_from'])) : ''),
                "sampling_date_from_options"    => (isset($booking_samples['sampling_date_from_options']) ? $booking_samples['sampling_date_from_options'] : ''),
                "sampling_date_to"  => (isset($booking_samples['sampling_date_to']) ? date('Y-m-d', strtotime($booking_samples['sampling_date_to'])) : ''),
                "sampling_date_to_options"  => (isset($booking_samples['sampling_date_to_options']) ? $booking_samples['sampling_date_to_options'] : ''),
                "sample_received_through"   => (isset($booking_samples['sample_received_through']) ? $booking_samples['sample_received_through'] : ''),
                "chemist"   => (isset($booking_samples['chemist']) ? $booking_samples['chemist'] : ''),
                "sample_condition"  => (isset($booking_samples['sample_condition']) ? $booking_samples['sample_condition'] : ''),
                "is_sample_condition"   => (isset($booking_samples['is_sample_condition']) ? $booking_samples['is_sample_condition'] : ''),
                "batch_size_qty_rec"    => (isset($booking_samples['batch_size_qty_rec']) ? $booking_samples['batch_size_qty_rec'] : 0),
                "notes" => (isset($booking_samples['notes']) ? $booking_samples['notes'] : ''),
                "sample_drawn_by"   => (isset($booking_samples['sample_drawn_by']) ? $booking_samples['sample_drawn_by'] : ''),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
                "created_by"    => $loggedInUserData['logged_in_user_id'],
            ]);
        }
    }

    public function addupdateBookingTests($booking_tests, $booking_id)
    {
        if (!empty($booking_tests) || $booking_tests != NULL || $booking_tests != "") {

            $loggedInUserData = Helper::getUserData();
            $tests_count = count($booking_tests);

            if ($tests_count) {

                // Delete all old   
                // $sampledata = MstProductSample::where('mst_product_id', $product_id);
                // $sampledata->forceDelete();

                foreach ($booking_tests as $tests) {
                    if (!empty($tests['by_pass'])) {
                        if (
                            !empty($tests['parent_child']) or
                            !empty($tests['p_sr_no']) or
                            !empty($tests['parent']) or
                            !empty($tests['product_details']) or
                            !empty($tests['test_name']) or
                            !empty($tests['label_claim']) or
                            !empty($tests['min_limit']) or
                            !empty($tests['max_limit']) or
                            !empty($tests['description']) or
                            !empty($tests['amount'])
                        ) {
                            $tests_data = array(
                                "booking_id" => (isset($booking_id) ? $booking_id : 0),
                                "parent_child" => (isset($tests['parent_child']) ? $tests['parent_child'] : ''),
                                "p_sr_no" => (isset($tests['p_sr_no']) ? $tests['p_sr_no'] : ''),
                                "by_pass" => (isset($tests['by_pass']) ? $tests['by_pass'] : 0),
                                "parent" => (isset($tests['parent']) ? $tests['parent'] : 0),
                                "product_details" => (isset($tests['product_details']) ? $tests['product_details'] : ''),
                                "test_name" => (isset($tests['test_name']) ? $tests['test_name'] : ''),
                                "label_claim" => (isset($tests['label_claim']) ? $tests['label_claim'] : ''),
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
            }
        }
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
            'customer_id:id,company_name',
            'samples',
            'samples.product_id:id,product_name',
            'samples.pharmacopiea_id:id,pharmacopeia_name',
            'tests',
            'tests.parent'
        )
            ->find($id);
        $data['receipte_date'] = \Carbon\Carbon::parse($data['receipte_date'])->format('d/m/Y');
        $data['mfg_date'] = \Carbon\Carbon::parse($data['mfg_date'])->format('d/m/Y');
        $data['exp_date'] = \Carbon\Carbon::parse($data['exp_date'])->format('d/m/Y');
        $data['analysis_date'] = \Carbon\Carbon::parse($data['analysis_date'])->format('d/m/Y');
        $data['samples'][0]['sampling_date_from'] = \Carbon\Carbon::parse($data['samples'][0]['sampling_date_from'])->format('d/m/Y');
        $data['samples'][0]['sampling_date_to'] = \Carbon\Carbon::parse($data['samples'][0]['sampling_date_to'])->format('d/m/Y');


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
        //
        try {

            $rules = [
                "report_type" => "required",
                "booking_type" => "required",
                "receipte_date" => "required",
                "customer_id" => "required",
                'mfg_date'  => 'required|date',
                'exp_date'    => 'required|date_format:Y-m-d|after:mfg_date',
            ];
            $massage = [
                "report_type" => "Please select 'Report type'",
                "customer_id" => "Please select 'Customer'",
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
                "signature" => (isset($request->signature) ? $request->signature : 0),
                "verified_by"   => (isset($request->verified_by) ? $request->verified_by : ''),
                "nabl_scope"    => (isset($request->nabl_scope) ? $request->nabl_scope : 0),
                "cancel"    => (isset($request->cancel) ? $request->cancel : ''),
                "cancel_remarks"    => (isset($request->cancel_remarks) ? $request->cancel_remarks : ''),
                "priority"  => (isset($request->priority) ? $request->priority : ''),
                "discipline"    => (isset($request->discipline) ? $request->discipline : ''),
                "booking_group" => (isset($request->booking_group) ? $request->booking_group : ''),
                "statement_ofconformity"    => (isset($request->statement_ofconformity) ? $request->statement_ofconformity : ''),
                "is_active" => 1,
                "selected_year" => $loggedInUserData['selected_year'],
                "updated_by"    => $loggedInUserData['logged_in_user_id'],
            ];

            // $this->addupdateBookingSample($request->booking_sample_details, $booking_data->id);
            // $this->addupdateBookingTests($request->booking_tests, $booking_data->id);

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
     * @param  \App\Models\booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy(booking $booking)
    {
        //
    }
}
