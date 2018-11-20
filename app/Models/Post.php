<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Post extends Model
{
    protected $fillable = ['title', 'sub', 'cover', 'content', ];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getCoverUrlAttribute()
    {
        $url = $this->attributes['cover'];
        if (Str::startsWith($url, ['http://', 'https://'])) {
            return $url;
        }
        return \Storage::disk('public')->url($url);
    }
}
