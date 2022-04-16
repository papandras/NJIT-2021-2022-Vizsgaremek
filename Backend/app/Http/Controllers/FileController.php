<?php

namespace App\Http\Controllers;

use App\Http\Resources\FileResource;
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
            $request->file("file")->storeAs("storage", $filename);

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

    public function getFiles($limit = null){

        if(is_null($limit)){
            return FileResource::collection(File::where('user_id', Auth::user()->id)->orderBy('updated_at', 'desc')->get());
        }

        $data = FileResource::collection(File::where('user_id', Auth::user()->id)->orderBy('updated_at', 'desc')->limit($limit)->get());

        if(count($data) == 0){
            return response([
                "message" => "Nincs feltöltött fájlod!"
            ]);
        }
        return $data;
    }

    public function download($filename){
        return Storage::download("storage/".$filename);
    }

    public function delete($filename){
        Storage::delete("storage/".$filename);
        File::where('title', $filename)->delete();
        return response([
            "message" => "A fájl sikeresen törölve"
        ]);
    }
}
