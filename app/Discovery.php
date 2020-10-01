<?php

namespace App;

use App\Traits\Rateable;
use Illuminate\Database\Eloquent\Model;

class Discovery extends Model
{
    use Rateable;
    protected $guarded = [];

    public function place()
    {
        return $this->morphToMany(Place::class, 'placeable');
    }
}
