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
        Schema::create('recepciones_detalle', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_articulo')
                ->nullable()
                ->constrained('articulos')
                ->cascadeOnUpdate()
                ->nullOnDelete();
            $table->foreignId('id_recepcion')
                ->nullable()
                ->constrained('recepciones')
                ->cascadeOnUpdate()
                ->nullOnDelete();
            $table->integer('cantidad');
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
        Schema::dropIfExists('recepciones_detalle');
    }
};