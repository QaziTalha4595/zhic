<?php

namespace App\Http\Controllers\Admin\Reports;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Ebook\Ebook_location;
use App\Models\Ebook\Ebook;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Carbon;

class ViewController extends Controller
{
    public function EbookView()
    {
        return view("Admin.Ebook.EbookView");
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
        $Ebook_Location = Ebook_location::with(['ebook'])->OrderBy('location_id','DESC');
        return Datatables::of($Ebook_Location)
        ->addColumn('Name', function ($Ebook_Location) {
            return $Ebook_Location->ebook->ebook_name ?? '';
        })
        ->addColumn('TotalView', function ($Ebook_Location) {
            return $Ebook_Location->ebook->no_view ?? '';
        })
        ->rawColumns(['Action', 'file_read'])
        ->make(true);
    }
    public function EbookLocationReport(Request $req)
    {
        // $dee = "Afghanistan";
        // $Ebook_Location = Ebook_location::where('created_at',$dee)
        // ->get();
        // $Ebook_Location = Ebook_location::get('created_at');
        // // $cl = $req->input('from_date');
        // dd($Ebook_Location);
        // return false;
        if ($req->ajax())
        {
            // if($req->input('from_date') && $req->input('to_date'))
            // {
            //     $Ebook_Location = Ebook_location::with(['ebook'])
            //     ->whereBetween('created_at', [$req->input('date_from'), $req->input('date_to')])
            //     ->get();
            // }
            if ($req->input('from_date') && $req->input('to_date'))
            {
                $Ebook_Location = Ebook_location::with(['ebook'])
                ->whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                    ->get();
            }
            elseif($req->input('user_nationality') || $req->input('age') || $req->input('qualification') || $req->input('gender') || $req->input('from_date'))
            {
                // $Category = Category::where('id',$req->input('category_name'))->get();

                $Ebook_Location = Ebook_location::with(['ebook'])
                ->where('user_address', $req->input('user_nationality'))
                // ->orWhere('created_at', $req->input('from_date'))
                ->orWhere('age',$req->input('age'))
                ->orWhere('qualification',$req->input('qualification'))
                ->orWhere('gender',$req->input('gender'))
                ->get();
            }
            else
            {
                $Ebook_Location = Ebook_location::with(['ebook'])->OrderBy('location_id','DESC');
            }
        }

        return Datatables::of($Ebook_Location)
        ->editColumn('Date', function ($Ebook_Location) {
            $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $Ebook_Location->created_at)->format('d-m-Y');
            return $formatedDate;
        })
        ->addColumn('Name', function ($Ebook_Location) {
            return $Ebook_Location->ebook->ebook_name ?? '';
        })
        ->make(true);
    }


}
