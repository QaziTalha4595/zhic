<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEbookCoverTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ebook__cover', function (Blueprint $table) {
            $table->ebook__cover_id();
            $table->integer('file_id');
            $table->longText('ebook__cover');
            $table->integer('ebook_position');
            $table->string('ebook_bg_color');
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
        Schema::dropIfExists('ebook__cover');
    }
}
