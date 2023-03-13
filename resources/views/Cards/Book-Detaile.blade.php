@extends('layout')

@section('content')
<style>
    .card1{
        max-width: 540px;
        border: 1px solid rgba(0, 0, 0, 0.125);
        margin-left:1px;
        min-height:10px;
        padding-bottom:4%;
        text-align: left;
    }
    i{
        color: white;
    }
    .cardbody{
        text-align: left;
    }
</style>
<link rel="stylesheet" href="{{url('public/web/assets/css/plyr.css')}}">


<div class="row" style="margin-left: 10px; padding-top: 56px;">
    <div class="col-sm-3">
      <div class="card ">
        <div class="card-body">
            @foreach($BookDetail->covers as $cover)
            {{-- @php
                dd($BookDetail->covers);
            @endphp --}}
            <img src="{{config('global.main_url')}}/public/Files/E-Book-CoverImg/{{$cover->ebook__cover ?? ''}}" alt="woman" />
            {{$cover->ebook__cover ?? ''}}

            <li data-toggle="modal" data-target="#RatingModal"> <a href="#"
                class="text-grey"> Rating
                {{round($BookDetail->avg_rating)}}.0</a> </li>
          <a href="#" class="btn btn-primary btn-small"> <i class="fa fa-download" aria-hidden="true" ></i></a>
          <a href="#" class="btn btn-primary"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
          <a href="#" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i></a>
          <a href="#" class="btn btn-primary"><i class="fa fa-book" aria-hidden="true"></i></a>
            @endforeach
        </div>
      </div>
    </div>

    <div class="col-sm-4">
      <div class="card">
        <div class="card-body cardbody">
            @if ($BookDetail->book_type != 1)
            <h5 class="card-title" style="text-align: left;">{{$BookDetail->file_name ?? ' '}}</h5>
            @endif

            @if($BookDetail->book_type == 1)
            <div class="audio-book-area mt-20">
                <div class="card-header bg-none">
                    <div class="d-flex justify-content-between">
                        <p class="m-0"><b> {{$BookDetail->file_name ?? ''}}</b></p>
                        <p class="m-0"><b>Total : {{count($audios)}} </b></p>
                    </div>
                </div>
                <div class="audio-player card-body">
                    <?php $i = 1;?>
                    @if($BookDetail->book_type == 1)
                    @foreach($audios as $audio)
                    <p class="mb-0 ml-2 ">{{$i}}# -{{$audio->audio_title}}</p>
                    <audio controls class="player">
                        <source
                            src="{{url('/')}}/public/Files/E-Book-Audio/{{$audio->audio_file ?? ''}}"
                            type="audio/mp3">
                    </audio>
                    <?php $i++;?>
                    @endforeach
                    @endif
                </div>
            </div>
            @endif

            @if($BookDetail->book_type != 1)
            <div class="product-info-stock-sku">
                <div class="product-addto-links-text">
                    <p>{{$BookDetail->file_note ?? ''}}</p>
                </div>
            </div>
            @endif

            @if($BookDetail->file_isbn != null)
            <div class="product-reviews-summary">
                <div class="reviews-actions">
                    <a href="#"><b> ISBN</b></a>
                    <a href="#" class="view">{{$BookDetail->file_isbn ?? ''}}</a>
                </div>
            </div>
            @endif

            @if($BookDetail->file_author != null)
            <div class="product-reviews-summary">
                <div class="reviews-actions">
                    <a href="#"><b> Author</b></a>
                    <a href="#" class="view">{{$BookDetail->file_author ?? ''}}</a>
                </div>
            </div>
            @endif

            @if($BookDetail->ebook_publisher != null)
            <div class="product-reviews-summary">
                <div class="reviews-actions">
                    <a href="#"><b> Publisher</b></a>
                    <a href="#" class="view">{{$BookDetail->ebook_publisher ?? ''}}</a>
                </div>
            </div>
            @endif
        </div>
      </div>
    </div>

    <div class="col-sm-4">


        {{-- @php
            dd($BookDetails)
        @endphp --}}
         {{-- @foreach($BookDetails as $Books)
         @if ($Books->book_type != 1)
            <div class="card card1" style="margin-left:1px;">
                <div class="row no-gutters">
                <div class="col-md-6">
                    <img class="" src="{{url('/public/Files/E-Book-CoverImg/11307_urdu.jpeg')}}"
                        alt="------" >
                </div>
                <div class="col-md-5">
                    <div class="card-body">

                        <h5 class="card-title" style="text-align: left;">{{$Books->file_name}}</h5>
                        <p class="card-text">{{$Books->file_note}}</p>
                            @if($Books->book_type == 0)
                            <a href="{{url('/')}}/{{$Books->ebook_slug}}/Detaile" class="btn btn-white">Read</a>
                            @else
                            <a href="{{url('/')}}/{{$Books->ebook_slug}}/Detaile" class="btn btn-white">Listen</a>
                            @endif
                    </div>
                </div>
                </div>
            </div>
            @endif
            @if ($Books->book_type == 1)
            <div class="card card1" style="margin-left:1px;">
                <div class="row no-gutters">
                <div class="col-md-6">
                    <img class="" src="{{url('/public/Files/E-Book-CoverImg/11307_urdu.jpeg')}}"
                        alt="------" >
                </div>
                <div class="col-md-5">
                    <div class="card-body">

                        <h5 class="card-title" style="text-align: left;">{{$Books->file_name}}</h5>
                        <p class="card-text">{{$Books->file_note}}</p>
                            @if($Books->book_type == 0)
                            <a href="{{url('/')}}/{{$Books->ebook_slug}}/Detaile" class="btn btn-white">Read</a>
                            @else
                            <a href="{{url('/')}}/{{$Books->ebook_slug}}/Detaile" class="btn btn-white">Listen</a>
                            @endif
                    </div>
                </div>
                </div>
            </div>
            @endif
            @endforeach --}}

            <div class="card card1" >
            <div class="row no-gutters">
              <div class="col-md-6">
                <img class="" src="{{url('/public/Files/E-Book-CoverImg/5676_Bengali1.jpeg')}}"
                    alt="------" >
              </div>
              <div class="col-md-5">
                <div class="card-body">
                    <h5 class="card-title" style="text-align: left;">The Universal Quran</h5>
                    <p class="card-text">
                      المصحف العادي</p>
            <p class="card-text" style="color: black;">Publisher ZHIC</p>
                    <a href="#" class="btn btn-primary">Read</a>
                </div>
              </div>
            </div>
          </div>
          <div class="card card1">
            <div class="row no-gutters">
              <div class="col-md-6">
                <img class="" src="{{url('/public/Files/E-Book-CoverImg/16698_42995_universityQuran.jpeg')}}"
                    alt="------" >
              </div>
              <div class="col-md-5">
                <div class="card-body">
                    <h5 class="card-title" style="text-align: left;">The Universal Quran</h5>
                    <p class="card-text">
                      المصحف العادي</p>
            <p class="card-text" style="color: black;">Publisher ZHIC</p>
                    <a href="#" class="btn btn-primary">Read</a>
                </div>
              </div>
            </div>
          </div>

      </div>

  </div>


@endsection
