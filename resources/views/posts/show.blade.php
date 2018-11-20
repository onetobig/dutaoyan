@extends('layouts.app')
@section('title', '详情')
@section('content')
	<div class="container">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h2 class="text-center">{{ $post->title }}</h2>
				</div>
                <div class="container text-center">
				<img src="{{ $post->cover_url }}" class="img-thumbnail img-responsive" >
                </div>

				<div class="card-body">
					{!! $post->content !!}
				</div>
			</div>
		</div>
	</div>
@endsection
