<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.text-white.mb-0{
display : none !important;
}
</style>
</head>
<body>
        <div class="content-body">
            <div class="container-fluid mt-3">
                <!-- 일 년도 데이터 -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-7">
                            <div class="card-body">
                                <!-- 1년 신규 유저 수 -->
                                <h3 class="card-title text-white">New Users</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white" id="users"></h2>
                                    <p class="yearAgo"></p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <!-- 1년 매출 -->
                                <h3 class="card-title text-white">Total Sales</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white" id="sales"></h2>
                                    <p class="yearAgo"></p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-5">
                            <div class="card-body">
                                <!-- 1년 전체 예약 수 -->
                                <h3 class="card-title text-white">New Reservation</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white" id="reservs"></h2>
                                    <p class="yearAgo"></p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-8">
                            <div class="card-body">
                                <!-- 1년 전체 리뷰 수 -->
                                <h3 class="card-title text-white">New Reviews</h3>
                                <div class="admin-div d-inline-block">
                                    <h2 class="text-white" id="reviews"></h2>
                                    <p class="yearAgo"></p>
                                </div>
                                
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
                                            <h2 class="gradient-3-text m-0" id="chartSales"></h2>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="adminChart" width="500" height="250"></canvas>
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
                                            <tbody id="hostTableBody"></tbody>
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
        <script>
        // ajax
       $(function yearago(){
       		$.ajax({
       			method:'GET',
       			url:'ajaxyearago.do',
       			success:function(data){
       				var date = new Date();
       				var today = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate();
       				$('.yearAgo').html(data + " ~ " + today);
       			}
       		});
       	});
        			
        			
        $(function ajaxYearData(){
        	$.ajax({
        		method:'GET',
        		url:'ajaxYearData.do',
        		success:function(data){
        			$('#users').html(data[0]);
        			$('#reservs').html(data[1]);
        			$('#sales').html(data[2]);
        			$('#chartSales').html('>>' + data[2]+'원');
        			$('#reviews').html(data[3]);
        		}
        	});
        });
        
        
        $(function ajaxHostRank(){
        	$.ajax({
        		method:'GET',
        		url:'ajaxHostRank.do',
        		success:function(data){
                    $.each(data, function(ind, val){
                    	var date = new Date(val.joindate);
           				var join = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate();
                          $('#hostTableBody').append($('<tr>').append($('<td>').html(val.rank))
							                           	 	 .append($('<td>').html(val.id))	
							                           	 	 .append($('<td>').html(val.gender))
							                          	  	 .append($('<td>').html(val.lnum))
							                          	  	 .append($('<td>').html(join)));
                    });
        		}
        	});
        });
        
        $(function ajaxMonthlyChart(){
        	$.ajax({
        		method:'GET',
        		url:'ajaxMonthlyChart.do',
        		success:function(data){
        			console.log(data[0]);
        			console.log(data[0].monthdate == '2021');
        			
        			var ctx = $('#adminChart');
                	var chartData = {
                			labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                			datasets:[{
                				data:[{
//                					if(data[0].monthdate == '2021-09'){
//                						data[0].monthsales
//                					}
                					
                				}],
                				label:'올해',
                				borderColor : 'red',
                				borderWidth: 2,
                				pointBackgroundColor : 'black'
                			},{
                			data:[600,500,400,300,200,100,0,100,200,300,400,500],
                			label:'작년',
            				borderColor : 'blue',
            				borderWidth: 2,
            				pointBackgroundColor : 'black'
                			}]
                	}
                	var adminChart = new Chart(ctx,{
                		type: 'line',
                		data: chartData,
                		option:{
                			legend:{
                				display:false
                			}
                		}
                	});
        		}
        	});
        	
        });
        		
        </script>
</body>
</html>