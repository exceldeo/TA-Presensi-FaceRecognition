<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Dosen extends Authenticatable
{
    protected $table = 'dosen';
    protected $primaryKey = 'nip';

    protected $casts = [
        'nip' => 'string',
    ];
    
    protected $fillable = [
        'nama_dosen', 'password', 'email' , 'departement', 'role'
    ];

    public function dosenPunyaJadwal(){
        return $this->hasMany(Jadwal::class);
    }
}
