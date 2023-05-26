<?php

namespace App\Http\Controllers\Admin\Feedback;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Feedback\Feedback;
use Yajra\Datatables\Datatables;
use DB;
use Illuminate\Support\Carbon;

class FeedbackController extends Controller
{
    public function Feedback()
    {
        return view('Admin.Feedback.Feedback');
    }
    public function FeedbackShow(Request $req)
    {

        if ($req->ajax())
        {
            if ($req->input('from_date') && $req->input('to_date'))
            {
                $Feedback = Feedback::with(['ebook'])
                ->whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                    ->get();
            }
            elseif($req->input('user_nationality') || $req->input('age') || $req->input('qualification') || $req->input('gender') || $req->input('from_date'))
            {
                // $Category = Category::where('id',$req->input('category_name'))->get();

                $Feedback = Feedback::with(['ebook'])
                ->where('user_address', $req->input('user_nationality'))
                ->orWhere('age',$req->input('age'))
                ->orWhere('qualification',$req->input('qualification'))
                ->orWhere('gender',$req->input('gender'))
                ->get();
            }
            else
            {
                $Feedback = Feedback::with(['ebook'])->OrderBy('feedback_id','DESC');
            }
        }
        return DataTables::of($Feedback)
        ->editColumn('created_at', function ($Feedback) {
            $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $Feedback->created_at)->format('d-m-Y');
            return $formatedDate;
        })
        ->addColumn('Book Name', function ($Feedback) {
            return $Feedback->ebook->ebook_name;
        })
        ->make(true);
    }
}
