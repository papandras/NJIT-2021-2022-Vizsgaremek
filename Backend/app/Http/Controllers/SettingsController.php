<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cookie;

class SettingsController extends Controller
{
    public function settings(Request $request)
    {
        $data = $request->validate(
            [
                "email" => "nullable|email:rfc,dns",
                "password" => "nullable|min:8|max:20",
                "profilpic" => "file|image|nullable",
                "confirm" => "required|current_password:sanctum",
                "removepic" => "nullable"
            ],
            [
                "email.email" => "Létező email címet adj meg!",
                "profilpic.file" => "Hibás fájl!",
                "profilpic.image" => "Kizárólag képet tölthetsz fel!",
                'password.min' => "A jelszó minimum 8 karakter hosszú!",
                'password.max' => "A jelszó maximum 20 karakter hosszú!",
                "confirm.required" => "A jelszó megerősítése kötelező!",
                "confirm.current_password" => "Jelszó megerősítés sikertelen!"
            ]
        );

        if (isset($data["profilpic"]) && !is_null($data["profilpic"])) {
            $filename = Auth::user()->name . "-profilpic." . $data['profilpic']->getClientOriginalExtension();
            $request->file("profilpic")->storeAs("profilpic", $filename);
            $data["profilpic"] = $filename;
        }

        if (isset($data["password"]) && !is_null($data["password"])) {
            $data["password"] = Hash::make($data["password"]);
        }

        if(isset($data["removepic"]) && $data["removepic"] == "true"){
            $data["profilpic"] = "base-notfound.svg";
        }

        Auth::user()->update($data);

        return $data;
    }

    public function removeaccount() {
        Auth::user()->delete();

        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'Sikeres profil törlés'
        ])->withCookie($cookie);
    }
}
