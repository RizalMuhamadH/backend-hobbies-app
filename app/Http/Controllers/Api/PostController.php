<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\ContentTypes\ImageHandler;
use App\Http\Controllers\ContentTypes\MultipleFileHandler;
use App\Http\Controllers\ContentTypes\MultipleImageHandler;
use App\Http\Controllers\Controller;
use App\Http\Resources\PostCommentResource;
use App\Http\Resources\PostResource;
use App\Image;
use App\Place;
use App\Post;
use App\User;
use App\Video;
use Illuminate\Http\Request;

class PostController extends Controller
{

    public function show($id)
    {
        $post = Post::find(1);

        if ($post) {
            return new PostCommentResource($post->with(['comments.replies'])->first());
        }

        return [];
    }

    public function store(Request $request)
    {
        // return $request;
        $user = User::find($request->id);

        $post = Post::create([
            'caption' => $request->caption,
            'user_id' => $user->id
        ]);

        if ($request->place != null) {
            $place = Place::where('name', $request->place['name'])->where('address', $request->place_address)->first();

            if ($place) {
                $post->place()->attach($place->id);
            } else {
                $post->place()->create([
                    'name'      => $request->place['name'],
                    'address'   => $request->place['address'],
                    'lat'       => $request->place['lat'],
                    'lng'       => $request->place['lng']
                ]);
            }
        }

        if ($request->hasFile('file_image')) {
            $path = (new ImageHandler($request, 'images', 'file_image', Image::class))->handle();

            $post->images()->create(['path' => $path]);
        }

        if ($request->file_images != null) {
            $paths = (new MultipleImageHandler($request, 'images', 'file_images', Image::class))->handle();
            $arr = json_decode($paths);
            foreach ($arr as $item) {
                $post->images()->create(['path' => $item]);
            }
        }

        if ($request->file_videos != null) {
            $paths = (new MultipleFileHandler($request, 'videos', 'file_videos', Video::class))->handle();
            $arr = json_decode($paths);
            foreach ($arr as $item) {
                $post->videos()->create(['path' => json_encode($item)]);
            }
        }

        return (new PostResource($post))->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();
    }

    public function update(Request $request, $id)
    {
        $post = Post::where('id', $request->post_id)->where('user_id', $id)->first();
        $oldPlace = $post->place()->first();

        if ($post) {
            $post->update(['caption' => $request->caption]);
        }

        if ($request->place_name != null || $request->place_name != '') {
            $place = Place::where('name', $request->place_name)->where('address', $request->place_address)->first();

            if (!$place) {
                $post->places()->create([
                    'name'      => $request->place_name,
                    'address'   => $request->place_address,
                    'lat'       => $request->place_lat,
                    'lng'       => $request->place_lng
                ]);
            } else if ($oldPlace != null) {
                if ($oldPlace->id != $place->id) {
                    $post->place()->detach();
                    $post->place()->attach($place->id);
                }
            } else {
                $post->place()->attach($place->id);
            }
        } else {
            if ($oldPlace != null) {
                $post->place()->detach();
            }
        }

        return (new PostResource($post))->additional(['meta' => [
            'code' => 200,
            'message' => 'Data found'
        ]])->response();
    }

    public function feed()
    {
        $post = Post::orderBy('created_at', 'desc')->get();

        return PostResource::collection($post);
    }

    public function feedFollowings($id, Request $request)
    {
        $user = User::find($id);

        if ($user) {
            $arr = [];
            foreach ($user->followings as $following) {
                array_push($arr, $following->id);
            }
            array_push($arr, $user->id);

            if ($request->page && $request->limit) {
                $post = Post::whereIn('user_id', $arr)->orderBy('created_at', 'desc')->paginate($request->limit)->appends(array('state' => $request->state, 'limit' => $request->limit));

                $posts = PostResource::collection($post);
                $posts->map(function ($v) use ($user) {
                    $v->me = $user;
                });
                return ($posts)->additional(['meta' => [
                    'code' => 200,
                    'message' => 'Data found'
                ]])->response();
            } else {

                $post = Post::whereIn('user_id', $arr)->orderBy('created_at', 'desc')->get();

                if ($post != '[]') {
                    $posts = PostResource::collection($post);
                    $posts->map(function ($v) use ($user) {
                        $v->me = $user;
                    });
                    return ($posts)->additional(['meta' => [
                        'code' => 200,
                        'message' => 'Data found'
                    ]])->response();
                }
            }


            $response = [
                'data' => [],
                'meta' => [
                    'code' => 500,
                    'message' => 'Data not found'
                ]
            ];

            return response($response, 200);
        }
    }

    public function likePost(Post $post, User $user)
    {
        $user->like($post);

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function unlikePost(Post $post, User $user)
    {
        $user->unlike($post);

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Successfully'
            ]
        ];

        return response($response, $response['meta']['code']);
    }

    public function destroy($id, $userId)
    {
        $post = Post::where('id', $id)->where('user_id', $userId)->first();

        if ($post) {
            $post->delete();

            return (new PostResource($post))->additional(['meta' => [
                'code' => 200,
                'message' => 'Delete successfuly'
            ]])->response();
        }

        $response = [
            'data' => null,
            'meta' => [
                'code' => 200,
                'message' => 'Delete Failed'
            ]
        ];

        return response($response, $response['meta']['code']);
    }
}
