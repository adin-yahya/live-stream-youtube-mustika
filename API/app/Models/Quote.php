<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quote extends Model
{
    use HasFactory;
    public $table = "quote";
    protected $fillable = [
        'users_id',
        'event_id',
        'quote',
        'status_id'
    ];
    protected $casts = [
        // 'date' => 'datetime'
    ];
}
