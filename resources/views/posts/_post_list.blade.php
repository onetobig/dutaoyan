@if(count($posts))
	<ul class="media-list">
		@foreach($posts as $post)
			<li class="media">
				<div class="media-left">
					<a href="{{ route('posts.show', ['post' => $post] )}}">
						<img src="{{ $post->cover_url }}" alt="" class="media-object img-thumbnail" style="max-width: 252px;" title="{{ $post->user->name }}">
					</a>
				</div>
				
				<div class="media-body">
					<div class="media-heading">
						<a href="{{ $post->link() }}" title="{{ $post->title }}">
							{{ $post->title }}
						</a>
						
						<a href="{{ $post->link() }}" class="pull-right">
							<span class="badge">{{ $post->reply_count }}</span>
						</a>
					</div>
					
					<div class="media-body meta">
						{{--<a href="{{ route('categories.show', [$post->category->id]) }}" title="{{ $post->category->name }}">--}}
							{{--<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>--}}
							{{--{{ $post->category->name }}--}}
						{{--</a>--}}
						
						<span> • </span>
						
						
						<span> • </span>
						
						<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
						<span class="timeago" title="最后活跃于">{{ $post->updated_at->diffForHumans() }}</span>
					</div>
				</div>
			</li>
			
			@if ( ! $loop->last)
				<hr>
			@endif
			
		@endforeach
	</ul>
@else
	<div class="empty-block">暂无数据 ~_~ </div>
@endif