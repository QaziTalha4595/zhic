<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAudiobookTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('audiobook', function (Blueprint $table) {
            $table->integer('audio_book_id')->primary();
            $table->bigInteger('sub_cat_id');
            $table->bigInteger('category_id');
            $table->string('unique_id');
            $table->bigInteger('location_id');
            $table->string('audio_book_name');
            $table->text('audio_book_file_attachment');
            $table->string('audio_view');
            $table->string('duration');
            $table->string('audio_book_isbn');
            $table->string('audio_book_author');
            $table->string('audio_book_notes');
            $table->string('status');
            $table->integer('test_case');
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
        Schema::dropIfExists('audiobook');
    }
}
