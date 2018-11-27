@extends('layouts.app')

@section('title', $post->title)
@section('description', $post->excerpt)

@section('content')
	
	<div class="row">
		
		<div class="col-lg-3 col-md-3 hidden-sm hidden-xs author-info">
			<div class="panel panel-default">
				<div class="panel-body">
{{--					作者：{{ $post->user->name }}--}}
				</div>
				<hr>
				<div class="media">
					<div align="center">
{{--						<a href="{{ route('users.show', $post->user->id) }}">--}}
{{--							<img src="{{ $post->user->avatar }}" alt="" class="thumbnail img-responsive" width="300px" height="300px">--}}
						{{--</a>--}}
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 post-content">
			<div class="panel panel-default">
				<div class="panel-body">
					<h1 class="text-center">
						{{ $post->title }}
					</h1>
					
					<div class="article-meta text-center">
						{{ $post->created_at->diffForHumans() }}
						.
						<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						{{ visits($post)->count() }} 阅读
					</div>
					
					<div class="post-body">
						<img src="{{ $post->cover_url }}" class="img-thumbnail">
						<hr>
						<div class="container">
							{!! $post->content !!}
						</div>
					</div>
					
					@can('update', $post)
					<div class="operate">
						<hr>
						<a href="{{ route('posts.edit', $post->id) }}" class="btn btn-default btn-xs pull-left">
							<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 编辑
						</a>
						<form action="{{ route('posts.destroy', $post->id) }}" method="post">
							{{ csrf_field() }}
							{{ method_field('DELETE') }}
							<button class="btn btn-default btn-xs pull-left" style="margin-left: 6px;">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
								删除
							</button>
						</form>
					</div>
					@endcan
				</div>
			</div>
			
			{{--用户回复列表--}}
			<div class="panel panel-default post-reply">
				<div class="panel-body">
				</div>
			</div>
		</div>
		
		
	</div>

@endsection
