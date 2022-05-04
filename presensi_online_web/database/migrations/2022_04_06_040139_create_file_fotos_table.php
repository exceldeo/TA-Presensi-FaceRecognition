<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFileFotosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('filefoto', function (Blueprint $table) {
            $table->id();
            $table->string('pathFoto');
            $table->timestamps();

            //foreign key
            $table->string('nrp_mahasiswa')->references('nrp')->on('mahasiswa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('filefoto');
    }
}
