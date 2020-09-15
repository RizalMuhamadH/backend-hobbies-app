<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class NewsResource extends JsonResource
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
            'id'              => $this->id,
            'title'           => $this->title,
            'description'     => $this->description,
            'body'            => $this->body,
            'category'        => new NewsCategoryResource($this->whenLoaded('newsCategory')),
            'image'           => new ImageResource($this->image),
            'author'          => new AdminResource($this->author),
        ];
    }
}
