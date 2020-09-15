<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    public function image()
    {
        return $this->morphOne(Image::class, 'imageable');
    }

    public function newsCategory()
    {
        return $this->belongsTo(NewsCategory::class);
    }


    public function author()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
