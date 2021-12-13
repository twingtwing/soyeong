<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div class="content-body">

            <div class="container-fluid mt-3">
                <!-- 일 년도 데이터 -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-7">
                            <div class="card-body">
                                <!-- 한달 신규 유저 수 -->
                                <h3 class="card-title text-white">New Users</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white">4565</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fas fa-concierge-bell"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <!-- 한달 매출 -->
                                <h3 class="card-title text-white">Sales</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white">₩ 8541</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fas fa-money-bill-alt"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-5">
                            <div class="card-body">
                                <!-- 한달 전체 예약 수 -->
                                <h3 class="card-title text-white">Reservation</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white">4565</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fas fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-8">
                            <div class="card-body">
                                <!-- 한달 전체 리뷰 수 -->
                                <h3 class="card-title text-white">Reviews</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white">1020</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fas fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 일년도 chart -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div class="ml-2">
                                            <h3 class="mb-1 mt-2">Sales</h3>
                                            <p class="card-text">Total Earnings of this Year</p>
                                            <h2 class="gradient-3-text m-0">₩ 12,555</h2>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="admin-chart" width="500" height="250"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- host table -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body pb-0 d-flex justify-content-between">
                                <div class="ml-2">
                                    <h3 class="mb-1 mt-2">Host top 10</h3>
                                    <p class="card-text">The 10 best hosts of this Year</p>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs text-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>순위</th>
                                                    <th>아이디</th>
                                                    <th>성별</th>
                                                    <th>숙소 갯수</th>
                                                    <th>가입 날짜</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-danger">1</td>
                                                    <td>iPhone X</td>
                                                    <td><i class="fa fa-venus text-success  mr-2"></i> Female</td>
                                                    <td>10개</td>
                                                    <td>2021-01-02</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-danger">2</td>
                                                    <td>iPhone X</td>
                                                    <td><i class="fa fa-mars text-success  mr-2"></i> Male</td>
                                                    <td>7개</td>
                                                    <td>2021-02-02</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
                
            </div>
            <!-- #/ container -->
        </div>
</body>
</html>