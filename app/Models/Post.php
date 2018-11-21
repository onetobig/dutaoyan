<?php

namespace App\Models;

use App\Models\Traits\HashIdHelper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Post extends Model
{
    use HashIdHelper;
    protected $fillable = ['title', 'sub', 'cover', 'content', ];

    protected $casts = [
        'published_at' => 'datetime',
    ];

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

    public function link()
    {
        return route('posts.show', ['post' => $this]);
    }
}
