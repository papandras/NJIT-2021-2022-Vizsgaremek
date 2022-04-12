<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function getAllUsers(){
        return UserResource::collection(User::where("name", "not like", Auth::user()->name)->get());
    }

    public function getUser($username){
        return UserResource::collection(User::where("name", "LIKE", "%$username%")->get());
    }

    public function getUserByStartLetter($startletter){
        return UserResource::collection(User::where("name", "LIKE", "$startletter%")->get());
    }
}
