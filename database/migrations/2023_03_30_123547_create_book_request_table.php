<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookRequestTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_request', function (Blueprint $table) {
            $table->integer('request_id')->primary();
            $table->string('book_name');
            $table->string('user_name');
            $table->string('user_email');
            $table->string('user_nationality');
            $table->string('user_spoken');
            $table->string('user_message');
            $table->string('request_date');
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
        Schema::dropIfExists('book_request');
    }
}
