<?php

namespace App\Http\Controllers;

use App\Models\Articulos;
use Illuminate\Http\Request;

class ArticuloController extends Controller
{
    public function index()
    {
        return response(Articulos::all(), 200)
            ->header('Content-Type', 'application/json');
    }

    public function store(Request $request)
    {

        Articulos::create([
            'articulo' => $request->articulo,
            'id_categoria' => $request->id_categoria,
        ]);
        return response([
            'message' => 'Inserción Exitosa',
            'data' => Articulos::latest('id')->first(),
            'status_http' => 201
        ])
            ->header('Content-Type', 'application/json');
    }

    public function show($id)
    {
        return response([
            'message' => 'Registro Encontrado',
            'data' => Articulos::find($id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }


    public function update(Request $request)
    {
        $articulo = Articulos::find($request->id);
        $articulo->articulo = $request->articulo;
        $articulo->id_categoria = $request->id_categoria;
        $articulo->save();
        return response([
            'message' => 'Actualización Exitosa',
            'data' => Articulos::find($request->id),
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }

    public function destroy($id)
    {
        $articulo = Articulos::find($id);
        $articulo->delete();
        return response([
            'message' => 'Registro ' . $id . ' Eliminado',
            'status_http' => 200
        ])
            ->header('Content-Type', 'application/json');
    }
}