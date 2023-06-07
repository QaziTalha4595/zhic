<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ebook\Ebook;
use App\Models\User;

class DashboardController extends Controller
{
    public function Dashboard(Request $req)
    {
        $Ebook_Report = [];
        $AudioBook_Report = [];
        $Ebook_Count = Ebook::where('book_type', '1')->count();

        $AudioBook_Count = Ebook::where('book_type', '0')->count();

        $User_Count = User::all()->count();

        for ($i=1; $i <= 12; $i++) {
            $month = $i<10 ? "0".$i : $i;
            array_push($Ebook_Report,Ebook::where('book_type', '0')->where('created_at','LIKE','%-'.$month.'-%')->count());
        }
        for ($j=1; $j <= 12; $j++) {
            $month = $j<10 ? "0".$j : $j;
            array_push($AudioBook_Report,Ebook::where('book_type', '1')->where('created_at','LIKE','%-'.$month.'-%')->count());
        }

        return view('Admin.Dashboard',compact('Ebook_Count','AudioBook_Count','User_Count', 'Ebook_Report','AudioBook_Report'));


    }
}
