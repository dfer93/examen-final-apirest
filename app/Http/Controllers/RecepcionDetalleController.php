<?php

namespace App\Http\Controllers;

use App\Models\RecepcionesDetalle;
use Illuminate\Http\Request;

class RecepcionDetalleController extends Controller
{
    public function index()
    {
        return response(RecepcionesDetalle::all(), 200)
            ->header('Content-Type', 'application/json');
    }

    public function store(Request $request)
    {

        RecepcionesDetalle::create([
            'id_articulo' => $request->id_articulo,
            'id_recepcion' => $request->id_recepcion,
            'cantidad' => $request->cantidad,
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => RecepcionesDetalle::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => RecepcionesDetalle::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $rec_det = RecepcionesDetalle::find($request->id);
        $rec_det->id_articulo = $request->id_articulo;
        $rec_det->id_recepcion = $request->id_recepcion;
        $rec_det->cantidad = $request->cantidad;
        $rec_det->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => RecepcionesDetalle::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $rec_det = RecepcionesDetalle::find($id);
        $rec_det->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}