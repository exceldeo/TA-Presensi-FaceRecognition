<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JadwalMahasiswa extends Model
{
    protected $table = 'jadwal_mahasiswa';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'id_jadwal', 'nrp_mahasiswa'
    ];

    public function jadwalMahasiswaDimilikiJadwal(){
        return $this->belongsTo(Jadwal::class);
    }
    public function jadwalMahasiswaDimilikiMahasiswa(){
        return $this->belongsTo(Mahasiswa::class);
    }
    public function jadwalMahasiswaPunyaPresensi(){
        return $this->hasMany(Presensi::class);
    }
}
