<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use App\Models\Group;
use App\Models\GroupMember;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GroupController extends Controller
{
    public function create(Request $request){
        $data = $request->validate([
            "name" => "required"
        ]);

        $data["owner_id"] = Auth::user()->id;

        if(Group::where([['owner_id', $data['owner_id']],['name', $data["name"]]])->first() != ""){
            return response([
                'message' => 'A csoport már létezik!'
            ]);
        }

        Group::create($data);

        return response([
            'message' => 'Csoport sikeresen létrehozva!'
        ]);
    }

    public function addmember(Request $request){
        $data = $request->validate([
            'group_id' => 'numeric|required|exists:groups,id',
            'group_member' => 'numeric|required|exists:users,id'
        ]);
        $userid = Auth::user()->id;
        if(is_null(Group::select('owner_id')->where('owner_id', $userid)->first())){
            return response([
                'error' => 'Másnak a csoportjához nem adhatsz hozzá!'
            ]);
        }
        if($request["group_member"] == $userid)
        {
            return response([
                'error' => 'Magadat nem tudod hozzáadni!'
            ]);
        }

        GroupMember::create($data);

        return response([
            'message' => 'Tag sikeresen hozzáadva!'
        ]);
    }

    public function getmembers(Group $id){

        if($id->owner_id != Auth::user()->id){
            return response([
                "error" => "Csak a saját csoportjaidat tekintheted meg!"
            ]);
        }

        $members = [];

        for($i = 0; $i < count($id->members); $i++){
            array_push($members, UserResource::collection(User::where("id", $id->members[$i]["group_member"])->get()));
        }

        return $members;
    }

    public function deletegroup(Group $id){
        if($id->owner_id != Auth::user()->id){
            return response([
                "error" => "Nincs jogosultságod a törléshez!"
            ]);
        }
        $id->delete();

        return response([
            'message' => 'Csoport sikeresen törölve!'
        ]);
    }

    public function deletememberfromgroup(Group $group, User $user){
        if($group->owner_id != Auth::user()->id){
            return response([
                "error" => "Nincs jogosultságod a törléshez!"
            ]);
        }
        GroupMember::where([['group_id', $group->id],['group_member', $user->id]])->delete();
        return response([
            'message' => 'Csoporttag sikeresen törölve!'
        ]); 
    }

    public function leavegroup($id) {
        GroupMember::where([['group_id', $id],['group_member', Auth::user()->id]])->delete();

        return response([
            'message' => 'Sikeresen kiléptél a csoportból!'
        ]); 
    }
}
