<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FileFoto extends Model
{
    protected $table = 'file_foto';
    protected $primaryKey = 'nip';
    
    protected $fillable = [
        'nrp', 'pathFoto'
    ];

    public function fileFotoDimilikiMahasiswa(){
        return $this->belongsTo(Mahasiswa::class);
    }
}
