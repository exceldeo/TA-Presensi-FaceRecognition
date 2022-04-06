<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{
    protected $table = 'kelas';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'nama_kelas', 'lokasi_kelas'
    ];
    public function kelasPunyaJadwal(){
        return $this->hasMany(Jadwal::class);
    }
}
