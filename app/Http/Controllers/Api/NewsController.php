<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\NewsCategoryResource;
use App\Http\Resources\NewsResource;
use App\News;
use App\NewsCategory;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function index()
    {
        return NewsResource::collection(News::with('newsCategory')->orderBy('id', 'desc')->paginate(15))->response();
    }

    public function show($id)
    {
        $news = News::find($id);

        if ($news) return (new NewsResource($news))->additional(['meta' => [
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
        $category = NewsCategory::with(['news'])->find($catId);

        if ($category) return (new NewsCategoryResource($category))->additional(['meta' => [
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
        $categories = NewsCategory::all();

        if ($categories) return NewsCategoryResource::collection($categories)->additional(['meta' => [
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
