<?php

namespace App\Http\Controllers\Api;

use App\Events\GroupCreated;
use App\Group;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    public function store(Request $request)
    {
        $group = Group::create(['name' => $request->name]);

        $users = collect($request->users);
        $users->push($request->user_id);

        $group->users()->attach($users);

        broadcast(new GroupCreated($group))->toOthers();

        return $group;
    }
}
