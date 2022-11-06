<?php

namespace App\Http\Controllers;

use App\Models\Solicitudes;
use Illuminate\Http\Request;

class SolicitudController extends Controller
{
    public function index()
    {
        return response(Solicitudes::all(), 200)
            ->header('Content-Type', 'application/json');
    }

    public function store(Request $request)
    {

        Solicitudes::create([
            'dependencia' => $request->dependencia,
            'fecha_solicitud' => $request->fecha_solicitud,
            'estado' => $request->estado,
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => Solicitudes::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => Solicitudes::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $solicitud = Solicitudes::find($request->id);
        $solicitud->dependencia = $request->dependencia;
        $solicitud->fecha_solicitud = $request->fecha_solicitud;
        $solicitud->estado = $request->estado;

        $solicitud->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => Solicitudes::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $solicitud = Solicitudes::find($id);
        $solicitud->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}