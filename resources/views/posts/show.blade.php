@extends('layouts.app')

@section('title', $post->title)
@section('description', $post->excerpt)

@section('content')

	<div class="row">
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 post-content">
			<div class="panel panel-default">
				<div class="panel-body">
                    <div class="">
                        <h1 class="">
                            {{ $post->title }}
                        </h1>
                        <div class="article-meta">
                            创建于 {{ $post->created_at->diffForHumans() }}  /  阅读量 {{ visits($post)->count() }} / 更新于 {{ $post->updated_at->diffForHumans() }}
                        </div>

                        <div style="background-color:cornflowerblue;height:1px;border:none;box-shadow:0 1px 0px 1px #64959D;margin:10px 0px 10px 0;"></div>
                    </div>

					<div class="">
                        {!! $post->body !!}
					</div>
				</div>
			</div>

			{{--用户回复列表--}}
			<div class="panel panel-default post-reply">
				<div class="panel-body">
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 hidden-sm hidden-xs author-info">
			<div class="panel panel-default">
				<div class="panel-body">
{{--					作者：{{ $post->user->name }}--}}
					@if($post->image)
						<img src="{{ $post->cover_url }}" class="img-thumbnail"/>
					@endif
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

	</div>

@endsection
