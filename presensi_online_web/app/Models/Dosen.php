<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dosen extends Model
{
    protected $table = 'dosen';
    protected $primaryKey = 'nip';
    
    protected $fillable = [
        'nama_dosen', 'password', 'email' , 'departement', 'role'
    ];

    public function dosenPunyaJadwal(){
        return $this->hasMany(Jadwal::class);
    }
}
