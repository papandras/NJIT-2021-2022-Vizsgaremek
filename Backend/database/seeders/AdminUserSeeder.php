<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            "name" => "papandras",
            "email" => "papandras@example.com",
            "password" => Hash::make("12345678"),
            "role" => "admin"
        ]);

        User::create([
            "name" => "polli",
            "email" => "polli@example.com",
            "password" => Hash::make("12345678"),
            "role" => "admin"
        ]);

        User::create([
            "name" => "peti",
            "email" => "peti@example.com",
            "password" => Hash::make("12345678"),
            "role" => "admin"
        ]);
    }
}
