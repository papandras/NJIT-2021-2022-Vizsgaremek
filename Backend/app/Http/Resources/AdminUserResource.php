<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use App\Models\File;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminUserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $filesize = 0;
        $files = File::where('user_id', $this->id)->get();
        for ($i = 0; $i < count($files); $i++) {
            $filesize += $files[$i]->size;
        }

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
            "id" => $this->id,
            "name" => $this->name,
            "email" => $this->email,
            "filesize" => $filesize,
            "registered" => Carbon::parse($this->created_at)->timezone('Europe/Budapest')->toDateTimeString(),
            "role" => $this->role
        ];
    }
}
