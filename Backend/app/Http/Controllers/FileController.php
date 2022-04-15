<?php

namespace App\Http\Controllers;

use App\Models\File;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;

class FileController extends Controller
{
    public function upload(Request $request)
    {
        $data = $request->validate([
            "file" => "required|file"
        ]);

        $filename = Auth::user()->name . "-" . $data['file']->getClientOriginalName();
        
        if (count(File::where('title', $filename)->get()) == 0) {
            $request->file("file")->storeAs("storage", $data['file']->getClientOriginalName());

            $file = new File();
            $file->user_id = Auth::user()->id;
            $file->type = $data['file']->getClientOriginalExtension();
            $file->title = $filename;
            $file->size = $data['file']->getSize();;

            $file->save();

            return response([
                "message" => "$file->title sikeresen feltöltve!"
            ]);
        }

        return response([
            "error" => "A fájl már létezik!"
        ]);
    }
}
