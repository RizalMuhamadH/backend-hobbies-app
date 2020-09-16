<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Traits\Translatable;

class News extends Model
{

    use Translatable;

    public function save(array $options = [])
    {
        // If no author has been assigned, assign the current user's id as the author of the post
        if (!$this->admin_id && Auth::user()) {
            $this->admin_id = Auth::user()->getKey();
        }

        return parent::save();
    }

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
