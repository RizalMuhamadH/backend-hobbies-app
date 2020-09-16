<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('description');
            $table->text('body');
            $table->unsignedBigInteger('news_category_id');
            $table->unsignedBigInteger('admin_id');
            $table->string('status')->default('DRAFT');
            // $table->string('slug');
            // $table->string('meta_description');
            // $table->string('meta_keywords');
            // $table->string('seo_title');
            $table->timestamps();

            $table->foreign('news_category_id')->references('id')->on('news_categories');
            $table->foreign('admin_id')->references('id')->on('admins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('news');
    }
}
