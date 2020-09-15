<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $guarded = [];

    public function eventCategory()
    {
        return $this->belongsTo(EventCategory::class);
    }

    public function image()
    {
        return $this->morphOne(Image::class, 'imageable');
    }

    public function author()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
