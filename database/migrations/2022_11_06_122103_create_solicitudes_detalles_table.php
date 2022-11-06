<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicitudes_detalles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_solicitud')
                ->nullable()
                ->constrained('solicitudes')
                ->cascadeOnUpdate()
                ->nullOnDelete();
            $table->foreignId('id_articulo')
                ->nullable()
                ->constrained('articulos')
                ->cascadeOnUpdate()
                ->nullOnDelete();
            $table->integer('cantidad_solicitada');
            $table->integer('cantidad_aprobada');
            $table->integer('observaciones');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('solicitudes_detalles');
    }
};