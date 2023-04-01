<?php

namespace App\Http\Controllers\Admin\BookShelf;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Ebook\Ebook;
use App\Models\Book_Shelf;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Carbon;
use DB;

class BookShelfController extends Controller
{
    public function BookShelf()
    {
        $Ebook = Ebook::all();
        return view('Admin.BookShelf.BookShelf',compact('Ebook'));
    }
    public function BookShelfStore(Request $req)
    {
        $BookShelf = new Book_Shelf();
        $validator = Validator::make($req->all(), [
            'book_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'book_position' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        
        try {
            $BookShelf = Book_Shelf::updateOrCreate(
                ['book_shelf_id'   => $req->input('book_shelf_id')],
                ['file_id' => $req->input('book_name'),
                 'book_position' => $req->input('book_position')
                ]

            );
            
            return response()->json(["success" => true, "message" => $BookShelf->wasRecentlyCreated ? "BookShelf Detail Create Successfully" : "BookShelf Detail Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }

    public function BookShelfShow()
    {
        $BookShelf = Book_Shelf::with(['ebook','ebook__cover'])->OrderBy('book_shelf_id', 'DESC');
        return Datatables::of($BookShelf)
            ->addColumn('ebook', function ($BookShelf) {
                return $BookShelf->ebook->ebook_name;
            })
            ->addColumn('ebook__cover', function ($BookShelf) {
                return $BookShelf->ebook__cover->ebook_cover;
            })
            ->addColumn('Action', function ($BookShelf) {
                 return $BookShelf->book_shelf_id ;
            })
            ->rawColumns(['Action'])
            ->make(true);
    }
    public function BookShelfEdit(Request $req)
    {
        $book_shelf_id = $req->input('id');
        $BookShelf = Book_Shelf::with('ebook')->where('book_shelf_id', $book_shelf_id)->get();
        return response()->json(["data" => $BookShelf]);
    }
    public function BookShelfRemove(Request $req)
    {
        $BookShelf = Book_Shelf::where('book_shelf_id',$req->input('id'))->delete();

        if ($BookShelf) {
            return response()->json(["success" => true, "message" => "BookShelf Deleted Succesfully"]);
        } else {
            return response()->json(["success" => false, "message" => "BookShelf Remove Failed...!"]);
        }
    }
}
