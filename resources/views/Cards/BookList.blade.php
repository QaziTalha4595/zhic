@extends('layout')
@section('title', $BookDetail[0]->category_name. '-'.$BookDetail[0]->sub_category_name)
@section('content')

<!-- breadcrumbs-area-start -->

<div class="breadcrumbs-area mb-70">
    <div class="row">
        <div class="custom-breadcrumbs">
            {{-- @php

                dd($p_category_name);
            @endphp --}}
            <h5 class="active">{{(Request::segment(1) == "en") ? $BookDetail[0]->category_name : $BookDetail[0]->category_name_ar}}</h5>
            <ul>
                <li><a href="{{url('/')}}">{{__('basic.Home')}}</a></li>
                <li>||</li>
                <li><a href="#" class="active">{{(Request::segment(1) == "en") ? $BookDetail[0]->category_name : $BookDetail[0]->category_name_ar}}</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- breadcrumbs-area-end -->



<div class="shop-main-area mb-70">

    <div class="container">
        <div class="row">

            <div class="col-lg-3 col-md-12 col-12 order-lg-1 order-2 mt-sm-50 mt-xs-40" >
                <div class="shop-left">
                    <div class="card mb-20">
                        <div class="card-header">
                            <h6 class="mb-0">{{__('basic.Filterbylanguage')}}</h6>
                        </div>
                        <div class="left-menu card-body">
                            <ul>
                                @foreach($langGroup as $lang)
                                <li>
                                    <a href="javascript:void(0)"
                                        onclick="language({{$lang->language_id}})">{{$lang->languages ?? ''}}
                                        <span>
                                            <input class="language" name="filter_radio" type="radio"
                                                value="{{$lang->language_id ?? ''}}"
                                                <?php if ($lang->language_id == $test) {echo "checked";}?>>
                                        </span>
                                    </a>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">{{__('basic.FilterByAuthor')}}</h6>
                        </div>
                        <div class="left-menu card-body">
                            <ul>
                                @foreach($authorGroup as $autor)
                                @if($autor->ebook_author != "")
                                <li>
                                    <a href="javascript:void(0)" onclick="Author('{{$autor->ebook_author}}')">
                                        {{ (Request::segment(1) == "en") ? Str::limit($autor->ebook_author,20) : Str::limit($autor->ebook_author_ar,20) ?? '' }}
                                        <span>
                                            <input class="language" name="filter_radio" type="radio"
                                                value="{{$autor->ebook_author ?? ''}}"
                                                <?php if ($autor->ebook_author == $author) {echo "checked";}?>>
                                        </span>
                                    </a>
                                </li>
                                @endif
                                @endforeach
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-9 col-md-12 col-12 order-lg-2 order-1">
                <div class="toolbar mb-30 border">
                    <div class="shop-tab">
                        <div class="tab-3">
                            <ul class="nav">
                                <li ><a onclick="ChangeViewMode('3-col')" href="?mode=small"><i class="fa fa-th" aria-hidden="true"></i></a></li>
                                <li ><a onclick="ChangeViewMode('2-col')" href="?mode=large"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="list-page">
                            <p>   {{__('basic.items')}}  {{__('basic.to')}} <span class="ml-2">{{ count($BookDetail)}}</span> </p>
                        </div>
                    </div>
                    <div class="field-limiter">
                        <div class="control">
                            <span>{{__('basic.sort')}} :</span>
                            <!-- chosen-start -->
                            <select id="BookPeriod" name="BookPeriod" style="width:130px;" class="chosen-select"
                                tabindex="1" onchange="BookSort()">
                                <option selected disabled>{{__('basic.select')}}</option>
                                <option value="DESC" <?php if ($orderBy == "DESC") {
    echo "selected";
}?>>{{__('basic.latest')}}</option>
                                <option value="ASC" <?php if ($orderBy == "ASC") {
    echo "selected";
}?>>{{__('basic.oldest')}}</option>
                            </select>
                            <!-- chosen-end -->
                        </div>
                    </div>
                </div>
                <!-- tab-area-start -->
                <div class="tab-content">
                    <div class="tab-pane show active" id="th">
                        <div class="row" id="Category-Item-List">
                            @include('Cards.CategoryItem')
                        </div>
                        <div class="text-center">
                            <div id="response" style="display:none;">
                                <p><img src="{{url('public/web/assets/img/logo/loader.gif')}}" alt="" width="70"></p>
                            </div>
                        </div>
                    </div>

                </div>
                @if($totalpage != 1)
                <div class="text-center">
                    <button type="button" class="btn btn-info" id="load-btn" onclick="Pagination()">Load More</button>
                </div>
                @endif
                <!-- tab-area-end -->
                <!-- pagination-area-start -->
                <div class="pagination-area mt-50">
                </div>
                <!-- pagination-area-end -->
            </div>
        </div>
    </div>
</div>
<script>
var page = 1;
var base_url = "{{url('/')}}"

function BookSort() {
    var main_value = $("#BookPeriod").val();
    var url = updateQueryStringParameter(window.location.href, "orderBy", main_value);
    window.location = url;
}

function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return uri + separator + key + "=" + value;
    }
}


function goUp(url){
  if (url.endsWith("/")) url = url.substring(0,url.length-1)
  const lastSlashPosition = url.lastIndexOf("/");

  return lastSlashPosition <=7 ? url: url.substring(0,lastSlashPosition);
}

function language(language_id) {
    var main_value = language_id;
    var  m_url = window.location.href;
    if("{{$t_category}}" == "no"){
        m_url = goUp(window.location.href)
    }
    var url = updateUrlLanguage(m_url, "language", main_value);
    window.location = url;
}


function Author(Author) {

    var main_value = Author;
    var  m_url = window.location.href;
    if("{{$t_category}}" == "no"){
        m_url = goUp(window.location.href)
    }

    var url = updateUrlLanguage(m_url, "author", main_value);
    window.location = url;
}

function Pagination() {
    let totalpage = {{$totalpage}};
    page++
    if (totalpage == page) {
        $("#load-btn").hide()
    }
    $.ajax({
            type: "GET",
            url: "?page=" + page,
            beforeSend: function() {
                $('#response').show();
            },
            success: function(data) {
                $('#response').hide();
                if (data.html == "") {
                    alert("Data Is end");
                    return false;
                }
                $("#Category-Item-List").append(data.html)
            }
        })
    return false;
}

function updateUrlLanguage(uri, key, value, limit) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return uri + separator + key + "=" + value;
    }

}
function ChangeViewMode(mode) {
    $.get("{{route('Change-View-Mode')}}", {mode: mode},
        function (data) {
        //  alert(data)
        }
    );
 }
</script>
@endsection
