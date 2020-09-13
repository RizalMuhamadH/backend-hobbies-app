<?php

namespace App\Http\Controllers\Api;

use App\Events\GroupCreated;
use App\Group;
use App\Http\Controllers\Controller;
use App\Http\Resources\GroupResource;
use App\Http\Resources\UserResource;
use App\User;
use Illuminate\Http\Request;
use ImageHandler;

class GroupController extends Controller
{
    public function store(Request $request)
    {
        $path = '';
        if ($this->request->hasFile('file_image')) {
            $path = (new ImageHandler($request, 'images', 'file_image', Image::class))->handle();

        }

        $group = Group::create([
            'name' => $request->name,
            'description' => $request->description,
            'user_id' => $request->user_id,
            'image'   => $path,
            'private' => $request->private,
            'settings' => $request->settings
        ]);

        $group->addMembers(json_decode($request->users, true));

        broadcast(new GroupCreated($group))->toOthers();

        return $group;

    }

    public function update(Request $request, $groupId)
    {
        $group = Group::find($groupId);

        if($group){
            $path = $group->image;
            if ($this->request->hasFile('file_image')) {
                $path = (new ImageHandler($request, 'images', 'file_image', Image::class))->handle();

            }

            $group->update([
                'name' => $request->name,
                'description' => $request->description,
                'user_id' => $request->user_id,
                'image'   => $path,
                'private' => $request->private,
                'settings' => $request->settings
            ]);
        }

        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function getMembers($groupId)
    {
        $group = Group::find($groupId);

        if($group) return UserResource::collection($group->users)->additional(['meta' => [
                'code' => 200,
                'message' => 'Data found'
            ]])->response();

            $response = [
                'data' => null,
                'meta' => [
                    'code' => 500,
                    'message' => 'Data not found'
                ]
            ];

            return response($response, $response['meta']['code']);
    }

    public function addMembers(Request $request, $groupId)
    {
        $group = Group::find($groupId);

        if($group) {
            $group->addMembers(json_decode($request->users));

            return UserResource::collection($group->users)->additional(['meta' => [
                'code' => 200,
                'message' => 'Data found'
            ]])->response();
        }

        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function leaveGroup(Request $request, $groupId)
    {
        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        $group = Group::find($groupId);

        if($group) {
            $group->leave(json_decode($request->users));

            $response = [
                'data' => null,
                'meta' => [
                    'code' => 200,
                    'message' => 'Leave successfuly'
                ]
            ];
        }

        return response($response, $response['meta']['code']);
    }

    public function userGroups($userId)
    {
        $user = User::find($userId);

        if($user) return GroupResource::collection($user->ownerGroups)->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function requestJoinGroup(Request $request, $groupId)
    {

        $response = [
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        $group = Group::find($groupId);

        if($group){
            $group->request($request->user_id);

            $response = [
                'meta' => [
                    'code' => 200,
                    'message' => 'request join group succcessfuly'
                ]
            ];
        }

        return response($response, $response['meta']['code']);
    }

    public function acceptJoinGroup(Request $request, $groupId)
    {

        $response = [
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        $group = Group::find($groupId);

        if($group){
            $group->acceptRequest($request->user_id);

            $response = [
                'meta' => [
                    'code' => 200,
                    'message' => 'Accept join group succcessfuly'
                ]
            ];
        }

        return response($response, $response['meta']['code']);
    }


    public function declineJoinGroup(Request $request, $groupId)
    {

        $response = [
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        $group = Group::find($groupId);

        if($group){
            $group->declineRequest($request->user_id);

            $response = [
                'meta' => [
                    'code' => 200,
                    'message' => 'Decline request join group succcessfuly'
                ]
            ];
        }

        return response($response, $response['meta']['code']);
    }

    public function requestGroups($groupId)
    {
        $group = Group::find($groupId);

        if($group) return UserResource::collection($group->requests)->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }
}
