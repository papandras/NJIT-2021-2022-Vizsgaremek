<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupMember extends Model
{
    use HasFactory;

    protected $table = "groupmembers";

    protected $fillable = [
        'group_id', 'group_member'
    ];

    public function groups()
    {
        //return $this->belongsToMany(Group::class, 'groupmembers', 'id', 'group_id');
    }


}
