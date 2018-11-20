@extends('layouts.app')
@section('title', '首页')
@section('content')
	<div class="container">
		<div class="col">
			@foreach($posts as $post)
				<div class="media">
					<a href="{{ route('posts.show', ['post' => $post->id]) }}">
						<img src="{{ $post->cover_url }}" alt="" class="mr-3 align-self-center img-fluid" style="max-height: 220px;max-width: 220px;">
					</a>
					<div class="media-body">
						<a href="{{ route('posts.show', ['post' => $post->id]) }}">
							<h5 class="mt-0">{{ $post->title }}</h5>
						</a>
					</div>
				</div>
			@endforeach
		</div>
	</div>
@endsection
