<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

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

Route::get('reset-password/{token}', [AuthController::class, 'resetpassword'])->middleware('guest')->name('password.reset');
Route::post('update-password', [AuthController::class, 'updatepassword'])->middleware('guest')->name('password.update');