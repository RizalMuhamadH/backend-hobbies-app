<?php

namespace App;

use Groups;
use Illuminate\Database\Eloquent\Model;

class GroupRequest extends Model
{
    protected $fillable = ['user_id', 'group_id'];

    public function group()
    {
        return $this->belongsTo(Group::class, 'group_id');
    }

    public function sender()
    {
        return $this->belongsTo(Groups::userModel(), 'user_id');
    }
}
