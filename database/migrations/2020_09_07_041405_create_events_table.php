<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('description');
            $table->text('body');
            $table->dateTime('start');
            $table->dateTime('end');
            $table->unsignedBigInteger('event_categories_id');
            $table->unsignedBigInteger('admins_id');
            $table->timestamps();

            $table->foreign('event_categories_id')->references('id')->on('event_categories');
            $table->foreign('admins_id')->references('id')->on('admins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
