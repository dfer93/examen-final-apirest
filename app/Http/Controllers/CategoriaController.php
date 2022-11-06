<?php

namespace App\Http\Controllers;

use App\Models\Categorias;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function index()
    {
        return response(Categorias::all(), 200)
            ->header('Content-Type', 'text/plain');
    }

    public function store(Request $request)
    {

        Categorias::create([
            'descripcion' => $request->descripcion
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => Categorias::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => Categorias::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $categoria = Categorias::find($request->id);
        $categoria->descripcion = $request->descripcion;
        $categoria->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => Categorias::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $categoria = Categorias::find($id);
        $categoria->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}