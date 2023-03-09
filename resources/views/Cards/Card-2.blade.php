<div class="sec-card bg-round">
    <div class="sec-card-header" style="background-color: {{$book->ebook_bg_color}};border-radius: 10px;">
        <img class="border-r-10" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}" alt="{{$book->file_name}}">
    </div>
    <div class="sec-card-body bg-theme d-flex justify-content-between">
        <h4 class="m-0 line-height-0"> {{  Request::is('Home/en') ? Str::limit($book->file_name,14) : Str::limit($book->file_name_ar,14) ?? ''}}</h4>
        @if($book->book_type == 0)
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn btn-white">Read</a>
        @else
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn btn-white">Listen</a>
        @endif
    </div>
</div>
