<?php

namespace App\Http\Controllers;

use App\Http\Resources\AdminFileResource;
use App\Http\Resources\AdminUserResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\File;

class AdminController extends Controller
{
    private function checkrole()
    {
        if (Auth::user()->role != "admin") {
            return response([
                "error" => "Nincs hozzáférésed!"
            ]);
        }
    }

    public function getUsers($username = null)
    {
        $this->checkrole();
        if ($username == null) {
            return AdminUserResource::collection(User::where("name", "not like", Auth::user()->name)->get());
        }
        return AdminUserResource::collection(User::where([["name", "like", "%$username%"], ["name", "not like", Auth::user()->name]])->get());
    }

    public function setrole(User $user, $role)
    {
        $user->role = $role;
        $user->save();
        return response([
            "message" => "$user->name szerepkore $role szerepkorre modosult"
        ]);
    }

    public function deleteuser(User $user)
    {
        $user->delete();

        return response([
            "message" => "$user->name sikeresen torolve!"
        ]);
    }

    public function getFiles(Request $request)
    {
        $user = $request["user"];
        $file = $request["file"];

        if(!is_null($user)){
            
            $user = User::where("name", $user)->first();
        }

        if (is_null($user) && is_null($file)) {
            return AdminFileResource::collection(File::all());
        }

        if (is_null($user) && !is_null($file)) {
            return AdminFileResource::collection(File::where('title', 'like', "%-%$file%.%")->get());
        }

        if (!is_null($user) && is_null($file)) {
            return AdminFileResource::collection(File::where('user_id', $user->id)->get());
        }

        if (!is_null($user) && !is_null($file)) {
            return AdminFileResource::collection(File::where([['user_id', $user->id],['title', 'like', "%-%$file%.%"]])->get());
        }
    }
}
