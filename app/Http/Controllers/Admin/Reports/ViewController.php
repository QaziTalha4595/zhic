<?php

namespace App\Http\Controllers\Admin\Reports;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Ebook\Ebook_location;
use App\Models\Ebook\Ebook;
use App\Models\Category;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Carbon;

class ViewController extends Controller
{
    public function EbookView()
    {
        $categories  = new Category();
        $categories  = Category::all();
        return view("Admin.Ebook.EbookView",compact('categories'));
    }
    public function EbookDuration()
    {
        return view("Admin.Ebook.EbookDuration");
    }
    public function EbookReport()
    {
        return view("Admin.Ebook.EbookReport");
    }
    public function EbookReportView()
    {
        $Ebook_Location = Ebook_location::with(['ebook'])->get();
        return Datatables::of($Ebook_Location)
        ->rawColumns(['Action', 'file_read'])
        ->make(true);
    }
    public function EbookLocationReport(Request $req)
    {

        if ($req->ajax())
        {

            if ($req->input('from_date') && $req->input('to_date'))
            {
                $Ebook_Location = Ebook_location::whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                                                ->with(['ebook'])
                                                ->get();
            }
            elseif($req->input('user_nationality') || $req->input('age') || $req->input('qualification') || $req->input('gender') || $req->input('from_date'))
            {
                $Ebook_Location = Ebook_location::where('user_address', $req->input('user_nationality'))
                ->orWhere('age',$req->input('age'))
                ->orWhere('qualification',$req->input('qualification'))
                ->orWhere('gender',$req->input('gender'))
                ->with(['ebook'])
                ->get();
            }
            else
            {
                $Ebook_Location = Ebook_location::with(['ebook'])->get();
            }
        }

        return Datatables::of($Ebook_Location)
        ->editColumn('Date', function ($Ebook_Location) {
            $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $Ebook_Location->created_at)->format('d-m-Y');
            return $formatedDate;
        })
        ->make(true);
    }


}
