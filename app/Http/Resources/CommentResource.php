<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CommentResource extends JsonResource
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
            'parent_id'      => $this->parent_id,
            'user'           => new UserResource($this->user),
            'comment'        => $this->comment,
            $this->whenLoaded('replies') == null ? '' :
                'replies'        => CommentResource::collection($this->whenLoaded('replies')),
            'created_at'     => $this->created_at
        ];
    }
}
