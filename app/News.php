<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function category()
    {
        return $this->belongsTo(NewsCategory::class);
    }
}
