<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'id'            => $this->id,
            'name'          => $this->name,
            'email'         => $this->email,
            'avatar'        => $this->avatar,
            'uid'           => $this->google_token,
            'notify_token'  => $this->notify_token,
            'following'     => $this->when(property_exists($this, 'me'), function () {
                return $this->isFollowing($this->me);
            })
        ];
    }
}
