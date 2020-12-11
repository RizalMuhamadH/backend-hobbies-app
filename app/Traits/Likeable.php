<?php

namespace App\Traits;

use App\Like;
use App\User;
use Illuminate\Database\Eloquent\Model;

trait Likeable
{
    /**
     * @param \Illuminate\Database\Eloquent\Model $user
     *
     * @return bool
     */
    public function isLikedBy(Model $user)
    {
        if (is_a($user, User::class)) {
            if ($this->relationLoaded('likers')) {
                return $this->likers->contains($user);
            }

            return ($this->relationLoaded('likes') ? $this->likes : $this->likes())
                ->where('user_id', $user->getKey())->count() > 0;
        }

        return false;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\MorphMany
     */
    public function likes()
    {
        return $this->morphMany(Like::class, 'likeable');
    }

    /**
     * Return followers.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function likers()
    {
        return $this->belongsToMany(
            User::class,
            'likes',
            'likeable_id',
            'user_id'
        )
            ->where('likeable_type', $this->getMorphClass());
    }
}
