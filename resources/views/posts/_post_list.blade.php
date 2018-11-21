@if(count($posts))
	<ul class="media-list">
		@foreach($posts as $topic)
			<li class="media">
				<div class="media-left">
					<a href="{{ route('posts.show', ['post' => $post] )}}">
						<img src="{{ $topic->cover_url }}" alt="" class="media-object img-thumbnail" style="max-width: 252px;" title="{{ $topic->user->name }}">
					</a>
				</div>
				
				<div class="media-body">
					<div class="media-heading">
						<a href="{{ $topic->link() }}" title="{{ $topic->title }}">
							{{ $topic->title }}
						</a>
						
						<a href="{{ $topic->link() }}" class="pull-right">
							<span class="badge">{{ $topic->reply_count }}</span>
						</a>
					</div>
					
					<div class="media-body meta">
						{{--<a href="{{ route('categories.show', [$topic->category->id]) }}" title="{{ $topic->category->name }}">--}}
							{{--<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>--}}
							{{--{{ $topic->category->name }}--}}
						{{--</a>--}}
						
						<span> • </span>
						
						<a href="" title="{{ $topic->user->name }}">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							{{ $topic->user->name }}
						</a>
						
						<span> • </span>
						
						<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
						<span class="timeago" title="最后活跃于">{{ $topic->updated_at->diffForHumans() }}</span>
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