<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'], function () {


    Route::post('register', 'App\Http\Controllers\v1\UserController@register');
    Route::post('login', 'App\Http\Controllers\v1\UserController@authenticate');
    Route::post('logout', 'App\Http\Controllers\v1\UserController@logout');
    Route::get('open', 'App\Http\Controllers\v1\DataController@open');
});


Route::group(['middleware' => ['jwt.verify'], 'prefix' => 'v1'], function () {

    Route::get('user', 'App\Http\Controllers\v1\UserController@getAuthenticatedUser');
    Route::get('closed', 'App\Http\Controllers\v1\DataController@closed');

    // Employee Masters
    //Route::resource('company', 'App\Http\Controllers\v1\CompanyController');
    Route::get('listEmployee', 'App\Http\Controllers\v1\EmployeeController@index');
    Route::post('addEmployee', 'App\Http\Controllers\v1\EmployeeController@store');
    Route::get('getEmployee/{id}', 'App\Http\Controllers\v1\EmployeeController@show');
    Route::post('editEmployee/{id}', 'App\Http\Controllers\v1\EmployeeController@update');
    Route::post('deleteEmployee/{id}', 'App\Http\Controllers\v1\EmployeeController@destroy');

    // Customer Masters
    Route::get('listCustomer', 'App\Http\Controllers\v1\CustomerController@index');
    Route::get('exportCustomerData', 'App\Http\Controllers\v1\CustomerController@export_customer_data');
    Route::post('addCustomer', 'App\Http\Controllers\v1\CustomerController@store');
    Route::get('getCustomer/{id}', 'App\Http\Controllers\v1\CustomerController@show');
    Route::post('editCustomer/{id}', 'App\Http\Controllers\v1\CustomerController@update');
    Route::post('deleteCustomer/{id}', 'App\Http\Controllers\v1\CustomerController@destroy');

    // Company Masters
    Route::get('listCompany', 'App\Http\Controllers\v1\CompanyController@index');
    Route::post('addCompany', 'App\Http\Controllers\v1\CompanyController@store');
    Route::get('getCompany/{id}', 'App\Http\Controllers\v1\CompanyController@show');
    Route::post('editCompany/{id}', 'App\Http\Controllers\v1\CompanyController@update');
    Route::post('deleteCompany/{id}', 'App\Http\Controllers\v1\CompanyController@destroy');

    // Group Masters
    Route::get('listGroup', 'App\Http\Controllers\v1\GroupController@index');
    Route::get('listParentGroup', 'App\Http\Controllers\v1\GroupController@listParentGroups');
    Route::post('addGroup', 'App\Http\Controllers\v1\GroupController@store');
    Route::get('getGroup/{id}', 'App\Http\Controllers\v1\GroupController@show');
    Route::post('editGroup/{id}', 'App\Http\Controllers\v1\GroupController@update');
    Route::post('deleteGroup/{id}', 'App\Http\Controllers\v1\GroupController@destroy');

    // Pharmacopeia Masters
    Route::get('listPharmacopeia', 'App\Http\Controllers\v1\PharmacopeiaController@index');
    Route::post('addPharmacopeia', 'App\Http\Controllers\v1\PharmacopeiaController@store');
    Route::get('getPharmacopeia/{id}', 'App\Http\Controllers\v1\PharmacopeiaController@show');
    Route::post('editPharmacopeia/{id}', 'App\Http\Controllers\v1\PharmacopeiaController@update');
    Route::post('deletePharmacopeia/{id}', 'App\Http\Controllers\v1\PharmacopeiaController@destroy');
    Route::get('exportPharmacopieaData', 'App\Http\Controllers\v1\PharmacopeiaController@exportPharmacopieaData');

    // Department Masters
    Route::get('listDepartment', 'App\Http\Controllers\v1\DepartmentController@index');
    Route::post('addDepartment', 'App\Http\Controllers\v1\DepartmentController@store');
    Route::get('getDepartment/{id}', 'App\Http\Controllers\v1\DepartmentController@show');
    Route::post('editDepartment/{id}', 'App\Http\Controllers\v1\DepartmentController@update');
    Route::post('deleteDepartment/{id}', 'App\Http\Controllers\v1\DepartmentController@destroy');

    // Branch Masters
    Route::get('listBranch', 'App\Http\Controllers\v1\BranchController@index');
    Route::post('addBranch', 'App\Http\Controllers\v1\BranchController@store');
    Route::get('getBranch/{id}', 'App\Http\Controllers\v1\BranchController@show');
    Route::post('editBranch/{id}', 'App\Http\Controllers\v1\BranchController@update');
    Route::post('deleteBranch/{id}', 'App\Http\Controllers\v1\BranchController@destroy');

    Route::get('listPosition', 'App\Http\Controllers\v1\PositionController@index');
    Route::post('addPosition', 'App\Http\Controllers\v1\PositionController@store');
    Route::get('getPosition/{id}', 'App\Http\Controllers\v1\PositionController@show');
    Route::post('editPosition/{id}', 'App\Http\Controllers\v1\PositionController@update');
    Route::post('deletePosition/{id}', 'App\Http\Controllers\v1\PositionController@destroy');

    // Ledger Masters
    Route::get('listLedger', 'App\Http\Controllers\v1\LedgerController@index');
    Route::post('addLedger', 'App\Http\Controllers\v1\LedgerController@store');
    Route::get('getLedger/{id}', 'App\Http\Controllers\v1\LedgerController@show');
    Route::post('editLedger/{id}', 'App\Http\Controllers\v1\LedgerController@update');
    Route::post('deleteLedger/{id}', 'App\Http\Controllers\v1\LedgerController@destroy');

    // Category Masters
    Route::get('listCategory', 'App\Http\Controllers\v1\CategoryController@index');
    Route::get('listParentCategory', 'App\Http\Controllers\v1\CategoryController@listParentCategories');
    Route::get('listSubCategory/{id}', 'App\Http\Controllers\v1\CategoryController@listSubCategories');
    Route::get('listSubSubCategory/{id}', 'App\Http\Controllers\v1\CategoryController@listSubSubCategories');
    Route::post('addCategory', 'App\Http\Controllers\v1\CategoryController@store');
    Route::get('getCategory/{id}', 'App\Http\Controllers\v1\CategoryController@show');
    Route::post('editCategory/{id}', 'App\Http\Controllers\v1\CategoryController@update');
    Route::post('deleteCategory/{id}', 'App\Http\Controllers\v1\CategoryController@destroy');

    // Bank Masters
    Route::post('addBank', 'App\Http\Controllers\v1\BankController@store');
    Route::get('listBank', 'App\Http\Controllers\v1\BankController@index');
    Route::get('getBank/{id}', 'App\Http\Controllers\v1\BankController@show');
    Route::post('editBank/{id}', 'App\Http\Controllers\v1\BankController@update');
    Route::post('deleteBank/{id}', 'App\Http\Controllers\v1\BankController@destroy');

    // Machine Masters
    Route::post('addMachine', 'App\Http\Controllers\v1\MachineController@store');
    Route::get('listMachine', 'App\Http\Controllers\v1\MachineController@index');
    Route::get('getMachine/{id}', 'App\Http\Controllers\v1\MachineController@show');
    Route::post('editMachine/{id}', 'App\Http\Controllers\v1\MachineController@update');
    Route::post('deleteMachine/{id}', 'App\Http\Controllers\v1\MachineController@destroy');

    // Unit Masters
    Route::post('addUnit', 'App\Http\Controllers\v1\UnitController@store');
    Route::get('listUnit', 'App\Http\Controllers\v1\UnitController@index');
    Route::get('getUnit/{id}', 'App\Http\Controllers\v1\UnitController@show');
    Route::post('editUnit/{id}', 'App\Http\Controllers\v1\UnitController@update');
    Route::post('deleteUnit/{id}', 'App\Http\Controllers\v1\UnitController@destroy');

    // Material Masters
    Route::post('addMaterial', 'App\Http\Controllers\v1\MaterialController@store');
    Route::get('listMaterial', 'App\Http\Controllers\v1\MaterialController@index');
    Route::get('getMaterial/{id}', 'App\Http\Controllers\v1\MaterialController@show');
    Route::post('editMaterial/{id}', 'App\Http\Controllers\v1\MaterialController@update');
    Route::post('deleteMaterial/{id}', 'App\Http\Controllers\v1\MaterialController@destroy');

    // Location Masters
    Route::post('addLocation', 'App\Http\Controllers\v1\LocationController@store');
    Route::get('listLocation', 'App\Http\Controllers\v1\LocationController@index');
    Route::get('getLocation/{id}', 'App\Http\Controllers\v1\LocationController@show');
    Route::post('editLocation/{id}', 'App\Http\Controllers\v1\LocationController@update');
    Route::post('deleteLocation/{id}', 'App\Http\Controllers\v1\LocationController@destroy');

    // Product Masters
    Route::post('addProduct', 'App\Http\Controllers\v1\MstProductController@store');
    Route::get('listproduct', 'App\Http\Controllers\v1\MstProductController@index');
    Route::get('parentList', 'App\Http\Controllers\v1\MstProductController@parent_list');
    Route::get('getproduct/{id}', 'App\Http\Controllers\v1\MstProductController@show');
    Route::post('editProduct/{id}', 'App\Http\Controllers\v1\MstProductController@update');
    Route::post('deleteProduct/{id}', 'App\Http\Controllers\v1\MstProductController@destroy');
    Route::get('exportproductlist', 'App\Http\Controllers\v1\MstProductController@exportlist');
    Route::get('copyfromGeneric', 'App\Http\Controllers\v1\MstProductController@copy_fromGeneric');
    Route::get('methodDropdown', 'App\Http\Controllers\v1\MstProductController@method_dropdown');

    // Instruments master
    Route::post('addInstrument', 'App\Http\Controllers\v1\InstrumentController@store');
    Route::get('listInstrument', 'App\Http\Controllers\v1\InstrumentController@index');
    Route::get('getInstrument/{id}', 'App\Http\Controllers\v1\InstrumentController@show');
    Route::post('editInstrument/{id}', 'App\Http\Controllers\v1\InstrumentController@update');
    Route::post('deleteInstrument/{id}', 'App\Http\Controllers\v1\InstrumentController@destroy');

    // Booking
    Route::post('addBooking', 'App\Http\Controllers\v1\BookingController@store');
    Route::post('editBooking/{id}', 'App\Http\Controllers\v1\BookingController@update');
    Route::get('listBooking', 'App\Http\Controllers\v1\BookingController@index');
    Route::get('getBooking/{id}', 'App\Http\Controllers\v1\BookingController@show');
    Route::get('booking_no/{report_type?}/{receipte_date?}', 'App\Http\Controllers\v1\BookingController@last_booking_no');
    Route::get('contact_type/{type?}', 'App\Http\Controllers\v1\BookingController@contact_type');
    Route::get('exportBookingData', 'App\Http\Controllers\v1\BookingController@exportlist');
    Route::post('deleteBooking/{id}', 'App\Http\Controllers\v1\BookingController@destroy');
    Route::post('getproduct/{id}', 'App\Http\Controllers\v1\BookingController@getproduct');

    // Test Masters
    Route::get('listTest', 'App\Http\Controllers\v1\TestController@index');
    Route::get('listParentTest', 'App\Http\Controllers\v1\TestController@listParentTests');
    Route::get('listSubTest/{id}', 'App\Http\Controllers\v1\TestController@listSubTests');
    Route::get('listSubSubTest/{id}', 'App\Http\Controllers\v1\TestController@listSubSubTests');
    Route::post('addTest', 'App\Http\Controllers\v1\TestController@store');
    Route::get('getTest/{id}', 'App\Http\Controllers\v1\TestController@show');
    Route::post('editTest/{id}', 'App\Http\Controllers\v1\TestController@update');
    Route::post('deleteTest/{id}', 'App\Http\Controllers\v1\TestController@destroy');

    //Assign Tests
    Route::get('listAssignTests', 'App\Http\Controllers\v1\AssignTestsController@index');
    Route::post('assignTests', 'App\Http\Controllers\v1\AssignTestsController@assign_tests_chemist');
    Route::get('statusWiseTests', 'App\Http\Controllers\v1\AssignTestsController@statusWiseTests');
    Route::get('showTest/{id}', 'App\Http\Controllers\v1\AssignTestsController@show_test');
    Route::post('updateTestResult/{id}', 'App\Http\Controllers\v1\AssignTestsController@update_test_result');
    Route::post('TestApproveReject/{id?}', 'App\Http\Controllers\v1\AssignTestsController@tests_approve_reject');

    //Counter
    Route::get('listCounts', 'App\Http\Controllers\v1\CounterController@index');

    //Roll and Rights
    Route::post('assignRoleRights', 'App\Http\Controllers\v1\RoleRightsController@assign_role_rights');
    Route::post('updateRoleRights/{id}', 'App\Http\Controllers\v1\RoleRightsController@update_role_rights');
    Route::get('getRoleRights/{id}', 'App\Http\Controllers\v1\RoleRightsController@show_role_rights');
    Route::get('assignRoleDesign', 'App\Http\Controllers\v1\RoleRightsController@assign_role_design');

    //ROA COA Print in Booking
    Route::get('RoaCoaPrint/{id}/{type?}', 'App\Http\Controllers\v1\BookingPrintController@roa_coa_print');
    Route::get('RoaCoaShow/{id}/', 'App\Http\Controllers\v1\BookingPrintController@roa_coa_show');

    //Formula
    Route::post('addFormula', 'App\Http\Controllers\v1\FormulaController@store');
    Route::post('updateFormula/{id}', 'App\Http\Controllers\v1\FormulaController@update');
    Route::get('getFormula/{id}', 'App\Http\Controllers\v1\FormulaController@show');
    Route::get('listFormula', 'App\Http\Controllers\v1\FormulaController@index');
    Route::get('exportFormula', 'App\Http\Controllers\v1\FormulaController@export');
    Route::post('deleteFormula/{id}', 'App\Http\Controllers\v1\FormulaController@destroy');

    //Method
    Route::get('listMethod', 'App\Http\Controllers\v1\MethodController@index');
    Route::post('addMethod', 'App\Http\Controllers\v1\MethodController@store');
    Route::post('updateMethod/{id}', 'App\Http\Controllers\v1\MethodController@update');
    Route::get('getMethod/{id}', 'App\Http\Controllers\v1\MethodController@show');
    Route::get('deleteMethod/{id}', 'App\Http\Controllers\v1\MethodController@destroy');

    //Quotation
    Route::get('listQuotation', 'App\Http\Controllers\v1\QuotationController@index');
    Route::post('addQuotation', 'App\Http\Controllers\v1\QuotationController@store');
    Route::post('updateQuotation/{id}', 'App\Http\Controllers\v1\QuotationController@update');
    Route::get('getQuotation/{id}', 'App\Http\Controllers\v1\QuotationController@show');
    Route::get('deleteQuotation/{id}', 'App\Http\Controllers\v1\QuotationController@destroy');
    Route::get('generateQuotationNo', 'App\Http\Controllers\v1\QuotationController@generateQuotationNo');
    Route::get('getProductSamples/{id}', 'App\Http\Controllers\v1\QuotationController@getProductSamples');
});

Route::group(['prefix' => 'v1'], function () {
    Route::get('listYears', 'App\Http\Controllers\v1\CommonController@yearsList');
    Route::get('listCompanies', 'App\Http\Controllers\v1\CommonController@listCompanies');
    //uniqusername
    // Route::post('isUniqUsername', 'App\Helpers\Helpers@uniq_username');
    Route::post('isUniqUsername', 'App\Http\Controllers\v1\CommonController@uniq_username');
    Route::get('listStates', 'App\Http\Controllers\v1\CommonController@listStates');
    Route::get('listCountries', 'App\Http\Controllers\v1\CommonController@listCountries');
    Route::get('countriesWiseStates/{id}', 'App\Http\Controllers\v1\CommonController@countriesWiseStates');
    //clear cache
    Route::get('/clear/route', 'App\Http\Controllers\v1\CommonController@clearRoute');
});
