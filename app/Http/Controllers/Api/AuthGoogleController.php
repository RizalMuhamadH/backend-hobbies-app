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
            return (new UserProfileResource($user))->additional([
                'meta' => [
                    'code' => 200,
                    'message' => 'Register successfuly'
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
    
            return (new UserProfileResource($user))->additional([
                'meta' => [
                    'code' => 200,
                    'message' => 'Register successfuly'
                ]
            ])->response();
        }
    }
}
