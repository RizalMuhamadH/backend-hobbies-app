<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Image;
use App\Place;
use App\Post;
use App\User;
use Illuminate\Http\Request;
use ImageHandler;

class PostController extends Controller
{
    public function store(Request $request)
    {
        $user = User::find($request->id);

        $post = Post::create([
            'caption' => $request->caption,
            'user_id' => $user->id
        ]);

        $place = Place::where('name', $request->place_name)->where('address', $request->place_address)->first();

        if ($place) {
            $post->places()->attach($place->id);
        } else {
            $post->places()->create([
                'name'      => $request->place_name,
                'address'   => $request->place_address,
                'lat'       => $request->place_lat,
                'lng'       => $request->place_lng
            ]);
        }

        $path = (new ImageHandler($request, 'images', 'file_image', Image::class))->handle();

        $post->images()->create(['path' => $path]);

        return response('success');
    }

    public function update(Request $request, $id)
    {
        # code...
    }
}
