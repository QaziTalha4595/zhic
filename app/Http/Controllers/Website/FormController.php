<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Website\Form;


class FormController extends Controller
{
    public function store(Request $req){
        $validator = Validator::make($req->all(), [
            'book_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'user_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'user_email' => 'required|unique:users,email_address',
            'user_nationality' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'user_spoken' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'user_message' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        try {
            $Form = Form::Create(
                ['request_id '   => $req->input('cat_id')],
                ['book_name' => $req->get('book_name')],
                ['user_name' => $req->get('user_name')],
                ['user_email' => $req->get('user_email')],
                ['user_nationality' => $req->get('user_nationality')],
                ['user_spoken' => $req->get('user_spoken')],
                ['user_message' => $req->get('user_message')]
            );
            return response()->json(["success" => true, "message" => "Form Detail Create Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
}
