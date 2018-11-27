@extends('layouts.app')
@section('title', '首页')
@section('content')
	<div class="row">
		@include('posts._post_list', ['posts', $posts])
		{{-- 分页 --}}
		{!! $posts->appends(Request::except('page'))->render() !!}
	</div>
@endsection
