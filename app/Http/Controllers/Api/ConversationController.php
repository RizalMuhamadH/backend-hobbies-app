<?php

namespace App\Http\Controllers\Api;

use App\Conversation;
use App\Events\NewMessage;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ConversationController extends Controller
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
