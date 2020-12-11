<?php

namespace App\Traits;

use App\Like;
use Illuminate\Database\Eloquent\Model;

trait Liker
{
    /**
     * @param \Illuminate\Database\Eloquent\Model $object
     * @return Like|null
     */
    public function like(Model $object)
    {
        /* @var \Overtrue\LaravelLike\Traits\Likeable $object */
        if (!$this->hasLiked($object)) {
            $like = app(Like::class);
            $like->{'user_id'} = $this->getKey();

            $object->likes()->save($like);
        }

        return null;
    }

    /**
     * @param \Illuminate\Database\Eloquent\Model $object
     * @return null
     */
    public function unlike(Model $object)
    {
        $relation = $object->likes()
            ->where('likeable_id', $object->getKey())
            ->where('likeable_type', $object->getMorphClass())
            ->where(config('user_id'), $this->getKey())
            ->first();

        if ($relation) {
            $relation->delete();
        }
    }

    /**
     * @param \Illuminate\Database\Eloquent\Model $object
     * @return Like|null
     */
    public function toggleLike(Model $object)
    {
        return $this->hasLiked($object) ? $this->unlike($object) : $this->like($object);
    }

    /**
     * @param \Illuminate\Database\Eloquent\Model $object
     *
     * @return bool
     */
    public function hasLiked(Model $object)
    {
        return ($this->relationLoaded('likes') ? $this->likes : $this->likes())
            ->where('likeable_id', $object->getKey())
            ->where('likeable_type', $object->getMorphClass())
            ->count() > 0;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function likes()
    {
        return $this->hasMany(Like::class, 'user_id', $this->getKeyName());
    }
}
