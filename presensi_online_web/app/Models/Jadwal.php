<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    protected $table = 'jadwal';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'hari', 'jam_mulai', 'jam_akhir', 'tahun_ajaran', 'semester', 'id_kelas', 'id_matakuliah', 'id_dosen'
    ];

    public function jadwalDimilikiDosen(){
        return $this->belongsTo(Dosen::class);
    }
    public function jadwalDimilikiKelas(){
        return $this->belongsTo(Kelas::class);
    }
    public function jadwalDimilikiMatkul(){
        return $this->belongsTo(Matakuliah::class);
    }
    public function jadwalPunyaJadwalMahasiswa(){
        return $this->hasMany(JadwalMahasiswa::class);
    }

}
