@if(count($posts))
	<ul class="timeline media-list">
		@foreach($posts as $post)
		<li class="{{ $loop->index % 2 === 0 ? "" : "timeline-inverted" }}">
			<div class="timeline-badge {{["success", "warning", "info", "danger"][$loop->index % 4]}}">
				{{ $post->created_at->format("m-d") }}
			</div>
			<div class="timeline-panel">
				<div class="timeline-heading">
					<a href="{{ route('posts.show', ['post' => $post]) }}">
						<h4 class="timeline-title">{{ $post->title }}</h4>
					</a>
					<span class="text-right">{{ $post->created_at }}</span>
				</div>
				<div class="timeline-body">
					<a href="{{ route('posts.show', ['post' => $post]) }}">
						<img src="{{ $post->cover_url }}" alt="" class="img-thumbnail">
					</a>
				</div>
			</div>
		</li>
		@endforeach
	</ul>
@else
	<div class="empty-block">暂无数据 ~_~ </div>
@endif