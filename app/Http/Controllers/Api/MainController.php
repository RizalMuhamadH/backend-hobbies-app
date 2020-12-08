<?php

namespace App\Http\Controllers\Api;

use App\Event;
use App\Http\Controllers\Controller;
use App\Http\Resources\EventWithoutBodyResource;
use App\Http\Resources\NewsWithoutBodyResource;
use App\News;
use App\User;
use Illuminate\Http\Request;

class MainController extends Controller
{
    public function main(User $user)
    {
        $news = NewsWithoutBodyResource::collection(News::with('newsCategory')->orderBy('id', 'desc')->limit(6)->get());
        $events = EventWithoutBodyResource::collection(Event::with('eventCategory')->orderBy('id', 'desc')->limit(6)->get());

        $response = [
            'data' => [
                'news' => $news,
                'events' => $events
            ],
            'meta' => [
                'code' => 200,
                'message' => 'Data found'
            ]
        ];

        return response($response, $response['meta']['code']);
    }
}
