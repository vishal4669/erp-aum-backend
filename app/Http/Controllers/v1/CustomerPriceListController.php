<?php

namespace App\Http\Controllers\v1;

use App\Models\CustomerPriceList;
use App\Models\CustomerRateList;
use App\Models\ModelViews\ViewCustomerPriceList;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Helper;
use Log;
use DB;
use File;

class CustomerPriceListController extends Controller
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
        try {
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'customer_id' => 'required',
                'file_1' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'file_2' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'file_3' => 'nullable|mimes:jpeg,jpg,png,pdf',
            ];

            $messages = [];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $document = $this->addUpdateFiles($request->all());
            $data = CustomerPriceList::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'customer_id' => (isset($request->customer_id) ? $request->customer_id : NULL),
                'file_1' => (isset($document['file_1']) ? $document['file_1'] : NULL),
                'file_2' => (isset($document['file_2']) ? $document['file_2'] : NULL),
                'file_3' => (isset($document['file_3']) ? $document['file_3'] : NULL),
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'updated_at' => Null
            ]);
            // dd(!empty($request->customer_rate_list));
            if (!empty($request->customer_rate_list)) {
                $this->addUpdateCustomerRateList($request->customer_rate_list, $data->id);
            }
            DB::commit();
            Log::info("Customer PriceList Created with details : " . json_encode($request->all()));
            return Helper::response("Customer PriceList added Successfully", Response::HTTP_CREATED, true, $data);
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
    public function addUpdateFiles($request, $id = '')
    {
        //
        $files = CustomerPriceList::where('id', $id)->get();
        $countfilesData = $files->count();

        $files = $files->toarray();
        if (!empty($request['file_1'])) {
            $file_1 = $request['file_1'];
            if (empty($files)) {
                $check_file_1 = $file_1 !== NULL;
                //wanna add file
            } else {
                $check_file_1 = $files[0]['file_1'] !== $file_1 && $file_1 !== NULL;
                //if new file selected for file_1 or wanna update photo
            }
            if ($check_file_1) {
                //if new file selected for file_1 or wanna addupdate photo
                $random_string = Helper::generateRandomString();
                $file_1_name = 'file_1_' . $random_string . "." . $file_1->getClientOriginalExtension();
                $file_1->move(config('constants.CustomerPriceList_DOCUMENTS_BASEPATH'), $file_1_name);
                $request['file_1'] = $file_1_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_1']) && $files[0]['file_1'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_1']))) {
                        File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_1']));
                    }
                }
            }
        } else {
            $request['file_1'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_1']) && $files[0]['file_1'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_1']))) {
                    File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_1']));
                }
            }
        }
        if (!empty($request['file_2'])) {
            $file_2 = $request['file_2'];
            if (empty($files)) {
                $check_file_2 = $file_2 !== NULL;
                //wanna add file
            } else {
                $check_file_2 = $files[0]['file_2'] !== $file_2 && $file_2 !== NULL;
                //if new file selected for file_1 or wanna update photo
            }
            if ($check_file_2) {
                $random_string = Helper::generateRandomString();
                $file_2_name = 'file_2_' . $random_string . "." . $file_2->getClientOriginalExtension();
                $file_2->move(config('constants.CustomerPriceList_DOCUMENTS_BASEPATH'), $file_2_name);
                $request['file_2'] = $file_2_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_2']) && $files[0]['file_2'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_2']))) {
                        File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_2']));
                    }
                }
            }
        } else {
            $request['file_2'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_2']) && $files[0]['file_2'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_2']))) {
                    File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_2']));
                }
            }
        }
        if (!empty($request['file_3'])) {
            $file_3 = $request['file_3'];
            if (empty($files)) {
                $check_file_3 = $file_3 !== NULL;
                //wanna add file
            } else {
                $check_file_3 = $files[0]['file_3'] !== $file_3 && $file_3 !== NULL;
                //if new file selected for file_1 or wanna update photo
            }
            if ($check_file_3) {
                $random_string = Helper::generateRandomString();
                $file_3_name = 'file_3_' . $random_string . "." . $file_3->getClientOriginalExtension();
                $file_3->move(config('constants.CustomerPriceList_DOCUMENTS_BASEPATH'), $file_3_name);
                $request['file_3'] = $file_3_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_3']) && $files[0]['file_3'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_3']))) {
                        File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_3']));
                    }
                }
            }
        } else {
            $request['file_3'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_3']) && $files[0]['file_3'] != '' && File::exists(public_path('/images/customer_price_list/documents/' . $files[0]['file_3']))) {
                    File::delete(public_path('/images/customer_price_list/documents/' . $files[0]['file_3']));
                }
            }
        }

        return $request;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function addUpdateCustomerRateList($data, $id)
    {
        //
        $already_exist = CustomerRateList::where('customer_price_list', $id);
        $already_exist->forceDelete();

        foreach ($data as $item) {
            if (
                !empty($item['product_id']) or
                !empty($item['parent_id']) or
                !empty($item['test_id']) or
                !empty($item['rate'])
            ) {
                $loggedInUserData = Helper::getUserData();
                Log::info("Customer Rate List : " . json_encode($item));
                $data = [
                    'mst_companies_id' => $loggedInUserData['company_id'],
                    'customer_price_list' => $id,
                    "product_id" => $item['product_id'],
                    "parent_id" => $item['parent_id'],
                    "test_id" => $item['test_id'],
                    "rate" => $item['rate'],
                    'created_by' => $loggedInUserData['logged_in_user_id'],
                    'updated_by' => $loggedInUserData['logged_in_user_id'],
                    'selected_year' => $loggedInUserData['selected_year'],
                    'is_active' => 1,
                ];

                CustomerRateList::create($data);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomerPriceList  $customerPriceList
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        Log::info("Fetch Customer Price List details : " . json_encode(array('id' => $id)));
        try {
            $data = ViewCustomerPriceList::where('id', $id)
                ->where('is_active', 1)
                ->where('deleted_at', null)
                ->get()
                ->each(function ($item) {
                    $item->append('customer_dropdown');
                })->toarray();

            return Helper::response("Customer Price List Data Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CustomerPriceList  $customerPriceList
     * @return \Illuminate\Http\Response
     */
    public function edit(CustomerPriceList $customerPriceList)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CustomerPriceList  $customerPriceList
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CustomerPriceList $customerPriceList, $id)
    {
        //
        try {

            $loggedInUserData = Helper::getUserData();
            $customerpricelist = CustomerPriceList::find($id);
            if ($customerpricelist->file_1 == $request->file_1 || $request->file_1 == null) {
                $file_1_rule = '';
            } else {
                $file_1_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($customerpricelist->file_2 == $request->file_2 || $request->file_2 == null) {
                $file_2_rule = '';
            } else {
                $file_2_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($customerpricelist->file_3 == $request->file_3 || $request->file_3 == null) {
                $file_3_rule = '';
            } else {
                $file_3_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            $rules = [
                'customer_id' => 'required',
                'file_1' => $file_1_rule,
                'file_2' => $file_2_rule,
                'file_3' => $file_3_rule,
            ];

            $messages = [];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }
            //callback function to handle files
            $document = $this->addUpdateFiles($request->all(), $id);
            $data = [
                'mst_companies_id' => $loggedInUserData['company_id'],
                'customer_id' => (isset($request->customer_id) ? $request->customer_id : NULL),
                'file_1' => (isset($document['file_1']) ? $document['file_1'] : NULL),
                'file_2' => (isset($document['file_2']) ? $document['file_2'] : NULL),
                'file_3' => (isset($document['file_3']) ? $document['file_3'] : NULL),
                'updated_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'updated_at' => Null
            ];
            if (!empty($request->customer_rate_list)) {
                $this->addUpdateCustomerRateList($request->customer_rate_list, $id);
            }
            if ($customerpricelist !== null) {
                $customerpricelist->update($data);
            } else {
                return Helper::response("Customer Price List not exist.", Response::HTTP_OK, false);
            }
            DB::commit();
            Log::info("Customer Price List updated with details : " . json_encode($request->all()));
            return Helper::response("Customer Price List updated Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomerPriceList  $customerPriceList
     * @return \Illuminate\Http\Response
     */
    public function destroy(CustomerPriceList $customerPriceList)
    {
        //
    }
}
