<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Matakuliah extends Model
{
    protected $table = 'matakuliah';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'nama_matakuliah', 'departement'
    ];
    public function matakuliahPunyaJadwal(){
        return $this->hasMany(Jadwal::class);
    }
}
