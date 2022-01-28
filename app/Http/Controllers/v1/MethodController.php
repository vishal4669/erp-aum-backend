<?php

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Helper;
use App\Models\Method;
use App\Models\ViewMethod;
use Auth;
use Log;
use DB;
use File;

class MethodController extends Controller
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
                $data = DB::table('view_methods')
                    ->select('id', 'name', 'type', 'date', 'deleted_at');
            } else {
                $data = ViewMethod::select('id', 'mst_companies_id', 'name', 'type', 'date', 'description')
                ->where('mst_companies_id', $loggedInUserData['company_id']);
            }
            $data = $data->where('deleted_at', null)
                ->where('is_active', 1)
                ->orderBy('id', 'desc')
                ->get()
                ->each(function ($item) {
                    $item->append('pharmacopeia');
                });

            return Helper::response("Methods List Shown Successfully", Response::HTTP_OK, true, $data);
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
        try {
            $loggedInUserData = Helper::getUserData();

            $rules = [
                'name' => 'required',
                'type' => 'required',
                'description' => 'required',
                'file_1' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'file_2' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'file_3' => 'nullable|mimes:jpeg,jpg,png,pdf',
                'file_4' => 'nullable|mimes:jpeg,jpg,png,pdf'
            ];

            $messages = [];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $document = $this->addUpdateFiles($request->all());
            $data = Method::create([
                'mst_companies_id' => $loggedInUserData['company_id'],
                'name' => (isset($request->name) ? $request->name : NULL),
                'type' => (isset($request->type) ? $request->type : NULL),
                'date' => (isset($request->date) ? date('Y-m-d', strtotime($request->date)) : NULL),
                'file_1' => (isset($document['file_1']) ? $document['file_1'] : NULL),
                'file_2' => (isset($document['file_2']) ? $document['file_2'] : NULL),
                'file_3' => (isset($document['file_3']) ? $document['file_3'] : NULL),
                'file_4' => (isset($document['file_4']) ? $document['file_4'] : NULL),
                'description' => (isset($request->description) ? $request->description : NULL),
                'created_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
                'updated_at' => Null
            ]);

            DB::commit();
            Log::info("Method Created with details : " . json_encode($request->all()));
            return Helper::response("Method added Successfully", Response::HTTP_CREATED, true, $data);
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
        $files = Method::where('id', $id)->get();
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
                $file_1->move(config('constants.Method_DOCUMENTS_BASEPATH'), $file_1_name);
                $request['file_1'] = $file_1_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_1']) && $files[0]['file_1'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_1']))) {
                        File::delete(public_path('images/methods/documents/' . $files[0]['file_1']));
                    }
                }
            }
        } else {
            $request['file_1'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_1']) && $files[0]['file_1'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_1']))) {
                    File::delete(public_path('images/methods/documents/' . $files[0]['file_1']));
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
                $file_2->move(config('constants.Method_DOCUMENTS_BASEPATH'), $file_2_name);
                $request['file_2'] = $file_2_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_2']) && $files[0]['file_2'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_2']))) {
                        File::delete(public_path('images/methods/documents/' . $files[0]['file_2']));
                    }
                }
            }
        } else {
            $request['file_2'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_2']) && $files[0]['file_2'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_2']))) {
                    File::delete(public_path('images/methods/documents/' . $files[0]['file_2']));
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
                $file_3->move(config('constants.Method_DOCUMENTS_BASEPATH'), $file_3_name);
                $request['file_3'] = $file_3_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_3']) && $files[0]['file_3'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_3']))) {
                        File::delete(public_path('images/methods/documents/' . $files[0]['file_3']));
                    }
                }
            }
        } else {
            $request['file_3'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_3']) && $files[0]['file_3'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_3']))) {
                    File::delete(public_path('images/methods/documents/' . $files[0]['file_3']));
                }
            }
        }
        if (!empty($request['file_4'])) {
            $file_4 = $request['file_4'];
            if (empty($files)) {
                $check_file_4 = $file_4 !== NULL;
                //wanna add file
            } else {
                $check_file_4 = $files[0]['file_4'] !== $file_4 && $file_4 !== NULL;
                //if new file selected for file_1 or wanna update photo
            }
            if ($check_file_4) {
                $random_string = Helper::generateRandomString();
                $file_4_name = 'file_4_' . $random_string . "." . $file_4->getClientOriginalExtension();
                $file_4->move(config('constants.Method_DOCUMENTS_BASEPATH'), $file_4_name);
                $request['file_4'] = $file_4_name;

                if ($countfilesData > 0) {
                    if (isset($files[0]['file_4']) && $files[0]['file_4'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_4']))) {
                        File::delete(public_path('images/methods/documents/' . $files[0]['file_4']));
                    }
                }
            }
        } else {
            $request['file_4'] = NULL;
            if ($countfilesData > 0) {
                if (isset($files[0]['file_4']) && $files[0]['file_4'] != '' && File::exists(public_path('images/methods/documents/' . $files[0]['file_4']))) {
                    File::delete(public_path('images/methods/documents/' . $files[0]['file_4']));
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
    public function show($id)
    {
        //
        try {

            $loggedInUserData = Helper::getUserData();
            $data = ViewMethod::where('id', $id)
                ->get()
                ->each(function ($item) {
                    $item->append('pharmacopeia','pharmacopeia_dropdown');
                });


            return Helper::response("Methods List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
        
        try {
            $loggedInUserData = Helper::getUserData();
            $method = Method::find($id);
            if ($method->file_1 == $request->file_1 || $request->file_1 == null) {
                $file_1_rule = '';
            } else {
                $file_1_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($method->file_2 == $request->file_2 || $request->file_2 == null) {
                $file_2_rule = '';
            } else {
                $file_2_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($method->file_3 == $request->file_3 || $request->file_3 == null) {
                $file_3_rule = '';
            } else {
                $file_3_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($method->file_4 == $request->file_4 || $request->file_4 == null) {
                $file_4_rule = '';
            } else {
                $file_4_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }
            if ($method->file_5 == $request->file_5 || $request->file_5 == null) {
                $file_5_rule = '';
            } else {
                $file_5_rule = 'nullable|mimes:jpeg,jpg,png,pdf';
            }

            $rules = [
                'name' => 'required',
                'type' => 'required',
                'description' => 'required',
                'file_1' => $file_1_rule,
                'file_2' => $file_2_rule,
                'file_3' => $file_3_rule,
                'file_4' => $file_4_rule
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
                'name' => (isset($request->name) ? $request->name : NULL),
                'type' => (isset($request->type) ? $request->type : NULL),
                'date' => (isset($request->date) ? date('Y-m-d', strtotime($request->date)) : NULL),
                'file_1' => (isset($document['file_1']) ? $document['file_1'] : NULL),
                'file_2' => (isset($document['file_2']) ? $document['file_2'] : NULL),
                'file_3' => (isset($document['file_3']) ? $document['file_3'] : NULL),
                'file_4' => (isset($document['file_4']) ? $document['file_4'] : NULL),
                'description' => (isset($request->description) ? $request->description : NULL),
                'updated_by' => $loggedInUserData['logged_in_user_id'],
                'selected_year' => $loggedInUserData['selected_year'],
                'is_active' => 1,
            ];

            $method = Method::find($id);
            if ($method !== null) {
                $method->update($data);
            } else {
                return Helper::response("Method not exist.", Response::HTTP_OK, false);
            }
            DB::commit();
            Log::info("Method updated with details : " . json_encode($request->all()));
            return Helper::response("Method updated Successfully", Response::HTTP_CREATED, true, $data);
        } catch (Exception $e) {
            DB::rollback();
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
        //
        try {

            $loggedInUserData = Helper::getUserData();
            $data = Method::find($id);
            $files_to_remove = [$data->file_1, $data->file_2, $data->file_3, $data->file_4];
            foreach ($files_to_remove as $key => $file) {
                if (isset($file) && $file != '' && File::exists(public_path('images/methods/documents/' . $file))) {
                    File::delete(public_path('images/methods/documents/' . $file));
                }
            }
            $data->delete();

            return Helper::response("Methods Deleted Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
