<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Middleware\AuthMiddleware;

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

Route::get('/', function () {return view('Index');});

Route::get('/ControlPanel/Login', [AdminController::class, 'Login'])->name('Login');
Route::post('/ControlPanel/LoginUser', [AdminController::class, 'LoginUser'])->name('LoginUser');

Route::group(['prefix'=> 'ControlPanel', 'middleware'=> 'AuthMiddleware'], function()
{
    Route::get('/Dashboard', function () {return view('Admin.AdminLayout');})->name('Dashboard');
});
