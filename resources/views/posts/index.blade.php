@extends('layouts.app')
@section('title', '首页')
@section('content')
	<div class="row">
		<div class="col-lg-9 col-md-9 topic-list">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="nav nav-pills">
						<li class="active" role="presentation"><a href="">最后回复</a></li>
						<li class="" role="presentation"><a href="">最新发布</a></li>
					</div>
				</div>
				<div class="panel-body">
					@include('posts._post_list', ['posts', $posts])
					{{-- 分页 --}}
					{!! $posts->appends(Request::except('page'))->render() !!}
				</div>
			</div>
		</div>
	</div>
@endsection
