<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WebsiteController extends Controller
{

    public function Home()
    {
        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        $sliders = DB::table('main_slider')->get();

        return view('Website.Home', [
            'sliders' => $sliders,
            'Categories'=>$Categories, 
            'Categories_sub'=>$Categories_sub, 
            'Categories_third'=>$Categories_third
        ]);
    }

    public function BookDetail()
    {
        return view('Website.BookDetail');
    }

    public function BookCategory()
    {
        return view('Website.BookCategory');
    }

    public function Categories()
    {

        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();
        // return $Categories;
        return view('Layout',['Categories'=>$Categories, 'Categories_sub'=>$Categories_sub, 'Categories_third'=>$Categories_third]);
    }

}
