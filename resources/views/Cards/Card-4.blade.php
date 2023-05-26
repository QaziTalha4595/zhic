{{-- Home Card --}}

<div class="col-lg-6 ">
    <div class="meaning-q-card bg-round">
        <div class="meaning-q-card-img" style="background: {{$book->ebook_bg_color}};">
            <br>
            <img src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}"
                                onerror="this.onerror=null;this.src='https://www.shutterstock.com/image-illustration/jpeg-blank-notebook-isolated-on-600w-74102503.jpg';"
                           ><br><br>
            {{-- <img src="{{url('/public/Files/E-Book-Cover')}}/{{$book->ebook_cover}}"
                alt="{{$book->file_name}}"> --}}
        </div>
        <div class="meaning-q-card-body d-flex justify-content-between bg-theme">
            <h3 class="mb-0 pt-1"> {{  (Request::segment(1)== "en") ? $book->file_name : $book->file_name_ar ?? ''}}</h3>
            @if($book->book_type == 0)
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn btn-white">{{ __('basic.Read') }}</a>
            @else
            <a href="{{url( (Request::segment(1) == 'ar') ? 'ar/' : 'en/' )}}/EBook/{{$book->ebook_slug}}" class="btn btn-white">{{__('basic.Listen')}}</a>
            @endif
        </div>
    </div>
</div>
