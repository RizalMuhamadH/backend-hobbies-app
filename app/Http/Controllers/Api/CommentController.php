<?php

namespace App\Http\Controllers\Api;

use App\Comment;
use App\Http\Controllers\Controller;
use App\Http\Resources\CommentResource;
use App\Post;
use App\User;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request)
    {

        $user = User::find($request->id);

        $comment = new Comment();

        $comment->comment = $request->comment;

        $comment->user()->associate($user);

        $post = Post::find($request->post_id);

        $post->comments()->save($comment);

        return (new CommentResource($comment))->additional(['meta' => [
            'code' => 200,
            'message' => 'Successfuly'
        ]])->response();;
    }

    public function replyStore(Request $request)
    {
        $user = User::find($request->id);

        $reply = new Comment();

        $reply->comment = $request->get('comment');

        $reply->user()->associate($user);

        $reply->parent_id = $request->get('comment_id');

        $post = Post::find($request->get('post_id'));

        $post->comments()->save($reply);

        return (new CommentResource($reply))->additional(['meta' => [
            'code' => 200,
            'message' => 'Successfuly'
        ]])->response();;
    }

    public function index()
    {
        $post = Post::find(1);
        return new CommentResource($post->comments()->first());
    }

    public function postComments(Post $post)
    {
        $comments = $post->comments()->get();
        if (count($comments) > 0)
            return CommentResource::collection($comments)->additional(['meta' => [
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
}
