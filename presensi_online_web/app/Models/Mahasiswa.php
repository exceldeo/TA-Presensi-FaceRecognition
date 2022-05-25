<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    protected $table = 'mahasiswa';
    protected $primaryKey = 'nrp';
    
    protected $fillable = [
        'nama_mahasiswa', 'password', 'email', 'departement', 'tahun_masuk'
    ];

    public function mahasiswaDimilikiJadwalMahasiswa(){
        return $this->belongsTo(JadwalMahasiswa::class);
    }
    public function mahasiswaDimilikiFileFoto(){
        return $this->belongsTo(FileFoto::class);
    }
}
