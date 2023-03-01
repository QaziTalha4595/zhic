<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WebsiteController extends Controller
{

    public function Home()
    {

        return view('Website.Home');
    }

    public function BookDetail()
    {
        return view('Website.BookDetail');
    }

    public function BookCategory()
    {
        return view('Website.BookCategory');
    }

    // public function Categories()
    // {
    //     $Categories = DB::table('category')->get();
    //     // echo $Categories;       
    //     return view('index', ['categories'=>$Categories]);
    // }

}
