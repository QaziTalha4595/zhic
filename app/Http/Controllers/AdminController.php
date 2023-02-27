<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Validator;
use DB;
use Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function Login(Request $req)
    {
        return $env('JWT_SECRET');
        $data = ["name"=>"talha", "password"=> ("4595"), "email"=> "talha@gmail.com"];
        // User::create($data);
        if (Auth::attempt($data)) {
            // Get the authenticated user
            $user = Auth::user();

            // Generate a new personal access token for the user
            // $token = $user->createToken('My Token')->accessToken;

            // Use the token as needed
            return response()->json(['token' => $token]);
        }
        return view('Admin.Login');
    }

    public function LoginUser(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'user_email' => 'required|email',
            'user_password' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
        }

        $user = DB::table('users')->where(["admin_email"=> $req->input('user_email')])->first();
        if(!$user){
        return response()->json(["success" => false, "message" => "Invalid Credential"]);
        }

        if(Hash::check($req->input('user_password'), $user->admin_password)){
            Session::put('admin_id', $user->admin_id);
            Session::put('admin_name', $user->admin_name);
            Session::put('admin_email', $user->admin_email);
            Session::save();
            return response()->json(["success" => true, "message" => "Login Successfull"]);
        }
        else{
            return response()->json(["success" => false, "message" => "Invalid Credential"]);
        }
    }
}
