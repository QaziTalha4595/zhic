<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use DateTime;
use Illuminate\Support\Facades\Validator;


class FeedbackController extends Controller
{
    public function FeedBackSend(Request $request)
    {
        // $data = $request->all();
        // dd($data);
        // return false;
        $validator = Validator::make($request->all(), [
            'user_name' => 'bail|required|string',
            'user_email' => 'required',
            'user_address' => 'required',
        ]);
        if (!$validator->passes()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->all()]);
        }

        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $book_id = $request->input('book_id');
        $user_name = $request->input('user_name');
        $user_email = $request->input('user_email');
        $user_address = $request->input('user_address');
        $qualification = $request->input('qualification');
        $gender = $request->input('gender');
        $message = $request->input('message');
        $age = $request->input('age');

        Session::put('book_id', $book_id);
        Session::put('user_name', $user_name);
        Session::put('user_email', $user_email);
        Session::put('user_address', $user_address);
        Session::put('qualification', $qualification);
        Session::put('age', $age);
        Session::put('gender', $gender);
        Session::put('message', $message);
        Session::save();
        $created = DB::table("feedback")
            ->insert([
                'ebook_id' => Session::get('book_id'),
                'user_name' => Session::get('user_name'),
                'user_email' => Session::get('user_email'),
                'user_address' => Session::get('user_address'),
                'qualification' => Session::get('qualification'),
                'age' => Session::get('age'),
                'gender' => Session::get('gender'),
                'message' => Session::get('message'),
                'created_at' => $date_time,
            ]);

        if ($created == 1) {
            return response()->json(['success' => true, 'message' => 'Information Store  Successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
    }
    public function ContactStore(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'user_name' => 'bail|required|string',
            'user_email' => 'required',
            'user_message' => 'required',
        ]);
        if (!$validator->passes()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->all()]);
        }

        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $user_name = $request->input('user_name');
        $user_email = $request->input('user_email');
        $user_message = $request->input('user_message');


        $created = DB::table("Contact")
            ->insert([
                'user_name' => $user_name,
                'user_email' => $user_email,
                'user_massage' => $user_message,
                'created_at' => $date_time,
            ]);

        if ($created == 1) {
            return response()->json(['success' => true, 'message' => 'Information Store  Successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
    }

    public function SessionStore()
    {
        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $data = DB::table("feedback")
            ->insert([
                'book_id' => Session::get('book_id'),
                'user_name' => Session::get('user_name'),
                'user_email' => Session::get('user_email'),
                'user_address' => Session::get('user_address'),
                'qualification' => Session::get('qualification'),
                'gender' => Session::get('gender'),
                'message' => Session::get('message'),
                'created_at' => $date_time,
            ]);

            if ($data == 1) {
                return response()->json(['success' => true, 'message' => 'FeedBack Send Successfully.']);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }

    }

    public function RatingStore(Request $request)
    {
        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $ReviewStore = DB::table('feedback')->insert([
            'book_id' => $request->input('book_id'),
            'message' => $request->input('review'),
            'rating' => $request->input('rate'),
            'created_at' => $date_time,
        ]);


        $Averagedata = DB::table('feedback')
        ->where('book_id',$request->input('book_id'))
        ->avg('rating');

        $data = DB::table('ebook')
        ->where('file_id',$request->input('book_id'))
        ->update([
            'avg_rating' => $Averagedata,
        ]);

        if ($data == 1) {
            return response()->json(['success' => true, 'message' => 'Rating  Send Successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
    }

    public function CountDuration(Request $request)
    {
        $unique_id = $request->input();

        date_default_timezone_set('Asia/Calcutta');
        $datetime = new DateTime();
        $date_now = $datetime->format('Y-m-d');
        $time_now = $datetime->format('H:i:s');
        $date_time = $datetime->format('Y-m-d') . ' ' . $datetime->format('H:i:s');

        $data = DB::table('ebook')
        ->where('unique_id',$unique_id)
        ->update([
            'view_duration' => $date_time,
        ]);
        if ($data != 0) {
            return response()->json(['success' => true, 'message' => 'Duration inserted successfully', 'file_id' => $request->input('file_id')]);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
    }
}
