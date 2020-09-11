<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'             => $this->id,
            'caption'        => $this->caption,
            'user'           => new UserResource($this->user),
            'place'          => new PlaceResource($this->place()->first()),
            'images'         => ImageResource::collection($this->images),
            'videos'         => VideoResource::collection($this->videos),
            'created_at'     => $this->created_at
        ];
    }
}
