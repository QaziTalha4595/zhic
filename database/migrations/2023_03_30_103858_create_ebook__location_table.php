<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEbookLocationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ebook__location', function (Blueprint $table) {
            $table->integer('location_id')->primary();
            $table->string('user_name');
            $table->string('user_email');
            $table->string('user_address');
            $table->string('qualification');
            $table->string('gender');
            $table->string('age');
            $table->string('ip_address');
            $table->string('city');
            $table->string('location');
            $table->string('view_duration');
            $table->string('file_id');
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
        Schema::dropIfExists('ebook__location');
    }
}
