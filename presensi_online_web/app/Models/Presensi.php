<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Presensi extends Model
{
    protected $table = 'presensi';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'tanggal', 'jam_mulai', 'jam_akhir', 'id_jadwal'
    ];
    public function presensiDimilikiJadwalMahasiswa(){
        return $this->belongsTo(JadwalMahasiswa::class);
    }
}
