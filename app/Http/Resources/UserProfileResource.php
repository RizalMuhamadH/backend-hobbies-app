<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserProfileResource extends JsonResource
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
            'phone'          => $this->phone,
            'avatar'        => $this->avatar,
            'notify_token'  => $this->notify_token,
            // 'tokens'        => new UserTokenResource($this->tokens()->first()),
            'followings'    => $this->followings()->count(),
            'followers'     => $this->followers()->count(),
            'posts'         => $this->posts()->count()
        ];
    }
}
