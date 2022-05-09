<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class DosenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('dosen')->insert([
            'nama_dosen' => 'ardy',
            'email' => 'admin@mail.com',
            'password' => Hash::make('password'),
            'nip' => 123,
            'role' => 'admin',
            'departement' => 'Teknik Informatika',
        ]);

        DB::table('dosen')->insert([
            'nama_dosen' => 'excel',
            'email' => 'excel@mail.com',
            'password' => Hash::make('password'),
            'nip' => 12345,
            'role' => 'dosen',
            'departement' => 'Teknik Informatika',
        ]);
    }
}
