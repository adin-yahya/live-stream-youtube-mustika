<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Division extends Model
{
    use HasFactory;
    public $table = "division";
    protected $fillable = [
        'division_name',
        'status_id',
        'desc'
    ];
    protected $casts = [
        // 'date' => 'datetime'
    ];
}
