<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WebsiteController extends Controller
{
    public function Home(Request $req)
    {
        return view('Website.Home');
    }
}
