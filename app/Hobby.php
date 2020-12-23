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
}
