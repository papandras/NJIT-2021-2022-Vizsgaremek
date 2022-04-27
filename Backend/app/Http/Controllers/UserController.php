<?php

namespace App\Http\Controllers;

use App\Http\Resources\GroupFileResource;
use App\Http\Resources\UserResource;
use App\Models\Group;
use App\Models\GroupMember;
use App\Models\User;
use App\Models\File;
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

    public function getgroups(User $id){
        if($id->id != Auth::user()->id){
            return response([
                "error" => "Nincs jogosultságod a megtekintéshez!"
            ]);
        }

        $groupids =  GroupMember::where('group_member', $id->id)->get("group_id");
        $groups = [];
        for($i = 0; $i < count($groupids); $i++){
            array_push($groups,  Group::where("id", $groupids[$i]["group_id"])->first());
        }

        if(count($groups) == 0){
            return response([
                "errors" => "Nem vagy tagja egyik csoportnak sem!"
            ]);
        }
        return $groups;
    }

    public function getFilesInGroup($groupid) {
        return GroupFileResource::collection(File::where('group_id', $groupid)->get());
    }

    public function getownedgroups(){
        $user = Auth::user();

        $groups = Group::where('owner_id', $user->id)->get();

        if(count($groups) == 0){
            return response([
                "message" => "Nincsen saját csoportod!"
            ]);
        }

        return $groups;
    }
}
