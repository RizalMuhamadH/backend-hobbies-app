<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EventWithoutBodyResource extends JsonResource
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
            $this->whenLoaded('eventCategory') == null ? '' :
                'category'        => new EventCategoryResource($this->whenLoaded('eventCategory')),
            'image'           => new ImageResource($this->image),
            'author'          => new AdminResource($this->author)
        ];
    }
}
