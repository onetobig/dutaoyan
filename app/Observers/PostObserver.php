<?php

namespace App\Observers;

use App\Handlers\SlugTranslateHandler;
use App\Services\PostService;
use TCG\Voyager\Models\Post;

class PostObserver
{
    public function saving(Post $post)
    {
        if (!$post->image) {
            $service = new PostService();
            $post->image = $service->getFirstImage($post->body);
        }
        $post->slug = app(SlugTranslateHandler::class)->translate($post->title);
    }
}
