<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcaraTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event', function (Blueprint $table) {
            $table->id();
            $table->string('event_name');
            $table->text('desc')->nullable();
            $table->dateTimeTz('date');
            $table->text('meeting_link')->nullable();
            $table->text('livestream_link')->nullable();
            $table->time('sesion_limit_time')->nullable();
            $table->bigInteger('waiting_time')->nullable();
            $table->boolean('status_id');
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
        Schema::dropIfExists('acara');
    }
}
