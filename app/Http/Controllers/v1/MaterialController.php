<?php

namespace App\Http\Controllers\v1;

use App\Models\Material;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;

class MaterialController extends Controller
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

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if (!$is_dropdown) {
                $data = Material::select('mst_materials.*', 'u.unit_name', 'c.company_name', 'cat.category_name as parent_category_name', 'subcat.category_name as sub_category_name', 'subsubcat.category_name as sub_sub_category_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_materials.mst_companies_id')
                    ->leftjoin('mst_units as u', 'u.id', '=', 'mst_materials.mst_units_id')
                    ->leftjoin('mst_categories as cat', 'cat.id', '=', 'mst_materials.category_id')
                    ->leftjoin('mst_categories as subcat', 'subcat.id', '=', 'mst_materials.sub_category_id')
                    ->leftjoin('mst_categories as subsubcat', 'subsubcat.id', '=', 'mst_materials.sub_sub_category_id')
                    ->where('mst_materials.is_active', 1)
                    ->where('mst_materials.selected_year', $loggedInUserData['selected_year'])
                    ->orderBy('mst_materials.id', 'desc')
                    ->paginate(10);
            } else {
                $data = Material::select('mst_materials.*', 'c.company_name', 'u.unit_name', 'cat.category_name as parent_category_name', 'subcat.category_name as sub_category_name', 'subsubcat.category_name as sub_sub_category_name')
                    ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_materials.mst_companies_id')
                    ->leftjoin('mst_units as u', 'u.id', '=', 'mst_materials.mst_units_id')
                    ->leftjoin('mst_categories as cat', 'cat.id', '=', 'mst_materials.category_id')
                    ->leftjoin('mst_categories as subcat', 'subcat.id', '=', 'mst_materials.sub_category_id')
                    ->leftjoin('mst_categories as subsubcat', 'subsubcat.id', '=', 'mst_materials.sub_sub_category_id')
                    ->where('mst_materials.is_active', 1)
                    ->orderBy('mst_materials.id', 'desc')
                    ->get();
            }
            $data_arr = $data->toarray();
            if ((isset($data_arr["total"])) && $data_arr["total"] == 0) {
                return Helper::response("Materials List is Empty", Response::HTTP_OK, true, $data);
            } else {
                return Helper::response("Materials list shown successfully", Response::HTTP_OK, true, $data);
            }
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

            $rules = [
                'material_type' => 'required|max:25',
                'material_name' => 'required|max:255',
                'material_purchase_rate' => 'required|numeric|max:999999',
                'material_code' => 'required',
                'category_id' => 'required',
                'material_rate' => 'required|numeric|max:9999999',
                'material_amount' => 'required|numeric|max:999999999999',
                'material_qty' => 'required|numeric',
            ];

            $messages = [
                'material_type.required' => 'Material Type field is required.',
                'material_name.required' => 'Material Name field is required.',
                'material_name.max' => 'Material Name should not me greater than 255 characters.',
                'material_purchase_rate.required' => 'Material Purchase Rate field is required.',
                'material_purchase_rate.numeric' => 'Material Purchase Rate should be a numeric value.',
                'material_purchase_rate.max' => 'Material Purchase Rate should be lower than 9999999.',
                'material_code.required' => 'Material Code field is required.',
                'material_rate.required' => 'Material Rate field is required.',
                'material_rate.numeric' => 'Material Rate should be a numeric value.',
                'material_rate.max' => 'Material Rate should be lower than 9999999.',
                'category_id.required' => 'Category field is required.',
                'material_amount.required' => 'Material Amount field is required.',
                'material_amount.numeric' => 'Material Amount should be a numeric value.',
                'material_amount.max' => 'Material Amount should be lower than 999999999999.',
                'material_qty.required' => 'Material Quantity field is required.',
                'material_qty.numeric' => 'Material Quantity should be a numeric value.',
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['material_type'] = $input['material_type'];
            $input_data['material_name'] = $input['material_name'];
            $input_data['material_purchase_rate'] = $input['material_purchase_rate'];
            $input_data['material_code'] = $input['material_code'];
            $input_data['category_id'] = $input['category_id'];
            $input_data['sub_category_id'] = $input['sub_category_id'];
            $input_data['sub_sub_category_id'] = $input['sub_sub_category_id'];
            $input_data['material_rate'] = $input['material_rate'];
            $input_data['material_amount'] = $input['material_amount'];
            $input_data['material_qty'] = $input['material_qty'];
            $input_data['mst_units_id'] = $input['mst_units_id'];
            $input_data['material_use_before_date'] = $input['material_use_before_date'];
            $input_data['material_case_number'] = $input['material_case_number'];
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];
            $input_data['selected_year'] = $loggedInUserData['selected_year'];
            $input_data['is_active'] = 1;

            Log::info("Material created with details : " . json_encode($input_data));

            $data = Material::create($input_data);
            return Helper::response("Material added successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Material  $material
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        Log::Info("Fetch material info :" . json_encode(array('id' => $id)));
        try {
            $materialData = Material::select('mst_materials.*', 'c.company_name', 'u.unit_name', 'cat.category_name as parent_category_name', 'subcat.category_name as sub_category_name', 'subsubcat.category_name as sub_sub_category_name')
                ->leftjoin('mst_companies as c', 'c.id', '=', 'mst_materials.mst_companies_id')->where('mst_materials.id', $id)
                ->leftjoin('mst_units as u', 'u.id', '=', 'mst_materials.mst_units_id')
                ->leftjoin('mst_categories as cat', 'cat.id', '=', 'mst_materials.category_id')
                ->leftjoin('mst_categories as subcat', 'subcat.id', '=', 'mst_materials.sub_category_id')
                ->leftjoin('mst_categories as subsubcat', 'subsubcat.id', '=', 'mst_materials.sub_sub_category_id')
                ->first();

            // if statement required here to send Material data not available

            return Helper::response("Material Data Shown Successfully", Response::HTTP_OK, true, $materialData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Material  $material
     * @return \Illuminate\Http\Response
     */
    public function edit(Material $material)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Material  $material
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $rules = [
                'material_type' => 'required|max:25',
                'material_name' => 'required|max:255',
                'material_purchase_rate' => 'required|numeric|max:999999',
                'material_code' => 'required',
                'category_id' => 'required',
                'material_rate' => 'required|numeric|max:9999999',
                'material_amount' => 'required|numeric|max:999999999999',
                'material_qty' => 'required|numeric',
            ];

            $messages = [
                'material_type.required' => 'Material Type field is required.',
                'material_name.required' => 'Material Name field is required.',
                'material_name.max' => 'Material Name should not me greater than 255 characters.',
                'material_purchase_rate.required' => 'Material Purchase Rate field is required.',
                'material_purchase_rate.numeric' => 'Material Purchase Rate should be a numeric value.',
                'material_purchase_rate.max' => 'Material Purchase Rate should be lower than 9999999.',
                'material_code.required' => 'Material Code field is required.',
                'material_rate.required' => 'Material Rate field is required.',
                'material_rate.numeric' => 'Material Rate should be a numeric value.',
                'material_rate.max' => 'Material Rate should be lower than 9999999.',
                'category_id.required' => 'Category field is required.',
                'material_amount.required' => 'Material Amount field is required.',
                'material_amount.numeric' => 'Material Amount should be a numeric value.',
                'material_amount.max' => 'Material Amount should be lower than 999999999999.',
                'material_qty.required' => 'Material Quantity field is required.',
                'material_qty.numeric' => 'Material Quantity should be a numeric value.',
            ];

            $validator = Validator::make($request->all(), $rules, $messages);

            if ($validator->fails()) {
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['material_type'] = $input['material_type'];
            $input_data['material_name'] = $input['material_name'];
            $input_data['material_purchase_rate'] = $input['material_purchase_rate'];
            $input_data['material_code'] = $input['material_code'];
            $input_data['category_id'] = $input['category_id'];
            $input_data['sub_category_id'] = $input['sub_category_id'];
            $input_data['sub_sub_category_id'] = $input['sub_sub_category_id'];
            $input_data['material_rate'] = $input['material_rate'];
            $input_data['material_amount'] = $input['material_amount'];
            $input_data['material_qty'] = $input['material_qty'];
            $input_data['mst_units_id'] = $input['mst_units_id'];
            $input_data['material_use_before_date'] = $input['material_use_before_date'];
            $input_data['material_case_number'] = $input['material_case_number'];
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Material updated with details : " . json_encode(array('data' => $input_data, 'id' => $id)));

            $material = Material::find($id);
            $material->update($input_data);

            return Helper::response("Material updated successfully", Response::HTTP_OK, true, $material);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Material  $material
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $data = array();
            $material = Material::find($id);

            Log::info("Material deleted with : " . json_encode(array('id' => $id)));

            if (!empty($material)) {
                $material->delete();
                return Helper::response("Material deleted successfully", Response::HTTP_OK, true, $data);
            }

            return Helper::response("Material does not exist", Response::HTTP_NOT_FOUND, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"), $e->getStatusCode(), false, $data);
        }
    }
}
