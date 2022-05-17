<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PresensiMahasiswa extends Model
{
    protected $table = 'presensi_mahasiswa';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'tanggal', 'jam', 'status'
    ];
    public function presensiMahasiswaDimilikiJadwalMahasiswa(){
        return $this->belongsTo(JadwalMahasiswa::class);
    }
    public function presensiMahasiswaDimilikiPresensi(){
        return $this->belongsTo(Presensi::class);
    }
}
