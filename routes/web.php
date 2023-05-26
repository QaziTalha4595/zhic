<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Admin\Category\CategoryController;
use App\Http\Controllers\Admin\MainSlider\SliderController;
use App\Http\Controllers\Admin\Promotion\PromotionController;
use App\Http\Controllers\Admin\Ebook\EbookController;
use App\Http\Controllers\WebsiteController;
use App\Http\Controllers\Website\FeedbackController;
use App\Http\Controllers\Website\WebsiteEbookController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Middleware\AuthMiddleware;
use App\Http\Middleware\WebsiteMiddleware;
use App\Http\Controllers\Admin\BookShelf\BookShelfController;
use App\Http\Controllers\Admin\AudioBook\AudioBookController;
use App\Http\Controllers\Admin\Reports\ViewController;
use App\Http\Controllers\Admin\Book\BookRequestController;
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



    View::composer(['*'], function ($view) {
        $category = DB::table('category')->get();
        $sub_category = DB::table('category__sub')->get();
        $third_category = DB::table('category__third')
        ->orderBy('third_category_name','ASC')
        ->get();

        $view->with([
            'categories' => $category,
            'sub_categories' => $sub_category,
            'third_category' => $third_category,
        ]);
    });

    Route::get('/test', [WebsiteEbookController::class, 'test']);
Route::get('/', function(){return redirect("en/Home");});//to redirect to defualt lang
Route::group(['prefix' => '/{locale}', 'middleware'=> 'WebsiteMiddleware'],function(){ // to get lang in every page
    Route::get('/Home', [WebsiteEbookController::class, 'Home'])->name('Home'); // home page
    Route::post('/FormStore', [WebsiteController::class, 'FormStore'])->name('FormStore');
    Route::get('EBook/{slug}', [WebsiteEbookController::class, 'BookDetail'])->name('BookDetail');
    Route::get('EBook-{p_slug}/{s_slug?}/{t_slug?}', [WebsiteEbookController::class, 'BookCategoryView']);
    Route::get('Book-Request', [WebsiteEbookController::class, 'BookRequestView'])->name('User-Book-Request');
    Route::get('Contact', [WebsiteEbookController::class, 'Contact'])->name('Contact');
    Route::get('File/{unique_id}', [WebsiteController::class, 'FileRead'])->name('FileRead');
});


// Website
Route::post('FeedBack-Send', [FeedbackController::class, 'FeedBackSend'])->name('Admin-FeedBack-Send');
Route::post('ContactForm', [FeedbackController::class, 'ContactStore'])->name('ContactForm');
Route::post('Rating-Store', [FeedbackController::class, 'RatingStore'])->name('Rating-Store');
Route::get('Session-Store', [FeedbackController::class, 'SessionStore'])->name('Admin-Session-Store');
Route::get('Count-Duration', [FeedbackController::class, 'CountDuration'])->name('Admin-Count-Duration');
Route::get('Feedback-Show', [FeedbackController::class, 'FeedbackShow'])->name('Admin-Feedback-Show');
Route::post('BookRequest-Send', [WebsiteController::class, 'BookRequestSend'])->name('Admin-Book-Request-Send');




Route::get('Change-View-Mode', [WebsiteController::class, 'ChangeViewMode'])->name('Change-View-Mode');

Route::get('clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call("config:cache");
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    return "cache, config, view, route is cleared";
});

Route::get('/ControlPanel/Login', [AdminController::class, 'Login'])->name('Login');
Route::post('/ControlPanel/LoginUser', [AdminController::class, 'LoginUser'])->name('LoginUser');

Route::group(['prefix'=> 'ControlPanel', 'middleware'=> 'AuthMiddleware'], function()
{
    // Route::get('/Dashboard', function () {return view('Admin.AdminLayout');})->name('Dashboard');
    // ---==== Setup ====--- \\
    //Dashboared
    Route::get('/Dashboard',function(){
        return view('Admin.Dashboard');
    });
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

        // Book Shelf
    Route::get('BookShelf', [BookshelfController::class, 'BookShelf'])->name('BookShelf');
        // Route::get('ShelfItems', [BookshelfController::class, 'GetBookshelfItem'])->name('Get-Bookshelf-Item');
        Route::post('BookShelfStore', [BookshelfController::class, 'BookShelfStore'])->name('BookShelfStore');
    Route::get('BookShelfShow', [BookShelfController::class, 'BookShelfShow'])->name('BookShelfShow');
        Route::get('BookShelfEdit', [BookshelfController::class, 'BookShelfEdit'])->name('BookShelfEdit');
        // Route::post('Bookshelf-Update', [BookshelfController::class, 'BookshelfUpdate'])->name('Admin-Bookshelf-Update');
        Route::get('BookShelfRemove', [BookshelfController::class, 'BookShelfRemove'])->name('BookShelfRemove');



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
    Route::get('GetEbookCoverImage', [EbookController::class, 'GetEbookCoverImage'])->name('GetEbookCoverImage');
    Route::post('EbookUploadStore', [EbookController::class, 'EbookUploadStore'])->name('EbookUploadStore');
    Route::get('EbookShow', [EbookController::class, 'EbookShow'])->name('EbookShow');
    Route::get('EbookRemove', [EbookController::class, 'EbookRemove'])->name('EbookRemove');
    Route::post('Ebook-{file_id}-Edit', [EbookController::class, 'EbookCoverStore'])->name('EbookEdit');
    Route::get('EbookEdit',[EbookController::class,'EbookEdit'])->name('EbookEdit');
    Route::get('AllBookShow',[EbookController::class,'AllBookShow'])->name('AllBookShow');

    // Audio Book
    Route::get('AudioBookShow', [AudioBookController::class,'AudioBookShow'])->name('AudioBookShow');
    Route::get('AudioBook', [AudioBookController::class, 'AudioBook'])->name('AudioBook');
    Route::get('AudioBookBasic', [AudioBookController::class, 'AudioBookBasicTab'])->name('AudioBookBasic');
    Route::post('AudioBookStore', [AudioBookController::class, 'AudioBookBasicInfoStore'])->name('AudioBookStore');
    Route::get('AudioBook-{file_id}-CoverImage', [AudioBookController::class, 'AudioBookCoverImageView']);
    Route::post('AudioBookCoverImageStore', [AudioBookController::class, 'AudioBookCoverImageStore'])->name('AudioBookCoverImageStore');
    Route::get('AudioBook-{file_id}-Upload', [AudioBookController::class, 'AudioBookFileUpload'])->name('AudioBookFileUploadEdit');
    Route::post('AudioStore', [AudioBookController::class, 'AudioStore'])->name('AudioStore');
    Route::get('AudioBookRemove', [AudioBookController::class, 'AudioBookRemove'])->name('AudioBookRemove');
    Route::get('AudioBookCoverImageRemove', [AudioBookController::class, 'AudioBookCoverImageRemove'])->name('AudioBookCoverImageRemove');
    Route::get('AudioBookFileRemove', [AudioBookController::class, 'AudioBookFileRemove'])->name('AudioBookFileRemove');
    Route::get('GetAudioFile', [AudioBookController::class, 'GetAudioFile'])->name('GetAudioFile');

    Route::get('AudioBook-{file_id}-Basic', [AudioBookController::class, 'AudioBookBasicForEdit'])->name('AudioBookBasicForEdit');
    Route::get('AudioBookEdit',[AudioBookController::class,'AudioBookEdit'])->name('AudioBookEdit');
    Route::get('AudioEdit', [AudioBookController::class, 'AudioEdit'])->name('AudioEdit');
    //View Controller ROutes
    Route::get('/EbookView', [ViewController::class, 'EbookView'])->name('EbookView');
    Route::get('/EbookDuration', [ViewController::class, 'EbookDuration'])->name('EbookDuration');
    Route::get('/EbookReport', [ViewController::class, 'EbookReport'])->name('EbookReport');
    Route::get('/EbookLocationReport', [ViewController::class, 'EbookLocationReport'])->name('EbookLocationReport');
    Route::get('/EbookReportView', [ViewController::class, 'EbookReportView'])->name('EbookReportView');

    Route::get('/BookRequest', [BookRequestController::class, 'BookRequest'])->name('BookRequest');
    Route::get('/BookRequestShow', [BookRequestController::class, 'BookRequestShow'])->name('BookRequestShow');

    ///Feedback Routes
    Route::get('/Feedback', [FeedbackController::class, 'Feedback'])->name('Feedback');
    Route::get('/FeedbackShow', [FeedbackController::class, 'FeedbackShow'])->name('FeedbackShow');
});
