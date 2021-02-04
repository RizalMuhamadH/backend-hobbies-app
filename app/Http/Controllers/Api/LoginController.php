<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserCollection;
use App\Http\Resources\UserProfileResource;
use App\Http\Resources\UserResource;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{

    public function login(Request $request)
    {

        $validate = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        if ($validate->fails()) {
            return response([
                'meta' => [
                    'code' => 400,
                    'message' => $validate->errors()->first()
                ],
                'data' => null
            ], 200);
        }

        $credentials = request(['email', 'password']);
        if (!Auth::attempt($credentials)) {
            return response([
                'meta' => [
                    'code' => 400,
                    'message' => 'Unauthorized'
                ],
                'data' => null
            ], 200);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response([
                'meta' => [
                    'code' => 400,
                    'message' => 'The provided credentials are incorrect.'
                ]
            ], 200);
        }

        $user->notify_token = $request->token;
        $user->save();

        $user->tokens()->delete();

        $token = $user->createToken($request->device_name)->plainTextToken;

        return (new UserProfileResource($user))->additional([
            'meta' => [
                'code' => 200,
                'message' => 'Data found'
            ],
            'data' => [
                'token' => $token
            ]
        ])->response();
    }
}
