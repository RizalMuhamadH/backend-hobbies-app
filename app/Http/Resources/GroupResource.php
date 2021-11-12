<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GroupResource extends JsonResource
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
            'id'           => $this->id,
            'name'         => $this->name,
            'description'  => $this->description,
            'image'        => $this->image->path,
            'private'      => $this->private,
            'settings'     => $this->settings,
            'members'      => UserResource::collection($this->users),
            'admin'        => new UserResource($this->user),
        ];
    }
}
