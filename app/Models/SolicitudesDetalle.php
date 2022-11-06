<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudesDetalle extends Model
{
    use HasFactory;
    protected $fillable = [
        'id_solicitud',
        'id_articulo',
        'cantidad_solicitada',
        'cantidad_aprobada',
        'observaciones'
    ];
}