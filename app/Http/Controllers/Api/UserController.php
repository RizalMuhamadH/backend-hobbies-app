<?php

namespace App\Http\Controllers\Api;

use App\Geolocation;
use App\Http\Controllers\Controller;
use App\Http\Resources\GeolocationResource;
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

    public function profile(Request $request)
    {

        $user = User::where('id', $request->id)->first();
        if ($user) {
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

        return response($response, $response['meta']['code']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        if($user) return (new UserResource($user))->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();

        $response = [
            'data' => null,
            'meta' => [
                'code' => 400,
                'message' => 'Data not found'
            ]
        ];

        return response($response, $response['meta']['code']);

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

    public function updateName(Request $request, $id)
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

        return response($response, $response['meta']['code']);
    }

    public function updatePassword(Request $request, $id)
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

        return response($response, $response['meta']['code']);
    }

    public function updateAvatar(Request $request, $id)
    {
        $this->validate($request, [
            'avatar' => 'required|image|mimes:jpg,png,jpeg'
        ]);


        $user = User::where('email', $request->email)->first();

        if ($user) {
            $file = $request->file("avatar");
            $fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . $file->getClientOriginalExtension();

            Image::make($file)->save($this->path . '/' . $fileName);

            $user->update(["avatar" => "users/" . $fileName]);

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

        return response($response, $response['meta']['code']);
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

        return response($response, $response['meta']['code']);
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

        return response($response, $response['meta']['code']);
    }
}

// https://daengweb.id/upload-resize-image-di-laravel-57
