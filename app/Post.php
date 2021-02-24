<?php

namespace App;

use App\Traits\Likeable;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use Likeable;

    protected $fillable = ['caption', 'user_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->morphMany(Comment::class, 'commentable')->whereNull('parent_id')->orderBy('created_at', 'desc');
    }

    public function commentCount()
    {
        return $this->morphMany(Comment::class, 'commentable')->count();
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }

    public function videos()
    {
        return $this->morphMany(Video::class, 'videoable');
    }

    public function place()
    {
        return $this->morphToMany(Place::class, 'placeable');
    }
}
