<?php

namespace App\Http\Resources;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminFileResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $ownername = User::where('id', $this->user_id)->first();

        $filename = substr($this->title, strlen($ownername->name) + 1);
        $splitfilename = explode('.', $filename);
        $typelength = strlen($splitfilename[count($splitfilename) - 1]) + 1;
        $filename = substr($filename, 0, strlen($filename) - $typelength);

        $filesize = $this->size;

        switch (true) {
            case $filesize < 1024:
                $filesize = round($filesize, 2) . " B";
                break;
            case $filesize < (1024 * 1024):
                $filesize = round($filesize / 1024, 2) . " KB";
                break;

            case $filesize < (1024 * 1024 * 1024):
                $filesize = round($filesize / (1024 * 1024), 2) . " MB";
                break;
        }

        return [
            "name" => $filename,
            "type" => $this->type,
            "size" => $filesize,
            "owner" => $ownername->name,
            "uploaded" => Carbon::parse($this->created_at)->timezone('Europe/Budapest')->toDateTimeString(),
            "edited" => Carbon::parse($this->updated_at)->timezone('Europe/Budapest')->toDateTimeString(),
        ];
    }
}
