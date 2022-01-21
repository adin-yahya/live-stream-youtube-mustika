<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    public $table = "event";
    protected $fillable = [
        'event_name',
        'desc',
        'date',
        'meeting_link',
        'livestream_link',
        'sesion_limit_time',
        'status_id'
    ];
    protected $casts = [
        // 'date' => 'datetime'
    ];
}
