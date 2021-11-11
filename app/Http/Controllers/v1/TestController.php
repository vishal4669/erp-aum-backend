<?php    

namespace App\Http\Controllers\v1;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use App\Models\Test;
use App\Helpers\Helper;
use Auth;
use Log;
use Illuminate\Support\Facades\Validator;
    

class TestController extends Controller
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
                $data = Test::select('mst_tests.*', 't.procedure_name as parent_name')
                        ->leftjoin('mst_tests as t', 't.id', '=', 'mst_tests.parent_id')
                        ->where('mst_tests.is_active',1)
                        ->where('mst_tests.selected_year', $loggedInUserData['selected_year'])
                        ->where('mst_tests.mst_companies_id', $loggedInUserData['company_id'])
                        ->orderBy('mst_tests.id', 'desc')
                        ->get();
            } else {
                $data = Test::select('mst_tests.*', 'c.category_name as parent_name')
                        ->leftjoin('mst_tests as c', 'c.id', '=', 'mst_tests.parent_id')
                        ->where('mst_tests.is_active',1)
                        ->orderBy('mst_tests.id', 'desc')
                        ->get();
            }

            
            return Helper::response("Test List Shown Successfully", Response::HTTP_OK, true, $data);
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

    public function listParentTests(Request $request)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Test::where('is_active',1)->where('parent_id', 0)->get();
            return Helper::response("Parent Test List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }        
    }

    public function listSubTests($id)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Test::where('is_active',1)->where('parent_id', $id)->get();
            return Helper::response("Sub Test List Shown Successfully", Response::HTTP_OK, true, $data);
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }        
    }

    public function listSubSubTests($id)
    {
        try{
            $loggedInUserData = Helper::getUserData();

            $data = Test::where('is_active',1)->where('parent_id', $id)->get();
            return Helper::response("Sub Sub Test List Shown Successfully", Response::HTTP_OK, true, $data);
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
                'procedure_name' => 'required|max:255',
                'price' => 'required',
                'test_code' => 'required|max:50',
                'test_category' => 'required|max:255',
                'test_procedure' => 'required'
            ];

            $messages = [
                'procedure_name.required' => 'The Procedure Name field is required',
                'procedure_name.max' => 'The Test Procedure Name must be less than or equal to 255 characters',
                'price.required' => 'The Test Price field is required',                
                'test_code.required' => 'The Test Code field is required',
                'test_code.max' => 'The Test Code must be less than or equal to 50 characters',
                'test_category.required' => 'The Test Category field is required',
                'test_category.max' => 'The Test Category must be less than or equal to 255 characters',
                'test_procedure.required' => 'The Test Procedure field is required'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['procedure_name'] = $input['procedure_name'];  
            $input_data['price'] = $input['price'];  
            $input_data['test_code'] = $input['test_code'];  
            $input_data['test_category'] = $input['test_category'];  
            $input_data['test_procedure'] = $input['test_procedure'];  
            $input_data['parent_id'] = (isset($input['parent_id']) && $input['parent_id']!='' && $input['parent_id']!=null) ? $input['parent_id'] : 0;  
            $input_data['selected_year'] = $loggedInUserData['selected_year'];  
            $input_data['mst_companies_id'] = $loggedInUserData['company_id'];
            $input_data['is_active'] = 1;  
            $input_data['created_by'] = $loggedInUserData['logged_in_user_id'];

            Log::info("Test Created with details : ".json_encode($input_data));

            $data = Test::create($input_data);
            return Helper::response("Test Added Successfully", Response::HTTP_OK, true, $data);  
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
        Log::info("Fetch Test details : ".json_encode(array('id' => $id)));
        try{
            $testData = Test::find($id);
            return Helper::response("Test Data Shown Successfully", Response::HTTP_OK, true, $testData);
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
                'procedure_name' => 'required|max:255',
                'price' => 'required',
                'test_code' => 'required|max:50',
                'test_category' => 'required|max:255',
                'test_procedure' => 'required'
            ];

            $messages = [
                'procedure_name.required' => 'The Procedure Name field is required',
                'procedure_name.max' => 'The Test Procedure Name must be less than or equal to 255 characters',
                'price.required' => 'The Test Price field is required',                
                'test_code.required' => 'The Test Code field is required',
                'test_code.max' => 'The Test Code must be less than or equal to 50 characters',
                'test_category.required' => 'The Test Category field is required',
                'test_category.max' => 'The Test Category must be less than or equal to 255 characters',
                'test_procedure.required' => 'The Test Procedure field is required'
            ];

            $validator = Validator::make( $request->all(), $rules, $messages );


            if($validator->fails()){
                $data = array();
                return Helper::response($validator->errors()->all(), Response::HTTP_OK, false, $data);
            }

            $loggedInUserData = Helper::getUserData();

            $input = $request->all();
            $input_data['procedure_name'] = $input['procedure_name'];  
            $input_data['price'] = $input['price'];  
            $input_data['test_code'] = $input['test_code'];  
            $input_data['test_category'] = $input['test_category'];  
            $input_data['test_procedure'] = $input['test_procedure'];  
            $input_data['parent_id'] = (isset($input['parent_id']) && $input['parent_id']!='' && $input['parent_id']!=null) ? $input['parent_id'] : 0;  
            $input_data['updated_by'] = $loggedInUserData['logged_in_user_id']; 

            Log::info("Category updated with details : ".json_encode(array('data' => $input_data, 'id' => $id)));

            $test = Test::find($id);
            $test->update($input_data);

            return Helper::response("Test updated successfully", Response::HTTP_OK, true, $test); 
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
            $test = Test::find($id);

            Log::info("Test deleted with : ".json_encode(array('id' => $id)));

            if(!empty($test)){
                $test->delete();
                return Helper::response("Test deleted successfully", Response::HTTP_OK, true, $data); 
            }  

            return Helper::response("Test not exists", Response::HTTP_NOT_FOUND,true,$data);  
        } catch (Exception $e) {
            $data = array();
            return Helper::response(trans("message.something_went_wrong"),$e->getStatusCode(),false,$data);
        }  
    }

}
