<?php

namespace App\Traits;

use App\Rating;

trait Rateable
{
    /**
     * This model has many ratings.
     *
     * @param mixed $rating
     * @param mixed $value
     *
     * @return Rating
     */
    public function rate($value, $user_id)
    {
        $rating = new Rating();
        $rating->rating = $value;
        $rating->user_id = $user_id;

        $this->ratings()->save($rating);
    }

    public function rateOnce($value, $user_id)
    {
        $rating = Rating::query()
            ->where('rateable_type', '=', get_class($this))
            ->where('rateable_id', '=', $this->id)
            ->where('user_id', '=', $user_id)
            ->first();

        if ($rating) {
            $rating->rating = $value;
            $rating->save();
        } else {
            $this->rate($value, $user_id);
        }
    }

    public function ratings()
    {
        return $this->morphMany(Rating::class, 'rateable');
    }

    public function averageRating()
    {
        return $this->ratings()->avg('rating');
    }

    public function sumRating()
    {
        return $this->ratings()->sum('rating');
    }

    public function timesRated()
    {
        return $this->ratings()->count();
    }

    public function usersRated()
    {
        return $this->ratings()->groupBy('user_id')->pluck('user_id')->count();
    }

    public function userAverageRating($user_id)
    {
        return $this->ratings()->where('user_id', $user_id)->avg('rating');
    }

    public function userSumRating($user_id)
    {
        return $this->ratings()->where('user_id', $user_id)->sum('rating');
    }

    public function ratingPercent($max = 5)
    {
        $quantity = $this->ratings()->count();
        $total = $this->sumRating();

        return ($quantity * $max) > 0 ? $total / (($quantity * $max) / 100) : 0;
    }

    // Getters

    public function getAverageRatingAttribute()
    {
        return $this->averageRating();
    }

    public function getSumRatingAttribute()
    {
        return $this->sumRating();
    }

    public function getUserAverageRatingAttribute($user_id)
    {
        return $this->userAverageRating($user_id);
    }

    public function getUserSumRatingAttribute($user_id)
    {
        return $this->userSumRating($user_id);
    }
}
