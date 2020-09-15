<?php

namespace App\Http\Controllers\Api;

use App\Event;
use App\EventCategory;
use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\EventCategoryResource;
use App\Http\Resources\EventCollection;
use App\Http\Resources\EventResource;
use Illuminate\Http\Request;

class EventController extends Controller
{
    public function index()
    {
        return (new EventCollection(Event::with('eventCategory')->orderBy('id', 'desc')->paginate(15)))->response();
    }

    public function show($id)
    {
        $event = Event::find($id);

        if ($event) return (new EventResource($event))->additional(['meta' => [
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

    public function category($catId)
    {
        $category = EventCategory::with(['events'])->find($catId);

        if ($category) return (new EventCategoryResource($category))->additional(['meta' => [
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


    public function categories()
    {
        $categories = EventCategory::all();

        if ($categories) return EventCategoryResource::collection($categories)->additional(['meta' => [
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
