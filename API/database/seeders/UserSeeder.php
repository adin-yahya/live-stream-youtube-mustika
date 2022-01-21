<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Carbon\Carbon;

class UserSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'name' => 'Administrator',
                'nik' => '0000.MTK.0000',
                'division_id' => -1,
                'password' => bcrypt('admin'),
                'status_id' => 1,
                'user_verified_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]
        ];
        \DB::table('users')->insert($data);
    }
}
