<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function getAllUsers(){
        return UserResource::collection(User::all());
    }

    public function getUser($username){
        return UserResource::collection(User::where("name", "LIKE", "%$username%")->get());
    }
}
