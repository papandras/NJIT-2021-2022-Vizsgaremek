<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            "rang" => $this->role,
            "kep" => $this->profilpic
        ];
    }
}
