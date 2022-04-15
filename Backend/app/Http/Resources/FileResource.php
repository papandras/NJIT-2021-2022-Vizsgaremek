<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Resources\Json\JsonResource;

class FileResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "owner_id" => $this->user_id,
            "type" => $this->type,
            "name" => substr($this->title, strlen(Auth::user()->name)+1),
            "size" => $this->size,
            "shared_group_id" => $this->group_id,
            "created" => Carbon::parse($this->created_at)->timezone('Europe/Budapest')->toDateTimeString(),
            "updated" => Carbon::parse($this->updated_at)->timezone('Europe/Budapest')->toDateTimeString(),
        ];
    }
}