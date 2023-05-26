<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAudiobookCover extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('audiobook__cover', function (Blueprint $table) {
            $table->integer('audio_book_cover_id')->primary();
            $table->integer('file_id');
            $table->longText('audio_book_cover');
            $table->integer('audio_book_position');
            $table->string('audio_book_bg_color');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('audiobook__cover');
    }
}
