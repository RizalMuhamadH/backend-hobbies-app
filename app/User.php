<?php

namespace App;

use App\Traits\HasGroups;
use App\Traits\Liker;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Overtrue\LaravelFollow\Followable;
use Overtrue\LaravelSubscribe\Traits\Subscriber;

class User extends \TCG\Voyager\Models\User
{
    use Notifiable;
    use HasApiTokens;
    use Subscriber;
    use Followable;
    use Liker;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'notify_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function chats()
    {
        return $this->hasMany(Chat::class, 'receiver_id');
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function groups()
    {
        return $this->belongsToMany(Group::class, 'group_user');
    }

    public function ownerGroups()
    {
        return $this->hasMany(Group::class);
    }

    public function geolocation()
    {
        return $this->hasOne(Geolocation::class);
    }
}
