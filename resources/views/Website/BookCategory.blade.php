@extends('Layout')

@section('content')
<div class="breadcrumbs-area mb-70">
    <div class="row">
        <div class="custom-breadcrumbs">
            <h5 class="active"></h5>
            <ul>
                <li><a href="{{url('/')}}">Home</a></li>
                <li>||</li>
                <li><a href="#" class="active"></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- breadcrumbs-area-end -->

<div class="shop-main-area mb-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-12 order-lg-1 order-2 mt-sm-50 mt-xs-40" style="margin-top:25px;">
                <div class="shop-left">
                    <div class="card mb-20">
                        <div class="card-header">
                            <h6 class="mb-0">Filter by language</h6>
                        </div>
                        <div class="left-menu card-body">
                            <ul>
                                
                                <li>
                                    <a href="javascript:void(0)"
                                        onclick="language()">
                                        <span>
                                            <input class="language" name="filter_radio" type="radio"
                                                value=""
                                                >
                                        </span>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Filter by author</h6>
                        </div>
                        <div class="left-menu card-body">
                            <ul>
                                
                                <li>
                                    <a href="javascript:void(0)" onclick="Author('')">
                                        
                                        <span>
                                            <input class="language" name="filter_radio" type="radio"
                                                value=""
                                                >
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- <div class="banner-area mb-30 mt-30">
                        <div class="banner-img-2">
                            <a href="#"><img src="public/Files/Promotion/}}"
                                    alt="banner" /></a>
                        </div>
                    </div> -->
                </div>
            </div>
            <div class="col-lg-9 col-md-12 col-12 order-lg-2 order-1">
                <div class="toolbar mb-30">
                    <div class="shop-tab">
                        <div class="tab-3">
                            <ul class="nav">
                                <li><a href="#list"><i class="fa fa-bars"></i>List</a></li>
                            </ul>
                        </div>
                        <div class="list-page">
                            <p>Items <span class="ml-2">0 to</span> </p>
                        </div>
                    </div>
                    <div class="field-limiter">
                        <div class="control">
                            <span>Sort By</span>
                            <!-- chosen-start -->
                            <select id="BookPeriod" name="BookPeriod" style="width:130px;" class="chosen-select"
                                tabindex="1" onchange="BookSort()">
                                <option selected disabled>select</option>
                                <option value="DESC" >Lastest Book</option>
                                <option value="ASC" >Oldest Book</option>
                            </select>
                            <!-- chosen-end -->
                        </div>
                    </div>
                </div>
                <!-- tab-area-start -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="th">
                        <div class="row" id="Category-Item-List">
                           
                        </div>
                        <div class="text-center">
                            <div id="response" style="display:none;">
                                <p><img src="" alt="" width="70"></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-info" id="load-btn" onclick="Pagination()">Load More</button>
                </div>
                <!-- tab-area-end -->
                <!-- pagination-area-start -->
                <div class="pagination-area mt-50">
                </div>
                <!-- pagination-area-end -->
            </div>
        </div>
    </div>
</div>
@endsection