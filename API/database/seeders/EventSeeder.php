<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class EventSeeder extends Seeder
{
    public function run()
    {
        $data = array();
        for($j=1;$j<=3;$j++){ // loop in Division
            $dump = [
                'event_name' => 'Event ke-'.$j,
                'desc' => null,
                'date' => Carbon::now()->addDays(($j==1)? 0 : $j)->format('Y-m-d H:i:s'),
                'meeting_link' => 'https://www.youtube.com/watch?v=Ll5JJWYACh0',
                'livestream_link' => 'https://www.youtube.com/watch?v=Ll5JJWYACh0',
                'sesion_limit_time' => '12:00:00',
                'status_id' => ($j==1) ? 4 : 3,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];
            array_push($data, $dump);
        };
        \DB::table('event')->insert($data);
    }
}
