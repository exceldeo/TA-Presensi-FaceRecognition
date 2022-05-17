<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJadwalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jadwal', function (Blueprint $table) {
            $table->id()->unique();
            $table->string('hari');
            $table->time('jam_mulai');
            $table->time('jam_akhir');
            $table->integer('tahun_ajaran');
            $table->integer('semester');
            $table->timestamps();
            
            //foreign key
            $table->integer('id_kelas')->references('id')->on('kelas');
            $table->integer('id_matakuliah')->references('id')->on('matakuliah');
            $table->string('id_dosen')->references('nip')->on('dosen');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jadwal');
    }
}
