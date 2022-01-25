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
use DB;
use Log;


class QuotationController extends Controller
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
    public function show(Quotation $quotation,$id)
    {
        //
        try {
                $data = ViewQuotation::with('quotationProductInfo')->where('id',$id)->get();
            return Helper::response("Quotation List Shown Successfully", Response::HTTP_OK, true, $data);
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
    public function update(Request $request,$id)
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
    public function destroy(Quotation $quotation)
    {
        //
    }
}
