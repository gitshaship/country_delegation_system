<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function register (Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
             'username'=>'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string',
            'profile'=>'required|in:board,expert,trainer,competitor'
        ]);
        if ($validator->fails())
        {
            //return response(["message"=>"Data cannot be processed"], 422);
            return response($validator->errors(), 422);
        }
        $request['password']=Hash::make($request['password']);
        $request['remember_token'] = Str::random(10);
        $user = User::create($request->toArray());
        $response = ['message' => "user created successfully"];
        return response($response, 201);
    }

    public function __construct()
    {
        $this->middleware(['auth:api','api.board']);
    }
}
