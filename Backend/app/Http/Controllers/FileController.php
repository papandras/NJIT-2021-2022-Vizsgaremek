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
        for ($i = 0; $i < count($request->all()); $i++) {
            $data = $request->validate([
                "file$i" => "required|file"
            ]);

            $filename = Auth::user()->name . "-" . $data["file$i"]->getClientOriginalName();

            if (count(File::where('title', $filename)->get()) == 0) {
                $request->file("file$i")->storeAs("storage", $filename);

                $file = new File();
                $file->user_id = Auth::user()->id;
                $file->type = $data["file$i"]->getClientOriginalExtension();
                $file->title = $filename;
                $file->size = $data["file$i"]->getSize();
                $file->mimetype = $data["file$i"]->getMimeType();

                $file->save();
            } else {
                return response([
                    "error" => "A fájl már létezik!"
                ]);
            }
        }

        return response([
            "message" => "A fájlok sikeresen feltöltve!"
        ]);
    }

    public function getFiles($limit = null)
    {

        if (is_null($limit)) {
            return FileResource::collection(File::where('user_id', Auth::user()->id)->orderBy('updated_at', 'desc')->get());
        }

        $data = FileResource::collection(File::where('user_id', Auth::user()->id)->orderBy('updated_at', 'desc')->limit($limit)->get());

        if (count($data) == 0) {
            return response([
                "message" => "Nincs feltöltött fájlod!"
            ]);
        }
        return $data;
    }

    public function download($filename)
    {
        return Storage::download("storage/" . $filename);
    }

    public function delete($filename)
    {
        Storage::delete("storage/" . $filename);
        File::where('title', $filename)->delete();
        return response([
            "message" => "A fájl sikeresen törölve"
        ]);
    }

    public function sharewithgroup(Request $request, File $id)
    {
        $groupid = $request->validate([
            "group_id" => "required|exists:groups,id",
        ]);

        File::where("title", $id->title)->update($groupid);

        return $id;
        return response([
            "message" => "A fájl sikeresen megosztva!"
        ]);
    }

    public function unshare(File $id)
    {
        $id->group_id = null;
        $id->update();

        return response([
            "message" => "Megosztás sikeresen visszavonva!"
        ]);
    }

    private function unitexchange($byte)
    {
        switch (true) {
            case $byte < 1024:
                return round($byte, 2) . " B";
                break;
            case $byte < (1024 * 1024):
                return round($byte / 1024, 2) . " KB";
                break;

            case $byte < (1024 * 1024 * 1024):
                return round($byte / (1024 * 1024), 2) . " MB";
                break;
        }
    }

    public function getstat()
    {
        $files = File::where('user_id', Auth::user()->id)->get();

        $stat = [
            "image" => [
                "size" => 0,
            ],
            "text" => [
                "size" => 0,
            ],
            "video" => [
                "size" => 0,
            ],
            "audio" => [
                "size" => 0,
            ],
            "other" => [
                "size" => 0,
            ],
            "all" => [
                "size" => 0,
            ],
        ];

        for ($i = 0; $i < count($files); $i++) {
            switch (true) {
                case str_starts_with($files[$i]->mimetype, "image"):
                    $stat["image"]["size"] += $files[$i]->size;
                    $stat["all"]["size"] += $files[$i]->size;
                    break;
                case str_starts_with($files[$i]->mimetype, "text"):
                    $stat["text"]["size"] += $files[$i]->size;
                    $stat["all"]["size"] += $files[$i]->size;
                    break;
                case str_starts_with($files[$i]->mimetype, "video"):
                    $stat["video"]["size"] += $files[$i]->size;
                    $stat["all"]["size"] += $files[$i]->size;
                    break;
                case str_starts_with($files[$i]->mimetype, "audio"):
                    $stat["audio"]["size"] += $files[$i]->size;
                    $stat["all"]["size"] += $files[$i]->size;
                    break;
                default:
                    $stat["other"]["size"] += $files[$i]->size;
                    $stat["all"]["size"] += $files[$i]->size;
            }
        }

        $stat["image"]["sizewithunit"] = $this->unitexchange($stat["image"]["size"]);
        $stat["text"]["sizewithunit"] = $this->unitexchange($stat["text"]["size"]);
        $stat["video"]["sizewithunit"] = $this->unitexchange($stat["video"]["size"]);
        $stat["audio"]["sizewithunit"] = $this->unitexchange($stat["audio"]["size"]);
        $stat["other"]["sizewithunit"] = $this->unitexchange($stat["other"]["size"]);
        $stat["all"]["sizewithunit"] = $this->unitexchange($stat["all"]["size"]);

        return $stat;
    }
}
