<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GeolocationResource extends JsonResource
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
            'id'        => $this->id,
            'user'      => new UserResource($this->user),
            'status'    => $this->status,
            'shared'    => $this->shared,
            'lat'       => $this->lat,
            'lng'       => $this->lng,
            'date'      => $this->update_at
        ];
    }
}
