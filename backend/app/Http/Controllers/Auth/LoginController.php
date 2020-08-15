<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string',
            'password' => 'required|string',
        ]);
        if (!$validator->fails()) {

            $user = User::where('username', $request->username)->first();
            if ($user) {
                if (Hash::check($request->password, $user->password)) {
                    $token = Str::random(60);
                    $user->token = $token;
                    $user->save();
                    $response = ['token' => $token, 'profile' => $user->profile];
                    return response($response, 200);
                }
            }
        }
        $response = ["message" => 'Invalid login'];
        return response($response, 401);
    }

    public function logout (Request $request) {
        $token = $request->toArray()['token'];
        $selectedUser = User::where('token',$token)->first();
        if($selectedUser){
            $selectedUser->token = '';
            $selectedUser->save();
        }
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }


}
