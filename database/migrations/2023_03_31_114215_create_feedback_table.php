<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeedbackTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feedback', function (Blueprint $table) {
            $table->integer('feedback_id')->primary();
            $table->integer('book_id')->nullable();
            $table->string('user_name')->nullable();
            $table->string('user_email')->nullable();
            $table->string('user_address')->nullable();
            $table->string('qualification')->nullable();
            $table->text('gender')->nullable();
            $table->string('message')->nullable();
            $table->float('rating')->nullable();
            $table->longText('age')->nullable();
            $table->string('reader_action')->nullable();
            $table->string('send_date');
            $table->longText('feedback_token')->nullable();
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
        Schema::dropIfExists('feedback');
    }
}
