<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use DateTime;
use File;
use Response;

class WebsiteController extends Controller
{

    // Home Page
     public function Home(Request $req, $locale = 'en')
    {
        // app()->setLocale($locale);
        App::setLocale($locale);
        session()->put('locale', $locale);

        // dd($locale);


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

        $Article = DB::table('category__third')
            ->leftjoin('category__sub', 'category__sub.sub_cat_id', '=', 'category__third.sub_cat_id')
            ->where('category__third.category_id', 6)
            ->groupBy('third_category_name')
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
            'Article' => $Article,
            'locale' => $locale,
        ]);
    }

    public function ChangeViewMode(Request $request)
    {
        session()->put('view-mode', $request->input('mode'));
        return $request->input('mode');
    }
    public function FileRead(Request $request, $locale,  $unique_id)
    {

        $ip_address = '';
        $ip_manual = $request->ip();

        try {
            $ip = $_SERVER['REMOTE_ADDR'];
            $user_name = Session::get('user_name');
            $user_email = Session::get('user_email');
            $user_address = Session::get('user_address');
            $qualification = Session::get('qualification');
            $gender = Session::get('gender');
            $age = Session::get('age');
            $data = [
                'user_name' => Session::get('user_name'),
                'user_email' => Session::get('user_email'),
                'user_address' => Session::get('user_address'),
                'qualification' => Session::get('qualification'),
                'gender' => Session::get('gender'),
                'age' => Session::get('age'),
                'ip_address' => $ip_manual,
                // 'city' => $data->city,
                // 'location' => $data->country,
                'file_id' => $unique_id,
            ];
            $store = DB::table('ebook__location')
            ->insert($data);

        } catch (\Throwable $e) {
            abort(404);
        }


        $BookData = DB::table('ebook')
            ->where('unique_id', $unique_id)
            ->first();


        // update
        $user = DB::table('ebook')
            ->where('unique_id', $unique_id)
            ->update([
                'no_view' => DB::raw('no_view+1'),
            ]);


        // $reading_link = $BookData->ebook_link==null?url('/')."/public/Files/E-Book/".$BookData->file_attachment:$BookData->ebook_link;
        $reading_link = url('/')."/public/Files/E-Book/".$BookData->unique_id;
        // die($reading_link);
        return view('Website.Ebook.Ebook-pdf-view', ['unique_id' => $unique_id, 'data' => $BookData, 'reading_link'=>$reading_link]);

    }

    public function FileRead1(Request $request, $unique_id)
    {
        return $unique_id;
        return false;

        $files = DB::table('ebook')
            ->where('unique_id', $unique_id)
            ->get();
            $row = $files[0];

            if($row->ebook_link == null){
                $file_path = 'public/Files/E-Book/'.$row->file_attachment;
            }else {
                $file_path = $row->ebook_link;
            }
        $filename = '02368975141224.pdf';
        header('Content-type: application/pdf');
        header('Content-Disposition: inline; filename="' . $filename . '"');
        header('Content-Transfer-Encoding: binary');
        // header('Content-Length: ' . filesize($file_path));
        header('Accept-Ranges: bytes');
        @readfile($file_path);
    }


    public function BookRequestView()
    {
        $category = DB::table('category')->get();
        $sub_category = DB::table('category__sub')->get();

        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        return view('Website.BookRequest.BookRequest',['categories' => $category,
        'sub_categories' => $sub_category,

        'Categories'=>$Categories,
        'Categories_sub'=>$Categories_sub,
        'Categories_third'=>$Categories_third,
    ]);
    }

    public function BookRequestSend(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'book_name' => 'bail|required|string',
            'user_email' => 'required',
            'user_nationality' => 'required',
        ]);
        if (!$validator->passes()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->all()]);
        }

        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $data = DB::table('book_request')
        ->insert([
            'book_name' => $request->input('book_name'),
            'user_name' => $request->input('user_name'),
            'user_email' => $request->input('user_email'),
            'user_message' => $request->input('user_message'),
            'user_nationality' => $request->input('user_nationality'),
            'user_spoken' => $request->input('user_spoken'),
            'request_date' => $date_time,
        ]);
        if ($data == 1) {
            return response()->json(['success' => true, 'message' => 'Request Send Successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
    }




}
