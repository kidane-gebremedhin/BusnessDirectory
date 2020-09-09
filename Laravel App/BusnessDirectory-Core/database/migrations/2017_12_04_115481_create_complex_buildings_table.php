<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatecomplexbuildingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complex_buildings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique(); 
            $table->string('description')->nullable();
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
        Schema::dropIfExists('complex_buildings');
    }
}
