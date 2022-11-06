<?php

namespace App\Http\Controllers;

use App\Models\Recepciones;
use Illuminate\Http\Request;

class RecepcionController extends Controller
{
    public function index()
    {
        return response(Recepciones::all(), 200)
            ->header('Content-Type', 'application/json');
    }

    public function store(Request $request)
    {

        Recepciones::create([
            'proveedor' => $request->proveedor,
            'fecha' => $request->fecha,
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => Recepciones::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => Recepciones::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $recepciones = Recepciones::find($request->id);
        $recepciones->proveedor = $request->proveedor;
        $recepciones->fecha = $request->fecha;
        $recepciones->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => Recepciones::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $recepciones = Recepciones::find($id);
        $recepciones->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}