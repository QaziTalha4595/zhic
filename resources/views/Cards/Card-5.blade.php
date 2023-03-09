<style>
    .bg-theme{
    background: #0098BE !important;
}
.meaning-q-card-body h3 {
    color: #fff;
    margin: 0;
    font-weight: 100;
    font-size: 18px;
}
</style>

<div class="card book-card-1 my-2 bg-round" style="padding-bottom:0;">
    <div class="img-bg" style="background-color: {{$book->ebook_bg_color}};">
        <img class="img-w-70" src="{{url('/public/Files/E-Book-CoverImg')}}/{{$book->ebook__cover}}" alt="{{$book->file_name}}">
    </div>
    <div class="card-body bg-theme-grey">
        <div class="product-rating text-left mb-2">
            <ul>
                @for($i = 0; $i < 5; $i++) @if(round($book->avg_rating) > $i)
                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                    @else
                    <li><a href="#"><i class="fa fa-star" style="color:grey;"></i></a></li>
                    @endif
                    @endfor
                    <li>{{round($book->avg_rating)}}.0</li>
            </ul>
        </div>
        <h5 class="card-title">  {{  Request::is('Home/en') ? Str::limit($book->file_name,50) : Str::limit($book->file_name_ar,50) ?? ''}}</h5>
        <p> {{Request::is('/Home/en') ? Str::limit($book->file_note,60) : Str::limit($book->file_note_ar,60)}}</p>
        @if($book->book_type == 0)
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn card-btn">Read</a>
        @else
        <a href="{{url('/')}}/{{$book->ebook_slug}}/Detail" class="btn card-btn">Listen</a>
        @endif
    </div>
</div>
