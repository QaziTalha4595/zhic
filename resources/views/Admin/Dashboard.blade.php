@extends('Admin.AdminLayout')
@section('content')

<div class="container mt-4">
    <div class="row">
        <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{$ebook_count ?? ''}}</h3>

                    <p>Total E-Books</p>
                </div>
                <div class="icon">
                    <i class="far fa-chart-bar"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>{{$audio_count ?? ''}}</h3>

                    <p>Total Audio Book</p>
                </div>
                <div class="icon">
                    <i class="fas fa-chart-pie"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>53</h3>
                    <p>Total User</p>
                </div>
                <div class="icon">
                    <i class="fas fa-shopping-bag"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <!-- BAR CHART -->
            <div class="card card-warning">
                <div class="card-header">
                    <h3 class="card-title">E-Book Stats</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="chart">
                        <canvas id="myChart" width="400" height="270"></canvas>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
        <div class="col-lg-6">
            <!-- BAR CHART -->
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Audio Book Stats</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="chart">
                        <canvas id="audioChart" width="400" height="270"></canvas>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>
</div>
<script src="{{url('public/plugins/jquery/jquery.min.js')}}"></script>
<script src="{{url('public/plugins/chart.js/Chart.min.js')}}"></script>
<script>
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June' ,'July' , 'August' , 'September' , 'October' , 'November' ,'December'],
        datasets: [{
            label: 'Book Views',
            data: [12, 19, 8, 5, 10, 12,5,7,9,12,9,5],
            backgroundColor: [
                'rgba(255, 99, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(104, 253, 235, 0.2)',
                'rgba(166, 112, 249, 0.2)',
                'rgba(204, 254, 103, 0.2)',
                'rgba(253, 151, 104, 0.2)',
                'rgba(253, 226, 104, 0.2)',
                'rgba(57, 38, 95, 0.2)',
                'rgba(94, 57, 38, 0.2)',
                'rgba(166, 112, 249, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(104, 253, 235, 1)',
                'rgba(166, 112, 249, 1)',
                'rgba(204, 254, 103, 1)',
                'rgba(253, 151, 104, 1)',
                'rgba(253, 226, 104, 1)',
                'rgba(57, 38, 95, 1)',
                'rgba(94, 57, 38, 1)',
                'rgba(166, 112, 249, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var ctx = document.getElementById('audioChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June' ,'July' , 'August' , 'September' , 'October' , 'November' ,'December'],
        datasets: [{
            label: 'Book Views',
            data: [12, 19, 8, 5, 10, 12,5,7,9,12,9,5],
            backgroundColor: [
                'rgba(255, 99, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(104, 253, 235, 0.2)',
                'rgba(166, 112, 249, 0.2)',
                'rgba(204, 254, 103, 0.2)',
                'rgba(253, 151, 104, 0.2)',
                'rgba(253, 226, 104, 0.2)',
                'rgba(57, 38, 95, 0.2)',
                'rgba(94, 57, 38, 0.2)',
                'rgba(166, 112, 249, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(104, 253, 235, 1)',
                'rgba(166, 112, 249, 1)',
                'rgba(204, 254, 103, 1)',
                'rgba(253, 151, 104, 1)',
                'rgba(253, 226, 104, 1)',
                'rgba(57, 38, 95, 1)',
                'rgba(94, 57, 38, 1)',
                'rgba(166, 112, 249, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
@endsection()
