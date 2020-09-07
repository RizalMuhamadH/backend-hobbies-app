<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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

    public function profile(User $user)
    {
        $response = [
            'code' => 200,
            'data' => new UserResource($user)
        ];

        return response($response, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

            $response = [
                'code' => 200,
                'data' => new UserResource($user)
            ];
        } else {
            $response = [
                'code' => 500,
                'data' => null
            ];
        }

        return response($response, $response->code);
    }

    public function updatePassword(Request $request, $id)
    {
        $user = User::where('email', $request->email)->first();

        if ($user) {
            $user->update(["password" => bcrypt($request->password)]);

            $response = [
                'code' => 200,
                'data' => new UserResource($user)
            ];
        } else {
            $response = [
                'code' => 500,
                'data' => null
            ];
        }

        return response($response, $response->code);
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

            $response = [
                'code' => 200,
                'data' => new UserResource($user)
            ];
        } else {
            $response = [
                'code' => 500,
                'data' => null
            ];
        }

        return response($response, $response->code);
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
}

// https://daengweb.id/upload-resize-image-di-laravel-57
