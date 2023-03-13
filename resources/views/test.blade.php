@extends('layout')

@section('content')
<style>
    .card1{
        max-width: 540px;
        border: 1px solid #CAC9C9;
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
<div class="row" style="margin-left: 10px; padding-top: 56px;">
    <div class="col-sm-3">
      <div class="card ">
        <div class="card-body">
            <img class="" src="{{url('/public/Files/E-Book-CoverImg/5676_Bengali1.jpeg')}}"
            alt="------">
        </div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="card">
        <div class="card-body cardbody">
          <h5 class="card-title" style="text-align: left;">The Universal Quran</h5>
          <p class="card-text">المصحف العادي</p>
          <p class="card-text" style="color: black;">Publisher ZHIC</p>
          <i class="fa fa-star-o" aria-hidden="true" style="color:#E8B322;"></i><i class="fa fa-star-o" aria-hidden="true"style="color:#E8B322;"></i><i class="fa fa-star-o" aria-hidden="true"style="color:#E8B322;"></i><i class="fa fa-star-o" aria-hidden="true"style="color:#E8B322;"></i><i class="fa fa-star-o" aria-hidden="true"style="color:#E8B322;"></i> <span>Rating 5.0</span><br><br>
          <div class="audio-player card-body">

            <p class="mb-0 ml-2 ">1# -title</p>
            <audio controls class="player">
                <source
                    src="{{url('/public/Files/E-Book-Audio/17298634509145.mp3')}}"
                    type="audio/mp3">
            </audio>

        </div>
        </div>
      </div>
    </div>
    <div class="col-sm-4">

          <div class="card card1" style="margin-left:1px;">
            <div class="row no-gutters">
              <div class="col-md-6">
                <img class="" src="{{url('/public/Files/E-Book-CoverImg/11307_urdu.jpeg')}}"
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
