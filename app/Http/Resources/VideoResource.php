<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class VideoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $data = json_decode($this->path);
        return [
            'id'            => $this->id,
            'path'          => $data->download_link,
            'name'          => $this->original_name,
            'created_at'    => $this->created_at
        ];
    }
}
