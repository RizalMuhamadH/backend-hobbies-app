<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserProfileResource;
use App\User;
use Illuminate\Http\Request;

class AuthGoogleController extends Controller
{
    public function auth(Request $request)
    {
        $user = User::where('google_token', $request->uid)->first();

        if($user) {

            $user->notify_token = $request->token;
            $user->save();
                
            $user->tokens()->delete();

            $token = $user->createToken($request->device_name)->plainTextToken;

            return (new UserProfileResource($user))->additional([
                'meta' => [
                    'code' => 200,
                    'message' => 'Register successfuly'
                ],
                'data' => [
                    'status' => 'exist',
                    'token' => $token
                ]
            ])->response();
        } else {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'avatar' => $request->avatar,
                'google_token' => $request->uid,
                'notify_token' => $request->notify,
    
            ]);
            $token = $user->createToken($request->device_name)->plainTextToken;
    
            return (new UserProfileResource($user))->additional([
                'meta' => [
                    'code' => 200,
                    'message' => 'Register successfuly'
                ],
                'data' => [
                    'status' => 'new',
                    'token' => $token
                ]
            ])->response();
        }
    }
}
