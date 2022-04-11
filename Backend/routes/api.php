<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FriendController;
use App\Http\Controllers\UserController;
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

Route::post('register', [AuthController::class, 'register'])->name('register');
Route::post('login', [AuthController::class, 'login'])->name('login');

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', [AuthController::class, 'user'])->name('user');
    Route::get('getNewCookie', [AuthController::class, 'getNewCookie'])->name('getNewCookie');
    Route::post('logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('users', [UserController::class, 'getAllUsers'])->name('getAllUsers');
    Route::get('users/{username}', [UserController::class, 'getUser'])->name('getUser');

    Route::get('user/friends', [FriendController::class, 'getFriends'])->name('friends');
    Route::post('user/friends/add/', [FriendController::class, 'addFriend'])->name('addfriend');
    Route::post('user/friends/remove/', [FriendController::class, 'removeFriend'])->name('removeFriend');
    Route::get('user/friends/friendrequests', [FriendController::class, 'friendrequests'])->name('friendrequests');
    Route::post('user/friends/accept/', [FriendController::class, 'acceptrequest'])->name('acceptrequest');
});
