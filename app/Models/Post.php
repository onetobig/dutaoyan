<?php

namespace App\Models;

use App\Models\Traits\HashIdHelper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use TCG\Voyager\Models\Category;

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
        $url = $this->attributes['image'];
        if (Str::startsWith($url, ['http://', 'https://'])) {
            return $url;
        }
        return \Storage::disk('public')->url($url);
    }

    public function link()
    {
        return route('posts.show', ['post' => $this]);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
