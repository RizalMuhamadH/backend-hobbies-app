<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});


// https://www.codechief.org/article/create-your-own-multilevel-nested-comments-system-in-laravel#gsc.tab=0
// https://github.com/overtrue/laravel-follow
// https://modestasv.com/chat-with-laravel-pusher-and-socket-io-at-your-command/?utm_source=learninglaravel
// https://pusher.com/tutorials/group-chat-laravel
// https://www.youtube.com/watch?v=D9oIu6jiYLk