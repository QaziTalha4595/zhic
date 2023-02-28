<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\WebsiteController;
use App\Http\Controllers\Admin\Category\CategoryController;
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

Route::get('/', [WebsiteController::class, 'Categories'])->name('Home');
Route::get('/Book', [WebsiteController::class, 'BookDetail'])->name('BookDetail');
Route::get('/Category', [WebsiteController::class, 'BookCategory'])->name('BookCategory');


Route::get('/ControlPanel/Login', [AdminController::class, 'Login'])->name('Login');
Route::post('/ControlPanel/LoginUser', [AdminController::class, 'LoginUser'])->name('LoginUser');

Route::group(['prefix'=> 'ControlPanel', 'middleware'=> 'AuthMiddleware'], function()
{
    Route::get('/Dashboard', function () {return view('Admin.AdminLayout');})->name('Dashboard');
    // ---==== Setup ====--- \\
    // category management
    Route::get('/Category', [CategoryController::class, 'Category'])->name('Category');
    Route::post('/CategoryStore', [CategoryController::class, 'CategoryStore'])->name('CategoryStore');
    Route::get('/CategoryShow', [CategoryController::class, 'CategoryShow'])->name('CategoryShow');
    Route::get('/CategoryEdit', [CategoryController::class, 'CategoryEdit'])->name('CategoryEdit');
    Route::get('/CategoryRemove', [CategoryController::class, 'CategoryDestroy'])->name('CategoryRemove');

     //Sub category management
     Route::get('/SubCategory', [CategoryController::class, 'SubCategory'])->name('SubCategory');
     Route::post('/SubCategoryStore', [CategoryController::class, 'SubCategoryStore'])->name('SubCategoryStore');
     Route::get('/SubCategoryShow', [CategoryController::class, 'SubCategoryShow'])->name('SubCategoryShow');
     Route::get('/SubCategoryEdit', [CategoryController::class, 'SubCategoryEdit'])->name('SubCategoryEdit');
     Route::get('/SubCategoryRemove', [CategoryController::class, 'SubCategoryDestroy'])->name('SubCategoryRemove');

    // Thired category management
    Route::get('/ThirdCategory', [CategoryController::class, 'ThirdCategory'])->name('ThirdCategory');
    Route::post('/ThirdCategoryStore', [CategoryController::class, 'ThirdCategoryStore'])->name('ThirdCategoryStore');
    Route::get('/ThirdCategoryShow', [CategoryController::class, 'ThirdCategoryShow'])->name('ThirdCategoryShow');
    Route::get('/ThirdCategoryEdit', [CategoryController::class, 'ThirdCategoryEdit'])->name('ThirdCategoryEdit');
    // Route::get('/CategoryRemove', [CategoryController::class, 'CategoryDestroy'])->name('CategoryRemove');

    // Slider management
    Route::get('/Slider', [SliderController::class, 'Slider'])->name('Slider');
});
