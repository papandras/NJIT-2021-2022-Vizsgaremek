<?php

namespace App\Http\Controllers;

use App\Http\Resources\FriendResource;
use App\Models\Friend;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FriendController extends Controller
{
    public function getFriends(){
        return FriendResource::collection(Auth::user()->friends);
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

    
    public function removeFriend(Request $user){
        Auth::user()->friends()->detach($user->id);
        return "Barát eltávolítva!";
    }
}
