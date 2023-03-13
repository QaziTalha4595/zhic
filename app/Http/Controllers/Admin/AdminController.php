<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class AdminController extends Controller
{
    public function Login(Request $req)
    {
        return view('Admin.Login');
    }

    public function LoginUser(Request $req)
    { $validator = Validator::make($req->all(), [
        'email' => 'required|email',
        'password' => 'required'
    ]);

    if($validator->fails()) {
        return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
    }

    // $user = DB::table('users')->where(["admin_email" => $req->input('user_email')])->first();

    $data = $req->input();
    unset($data['_token']);
    if (Auth::attempt($data)) {
        $user = Auth::user();
        Session::put('admin_id', $user->id);
        Session::put('admin_name', $user->name);
        Session::put('admin_email', $user->email);
        Session::put('token',Hash::make(env('JWT_SECRET')));
        Session::save();
        return response()->json(["success" => true, "message" => "Login Successfull"]);
    }
    else{
    return response()->json(["success" => false, "message" => "Invalid Credential"]);
    }
}
}
