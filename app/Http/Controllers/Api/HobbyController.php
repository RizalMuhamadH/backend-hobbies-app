<?php

namespace App\Http\Controllers\Api;

use App\Hobby;
use App\Http\Controllers\Controller;
use App\Http\Resources\HobbyResource;
use App\Http\Resources\UserProfileResource;
use App\User;
use Illuminate\Http\Request;

class HobbyController extends Controller
{
    public function getHobbies()
    {
        $hobbies = Hobby::with('children')->where('parent_id', null)->get();

        if ($hobbies) return HobbyResource::collection($hobbies)->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();


        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function choiceHobby(Request $request, User $user)
    {
        $user->hobbies()->attach($request->hobbies);

        return (new UserProfileResource($user))->additional([
            'meta' => [
                'code' => 200,
                'message' => 'Data found'
            ]
        ])->response();
    }
}
