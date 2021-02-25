<?php

namespace App\Http\Controllers\Api;

use App\Events\UserFollow;
use App\Geolocation;
use App\Http\Controllers\ContentTypes\ImageHandler;
use App\Http\Controllers\Controller;
use App\Http\Resources\GeolocationResource;
use App\Http\Resources\PostResource;
use App\Http\Resources\UserProfileResource;
use App\Http\Resources\UserResource;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Intervention\Image\Facades\Image;

class UserController extends Controller
{

    public $path;
    public $dimensions;

    public function __construct()
    {
        $this->path = storage_path('app/public/users');
        $this->dimensions = ['245', '300', '500'];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        return User::orderBy('name')->where('id', '!=', $id)->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    public function profile(User $me, User $user)
    {

        if ($user) {
            return (new UserProfileResource($user))->additional([
                'meta' => [
                    'code' => 200,
                    'message' => 'Data found'
                ], "data" => [
                    "following" => $me->id == $user->id ? false : $me->isFollowing($user->id),
                    "post_collection" => PostResource::collection($user->posts()->get())
                ]
            ])->response();
        }

        $response = [
            'data' => null,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $me, User $user)
    {

        if ($user) return (new UserProfileResource($user))->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ], "data" => [
            "following" => $me->isFollowing($user->id)
        ]])->response();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 400,
                'message' => 'Data not found'
            ]
        ];

        return response($response, 200);
    }

    public function userProfile(User $me, User $user)
    {

        if ($user) return (new UserProfileResource($user))->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ], "data" => [
            "following" => $me->isFollowing($user->id)
        ]])->response();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 400,
                'message' => 'Data not found'
            ]
        ];

        return response($response, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        if ($user) {
        }
    }

    public function updateName(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if ($user) {
            $user->update(["name" => $request->name]);

            return (new UserProfileResource($user))->additional(['meta' => [
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

        return response($response, 200);
    }

    public function updatePassword(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if ($user) {
            $user->update(["password" => bcrypt($request->password)]);

            return (new UserProfileResource($user))->additional(['meta' => [
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

        return response($response, 200);
    }

    public function updateAvatar(Request $request)
    {
        // $this->validate($request, [
        //     'avatar' => 'required|image|mimes:jpg,png,jpeg'
        // ]);


        $user = User::where('email', $request->email)->first();

        if ($user) {

            $path = (new ImageHandler($request, 'users', 'avatar', Image::class))->handle();

            // $file = $request->file("avatar");
            // $fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . $file->getClientOriginalExtension();

            // Image::make($file)->save($this->path . '/' . $fileName);

            $user->avatar = $path;
            $user->save();

            return (new UserProfileResource($user))->additional(['meta' => [
                'code' => 200,
                'message' => 'Data found'
            ]])->response();
        }

        $response = [
            'data' => $request->email,
            'meta' => [
                'code' => 500,
                'message' => 'Data not found'
            ]
        ];

        return response($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getGeolocation(Request $request)
    {
        $geo = Geolocation::whereIn('id', json_decode($request->users))->orderBy('created_at', 'desc')->get();

        if ($geo != '[]') return GeolocationResource::collection($geo)->additional(['meta' => [
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

        return response($response, 200);
    }

    public function setGeolocation(Request $request)
    {
        $user = User::find($request->id);

        if ($user) {
            if ($user->geolocation) {
                $user->geolocation()->update([
                    'status'        => $request->status,
                    'shared'        => $request->shared,
                    'lat'           => $request->lat,
                    'lng'           => $request->lng
                ]);
            } else {
                $user->geolocation()->create([
                    'status'        => $request->status,
                    'shared'        => $request->shared,
                    'lat'           => $request->lat,
                    'lng'           => $request->lng
                ]);
            }
            return GeolocationResource::collection($user->geolocation)->additional(['meta' => [
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

        return response($response, 200);
    }

    public function followUser(User $user, User $follow)
    {
        // $private = $follow->settings['private'] == null || $follow->settings['private'] == false ? false : true;

        // if ($private) {
        //     $user->toggleFollow($follow);
        // } else {
        //     $user->follow($follow);
        // }

        $user->follow($follow);

        $request = ['user_request' => $user, 'user_follow' => $follow];
        // broadcast(new UserFollow($request))->toOthers();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function acceptFollowRequest(User $user, User $from)
    {
        $user->acceptFollowRequestFrom($from);

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function rejectFollowRequest(User $user, User $from)
    {
        $user->rejectFollowRequestFrom($from);

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function unfollowUser(User $user, User $unfollow)
    {

        $user->unfollow($unfollow);

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function listUser(User $user)
    {
        $users = User::where("id", "!=", $user->id)->orderBy("id", "desc")->paginate(15);



        $users->map(function ($v) use ($user) {
            $v->me = $user;
        });
        return ($users)->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();
    }

    public function searchUsers(User $user, $search)
    {
        $users = User::where("id", "!=", $user->id)->where("name", "like", "%" . $search . "%")->orderBy("id", "desc")->limit(20)->get();

        if (count($users) != 0) {
            $list = UserResource::collection($users);
            $list->map(function ($v) use ($user) {
                $v->me = $user;
            });
            return ($list)->additional(['meta' => [
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

        return response($response, 200);
    }

    public function userFollowings(User $user)
    {
        if (count($user->followings) != 0) {
            $friends = UserResource::collection($user->followings);

            return ($friends)->additional(['meta' => [
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

        return response($response, 200);
    }
}

// https://daengweb.id/upload-resize-image-di-laravel-57
