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

Route::get('user/{user}/hobby/{hobby}', 'Api\HobbyController@choiceHobby');


Route::middleware(['auth:sanctum'])->group(function () {


    Route::get('hobbies', 'Api\HobbyController@getHobbies');

    Route::get('user/{user}/list', 'Api\UserController@listUser');
    Route::get('user/{user}/search/{search}', 'Api\UserController@searchUsers');
    Route::get('user/{user}/followings', 'Api\UserController@userFollowings');
    Route::get('user/{user}/follow/{follow}', 'Api\UserController@followUser');
    Route::get('user/{user}/unfollow/{unfollow}', 'Api\UserController@unfollowUser');
    Route::get('user/{user}/accept/request/{from}', 'Api\UserController@acceptFollowRequest');
    Route::get('user/{user}/reject/request/{from}', 'Api\UserController@acceptFollowRequest');

    Route::get('main/{user}', 'Api\MainController@main');

    Route::get('user/{me}/profile/{user}', 'Api\UserController@profile');
    Route::get('user/{me}/profile/{user}/see', 'Api\UserController@userProfile');
    Route::put('user/update', 'Api\UserController@update');
    Route::post('user/update/name', 'Api\UserController@updateName');
    Route::post('user/update/password', 'Api\UserController@updatePassword');
    Route::post('user/update/avatar', 'Api\UserController@updateAvatar');


    Route::post('post', 'Api\PostController@store');
    Route::put('post', 'Api\PostController@update');
    Route::get('post/show/{id}', 'Api\PostController@show');
    Route::get('post/feed', 'Api\PostController@feed');
    Route::get('post/feed/{id}/following', 'Api\PostController@feedFollowings');
    Route::post('post/comment', 'Api\CommentController@store');
    Route::post('post/comment/reply', 'Api\CommentController@replyStore');
    Route::get('post/comment/{post}', 'Api\CommentController@postComments');
    Route::delete('post/comment/{id}', 'Api\CommentController@destroy');
    Route::get('post/{post}/like/{user}', 'Api\PostController@likePost');
    Route::get('post/{post}/unlike/{user}', 'Api\PostController@likePost');

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
});

Route::post('login', 'Api\LoginController@login');
Route::post('register', 'Api\RegisterController@store');
Route::post('auth', 'Api\AuthGoogleController@auth');
