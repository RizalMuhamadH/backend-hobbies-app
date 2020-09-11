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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', 'Api\LoginController@login');
Route::post('register', 'Api\RegisterController@store');
Route::get('user/{id}', 'Api\UserController@show');
Route::put('user/name/{id}', 'Api\UserController@updateName');
Route::put('user/password/{id}', 'Api\UserController@updatePassword');
Route::put('user/avatar/{id}', 'Api\UserController@updateAvatar');
Route::post('post', 'Api\PostController@store');
Route::get('post/show/{id}', 'Api\PostController@show');
Route::get('post/feed', 'Api\PostController@feed');
Route::get('post/feed/following/{id}', 'Api\PostController@feedFollowings');
Route::post('post/comment', 'Api\CommentController@store');
Route::post('post/comment/reply', 'Api\CommentController@replyStore');
// Route::get('comment', 'Api\CommentController@index');
