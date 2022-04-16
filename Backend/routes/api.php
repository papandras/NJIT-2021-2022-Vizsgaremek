<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\FriendController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\GroupMemberController;
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

Route::post('forgot-password', [AuthController::class, 'forgotpassword'])->middleware('guest')->name('password.request');

Route::middleware('auth:sanctum')->group(function () {
    //Get user's datas, new cookie, logout
    Route::get('user', [AuthController::class, 'user'])->name('user');
    Route::get('getNewCookie', [AuthController::class, 'getNewCookie'])->name('getNewCookie');
    Route::post('logout', [AuthController::class, 'logout'])->name('logout');

    //User search
    Route::get('users', [UserController::class, 'getAllUsers'])->name('getAllUsers');
    Route::get('users/{username}', [UserController::class, 'getUser'])->name('getUser');
    Route::get('users/letter/{startletter}', [UserController::class, 'getUserByStartLetter'])->name('getUserByStartLetter');

    //Friendship
    Route::get('user/friends', [FriendController::class, 'getFriends'])->name('friends');
    Route::post('user/friends/add/', [FriendController::class, 'addFriend'])->name('addfriend');
    Route::post('user/friends/remove/', [FriendController::class, 'removeFriend'])->name('removeFriend');
    Route::get('user/friends/friendrequests', [FriendController::class, 'friendrequests'])->name('friendrequests');
    Route::post('user/friends/accept/', [FriendController::class, 'acceptrequest'])->name('acceptrequest');
    Route::get('user/friends/sentrequests/', [FriendController::class, 'sentrequests'])->name('sentrequests');
    Route::post('user/friends/cancelrequest/', [FriendController::class, 'cancelrequest'])->name('cancelrequest');
    Route::post('user/friends/rejectrequest/', [FriendController::class, 'rejectrequest'])->name('rejectrequest');

    //Groups
    Route::post('group/create', [GroupController::class, 'create'])->name('group.create');
    Route::post('group/addmember', [GroupController::class, 'addmember'])->name('group.addmember');
    Route::get('group/{id}/members', [GroupController::class, 'getmembers'])->name('group.members');
    Route::get('user/{id}/groups', [UserController::class, 'getgroups'])->name('user.groups'); //amibe meghivtak
    Route::get('user/groups', [UserController::class, 'getownedgroups'])->name('user.owngroups'); //ahol ő a tulajdonos
    Route::delete('/group/{id}/delete', [GroupController::class, 'deletegroup'])->name('group.delete');
    Route::delete('/group/{group}/member/{user}/delete', [GroupController::class, 'deletememberfromgroup'])->name('group.delete.member');

    //Files
    Route::post('file/upload', [FileController::class, 'upload'])->name('file.upload');
    Route::get('file/get/{limit?}', [FileController::class, 'getFiles'])->name('file.get');
    Route::get('file/download/{filename}', [FileController::class, 'download'])->name('file.download');
});
