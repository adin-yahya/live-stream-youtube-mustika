<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubstreamTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('substream', function (Blueprint $table) {
            $table->id();
            $table->string('link')->nullable();
            $table->text('speaker_name')->nullable();
            $table->bigInteger('event_id');
            $table->bigInteger('division_id');
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
        Schema::dropIfExists('substream');
    }
}
