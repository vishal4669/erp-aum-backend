<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class CategoryController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $is_dropdown = (isset($request->is_dropdown)) ? $request->is_dropdown : false;

            if(!$is_dropdown){
                $data = Category::select('mst_categories.*', 'c.category_name as parent_name')
                        ->leftjoin('mst_categories as c', 'c.id', '=', 'mst_categories.parent_category_id')
                        ->where('mst_categories.is_active',1)
                        ->where('mst_categories.selected_year', $loggedInUserData['selected_year'])
                        ->orderBy('mst_categories.id', 'desc')
                        ->get();
            } else {
                $data = Category::select('mst_categories.*', 'c.category_name as parent_name')
                        ->leftjoin('mst_categories as c', 'c.id', '=', 'mst_categories.parent_category_id')
                        ->where('mst_categories.is_active',1)
                        ->orderBy('mst_categories.id', 'desc')
                        ->get();
            }

            
            return Helper::response("Category List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
        
    }

    /**
     * Display a listing of the resource parents.
     *
     * @return \Illuminate\Http\Response
     */

    public function listParentCategories(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Category::where('is_active',1)->where('parent_category_id', 0)->get();
            return Helper::response("Parent Category List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }        
    }

    public function listSubCategories($id)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Category::where('is_active',1)->where('parent_category_id', $id)->get();
            return Helper::response("Sub Category List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }        
    }

    public function listSubSubCategories($id)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Category::where('is_active',1)->where('parent_category_id', $id)->get();
            return Helper::response("Sub Sub Category List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{

            $rules = [
                'category_name' => 'required|max:255'
            ];

            $messages = [
                'category_name.required' => 'The Category Name field is required',
                'category_name.max' => 'The Category Name must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['category_name'] = $input['category_name'];  
            $input_data['parent_category_id'] = $input['parent_category_id'];  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Category Created with details : ".json_encode($input_data));

            $data = Category::create($input_data);
            return Helper::response("Category Added Successfully", Response::HTTP_OK, true, $data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        Log::info("Fetch Category details : ".json_encode(array('id' => $id)));
        try{
            $companyData = Category::find($id);
            return Helper::response("Category Data Shown Successfully", Response::HTTP_OK, true, $companyData);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{

            $rules = [
                'category_name' => 'required|max:255'
            ];

            $messages = [
                'category_name.required' => 'The Category Name field is required',
                'category_name.max' => 'The Category Name must be less than or equal to 255 characters'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['category_name'] = $input['category_name'];  
            $input_data['parent_category_id'] = $input['parent_category_id']; 
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Category updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $category = Category::find($id);
            $category->update($input_data);

            return Helper::response("Category updated successfully", Response::HTTP_OK, true, $category); 
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
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
        try{
            $data = array();
            $category = Category::find($id);

            Log::info("Category deleted with : ".json_encode(array('id' => $id)));

            if(!empty($category)){
                $category->delete();
                return Helper::response("Category deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Category not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}

