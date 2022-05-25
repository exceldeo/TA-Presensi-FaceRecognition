<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MahasiswaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mahasiswa')->insert([
            'nrp' => '123',
            'nama_mahasiswa' => 'latip',
            'email' => 'latip@gmail.com',
            'departement' => 'Teknik Informatika',
            'tahun_masuk' => 2018,
            'password' => Hash::make('password'),
        ]);

        DB::table('mahasiswa')->insert([
            'nrp' => '1234',
            'nama_mahasiswa' => 'dinda',
            'password' => Hash::make('password'),
            'email' => 'latip@gmail.com',
            'departement' => 'Teknik Informatika',
            'tahun_masuk' => 2018,
        ]);
    }
}
