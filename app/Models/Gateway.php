<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Gateway extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['id', 'title', 'slug', 'status', 'mode', 'url', 'key', 'secret', 'image', 'user_id'];

    public function getIconAttribute(): string
    {
        return asset($this->image);
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }
}
