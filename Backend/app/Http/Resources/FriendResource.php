<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FriendResource extends JsonResource
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
            "id" => $this->id,
            "nev" => $this->name,
            "email" => $this->email,
            "regisztralt" => $this->created_at,
            "pivot" => $this->pivot,
        ];
    }
}
