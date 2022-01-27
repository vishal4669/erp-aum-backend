<?php

namespace App\Http\Controllers\v1;

use App\Models\Quotation;
use App\Models\QuotationProductInfo;
use App\Models\ModelViews\ViewQuotation;
use App\Models\ModelViews\ViewQuotationProductInfo;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Helper;
use App\Models\ViewProductSamples;
use DB;
use Log;
use Carbon\Carbon;


class QuotationController extends Controller
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
            if ($is_dropdown) {
                $data = ViewQuotation::select(
                    'id',
                    'quotation_no',
                    "company_name",
                    "is_active",
                    "deleted_at"
                )->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->orderBy('id', 'desc')
                    ->get();
            } else {
                $data = ViewQuotation::select(
                    "id",
                    "mst_companies_id",
                    "quotation_no",
                    "type",
                    "customer_id",
                    "company_name",
                    "subject",
                    "quotation_date",
                    "valid_until",
                    "payment_terms",
                    "product_info_grand_total",
                    "is_active",
                    "deleted_at"
                )
                    ->where('is_active', 1)
                    ->where('deleted_at', NULL)
                    ->where('mst_companies_id', $loggedInUserData['company_id'])
                    ->orderBy('id', 'desc')
                    ->get();
            }

            if ($data->isEmpty()) {

                return Helper::response("Quotation List is Empty", Response::HTTP_OK, true, $data);
            } else {

                return Helper::response("Quotation List Shown Successfully", Response::HTTP_OK, true, $data);
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
        //
        DB::beginTransaction();
        try {
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'quotation_no' => 'required',
                'customer_id' => 'required:max',
                'subject' => 'required|max:255',
                'quotation_date' => 'required|date',
                'valid_until' => 'required|date|after:quotation_date',
                'turn_around_time' => 'required|max:155',
                'currency_type' => 'required|max:25'
            ];

            $messages = [
                'valid_until.after' => "The Valid Until Date Must Be A Date After Quotation Date."
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            $data = Quotation::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'quotation_no' => (isset($request->quotation_no) ? $request->quotation_no : NULL),
                'type' => (isset($request->type) ? $request->type : NULL),
                'customer_id' => (isset($request->customer_id) ? $request->customer_id : NULL),
                'subject' => (isset($request->subject) ? $request->subject : NULL),
                'quotation_date' => (isset($request->quotation_date) ? $request->quotation_date : NULL),
                'valid_until' => (isset($request->valid_until) ? $request->valid_until : NULL),
                'status' => (isset($request->status) ? $request->status : NULL),
                'kind_attention' => (isset($request->kind_attention) ? $request->kind_attention : NULL),
                'turn_around_time' => (isset($request->turn_around_time) ? $request->turn_around_time : NULL),
                'remarks' => (isset($request->remarks) ? $request->remarks : NULL),
                'currency_type' => (isset($request->currency_type) ? $request->currency_type : NULL),
                'grand_total' => (isset($request->grand_total) ? $request->grand_total : NULL),
                'payment_terms' => (isset($request->payment_terms) ? $request->payment_terms : NULL),
                'product_info_grand_total' => (isset($request->product_info_grand_total) ? $request->product_info_grand_total : NULL),
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'updated_at' => Null
            ]);
            if (isset($request->quotation_product_info)) {
                $this->quotationInfo($request->quotation_product_info, $data->id);
            }
            DB::commit();
            Log::info("Quotation Created with details : " . json_encode($request->all()));

            return Helper::response("Quotation added Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function quotationInfo($quotation_product_info, $id)
    {
        //
        if (!empty($quotation_product_info)) {

            // Delete all old
            $old_quotation = QuotationProductInfo::where('quotation_id', $id);
            $old_quotation->forceDelete();

            $loggedInUserData = Helper::getUserData();
            foreach ($quotation_product_info as $quotation) {
                if (
                    !empty($quotation['sample_name']) or
                    !empty($quotation['test_required']) or
                    !empty($quotation['method_technique']) or
                    !empty($quotation['sample_qty']) or
                    !empty($quotation['first_sample']) or
                    !empty($quotation['sample_in_row']) or
                    !empty($quotation['sample_preperation']) or
                    !empty($quotation['total']) or
                    !empty($quotation['remark'])
                ) {
                    Log::info("Single Quotation Data : " . json_encode($quotation));
                    $quotation_arr = [
                        'mst_companies_id' => $loggedInUserData['company_id'],
                        'quotation_id' => (isset($id) ? $id : NULL),
                        'sample_name' => (isset($quotation["sample_name"]) ? $quotation["sample_name"] : NULL),
                        'test_required' => (isset($quotation["test_required"]) ? $quotation["test_required"] : NULL),
                        'method_technique' => (isset($quotation["method_technique"]) ? $quotation["method_technique"] : NULL),
                        'sample_qty' => (isset($quotation["sample_qty"]) ? $quotation["sample_qty"] : NULL),
                        'first_sample' => (isset($quotation["first_sample"]) ? $quotation["first_sample"] : NULL),
                        'sample_in_row' => (isset($quotation["sample_in_row"]) ? $quotation["sample_in_row"] : NULL),
                        'sample_preperation' => (isset($quotation["sample_preperation"]) ? $quotation["sample_preperation"] : NULL),
                        'total' => (isset($quotation["total"]) ? $quotation["total"] : NULL),
                        'remark' => (isset($quotation["remark"]) ? $quotation["remark"] : NULL),
                        'selected_year' => $loggedInUserData['selected_year'],
                        'created_by' => $loggedInUserData['logged_in_user_id'],
                        'updated_by' => $loggedInUserData['logged_in_user_id'],
                        'is_active' => 1,
                    ];
                    QuotationProductInfo::create($quotation_arr);
                }
            }
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function show(Quotation $quotation, $id)
    {
        //
        try {
            $data = ViewQuotation::with('quotationProductInfo')->where('id', $id)
                ->get()->each(function ($item) {
                    $item->append('customer_dropdown');
                })->toarray();
            return Helper::response("Quotation List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Generating New Quotation Number.
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function generateQuotationNo()
    {
        //
        try {
            $getLastQuotationNo = ViewQuotation::select('id', 'quotation_no')
                ->orderBy('id', 'desc')
                ->limit(1)->get();
            $current_month = Carbon::now()->format('M');
            $current_year = Carbon::now()->format('y');

            if ($getLastQuotationNo->isNotempty()) {
                //if min one quotation no already exist then we need to increment number by 1
                $quotation_no = $getLastQuotationNo[0]->quotation_no;
                $old_number_partition = explode('/', $quotation_no);

                if ($old_number_partition[1] != strtoupper($current_month)  || $old_number_partition[2] != $current_year || $quotation_no == "" || $quotation_no == null) {
                    //On newyear and on new month starts then quotation number should start with 1 
                    $quotation_no = "SAL/" . strtoupper($current_month) . "/" . $current_year . "/1";
                } else {
                    //if last inserted quotation no had same month & year as current month and year then number should incremnt by 1
                    $new_number = intval($old_number_partition[3]) + 1;
                    $quotation_no = "SAL/" . strtoupper($current_month) . "/" . $current_year . "/" . $new_number;
                }
            } else {
                //if this is a first entry in quotation table then number set to 1
                $quotation_no = "SAL/" . strtoupper($current_month) . "/" . $current_year . "/1";
            }
            return Helper::response("Quotation No. Generated Successfully", Response::HTTP_OK, true, $quotation_no);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
    /**
     * Fetching Product-Samples Of Selected (Quotation Product-Infos Sample Name(Product)).
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function getProductSamples($id)
    {
        //
        try {
            $data = ViewProductSamples::select('id', 'mst_product_id', 'mst_sample_parameter_id', 'parameter_name', 'amount', 'method', 'method_name')->where('mst_product_id', $id)->get();
            return Helper::response("Product Samples Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function edit(Quotation $quotation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        DB::beginTransaction();
        try {
            $quotation = Quotation::find($id);
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'quotation_no' => 'required',
                'customer_id' => 'required:max',
                'subject' => 'required|max:255',
                'quotation_date' => 'required|date',
                'valid_until' => 'required|date|after:quotation_date',
                'turn_around_time' => 'required|max:155',
                'currency_type' => 'required|max:25'
            ];

            $messages = [
                'valid_until.after' => "The Valid Until Date Must Be A Date After Quotation Date."
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $data = [
                'mst_companies_id' => $loggedInUserData['company_id'],
                'quotation_no' => (isset($request->quotation_no) ? $request->quotation_no : NULL),
                'type' => (isset($request->type) ? $request->type : NULL),
                'customer_id' => (isset($request->customer_id) ? $request->customer_id : NULL),
                'subject' => (isset($request->subject) ? $request->subject : NULL),
                'quotation_date' => (isset($request->quotation_date) ? $request->quotation_date : NULL),
                'valid_until' => (isset($request->valid_until) ? $request->valid_until : NULL),
                'status' => (isset($request->status) ? $request->status : NULL),
                'kind_attention' => (isset($request->kind_attention) ? $request->kind_attention : NULL),
                'turn_around_time' => (isset($request->turn_around_time) ? $request->turn_around_time : NULL),
                'remarks' => (isset($request->remarks) ? $request->remarks : NULL),
                'currency_type' => (isset($request->currency_type) ? $request->currency_type : NULL),
                'grand_total' => (isset($request->grand_total) ? $request->grand_total : NULL),
                'payment_terms' => (isset($request->payment_terms) ? $request->payment_terms : NULL),
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'updated_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
            ];
            if (isset($request->quotation_product_info)) {
                $this->quotationInfo($request->quotation_product_info, $id);
            }

            $quotation->update($data);

            DB::commit();
            Log::info("Quotation Updated with details : " . json_encode($request->all()));

            return Helper::response("Quotation Updated Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Quotation  $quotation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Quotation $quotation,$id)
    {
        //
        try {
            $data = array();
            $quotation = Quotation::find($id);
            $quotationProductInfo = QuotationProductInfo::where('quotation_id', $id);
            Log::info("Quotation deleted with : " . json_encode(array('id' => $id)));

            if (!empty($quotation)) {
                $quotation->delete();
                if (!empty($quotationProductInfo)) {
                    $quotationProductInfo->delete();
                }
                return Helper::response("Quotation deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Quotation not exists", Response::HTTP_NOT_FOUND, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
