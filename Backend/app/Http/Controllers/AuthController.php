<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $data = $request->validated();
        $data["password"] = Hash::make($data["password"]);
        return User::create($data);
    }

    public function login(LoginRequest $request)
    {
        if (!Auth::attempt($request->only('name', 'password'))) {
            return response([
                'message' => 'Hibás adatok!'
            ], Response::HTTP_UNAUTHORIZED);
        }

        $user = Auth::user();

        $token = $user->createToken('token')->plainTextToken;

        $cookie = cookie('jwt', $token, $minutes = 30, $path = null, $domain = null, $httpOnly = false);

        return response([
            'message' => $token
        ])->withCookie($cookie);
    }

    public function getNewCookie(){

        $user = Auth::user();

        $token = $user->createToken('token')->plainTextToken;

        $cookie = cookie('jwt', $token, $minutes = 30, $path = null, $domain = null, $httpOnly = false);

        return response([
            'message' => $token
        ])->withCookie($cookie);

     }

    public function user()
    {
        return Auth::user();
    }

    public function logout()
    {
        $cookie = Cookie::forget('jwt');

        return response([
            'message' => 'Sikeres kijelentkezés'
        ])->withCookie($cookie);
    }
}