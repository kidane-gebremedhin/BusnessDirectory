<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateofficesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offices', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('buildingId');
            $table->integer('categoryId');
            $table->integer('letterId');
            $table->string('name');
            $table->string('level');
            $table->binary('image');
            $table->string('number');
            $table->double('longitude');
            $table->double('latitude');
            $table->string('description')->nullable();
            $table->string('isApproved')->default('false');
            $table->integer('createdByUserId');
            $table->integer('updatedByUserId')->nullable();

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
        Schema::dropIfExists('offices');
    }
}
