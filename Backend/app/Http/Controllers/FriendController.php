<?php

namespace App\Http\Controllers;

use App\Http\Resources\FriendResource;
use App\Http\Resources\UserResource;
use App\Models\Friend;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FriendController extends Controller
{
    public function getFriends(){
        $friendids = Friend::where([['user_id_sender', Auth::user()->id], ['status', 'LIKE', "accepted"]])->select('user_id_addressee')->get();
        $myfriends = [];
        for($i = 0; $i < count($friendids); $i++){
            array_push($myfriends, UserResource::collection(User::where("id", "LIKE", $friendids[$i]["user_id_addressee"])->get()));
        }
        return $myfriends;
    }

    public function addFriend(Request $user){
        if(Auth::user()->id != $user->id){
            if(count(Friend::where([['user_id_sender', Auth::user()->id], ['user_id_addressee', $user->id]])->get()) == 0){
                Auth::user()->friends()->attach($user->id);
                return "Sikeres barát jelölés!";
            }
            else{
                return "Korábban már bejelölted!";
            }
        }else{
            return "Magadat nem jelölheted be!";
        }
    }

    
    public function removeFriend(Request $id){
        $validated  = $id->validate(["id" => "required|min:1"])["id"];
        Friend::where([['user_id_sender', Auth::user()->id],['user_id_addressee', $validated]])->delete();
        Friend::where([['user_id_sender', $validated],['user_id_addressee', Auth::user()->id]])->delete();

        return "Barát eltávolítva!";
    }

    public function friendrequests(){
        $senderids =  Friend::where([['user_id_addressee', Auth::user()->id], ['status', 'requested']])->select('user_id_sender')->get();
        $myrequests = [];
        for($i = 0; $i < count($senderids); $i++){
            array_push($myrequests, UserResource::collection(User::where("id", "LIKE", $senderids[$i]["user_id_sender"])->get()));
        }
        return $myrequests;
    }

    public function acceptrequest(Request $id){
        $validated  = $id->validate(["id" => "required|min:1"])["id"];
        Friend::where([['user_id_addressee', Auth::user()->id],['user_id_sender', $validated]])->update(['status'=>'accepted']);

        $accept = new Friend;
        $accept->user_id_sender = Auth::user()->id;
        $accept->user_id_addressee = $validated;
        $accept->status = 'accepted';
        $accept->save();

        return "Sikeresen elfogadtad a jelölést!";
    }
}
