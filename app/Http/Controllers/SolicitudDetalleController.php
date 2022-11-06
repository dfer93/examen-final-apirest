<?php

namespace App\Http\Controllers;

use App\Models\SolicitudesDetalle;
use Illuminate\Http\Request;

class SolicitudDetalleController extends Controller
{
    public function index()
    {
        return response(SolicitudesDetalle::all(), 200)
            ->header('Content-Type', 'application/json');
    }

    public function store(Request $request)
    {

        SolicitudesDetalle::create([
            'id_solicitud' => $request->id_solicitud,
            'id_articulo' => $request->id_articulo,
            'cantidad_solicitada' => (int)$request->cantidad_solicitada,
            'observaciones' => '--',
            'cantidad_aprobada' => 0
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => SolicitudesDetalle::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => SolicitudesDetalle::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $solicituddet = SolicitudesDetalle::find($request->id);
        $solicituddet->observaciones = $request->observaciones;
        $solicituddet->cantidad_aprobada = $request->cantidad_aprobada;

        $solicituddet->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => SolicitudesDetalle::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $solicituddet = SolicitudesDetalle::find($id);
        $solicituddet->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}