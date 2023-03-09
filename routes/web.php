<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Category\CategoryController;
use App\Http\Controllers\Admin\MainSlider\SliderController;
use App\Http\Controllers\Admin\Promotion\PromotionController;
use App\Http\Controllers\Admin\Ebook\EbookController;
use App\Http\Controllers\Admin\AdminController;
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

Route::get('/', function () {return ('front page');});

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
    // Route::get('/FilterCategory', [CategoryController::class, 'FilterCategory'])->name('FilterCategory');

    
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
    Route::get('/ThirdCategoryRemove', [CategoryController::class, 'ThirdCategoryDestroy'])->name('ThirdCategoryRemove');
    Route::get('/FetchSubCategory', [CategoryController::class, 'FetchSubCategory'])->name('FetchSubCategory');
    
    // Thired category management
    Route::get('/Language', [CategoryController::class, 'Language'])->name('Language');
    Route::post('/LanguageStore', [CategoryController::class, 'LanguageStore'])->name('LanguageStore');
    Route::get('/LanguageShow', [CategoryController::class, 'LanguageShow'])->name('LanguageShow');
    Route::get('/LanguageEdit', [CategoryController::class, 'LanguageEdit'])->name('LanguageEdit');
    Route::get('/LanguageRemove', [CategoryController::class, 'LanguageDestroy'])->name('LanguageRemove');
    
    // Slider management
    Route::get('/Slider', [SliderController::class, 'Slider'])->name('Slider');
    Route::post('/SliderStore', [SliderController::class, 'SliderStore'])->name('SliderStore');
    Route::get('/SliderShow', [SliderController::class, 'SliderShow'])->name('SliderShow');
    Route::get('/SliderEdit', [SliderController::class, 'SliderEdit'])->name('SliderEdit');
    Route::get('/SliderRemove', [SliderController::class, 'SliderDestroy'])->name('SliderRemove');

     // Promotion management
    Route::get('/Promotion', [PromotionController::class, 'Promotion'])->name('Promotion');
    Route::get('/FetchSubCategory', [PromotionController::class, 'FetchSubCategory'])->name('FetchSubCategory');
    Route::post('/PromotionStore', [PromotionController::class, 'PromotionStore'])->name('PromotionStore');
    Route::get('/PromotionShow', [PromotionController::class, 'PromotionShow'])->name('PromotionShow');
    Route::get('/PromotionEdit', [PromotionController::class, 'PromotionEdit'])->name('PromotionEdit');
     Route::get('/PromotionRemove', [PromotionController::class, 'PromotionDestroy'])->name('PromotionRemove');
    // Route::get('/PromotionCrop',[PromotionController::class,'PromotionCrop'])->name('PromotionCrop');

    Route::get('/Ebook', [EbookController::class, 'Ebook'])->name('Ebook');
    Route::get('EbookUpload', [EbookController::class, 'EbookUpload'])->name('EbookUpload');
     Route::post('/EbookStore', [EbookController::class, 'EbookStore'])->name('EbookStore');
    // Route::get('/PromotionShow', [PromotionController::class, 'PromotionShow'])->name('PromotionShow');
    // Route::get('/PromotionEdit', [PromotionController::class, 'PromotionEdit'])->name('PromotionEdit');
    //  Route::get('/PromotionRemove', [PromotionController::class, 'PromotionDestroy'])->name('PromotionRemove');
    Route::get('/FetchThirdCategory', [EbookController::class, 'FetchThirdCategory'])->name('FetchThirdCategory');
    Route::get('Ebook-{file_id}-Basic', [EbookController::class, 'EbookBasicView']);
    Route::get('Ebook-{file_id}-CoverImage', [EbookController::class, 'EbookCoverImageView']);
    Route::post('EbookCoverStore', [EbookController::class, 'EbookCoverStore'])->name('EbookCoverStore');
    Route::get('EbookCoverImageRemove', [EbookController::class, 'EbookCoverImageRemove'])->name('EbookCoverImageRemove');
    Route::get('Ebook-{file_id}-Upload', [EbookController::class, 'EbookCoverUploadView']);
    Route::post('EbookUploadStore', [EbookController::class, 'EbookUploadStore'])->name('EbookUploadStore');

    
    
   
});
