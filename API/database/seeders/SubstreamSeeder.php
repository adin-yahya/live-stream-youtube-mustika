<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class SubstreamSeeder extends Seeder
{
    public function run()
    {
        $data = array();
        for($i=1;$i<=2;$i++){ // loop in Event
            for($j=1;$j<=7;$j++){ // loop in Division
                $dump = [
                    'link' => 'https://www.youtube.com/watch?v=g_AAW9BalO8',
                    'division_id' => $j,
                    'event_id' => $i,
                    'speaker_name' => 'Pembicara-'.$j,
                    'status_id' => 1,
                    'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                    'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
                ];
                array_push($data, $dump);
            };
        };
        \DB::table('substream')->insert($data);
    }
}
