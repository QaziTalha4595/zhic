<?php

namespace App\Http\Controllers\Admin\Book;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Book\Book_Request;
use Yajra\Datatables\Datatables;

class BookRequestController extends Controller
{
    public function BookRequest()
    {
        return view('Admin.Book.BookRequest');
    }
    public function BookRequestShow()
    {
        $BookRequest = Book_Request::OrderBy('request_id','DESC');

        return Datatables::of($BookRequest)
        ->make(true);
    }
}
