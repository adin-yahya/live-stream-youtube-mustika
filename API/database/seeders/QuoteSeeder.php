<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class QuoteSeeder extends Seeder
{
    public function run()
    {
        $data = array();
        for($i=1;$i<=2;$i++){ // loop in Event
            for($j=1;$j<=7;$j++){ // loop in Division
                $dump = [
                    'users_id' => $i,
                    'event_id' => $i,
                    'quote' => "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text?",
                    'status_id' => 1,
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                    'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                ];
                array_push($data, $dump);
            };
        };
        \DB::table('quote')->insert($data);
    }
}
