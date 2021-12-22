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
                                <span class="float-right display-5 opacity-5"><i class="fas fa-concierge-bell"></i></span>
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
                                <span class="float-right display-5 opacity-5"><i class="fas fa-money-bill-alt"></i></span>
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
                               <span class="float-right display-5 opacity-5"><i class="fas fa-users"></i></span>
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
                                            <h3 class="mb-1 mt-2 text-warning">Sales</h3>
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
                                    <h3 class="mb-1 mt-2 text-warning">Host top 10</h3>
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
                                                    <th><i class="fas fa-venus-mars text-success mr-2"></i>성별</th>
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
        			$('#sales').html('￦ '+data[2].toLocaleString('ko-KR'));
        			$('#chartSales').html('￦ ' + data[2].toLocaleString('ko-KR')+'원');
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
                  var thisJan = 0;
                  var thisFeb = 0;
                  var thisMar = 0;
                  var thisApr = 0;
                  var thisMay = 0;
                  var thisJun = 0;
                  var thisJul = 0;
                  var thisAug = 0;
                  var thisSep = 0;
                  var thisOct = 0;
                  var thisNov = 0;
                  var thisDec = 0;
                  for(var i=0; i<data.length; i++){
                     if(data[i].monthdate == "2021-01"){
                        thisJan = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-02"){
                        thisFeb = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-03"){
                        thisMar = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-04"){
                        thisApr = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-05"){
                        thisMay = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-06"){
                        thisJun = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-07"){
                        thisJul = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-08"){
                        thisAug = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-09"){
                    	thisSep = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-10"){
                        thisOct = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-11"){
                        thisNov = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2021-12"){
                        thisDec = data[i].monthsales;
                     }
                  }
                  
                  var lastJan = 0;
                  var lastFeb = 0;
                  var lastMar = 0;
                  var lastApr = 0;
                  var lastMay = 0;
                  var lastJun = 0;
                  var lastJul = 0;
                  var lastAug = 0;
                  var lastSep = 0;
                  var lastOct = 0;
                  var lastNov = 0;
                  var lastDec = 0;
                  for(var i=0; i<data.length; i++){
                     if(data[i].monthdate == "2020-01"){
                        lastJan = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-02"){
                        lastFeb = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-03"){
                        lastMar = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-04"){
                        lastApr = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-05"){
                        lastMay = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-06"){
                        lastJun = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-07"){
                        lastJul = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-08"){
                        lastAug = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-09"){
                        lastSep = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-10"){
                        lastOct = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-11"){
                        lastNov = data[i].monthsales;
                     }
                     if(data[i].monthdate == "2020-12"){
                        lastDec = data[i].monthsales;
                     }
                  }
                  
                  var ctx = $('#adminChart');
                    var chartData = {
                          labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                          datasets:[{
                             data:[thisJan, thisFeb, thisMar, thisApr, thisMay, thisJun, thisJul, thisAug, thisSep, thisOct, thisNov, thisDec],
                             label:'올해',
                             backgroundColor: 'rgba(255, 0, 0, 0.2)',
                             borderColor: 'red',
                             borderWidth: 0.5,
                             pointStyle: 'circle',
                             pointRadius: 5,
                             pointBorderColor: 'transparent',
                             pointBackgroundColor: 'red',
                          },
                          {
                          	data:[lastJan, lastFeb, lastMar, lastApr, lastMay, lastJun, lastJul, lastAug, lastSep, lastOct, lastNov, lastDec],
                          	label:'작년',
                          	backgroundColor: 'rgba(0, 0, 255, 0.2)',
                            borderColor: 'blue',
                            borderWidth: 0.5,
                            pointStyle: 'circle',
                            pointRadius: 5,
                            pointBorderColor: 'transparent',
                            pointBackgroundColor: 'blue',
                          }]
                    }
                    
                    var adminChart = new Chart(ctx,{
                       type: 'line',
                       data: chartData,
                       options: {
                           responsive: true,
                           tooltips: {
                               mode: 'index',
                               titleFontSize: 12,
                               titleFontColor: '#000',
                               bodyFontColor: '#000',
                               backgroundColor: '#fff',
                               titleFontFamily: 'Montserrat',
                               bodyFontFamily: 'Montserrat',
                               cornerRadius: 3,
                               intersect: false,
                           },
                           legend: {
                               position: 'top',
                               labels: {
                                   usePointStyle: true,
                                   fontFamily: 'Montserrat',
                               },


                           },
                           scales: {
                               xAxes: [{
                                   display: true,
                                   gridLines: {
                                       display: false,
                                       drawBorder: false
                                   }
                               }],
                               yAxes: [{
                                   display: true,
                                   gridLines: {
                                       display: false,
                                       drawBorder: false
                                   },
                                   ticks: {
                                       beginAtZero:true
                                   },
                                   afterTickToLabelConversion : function(q){
                                       for(var tick in q.ticks){
                                         q.ticks[tick] += ' 원';
                                       }
                                   }
                               }]
                           },
                           title: {
                               display: false,
                           }
                       }
                    });
               }
            });
            
         });
        		
        </script>
</body>
</html>