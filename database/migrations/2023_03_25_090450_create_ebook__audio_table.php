<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEbookAudioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ebook__audio', function (Blueprint $table) {
            $table->integer('audio_id')->primary();
            $table->integer('file_id');
            $table->longText('audio_title');
            $table->string('audio_file');
            $table->string('audio_link');
            $table->integer('audio_position');
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
        Schema::dropIfExists('ebook__audio');
    }
}
