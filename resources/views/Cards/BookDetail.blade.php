@extends('layout')

@section('content')
<link href="{{url('public/Website/css/style-english.css?ver=925')}}" rel=stylesheet type=text/css>

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
    .product-addto-links a i{
      float:left;
      margin-top: 8%;
      margin-left: 8%;
    }
    .col-sm-4{
    @if ((Request::segment(1) == "ar"))
        padding-left: 0px;
    @endif
    }

    .active{
        width: 211.5px;
        margin-right:40px;
    }

    /* .col-sm-8{
        @if ( $BookDetail->book_type == 1)

        max-width: 45.666667%;
        @endif
    } */

    .imagecard{
        @if ($BookDetail->book_type == 1)
            padding-bottom: 24%;
        @endif
    }


    .mb_YTPBar{
        display:none !important;
    }

    @media screen and (max-width: 767px){

        .header-nav {
            top: 82px;
        }

        .print{
            margin-right: 44%%;
        }
    }



</style>
<link rel="stylesheet" href="{{ url('public/web/assets/css/plyr.css') }}">

<div class="row d-flex justify-content-center" style="margin-left: 10px; padding-top: 56px;">
    <div class="col-sm-4" style="padding-right:0px;">
      <div class="card imagecard" >
        <div class="card-body">
            @foreach ($BookDetail->covers as $cover)

            {{-- <img class="" src="{{url('/public/Files/E-Book-CoverImg/download.jpg')}}"
            alt="------"> --}}
            <img src="{{config('global.main_url')}}/public/Files/E-Book-CoverImg/{{$cover->ebook__cover ?? ''}}" alt="woman" />

            <br><br>
            <div class="product-addto-links ">
            </div>
            @if($BookDetail->book_type == 1)

            @else
                 <div class="product-social-links text-center ">
                     @if(Session::has('user_name'))
                        <div class="product-addto-links d-flex justify-content-center">
                            <div class="row" style="width: 69%;">

                                <div class="col-sm-6 ">
                                <a title="Read Book" onclick="SessionStore()" title="Read Book"> <i class="fa fa-user"> </i> <label style="color: white; font-size: 20px:"> {{__('basic.Read')}}</label> </a>
                                </div>
                                <div class="col-sm-6 ">
                                @if($BookDetail->downloadable == 1)
                                <a title="Download Book"  style="margin-top: 7%;" onclick="SessionStorePD()" id="Download"> <i class="fa fa-download" value="2"> </i> <label style=" color:white; font-size: 20px:">{{__('basic.download')}}</label> </a>
                                @endif
                                </div>
                                <div class="col-sm-6 ">
                                @if($BookDetail->printable == 1)
                                <a title="Print Book" class="print"  onclick="SessionStorePD()" id="Print"  > <i class="fa fa-print"> </i> <label style="color: white; font-size: 20px:  ">{{__('basic.print')}}</label> </a>
                                @endif
                                </div>
                                <div class="col-sm-6 ">
                                    @if($BookDetail->ebook_audio != "")
                                    <a title="Audio Book" > <i class="fa fa-headphones"> </i> <label style="color: white; font-size: 20px: ">Audio</label> </a>
                                    @endif
                                    </div>
                            </div>
                        </div>
                     @else
                        <div class="product-addto-links d-flex justify-content-center">
                            <div class="row" style="width: 69%;">
                                <div class="col-sm-6 ">

                                    <a title="Read Book" data-toggle="modal" data-target="#ReadFeedbackModal" > <i class="fa fa-user"> </i> <label style="color: white; font-size: 20px:">Read</label> </a>
                                </div>
                                @if($BookDetail->ebook_audio == 1)
                                <div class="col-sm-6 ">
                                <a title="Audio Book"> <i class="fa fa-headphones"> </i> <label style="color: white; font-size: 20px: ">Audio</label> </a>
                                </div>
                                @endif

                            @if($BookDetail->downloadable == 1)
                            <div class="col-sm-6 ">
                                <a title="Download Book" data-toggle="modal" data-target="#DownloadeFeedbackModadl" > <i class="fa fa-download" value="2"> </i> <label style=" color:white; font-size: 20px:">Download</label> </a><br>
                            </div>
                                @endif

                            @if($BookDetail->printable == 1)
                            <div class="col-sm-6 ">
                            <a title="Print Book" class="print" data-toggle="modal" data-target="#DownloadeFeedbackModadl"> <i class="fa fa-print"> </i> <label style="color: white; font-size: 20px:  ">Print</label> </a>
                            </div>
                            @endif
                        </div>

                        </div>
                    @endif
                 </div>
            @endif
            @endforeach

        </div>
    </div>
    </div>


    <div class="col-sm-5" style="    padding-left: 0px;">
        <div class="card">
          <div class="card-body cardbody">
              @if ($BookDetail->book_type != 1)
              <h5 class="card-title" style="text-align: left; font-size: 36px;">{{( Request::segment(1)== "en") ? $BookDetail->ebook_name ?? '' : $BookDetail->ebook_name_ar ?? ''}}</h5>
              @endif

              {{-- Audio Details  --}}
              @if($BookDetail->book_type == 1)
              <div class="audio-book-area mt-20">
                  <div class="card-header bg-none">
                      <div class="d-flex justify-content-between">
                          <p class="m-0"><b> {{(Request::segment(1)== "en") ? $BookDetail->ebook_name ?? '' : $BookDetail->ebook_name_ar ?? ''}}</b></p>
                          <p class="m-0"><b>Total : {{count($audios)}} </b></p>
                      </div>
                  </div>
                  <div class="audio-player card-body">
                      <?php $i = 1;?>
                      @if($BookDetail->book_type == 1)
                      @foreach($audios as $audio)
                      <p class="mb-0 ml-2 ">{{$i}}# -{{(Request::segment(1)== "en") ? $audio->audio_title ?? '' : $BookDetail->ebook_name_ar ?? ''}}</p>
                      <audio controls class="player" >
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
                      <p> {{(Request::segment(1)== "en") ? $BookDetail->file_note ?? '' : $BookDetail->file_note_ar ?? ''}}</p>
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
                      <a href="#" class="view"> {{(Request::segment(1)== "en") ? $BookDetail->file_author ?? '' : $BookDetail->file_author_ar ?? ''}}</a>
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
  </div>

  <!-- Arabic Learning Book -->
<!-- shop-main-area-end -->
<div class="container container-card1" style="">


    <div class="row"></div>

    <!-- product slider -->
    <div class="tab-active owl-carousel" style="direction: ltr;">
        <!-- single-product-start -->
        @foreach($bookshelf as $book)
        @if($book->searchable == 1)
        @if($book->ebook_position == 1)
        @include('Cards\Card-7',['book'=> $book])
        @endif
        @endif
        @endforeach
        <!-- single-product-end -->
    </div>
    <!-- product slider -->
</div>
<!-- Arabic Learning Book -->


  <!-- Read Modal -->
  <div class="modal " id="ReadFeedbackModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Fill Information.</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">
              <form id="ReadFeedbackForm">
                  @csrf
                  <input type="hidden" name="book_id" id="book_id" value="{{$BookDetail->file_id ?? ''}}">
                  <div class="form-group">
                      <label for="exampleInputEmail1">Name</label>
                      <input type="text" class="form-control Read_Input" id="user_name" name="user_name"
                          placeholder="Enter your name" autocomplete="off">
                  </div>
                  <div class="form-group">
                      <label for="exampleInputEmail1">Email</label>
                      <input type="text" class="form-control Read_Input" id="user_email" name="user_email"
                          placeholder="Enter your email" autocomplete="off">
                  </div>
                  <div class="form-group">
                      <label for="exampleInputPassword1">Age</label>
                      <select name="age" id="age" class="form-control Read_Input slelect2" style="width:100%;">
                          <option selected disabled>Select Age</option>
                          <option value="25-35">18-25</option>
                          <option value="25-35">25-35</option>
                          <option value="35-40">35-40</option>
                          <option value="40-55">40-55</option>
                          <option value="55 and Above">55 and Above </option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="exampleInputEmail1">Nationality</label>
                      <select type="text" class="form-control slelect2" id="user_address_read" name="user_address"
                          style="width:100%;">
                          <option selected disabled>Select Nationality</option>
                          <option value="Afganistan">Afghanistan</option>
                          <option value="Albania">Albania</option>
                          <option value="Algeria">Algeria</option>
                          <option value="American Samoa">American Samoa</option>
                          <option value="Andorra">Andorra</option>
                          <option value="Angola">Angola</option>
                          <option value="Anguilla">Anguilla</option>
                          <option value="Antigua & Barbuda">Antigua & Barbuda</option>
                          <option value="Argentina">Argentina</option>
                          <option value="Armenia">Armenia</option>
                          <option value="Aruba">Aruba</option>
                          <option value="Australia">Australia</option>
                          <option value="Austria">Austria</option>
                          <option value="Azerbaijan">Azerbaijan</option>
                          <option value="Bahamas">Bahamas</option>
                          <option value="Bahrain">Bahrain</option>
                          <option value="Bangladesh">Bangladesh</option>
                          <option value="Barbados">Barbados</option>
                          <option value="Belarus">Belarus</option>
                          <option value="Belgium">Belgium</option>
                          <option value="Belize">Belize</option>
                          <option value="Benin">Benin</option>
                          <option value="Bermuda">Bermuda</option>
                          <option value="Bhutan">Bhutan</option>
                          <option value="Bolivia">Bolivia</option>
                          <option value="Bonaire">Bonaire</option>
                          <option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
                          <option value="Botswana">Botswana</option>
                          <option value="Brazil">Brazil</option>
                          <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                          <option value="Brunei">Brunei</option>
                          <option value="Bulgaria">Bulgaria</option>
                          <option value="Burkina Faso">Burkina Faso</option>
                          <option value="Burundi">Burundi</option>
                          <option value="Cambodia">Cambodia</option>
                          <option value="Cameroon">Cameroon</option>
                          <option value="Canada">Canada</option>
                          <option value="Canary Islands">Canary Islands</option>
                          <option value="Cape Verde">Cape Verde</option>
                          <option value="Cayman Islands">Cayman Islands</option>
                          <option value="Central African Republic">Central African Republic</option>
                          <option value="Chad">Chad</option>
                          <option value="Channel Islands">Channel Islands</option>
                          <option value="Chile">Chile</option>
                          <option value="China">China</option>
                          <option value="Christmas Island">Christmas Island</option>
                          <option value="Cocos Island">Cocos Island</option>
                          <option value="Colombia">Colombia</option>
                          <option value="Comoros">Comoros</option>
                          <option value="Congo">Congo</option>
                          <option value="Cook Islands">Cook Islands</option>
                          <option value="Costa Rica">Costa Rica</option>
                          <option value="Cote DIvoire">Cote DIvoire</option>
                          <option value="Croatia">Croatia</option>
                          <option value="Cuba">Cuba</option>
                          <option value="Curaco">Curacao</option>
                          <option value="Cyprus">Cyprus</option>
                          <option value="Czech Republic">Czech Republic</option>
                          <option value="Denmark">Denmark</option>
                          <option value="Djibouti">Djibouti</option>
                          <option value="Dominica">Dominica</option>
                          <option value="Dominican Republic">Dominican Republic</option>
                          <option value="East Timor">East Timor</option>
                          <option value="Ecuador">Ecuador</option>
                          <option value="Egypt">Egypt</option>
                          <option value="El Salvador">El Salvador</option>
                          <option value="Equatorial Guinea">Equatorial Guinea</option>
                          <option value="Eritrea">Eritrea</option>
                          <option value="Estonia">Estonia</option>
                          <option value="Ethiopia">Ethiopia</option>
                          <option value="Falkland Islands">Falkland Islands</option>
                          <option value="Faroe Islands">Faroe Islands</option>
                          <option value="Fiji">Fiji</option>
                          <option value="Finland">Finland</option>
                          <option value="France">France</option>
                          <option value="French Guiana">French Guiana</option>
                          <option value="French Polynesia">French Polynesia</option>
                          <option value="French Southern Ter">French Southern Ter</option>
                          <option value="Gabon">Gabon</option>
                          <option value="Gambia">Gambia</option>
                          <option value="Georgia">Georgia</option>
                          <option value="Germany">Germany</option>
                          <option value="Ghana">Ghana</option>
                          <option value="Gibraltar">Gibraltar</option>
                          <option value="Great Britain">Great Britain</option>
                          <option value="Greece">Greece</option>
                          <option value="Greenland">Greenland</option>
                          <option value="Grenada">Grenada</option>
                          <option value="Guadeloupe">Guadeloupe</option>
                          <option value="Guam">Guam</option>
                          <option value="Guatemala">Guatemala</option>
                          <option value="Guinea">Guinea</option>
                          <option value="Guyana">Guyana</option>
                          <option value="Haiti">Haiti</option>
                          <option value="Hawaii">Hawaii</option>
                          <option value="Honduras">Honduras</option>
                          <option value="Hong Kong">Hong Kong</option>
                          <option value="Hungary">Hungary</option>
                          <option value="Iceland">Iceland</option>
                          <option value="Indonesia">Indonesia</option>
                          <option value="India">India</option>
                          <option value="Iran">Iran</option>
                          <option value="Iraq">Iraq</option>
                          <option value="Ireland">Ireland</option>
                          <option value="Isle of Man">Isle of Man</option>
                          <option value="Israel">Israel</option>
                          <option value="Italy">Italy</option>
                          <option value="Jamaica">Jamaica</option>
                          <option value="Japan">Japan</option>
                          <option value="Jordan">Jordan</option>
                          <option value="Kazakhstan">Kazakhstan</option>
                          <option value="Kenya">Kenya</option>
                          <option value="Kiribati">Kiribati</option>
                          <option value="Korea North">Korea North</option>
                          <option value="Korea Sout">Korea South</option>
                          <option value="Kuwait">Kuwait</option>
                          <option value="Kyrgyzstan">Kyrgyzstan</option>
                          <option value="Laos">Laos</option>
                          <option value="Latvia">Latvia</option>
                          <option value="Lebanon">Lebanon</option>
                          <option value="Lesotho">Lesotho</option>
                          <option value="Liberia">Liberia</option>
                          <option value="Libya">Libya</option>
                          <option value="Liechtenstein">Liechtenstein</option>
                          <option value="Lithuania">Lithuania</option>
                          <option value="Luxembourg">Luxembourg</option>
                          <option value="Macau">Macau</option>
                          <option value="Macedonia">Macedonia</option>
                          <option value="Madagascar">Madagascar</option>
                          <option value="Malaysia">Malaysia</option>
                          <option value="Malawi">Malawi</option>
                          <option value="Maldives">Maldives</option>
                          <option value="Mali">Mali</option>
                          <option value="Malta">Malta</option>
                          <option value="Marshall Islands">Marshall Islands</option>
                          <option value="Martinique">Martinique</option>
                          <option value="Mauritania">Mauritania</option>
                          <option value="Mauritius">Mauritius</option>
                          <option value="Mayotte">Mayotte</option>
                          <option value="Mexico">Mexico</option>
                          <option value="Midway Islands">Midway Islands</option>
                          <option value="Moldova">Moldova</option>
                          <option value="Monaco">Monaco</option>
                          <option value="Mongolia">Mongolia</option>
                          <option value="Montserrat">Montserrat</option>
                          <option value="Morocco">Morocco</option>
                          <option value="Mozambique">Mozambique</option>
                          <option value="Myanmar">Myanmar</option>
                          <option value="Nambia">Nambia</option>
                          <option value="Nauru">Nauru</option>
                          <option value="Nepal">Nepal</option>
                          <option value="Netherland Antilles">Netherland Antilles</option>
                          <option value="Netherlands">Netherlands (Holland, Europe)</option>
                          <option value="Nevis">Nevis</option>
                          <option value="New Caledonia">New Caledonia</option>
                          <option value="New Zealand">New Zealand</option>
                          <option value="Nicaragua">Nicaragua</option>
                          <option value="Niger">Niger</option>
                          <option value="Nigeria">Nigeria</option>
                          <option value="Niue">Niue</option>
                          <option value="Norfolk Island">Norfolk Island</option>
                          <option value="Norway">Norway</option>
                          <option value="Oman">Oman</option>
                          <option value="Pakistan">Pakistan</option>
                          <option value="Palau Island">Palau Island</option>
                          <option value="Palestine">Palestine</option>
                          <option value="Panama">Panama</option>
                          <option value="Papua New Guinea">Papua New Guinea</option>
                          <option value="Paraguay">Paraguay</option>
                          <option value="Peru">Peru</option>
                          <option value="Phillipines">Philippines</option>
                          <option value="Pitcairn Island">Pitcairn Island</option>
                          <option value="Poland">Poland</option>
                          <option value="Portugal">Portugal</option>
                          <option value="Puerto Rico">Puerto Rico</option>
                          <option value="Qatar">Qatar</option>
                          <option value="Republic of Montenegro">Republic of Montenegro</option>
                          <option value="Republic of Serbia">Republic of Serbia</option>
                          <option value="Reunion">Reunion</option>
                          <option value="Romania">Romania</option>
                          <option value="Russia">Russia</option>
                          <option value="Rwanda">Rwanda</option>
                          <option value="St Barthelemy">St Barthelemy</option>
                          <option value="St Eustatius">St Eustatius</option>
                          <option value="St Helena">St Helena</option>
                          <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                          <option value="St Lucia">St Lucia</option>
                          <option value="St Maarten">St Maarten</option>
                          <option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
                          <option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
                          <option value="Saipan">Saipan</option>
                          <option value="Samoa">Samoa</option>
                          <option value="Samoa American">Samoa American</option>
                          <option value="San Marino">San Marino</option>
                          <option value="Sao Tome & Principe">Sao Tome & Principe</option>
                          <option value="Saudi Arabia">Saudi Arabia</option>
                          <option value="Senegal">Senegal</option>
                          <option value="Seychelles">Seychelles</option>
                          <option value="Sierra Leone">Sierra Leone</option>
                          <option value="Singapore">Singapore</option>
                          <option value="Slovakia">Slovakia</option>
                          <option value="Slovenia">Slovenia</option>
                          <option value="Solomon Islands">Solomon Islands</option>
                          <option value="Somalia">Somalia</option>
                          <option value="South Africa">South Africa</option>
                          <option value="Spain">Spain</option>
                          <option value="Sri Lanka">Sri Lanka</option>
                          <option value="Sudan">Sudan</option>
                          <option value="Suriname">Suriname</option>
                          <option value="Swaziland">Swaziland</option>
                          <option value="Sweden">Sweden</option>
                          <option value="Switzerland">Switzerland</option>
                          <option value="Syria">Syria</option>
                          <option value="Tahiti">Tahiti</option>
                          <option value="Taiwan">Taiwan</option>
                          <option value="Tajikistan">Tajikistan</option>
                          <option value="Tanzania">Tanzania</option>
                          <option value="Thailand">Thailand</option>
                          <option value="Togo">Togo</option>
                          <option value="Tokelau">Tokelau</option>
                          <option value="Tonga">Tonga</option>
                          <option value="Trinidad & Tobago">Trinidad & Tobago</option>
                          <option value="Tunisia">Tunisia</option>
                          <option value="Turkey">Turkey</option>
                          <option value="Turkmenistan">Turkmenistan</option>
                          <option value="Turks & Caicos Is">Turks & Caicos Is</option>
                          <option value="Tuvalu">Tuvalu</option>
                          <option value="Uganda">Uganda</option>
                          <option value="United Kingdom">United Kingdom</option>
                          <option value="Ukraine">Ukraine</option>
                          <option value="United Arab Erimates">United Arab Emirates</option>
                          <option value="United States of America">United States of America</option>
                          <option value="Uraguay">Uruguay</option>
                          <option value="Uzbekistan">Uzbekistan</option>
                          <option value="Vanuatu">Vanuatu</option>
                          <option value="Vatican City State">Vatican City State</option>
                          <option value="Venezuela">Venezuela</option>
                          <option value="Vietnam">Vietnam</option>
                          <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                          <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                          <option value="Wake Island">Wake Island</option>
                          <option value="Wallis & Futana Is">Wallis & Futana Is</option>
                          <option value="Yemen">Yemen</option>
                          <option value="Zaire">Zaire</option>
                          <option value="Zambia">Zambia</option>
                          <option value="Zimbabwe">Zimbabwe</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="exampleInputEmail1">Spoken</label>
                      <input type="text" class="form-control" id="user_spoken" name="user_spoken"
                          placeholder="Enter your spoken language" autocomplete="off">
                  </div>
                  <div class="form-group">
                      <label for="exampleInputPassword1">Qualification</label>
                      <select id="read_qualification" name="qualification" class="slelect2" style="width:100%;">
                          <option selected disabled> Select Qualification</option>
                          <option value="No formal education">No formal education</option>
                          <option value="Primary education">Primary education</option>
                          <option value="Secondary education">Secondary education or high school</option>
                          <option value="Vocational qualification">Vocational qualification</option>
                          <option value="Bachelor's degree">Bachelor's degree</option>
                          <option value="Master's degree">Master's degree</option>
                          <option value="Doctorate or higher">Doctorate or higher</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="exampleInputPassword1">Gender</label>
                      <select name="gender" id="gender" class="form-control Read_Input">
                          <option selected disabled>Select Gender</option>
                          <option value="male">Male</option>
                          <option value="female">Female</option>
                      </select>
                  </div>
              </form>
          </div>
          <div class="text-center py-2 mb-1">
              <p class="m-0" style="text-align: center;">All rights reserved for Zayed House for Islamic culture</p>
          </div>
          <div class="error text-center mx-3">
              <div id="Read_error"></div>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button id="btnSubmit-1" type="button" class="btn btn-primary" onclick="ReadFeedback()">Read</button>
          </div>
      </div>
  </div>
</div>
<script src="{{url('public/web/assets/js/plyr.js')}}"></script>

{{-- Download Model  --}}
<div class="modal " id="DownloadeFeedbackModadl" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fill Information.</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="DownloadeFeedbackForm">
                    @csrf
                    <input type="hidden" name="book_id" id="book_id" value="{{$BookDetail->file_id ?? ''}}">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name</label>
                        <input type="text" class="form-control required" id="user_name" name="user_name"
                            placeholder="Enter your name" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="text" class="form-control required" id="user_email" name="user_email"
                            placeholder="Enter your email" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Age</label>
                        <select name="age" id="read_age" class="form-control Read_Input slelect2" style="width:100%;">
                            <option selected disabled>Select Age</option>
                            <option value="25-35">18-25</option>
                            <option value="25-35">25-35</option>
                            <option value="35-40">35-40</option>
                            <option value="40-55">40-55</option>
                            <option value="55 and Above">55 and Above </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nationality</label>
                        <select type="text" class="form-control slelect2" id="user_address" name="user_address"
                            style="width:100%;">
                            <option selected disabled>Select Nationality</option>
                            <option value="Afganistan">Afghanistan</option>
                            <option value="Albania">Albania</option>
                            <option value="Algeria">Algeria</option>
                            <option value="American Samoa">American Samoa</option>
                            <option value="Andorra">Andorra</option>
                            <option value="Angola">Angola</option>
                            <option value="Anguilla">Anguilla</option>
                            <option value="Antigua & Barbuda">Antigua & Barbuda</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Armenia">Armenia</option>
                            <option value="Aruba">Aruba</option>
                            <option value="Australia">Australia</option>
                            <option value="Austria">Austria</option>
                            <option value="Azerbaijan">Azerbaijan</option>
                            <option value="Bahamas">Bahamas</option>
                            <option value="Bahrain">Bahrain</option>
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Barbados">Barbados</option>
                            <option value="Belarus">Belarus</option>
                            <option value="Belgium">Belgium</option>
                            <option value="Belize">Belize</option>
                            <option value="Benin">Benin</option>
                            <option value="Bermuda">Bermuda</option>
                            <option value="Bhutan">Bhutan</option>
                            <option value="Bolivia">Bolivia</option>
                            <option value="Bonaire">Bonaire</option>
                            <option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
                            <option value="Botswana">Botswana</option>
                            <option value="Brazil">Brazil</option>
                            <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                            <option value="Brunei">Brunei</option>
                            <option value="Bulgaria">Bulgaria</option>
                            <option value="Burkina Faso">Burkina Faso</option>
                            <option value="Burundi">Burundi</option>
                            <option value="Cambodia">Cambodia</option>
                            <option value="Cameroon">Cameroon</option>
                            <option value="Canada">Canada</option>
                            <option value="Canary Islands">Canary Islands</option>
                            <option value="Cape Verde">Cape Verde</option>
                            <option value="Cayman Islands">Cayman Islands</option>
                            <option value="Central African Republic">Central African Republic</option>
                            <option value="Chad">Chad</option>
                            <option value="Channel Islands">Channel Islands</option>
                            <option value="Chile">Chile</option>
                            <option value="China">China</option>
                            <option value="Christmas Island">Christmas Island</option>
                            <option value="Cocos Island">Cocos Island</option>
                            <option value="Colombia">Colombia</option>
                            <option value="Comoros">Comoros</option>
                            <option value="Congo">Congo</option>
                            <option value="Cook Islands">Cook Islands</option>
                            <option value="Costa Rica">Costa Rica</option>
                            <option value="Cote DIvoire">Cote DIvoire</option>
                            <option value="Croatia">Croatia</option>
                            <option value="Cuba">Cuba</option>
                            <option value="Curaco">Curacao</option>
                            <option value="Cyprus">Cyprus</option>
                            <option value="Czech Republic">Czech Republic</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Djibouti">Djibouti</option>
                            <option value="Dominica">Dominica</option>
                            <option value="Dominican Republic">Dominican Republic</option>
                            <option value="East Timor">East Timor</option>
                            <option value="Ecuador">Ecuador</option>
                            <option value="Egypt">Egypt</option>
                            <option value="El Salvador">El Salvador</option>
                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                            <option value="Eritrea">Eritrea</option>
                            <option value="Estonia">Estonia</option>
                            <option value="Ethiopia">Ethiopia</option>
                            <option value="Falkland Islands">Falkland Islands</option>
                            <option value="Faroe Islands">Faroe Islands</option>
                            <option value="Fiji">Fiji</option>
                            <option value="Finland">Finland</option>
                            <option value="France">France</option>
                            <option value="French Guiana">French Guiana</option>
                            <option value="French Polynesia">French Polynesia</option>
                            <option value="French Southern Ter">French Southern Ter</option>
                            <option value="Gabon">Gabon</option>
                            <option value="Gambia">Gambia</option>
                            <option value="Georgia">Georgia</option>
                            <option value="Germany">Germany</option>
                            <option value="Ghana">Ghana</option>
                            <option value="Gibraltar">Gibraltar</option>
                            <option value="Great Britain">Great Britain</option>
                            <option value="Greece">Greece</option>
                            <option value="Greenland">Greenland</option>
                            <option value="Grenada">Grenada</option>
                            <option value="Guadeloupe">Guadeloupe</option>
                            <option value="Guam">Guam</option>
                            <option value="Guatemala">Guatemala</option>
                            <option value="Guinea">Guinea</option>
                            <option value="Guyana">Guyana</option>
                            <option value="Haiti">Haiti</option>
                            <option value="Hawaii">Hawaii</option>
                            <option value="Honduras">Honduras</option>
                            <option value="Hong Kong">Hong Kong</option>
                            <option value="Hungary">Hungary</option>
                            <option value="Iceland">Iceland</option>
                            <option value="Indonesia">Indonesia</option>
                            <option value="India">India</option>
                            <option value="Iran">Iran</option>
                            <option value="Iraq">Iraq</option>
                            <option value="Ireland">Ireland</option>
                            <option value="Isle of Man">Isle of Man</option>
                            <option value="Israel">Israel</option>
                            <option value="Italy">Italy</option>
                            <option value="Jamaica">Jamaica</option>
                            <option value="Japan">Japan</option>
                            <option value="Jordan">Jordan</option>
                            <option value="Kazakhstan">Kazakhstan</option>
                            <option value="Kenya">Kenya</option>
                            <option value="Kiribati">Kiribati</option>
                            <option value="Korea North">Korea North</option>
                            <option value="Korea Sout">Korea South</option>
                            <option value="Kuwait">Kuwait</option>
                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                            <option value="Laos">Laos</option>
                            <option value="Latvia">Latvia</option>
                            <option value="Lebanon">Lebanon</option>
                            <option value="Lesotho">Lesotho</option>
                            <option value="Liberia">Liberia</option>
                            <option value="Libya">Libya</option>
                            <option value="Liechtenstein">Liechtenstein</option>
                            <option value="Lithuania">Lithuania</option>
                            <option value="Luxembourg">Luxembourg</option>
                            <option value="Macau">Macau</option>
                            <option value="Macedonia">Macedonia</option>
                            <option value="Madagascar">Madagascar</option>
                            <option value="Malaysia">Malaysia</option>
                            <option value="Malawi">Malawi</option>
                            <option value="Maldives">Maldives</option>
                            <option value="Mali">Mali</option>
                            <option value="Malta">Malta</option>
                            <option value="Marshall Islands">Marshall Islands</option>
                            <option value="Martinique">Martinique</option>
                            <option value="Mauritania">Mauritania</option>
                            <option value="Mauritius">Mauritius</option>
                            <option value="Mayotte">Mayotte</option>
                            <option value="Mexico">Mexico</option>
                            <option value="Midway Islands">Midway Islands</option>
                            <option value="Moldova">Moldova</option>
                            <option value="Monaco">Monaco</option>
                            <option value="Mongolia">Mongolia</option>
                            <option value="Montserrat">Montserrat</option>
                            <option value="Morocco">Morocco</option>
                            <option value="Mozambique">Mozambique</option>
                            <option value="Myanmar">Myanmar</option>
                            <option value="Nambia">Nambia</option>
                            <option value="Nauru">Nauru</option>
                            <option value="Nepal">Nepal</option>
                            <option value="Netherland Antilles">Netherland Antilles</option>
                            <option value="Netherlands">Netherlands (Holland, Europe)</option>
                            <option value="Nevis">Nevis</option>
                            <option value="New Caledonia">New Caledonia</option>
                            <option value="New Zealand">New Zealand</option>
                            <option value="Nicaragua">Nicaragua</option>
                            <option value="Niger">Niger</option>
                            <option value="Nigeria">Nigeria</option>
                            <option value="Niue">Niue</option>
                            <option value="Norfolk Island">Norfolk Island</option>
                            <option value="Norway">Norway</option>
                            <option value="Oman">Oman</option>
                            <option value="Pakistan">Pakistan</option>
                            <option value="Palau Island">Palau Island</option>
                            <option value="Palestine">Palestine</option>
                            <option value="Panama">Panama</option>
                            <option value="Papua New Guinea">Papua New Guinea</option>
                            <option value="Paraguay">Paraguay</option>
                            <option value="Peru">Peru</option>
                            <option value="Phillipines">Philippines</option>
                            <option value="Pitcairn Island">Pitcairn Island</option>
                            <option value="Poland">Poland</option>
                            <option value="Portugal">Portugal</option>
                            <option value="Puerto Rico">Puerto Rico</option>
                            <option value="Qatar">Qatar</option>
                            <option value="Republic of Montenegro">Republic of Montenegro</option>
                            <option value="Republic of Serbia">Republic of Serbia</option>
                            <option value="Reunion">Reunion</option>
                            <option value="Romania">Romania</option>
                            <option value="Russia">Russia</option>
                            <option value="Rwanda">Rwanda</option>
                            <option value="St Barthelemy">St Barthelemy</option>
                            <option value="St Eustatius">St Eustatius</option>
                            <option value="St Helena">St Helena</option>
                            <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                            <option value="St Lucia">St Lucia</option>
                            <option value="St Maarten">St Maarten</option>
                            <option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
                            <option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
                            <option value="Saipan">Saipan</option>
                            <option value="Samoa">Samoa</option>
                            <option value="Samoa American">Samoa American</option>
                            <option value="San Marino">San Marino</option>
                            <option value="Sao Tome & Principe">Sao Tome & Principe</option>
                            <option value="Saudi Arabia">Saudi Arabia</option>
                            <option value="Senegal">Senegal</option>
                            <option value="Seychelles">Seychelles</option>
                            <option value="Sierra Leone">Sierra Leone</option>
                            <option value="Singapore">Singapore</option>
                            <option value="Slovakia">Slovakia</option>
                            <option value="Slovenia">Slovenia</option>
                            <option value="Solomon Islands">Solomon Islands</option>
                            <option value="Somalia">Somalia</option>
                            <option value="South Africa">South Africa</option>
                            <option value="Spain">Spain</option>
                            <option value="Sri Lanka">Sri Lanka</option>
                            <option value="Sudan">Sudan</option>
                            <option value="Suriname">Suriname</option>
                            <option value="Swaziland">Swaziland</option>
                            <option value="Sweden">Sweden</option>
                            <option value="Switzerland">Switzerland</option>
                            <option value="Syria">Syria</option>
                            <option value="Tahiti">Tahiti</option>
                            <option value="Taiwan">Taiwan</option>
                            <option value="Tajikistan">Tajikistan</option>
                            <option value="Tanzania">Tanzania</option>
                            <option value="Thailand">Thailand</option>
                            <option value="Togo">Togo</option>
                            <option value="Tokelau">Tokelau</option>
                            <option value="Tonga">Tonga</option>
                            <option value="Trinidad & Tobago">Trinidad & Tobago</option>
                            <option value="Tunisia">Tunisia</option>
                            <option value="Turkey">Turkey</option>
                            <option value="Turkmenistan">Turkmenistan</option>
                            <option value="Turks & Caicos Is">Turks & Caicos Is</option>
                            <option value="Tuvalu">Tuvalu</option>
                            <option value="Uganda">Uganda</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="Ukraine">Ukraine</option>
                            <option value="United Arab Erimates">United Arab Emirates</option>
                            <option value="United States of America">United States of America</option>
                            <option value="Uraguay">Uruguay</option>
                            <option value="Uzbekistan">Uzbekistan</option>
                            <option value="Vanuatu">Vanuatu</option>
                            <option value="Vatican City State">Vatican City State</option>
                            <option value="Venezuela">Venezuela</option>
                            <option value="Vietnam">Vietnam</option>
                            <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                            <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                            <option value="Wake Island">Wake Island</option>
                            <option value="Wallis & Futana Is">Wallis & Futana Is</option>
                            <option value="Yemen">Yemen</option>
                            <option value="Zaire">Zaire</option>
                            <option value="Zambia">Zambia</option>
                            <option value="Zimbabwe">Zimbabwe</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Spoken</label>
                        <input type="text" class="form-control required" id="user_spoken" name="user_spoken"
                            placeholder="Enter your spoken language" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="qualification">Qualification</label>
                        <select id="qualification" name="qualification" class="slelect2" style="width:100%;">
                            <option selected disabled> Select Qualification</option>
                            <option value="No formal education">No formal education</option>
                            <option value="Primary education">Primary education</option>
                            <option value="Secondary education">Secondary education or high school</option>
                            <option value="Vocational qualification">Vocational qualification</option>
                            <option value="Bachelor's degree">Bachelor's degree</option>
                            <option value="Master's degree">Master's degree</option>
                            <option value="Doctorate or higher">Doctorate or higher</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Gender</label>
                        <select name="gender" id="gender" class="form-control required">
                            <option selected disabled>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                </form>
                <p><b>Note</b> : The way to display the book offline will be pdf, as well as when printing</p>
            </div>
            <div class="text-center py-2">
                <p class="m-0" style="text-align: center;">All rights reserved for Zayed House for Islamic culture</p>
            </div>
            <div class="error text-center mx-3">
                <div id="Downloade_error"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="btnSubmit" type="button" class="btn btn-primary"
                    onclick="DownnloadeFeedback()">Download</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#Print").click(function() {
            let print = $("#btnSubmit").html("Print");
        })

        $("#Download").click(function() {
            let print = $("#btnSubmit").html("Download");
        })
        // $(".audio-section").hide()
        $("#Listen").click(function() {
            $(".audio-section").toggle()
        })
    })

    function DownnloadeFeedback() {
        var fields = $("input[class*='required']");
        for (let i = 0; i <= fields.length; i++) {
            if ($(fields[i]).val() === '') {
                var currentElement = $(fields[i]).attr('id');
                var value = currentElement.replaceAll('_', ' ');
                $("#Downloade_error").removeClass().html('');
                $("#Downloade_error").show().addClass('alert alert-danger').html('The ' + value +
                    ' field is required.');
                return false;
            } else {
                $("#Downloade_error").hide().removeClass().html('');
            }
        }

        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "POST",
            url: "{{route('Admin-FeedBack-Send')}}",
            data: $("#DownloadeFeedbackForm").serialize(),
            error: function(jqXHR, textStatus, errorThrown) {
                $("#btnSubmit").prop("disabled", false);
                $("#Downloade_error").removeClass().html('').show();
                $("#Downloade_error").addClass("alert alert-danger").html(errorThrown);
                return false;
            },
            success: function(data) {
                $("#btnSubmit").prop("disabled", false);
                if (data["success"] == true) {
                    $("#Downloade_error").removeClass().html('').show();
                    $("#Downloade_error").addClass("alert alert-success").html(data['message']);
                    setTimeout(() => {
                        $("#DownloadeFeedbackModadl").modal('hide');
                        $("#Downloade_error").removeClass().html('').hide();
                        $("#DownloadeFeedbackForm")[0].reset();
                        window.open(
                            // "{{config('global.main_url')}}public/Files/E-Book/{{$BookDetail->p_r_ebook}}",
                            // '_blank'
                            "../File/{{$BookDetail->unique_id}}", '_blank'
                            );
                        location.relod();
                    }, 2000);
                } else {
                    $("#Downloade_error").removeClass().html('').show();
                    $("#Downloade_error").addClass("alert alert-danger").html(data['message']);
                    return false;
                }
            }
        });
    }

    function ReadFeedback() {
        var fields = $("input[class*='Read_Input']");
        for (let i = 0; i <= fields.length; i++) {
            if ($(fields[i]).val() === '') {
                var currentElement = $(fields[i]).attr('id');
                var value = currentElement.replaceAll('_', ' ');
                $("#Read_error").removeClass().html('');
                $("#Read_error").show().addClass('alert alert-danger').html('The ' + value + ' field is required.');
                return false;
            } else {
                $("#Read_error").hide().removeClass().html('');
            }
        }

        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "POST",
            url: "{{route('Admin-FeedBack-Send')}}",
            data: $("#ReadFeedbackForm").serialize(),
            error: function(jqXHR, textStatus, errorThrown) {
                $("#btnSubmit").prop("disabled", false);
                $("#Read_error").removeClass().html('').show();
                $("#Read_error").addClass("alert alert-danger").html(errorThrown);
                return false;
            },
            success: function(data) {
                $("#btnSubmit").prop("disabled", false);
                // return false;
                if (data["success"] == true) {
                    $("#Read_error").removeClass().html('').show();
                    $("#Read_error").addClass("alert alert-success").html(data['message']);
                    setTimeout(() => {
                        $("#ReadFeedbackModal").modal('hide');
                        $("#Read_error").removeClass().html('').hide();
                        $("#ReadFeedbackForm")[0].reset();
                        window.open(
                            "../File/{{$BookDetail->unique_id}}",
                            // "../../../public/Files/{{$BookDetail->unique_id}}",
                            '_blank');

                        location.relod();

                    }, 2000);

                } else {
                    $("#Read_error").removeClass().html('').show();
                    $("#Read_error").addClass("alert alert-danger").html(data['message'][0]);
                    return false;
                }
            }
        });
    }


    // SessionStore function
    function SessionStore() {
        $.ajax({
            type: "GET",
            url: "{{route('Admin-Session-Store')}}",
            success: function(data) {
                setTimeout(() => {
                    window.open(
                        "../File/{{$BookDetail->unique_id}}",
                        '_blank');
                }, 1000);
            }
        })
    }

    function SessionStorePD() {
        $.ajax({
            type: "GET",
            url: "{{route('Admin-Session-Store')}}",
            success: function(data) {
                var elink = "{{$BookDetail->ebook_download_link}}";
                if (elink == "") {
                    window.open(
                        "{{config('global.main_url')}}public/Files/E-Book/{{$BookDetail->p_r_ebook}}",
                        '_blank');
                } else {
                    console.log("Ebook Click")
                    window.open(
                        "{{$BookDetail->ebook_download_link}}",
                        '_blank');
                }
                return false
            }
        })
    }
    </script>
@endsection
