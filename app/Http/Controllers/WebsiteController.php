<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WebsiteController extends Controller
{

    public function Home(Request $req, $locale = 'en')
    {
        app()->setLocale($locale);
        session()->put('locale', $locale);



        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        $books = DB::table('ebook')->get();
        $sliders = DB::table('main_slider')->get();

        $bookshelf = DB::table('book_shelf')
            ->select('ebook.*', 'ebook__cover.*', 'book_shelf.*')
            ->leftjoin('ebook', 'ebook.file_id', 'book_shelf.file_id')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', 'ebook.file_id')
            ->orderby('book_shelf_id', 'ASC')
            ->get();

        $HolyQuraan = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 1)
            ->where('ebook.featured', 1)
            ->limit(7)
            ->get();


        $MeaningofQuraan = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 2)
            ->where('ebook.featured', 1)
            ->limit(5)
            ->get();

        $IslammicCultBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 3)
            ->where('ebook.featured', 1)
            ->limit(4)
            ->get();
        $ArbicLearningBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 4)
            ->where('ebook.featured', 1)
            ->limit(5)
            ->get();

        $ChildrenBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 5)
            ->where('ebook.featured', 1)
            ->limit(6)
            ->get();

        return view('Website.Home', [
            'sliders' => $sliders,
            'Categories'=>$Categories,
            'Categories_sub'=>$Categories_sub,
            'Categories_third'=>$Categories_third,
            'books' => $books,
            'bookshelf' => $bookshelf,
            'HolyQuraan' => $HolyQuraan,
            'MeaningofQuraan' => $MeaningofQuraan,
            'IslammicCultBook' => $IslammicCultBook,
            'ChildrenBook' => $ChildrenBook,
            'ArbicLearningBook' => $ArbicLearningBook,
        ]);
    }

    public function BookDetail()
    {
        return view('Website.BookDetail');
    }


    public function Categories()
    {

        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();
        // return $Categories;
        return view('test',['Categories'=>$Categories, 'Categories_sub'=>$Categories_sub, 'Categories_third'=>$Categories_third]);
    }



}
