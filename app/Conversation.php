<?php

namespace App;

use App\Events\NewMessage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;

class Conversation extends Model
{
    public function store(Request $request)
    {
        $conversation = Conversation::create([
            'message' => $request('message'),
            'group_id' => $request('group_id'),
            'user_id' => $request->user_id,
        ]);

        broadcast(new NewMessage($conversation))->toOthers();

        return $conversation->load('user');
    }
}
