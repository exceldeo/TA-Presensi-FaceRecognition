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
            'password' => Hash::make('password'),
            'img_path' => 'belum',
            'is_verifikasi' => 0,
        ]);

        DB::table('mahasiswa')->insert([
            'nrp' => '1234',
            'nama_mahasiswa' => 'dinda',
            'password' => Hash::make('password'),
            'img_path' => 'belum',
            'is_verifikasi' => 0,
        ]);
    }
}
