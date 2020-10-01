<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Place extends Model
{

    protected $guarded = [];

    public function posts()
    {
        return $this->morphedByMany(Post::class, 'placeable');
    }

    public function discoveries()
    {
        return $this->morphedByMany(Discovery::class, 'placeable');
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }
}
