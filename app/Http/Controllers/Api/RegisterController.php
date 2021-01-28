<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserProfileResource;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function store(Request $request)
    {
        // $this->validate($request, [
        //     'name' => 'required|string|max:255',
        //     'email' => 'required|string|email|max:255|unique:users',
        //     'password' => 'required|string|min:6',
        // 'notify_token' => 'required|string',
        // ]);

        $validate = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        if ($validate->fails()) {
            return response([
                'meta' => [
                    'code' => 400,
                    'message' => $validate->errors()->first()
                ]
            ], 200);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),

        ]);

        return (new UserProfileResource($user))->additional([
            'meta' => [
                'code' => 200,
                'message' => 'Register successfuly'
            ]
        ])->response();

        // return response([
        //     'meta' => [
        //         'code' => 200,
        //         'message' => 'Register successfuly'
        //     ],
        //     'data' => $user
        // ], 200);
    }
}
