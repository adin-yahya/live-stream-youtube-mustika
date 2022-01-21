<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class DivisionSeeder extends Seeder
{
    public function run()
    {
        $data = array();
        $name = ['Direktur','Kepala Unit', 'Kepala Produksi', 'Technical Support', 'Sales', 'Admin', 'Bagian Umum'];
        for($j=1;$j<=7;$j++){ // loop in Division
            $dump = [
                'division_name' => $name[$j-1],
                'desc' => null,
                'status_id' => 1,
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
            ];
            array_push($data, $dump);
        };
        array_push($data, $dump);
        \DB::table('division')->insert($data);
    }
}
