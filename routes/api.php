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

Route::post('group/chat/create', 'Api\GroupController@store');
Route::get('group/user/{userId}', 'Api\GroupController@userGroups');
Route::put('group/{groupId}/update', 'Api\GroupController@update');
Route::post('group/{groupId}/member/add', 'Api\GroupController@addMembers');
Route::get('group/{groupId}/requests', 'Api\GroupController@requestGroups');
Route::post('group/{groupId}/request', 'Api\GroupController@requestJoinGroup');
Route::post('group/{groupId}/request/accept', 'Api\GroupController@acceptJoinGroup');
Route::post('group/{groupId}/request/decline', 'Api\GroupController@decllineJoinGroup');


Route::post('group/{groupId}/conversation', 'Api\ConversationController@store');

Route::get('events', 'Api\EventController@index');
Route::get('events/{id}', 'Api\EventController@show');
Route::get('events/category', 'Api\EventController@categories');
Route::get('events/category/{catId}', 'Api\EventController@category');

Route::get('news', 'Api\EventController@index');
Route::get('news/{id}', 'Api\EventController@show');
Route::get('news/category', 'Api\EventController@categories');
Route::get('news/category/{catId}', 'Api\EventController@category');
// Route::get('comment', 'Api\CommentController@index');
