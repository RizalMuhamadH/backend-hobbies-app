<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EventResource extends JsonResource
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
            'start'           => $this->start,
            'end'             => $this->end,
            'category'        => new EventCategoryResource($this->category),
            'body'            => $this->body,
            'image'           => new ImageResource($this->image),
            'author'          => new AdminResource($this->author)
        ];
    }
}
