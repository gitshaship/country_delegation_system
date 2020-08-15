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
Route::post('/v1/auth/login', 'Auth\LoginController@login')->name('login.api');
Route::post('/v1/auth/register','Auth\RegisterController@register')->name('register.api');

//activity api
Route::post('v1/activity','Activity\ActivityController@create')->middleware('api.expert')->name('activity_register.api');
Route::put('v1/activity/{id}','Activity\ActivityController@update')->middleware('api.expert')->name('activity_update.api');
Route::delete('v1/activity/{id}','Activity\ActivityController@destroy')->middleware('api.expert')->name('activity_delete.api');
Route::get('v1/activity/{skillId}','Activity\ActivityController@listView')->name('activity_view.api');

//skill api
Route::get('v1/skills','Skills\SkillsController@listView')->name('skills_view.api');

Route::middleware('auth:api')->group( function(){
    Route::post('/v1/auth/logout', 'Auth\LoginController@logout')->name('logout.api');
});


