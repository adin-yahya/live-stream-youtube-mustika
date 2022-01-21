<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class DatabaseSeeder extends Seeder
{
    protected $toTruncate = ['status','users','substream','division','event','quote'];

    public function run()
    {
        Model::unguard();

        foreach($this->toTruncate as $table) {
            \DB::table($table)->truncate();
        }

        $this->call([  
            StatusSeeder::class,
            UserSeeder::class,
            SubstreamSeeder::class,
            DivisionSeeder::class,
            EventSeeder::class,
            QuoteSeeder::class
        ]);

        Model::reguard();

        
    }
}
