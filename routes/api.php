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

Route::post('register', 'App\Http\Controllers\UserController@register');
Route::post('login', 'App\Http\Controllers\UserController@authenticate');
Route::post('logout', 'App\Http\Controllers\UserController@logout');
Route::get('open', 'App\Http\Controllers\DataController@open');

Route::group(['middleware' => ['jwt.verify']], function() {
    Route::get('user', 'App\Http\Controllers\UserController@getAuthenticatedUser');
    Route::get('closed', 'App\Http\Controllers\DataController@closed');

    //Route::resource('company', 'App\Http\Controllers\CompanyController');

    Route::get('listCompany', 'App\Http\Controllers\CompanyController@index');
    Route::post('addCompany', 'App\Http\Controllers\CompanyController@store');
    Route::get('getCompany/{id}', 'App\Http\Controllers\CompanyController@show');
    Route::post('editCompany/{id}', 'App\Http\Controllers\CompanyController@update');
    Route::post('deleteCompany/{id}', 'App\Http\Controllers\CompanyController@destroy');

    Route::get('listGroup', 'App\Http\Controllers\GroupController@index');
    Route::post('addGroup', 'App\Http\Controllers\GroupController@store');
    Route::get('getGroup/{id}', 'App\Http\Controllers\GroupController@show');
    Route::post('editGroup/{id}', 'App\Http\Controllers\GroupController@update');
    Route::post('deleteGroup/{id}', 'App\Http\Controllers\GroupController@destroy');


    //Route::resource('group', 'App\Http\Controllers\GroupController');
});
