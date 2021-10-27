<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Overtrue\LaravelSubscribe\Traits\Subscribable;

class Hobby extends Model
{
    use Subscribable;

    public function users()
    {
        return $this->morphedByMany(User::class, 'hobbyable');
    }

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }

    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id');
    }
}
