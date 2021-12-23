<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ml-5{
cursor: pointer;
}
</style>
</head>
<body>
	<!-- 마이페이지에서 호스트 매출관리 -->

	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>결제 및 환불 관리</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->

	<!--================ start body Area =================-->
	<section class="section_gap">
		<div class="container">
			<div class="row mb-30">
				<a href="javascript:history.back()"
					class="genric-btn warning-border circle arrow pl-4"><span
					class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>Prev</a>
			</div>
			<div class="section_title text-center">
				<h2 class="title_color">
					<strong>결제 및 환불</strong>
				</h2>
			</div>
			<!-- 모두 첨에는 기본으로 1개월 가져옴 -->
			<div
				class="btn-Pay row mb-4 border border-right-0 border-top-0 border-left-0">
				<div class="active-btn-Pay ml-4" style="cursor: pointer;">
					<h5>대금 수령 완료</h5>
				</div>
				<!-- 
				<div class="ml-5">
					<h5>수령 예정</h5>
				</div>
				 -->
				<div class="ml-5">
					<h5>환불 요청</h5>
				</div>
				<div class="ml-5">
					<h5>통계</h5>
				</div>
			</div>
			<div class="div-Pay pt-3">
				<!-- 대금수령완료 div -->
				<div class="active-div-Pay">
					<div class="row pt-2">
						<div class="col-md-12 d-flex justify-content-between">
							<div class="btn-Pay-date">
								<button type="button" class="genric-btn default" value="1">1 개월</button>
								<button type="button" class="genric-btn default" value="2">3 개월</button>
								<button type="button" class="genric-btn default" value="all">전체</button>
								<button type="button" class="genric-btn default">직접 설정</button>
							</div>
							<div>
								<button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
							</div>
						</div>
						<div class="pay-date-detail col-md-12 d-print-block d-flex justify-content-center mt-3">
							<div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
								<div class="book_tabel_item d-flex justify-content-around">
									<div class="form-group mr-3">
										<div class='input-group date datetimepicker-pay-start'>
											<h5 class="pt-2 pl-2 pr-3">start :</h5>
											<input type='text' class="form-control"
												placeholder="Start Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
									<div class="form-group">
										<div class='input-group date datetimepicker-pay-end'>
											<h5 class="pt-2 pl-2 pr-3">end :</h5>
											<input type='text' class="form-control"
												placeholder="End Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 더보기 10개 반복 -->
					<div class="row mt-4 pt-4">
						<table class="table text-center align-middle">
							<thead>
							<tr>
								<th>예약 날짜</th>
								<th>대금</th>
								<th>예약자</th>
								<th>체크인 - 체크아웃</th>
								<th>숙소</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${sales}" var="sale">
								<c:if test="${sale.ispaid eq 'Y' and sale.bookcancel eq 'N'}">
									<tr>
										<td>${sale.bookdate }</td>
										<td>${sale.fee }</td>
										<td>${sale.name }</td>
										<td>${sale.checkin } - ${sale.checkout }</td>
										<td>${sale.rname }</td>
									</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!--  수령 예정 div
				<div class="d-none">
					<div class="row pt-2">
						<div class="col-md-12 d-flex justify-content-between">
							<div class="btn-Pay-date">
								<button type="button" class="genric-btn default" value="1">1 개월</button>
								<button type="button" class="genric-btn default" value="2">3 개월</button>
								<button type="button" class="genric-btn default" value="all">전체</button>
								<button type="button" class="genric-btn default">직접 설정</button>
							</div>
							<div>
								<button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
							</div>
						</div>
						<div class="pay-date-detail d-print-block col-md-12 d-flex justify-content-center mt-3">
							<div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
								<div class="book_tabel_item d-flex justify-content-around">
									<div class="form-group mr-3">
										<div class='input-group date datetimepicker-pay-start'>
											<h5 class="pt-2 pl-2 pr-3">start :</h5>
											<input type='text' class="form-control"
												placeholder="Start Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
									<div class="form-group">
										<div class='input-group date datetimepicker-pay-end'>
											<h5 class="pt-2 pl-2 pr-3">end :</h5>
											<input type='text' class="form-control"
												placeholder="End Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 구매 확정여부 없어지면 없애기
					<div class="row mt-4 pt-4">
						<table class="table text-center">
							<thead>
								<tr>
									<th>예약 날짜</th>
									<th>대금</th>
									<th>예약자</th>
									<th>체크인 - 체크아웃</th>
									<th>숙소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sales}" var="sale">
									<c:if test="${sale.ispaid eq 'N' and sale.bookcancel eq 'N'}">
										<tr>
											<td>${sale.bookdate }</td>
											<td>${sale.fee }</td>
											<td>${sale.name }</td>
											<td>${sale.checkin } - ${sale.checkout }</td>
											<td>${sale.rname }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				-->
				<!-- 환불 요청 div -->
				<div class="d-none">
					<div class="row pt-2">
						<div class="col-md-12 d-flex justify-content-between">
							<div class="btn-Pay-date">
								<button type="button" class="genric-btn default" value="1">1
									개월</button>
								<button type="button" class="genric-btn default" value="2">3
									개월</button>
								<button type="button" class="genric-btn default" value="all">전체</button>
								<button type="button" class="genric-btn default">직접 설정</button>
							</div>
							<div>
								<button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
							</div>
						</div>
						<div
							class="pay-date-detail d-print-block col-md-12 d-flex justify-content-center mt-3">
							<div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
								<div class="book_tabel_item d-flex justify-content-around">
									<div class="form-group mr-3">
										<div class='input-group date datetimepicker-pay-start'>
											<h5 class="pt-2 pl-2 pr-3">start :</h5>
											<input type='text' class="form-control"
												placeholder="Start Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
									<div class="form-group">
										<div class='input-group date datetimepicker-pay-end'>
											<h5 class="pt-2 pl-2 pr-3">end :</h5>
											<input type='text' class="form-control"
												placeholder="End Date" /> <span class="input-group-addon">
												<i class="fa fa-calendar" aria-hidden="true"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 더보기 10개 반복 -->
					<div class="row mt-4 pt-4">
						<table class="table text-center">
							<thead>
							<tr>
								<th>예약 날짜</th>
								<th>대금</th>
								<th>예약자</th>
								<th>체크인 - 체크아웃</th>
								<th>숙소</th>
								<th>환불</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${sales}" var="sale">
								<c:if test="${sale.bookcancel eq 'Y'}">
									<tr data-bookno="${sale.bookno }">
										<td class="align-middle">${sale.bookdate }</td>
										<td class="align-middle">${sale.fee }</td>
										<td class="align-middle">${sale.name }</td>
										<td class="align-middle">${sale.checkin } - ${sale.checkout }</td>
										<td class="align-middle">${sale.rname }</td>
										<c:if test="${empty sale.bookrefund}">
											<td class="d-flex justify-content-around align-middle">
												<button type="button" data-refund="Y" class="btn btn-primary refund">
													<i class="far fa-circle"></i>
												</button>
												<button type="button" data-refund="N" class="btn btn-primary refund">
													<i class="far fa-times-circle"></i>
												</button>
											</td>
										</c:if>
										<c:if test="${sale.bookrefund eq 'Y'}">
											<td class="align-middle">환불 승인</td>
										</c:if>
										<c:if test="${sale.bookrefund eq 'N'}">
											<td class="align-middle">환불 거부</td>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 통계 div -->
				<div class="d-none">
					<div class="statistics-div">
						<div class="row my-4 pb-3">
							<div class="col text-center">
								<h2>
									<i class="fas fa-search-dollar text-warning"></i>&nbsp;&nbsp; 작월 수입 그래프
								</h2>
							</div>
						</div>
						<div class="row mt-5 text-center">
							<div class="col-md-3">
								<div class="card border-light bg-light">
									<div class="card-body pt-4">
										<div class="text-center pt-3">
											<span class="display-4"> <i
												class="fas fa-dollar-sign text-warning" aria-hidden="true"></i>
											</span>
											<h4 class="mt-4">전체 총 수입</h4>
											<h3 class="text-warning mt-4 mb-4" id="salesMoney"></h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card border-light bg-light">
									<div class="card-body pt-4">
										<div class="text-center pt-3">
											<span class="display-4"> <i
												class="fas fa-book-reader text-warning" aria-hidden="true"></i>
											</span>
											<h4 class="mt-4">전체 예약수</h4>
											<h3 class="text-warning mt-4 mb-4" id="salesCount"></h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card border-light bg-light">
									<div class="card-body pt-4">
										<div class="text-center pt-3">
											<span class="display-4"> <i
												class="fas fa-heart text-warning" aria-hidden="true"></i>
											</span>
											<h4 class="mt-4">전체 평점</h4>
											<h3 class="text-warning mt-4 mb-4" id="reviewStar"></h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card border-light bg-light">
									<div class="card-body pt-4">
										<div class="text-center pt-3">
											<span class="display-4"> <i
												class="fas fa-retweet text-warning" aria-hidden="true"></i>
											</span>
											<h4 class="mt-4" id="reviewCount">전체 후기수</h4>
											<h3 class="text-warning mt-4 mb-4">${review.count} 개</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr class="my-5 pb-5">
						<div class="container">
							<div class="row my-4 pb-3">
								<div class="col text-center">
									<h2>
										<i class="fas fa-chart-line text-warning"></i>&nbsp;&nbsp; 1년간
										월간 수입 그래프
									</h2>
								</div>
							</div>
							<div class="row my-2">
								<div class="col">
									<div class="card pt-3 pl-3">
										<div class="card-body">
											<canvas id="lineChart" height="45vh" width="80vh"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ body Area  =================-->

	<script type="text/javascript">
		//목록 버튼 클릭 시 레이아웃 전환
		$('.btn-Pay').on('click','div:not(.active-btn-Pay)',
			function() {
			//목록 변경
				$('.active-btn-Pay').toggleClass('active-btn-Pay');
				this.classList.toggle('active-btn-Pay');

				//원상복귀
				$('.active-Pay-date').attr("class", 'genric-btn default');
				$('.active-div-Pay .pay-date-detail').addClass('d-print-block');

				//내용 변경
				$('.active-div-Pay').toggleClass('active-div-Pay').toggleClass('d-none');
				$('.div-Pay > div').eq($(this).index()).toggleClass('active-div-Pay').toggleClass('d-none');

		});


		$('.refund').on('click', function() {
			//환불 승인
			let bookno = $(this.closest('tr')).data('bookno');
			let bookrefund =  $(this).data('refund');
			$.ajax({
				url : 'changeRefund.do',
				type : 'get',
				data : {
					bookno : bookno,
					bookrefund : bookrefund
				}
			})
			.done(data => {
				if(data.trim() === 'Y'){
					if(bookrefund === 'Y'){
						$(this).closest('td').text('환불 승인');
					}else if(bookrefund === 'N'){
						$(this).closest('td').text('환불 거부');
					}
					alert('처리 완료 되었습니다.');
				}else if(data.trim() === 'N'){
					alert('환불 처리 과정중 오류가 발생하였습니다. ')
				}
			})
		});

		//버튼 클릭 시 버튼 변경 toggle을 remove로 수정 필요
		$('.btn-Pay-date').on('click',function(event) {
			if (event.target.nodeName === 'BUTTON'&& !event.target.classList.contains('active-Pay-date')) {
				if ($('.active-Pay-date')) $('.active-Pay-date').attr("class",'genric-btn default');
				event.target.setAttribute("class",'genric-btn warning active-Pay-date');
			} else if (event.target.nodeName === 'BUTTON'&& event.target.classList.contains('active-Pay-date')) {
				event.target.setAttribute("class",'genric-btn default ');
			}

			if (event.target.nodeName === 'BUTTON' && $(event.target).index() == 3) {
				event.target.closest('div').parentNode.parentNode.querySelector('.pay-date-detail').classList.toggle('d-print-block');
			}
		})

		//id해서 수정해야함 
		$('.btn-Pay-ajax').on('click',function() {
							//카테고리에 따라 ajax경로 다르게 설정하거나 혹으 serviceimpl 메서드를 다르게 해야함
			if ($('.active-Pay-date').length == 0) {
				//디자인 바꿀수 있으면 하기
				alert('검색할 범위를 먼저 선택해주세요.');
				return;
			}
			let $index = $('.active-Pay-date').index();
			let startDate,endDate;
			let now = new Date();
			if ($index < 2) {
				//순서 바뀌면 안됨
				startDate = new Date(now.setMonth(now.getMonth() - $('.active-Pay-date').val())).toISOString().substring(0, 10);
			} else if($index == 3){
				startDate = $('.active-div-Pay .pay-date-detail .datetimepicker-pay-start > input').val();
				endDate = $('.active-div-Pay .pay-date-detail .datetimepicker-pay-end > input').val();
			} 
		 	$.ajax({
					url : 'dataSales.do',
					type : 'get',
					dataType : 'json',
					data : {
						startDate : startDate,
						endDate : endDate
					}
				})
				.done(data => {
					createTable(data)
				})
	    });
		
		function createTable(data){
			let tbody = $('.active-div-Pay table>tbody');
			let index = $('.active-div-Pay').index();
			tbody.empty();
			if(index === 0 ){
				for (const row of data) {
					if(row.ispaid === "Y" && row.bookcancel === "N"){
						let tr = $('<tr>').appendTo(tbody);
						tr.append($('<td>').text(new Date(row.bookdate).toISOString().substring(0, 10)),$('<td>').text(row.fee),
						$('<td>').text(row.name),$('<td>').text(new Date(row.checkin).toISOString().substring(0, 10) +'-'+ new Date(row.checkout).toISOString().substring(0, 10)),$('<td>').text(row.rname));
					}
				}
			}else if(index === 1){
				for (const row of data) {
					if(row.ispaid === "N" && row.bookcancel === "N"){
						let tr = $('<tr>').appendTo(tbody);
						tr.append($('<td>').text(new Date(row.bookdate).toISOString().substring(0, 10)),$('<td>').text(row.fee),
								$('<td>').text(row.name),$('<td>').text(new Date(row.checkin).toISOString().substring(0, 10) +'-'+ new Date(row.checkout).toISOString().substring(0, 10)),$('<td>').text(row.rname));
					}
				}
			}else if(index === 2){
				for (const row of data) {
					if(row.bookcancel === "Y"){
						let tr = $('<tr>').appendTo(tbody);
						tr.append($('<td>').text(new Date(row.bookdate).toISOString().substring(0, 10)),$('<td>').text(row.fee),
								$('<td>').text(row.name),$('<td>').text(new Date(row.checkin).toISOString().substring(0, 10) +'-'+ new Date(row.checkout).toISOString().substring(0, 10)),$('<td>').text(row.rname));
						tr.attr('data-bookno',row.bookno);
						if(row.bookrefund === 'Y'){
							tr.append($('<td>').text('환불 처리 완료'));
						}else if(row.bookrefund === 'N'){
							tr.append($('<td>').html('<button type="button" class="btn btn-primary refund-Y"><i class="fas fa-check"></i></button>').addClass('d-flex justify-content-around align-middle'));
						}
					}
				}
			}		
		}

		//id수정해야함
		$('.datetimepicker-pay-start').datetimepicker({
					format : 'yyyy-mm-dd',
					minView : 'month',
					endDate : new Date((new Date).setDate((new Date)
							.getDate() - 2))
		})
		.on('changeDate ',function() {
			let startDate = $('.datetimepicker-pay-start > input').val();
			let end = Number(startDate.substring(startDate.length - 1)) + 1;
			startDate = startDate.substring(0,startDate.length - 1)+ end;
			$('.datetimepicker-pay-end').datetimepicker('setStartDate', startDate);
		});

		$('.datetimepicker-pay-end').datetimepicker({
					format : 'yyyy-mm-dd',
					minView : 'month',
					endDate : new Date((new Date).setDate((new Date)
							.getDate() - 1))
		});

		//통계 chart.js
		let lineId = document.getElementById('lineChart').getContext('2d');
		let monthNames = [ "January", "February", "March", "April", "May",
				"June", "July", "August", "September", "October", "November",
				"December" ];
		let salesHost =JSON.parse('${total}');
		let salesData = [];

		let monthChart = [];
		for (var i = 0; i < 12; i++) {
			monthChart.push(monthNames[(new Date().getMonth() + i) % 12]);
			let flag = false;
			for(var sale of salesHost){
				if((new Date().getMonth() + i)%12 == (Number((sale.mdate).substring(5,7))-1)){
					salesData.push(Math.round(sale.fee/10000));
					flag = true;
					if(new Date().getMonth() === 11){
						salesCount.innerHTML = sale.count + ' 개';
						salesMoney.innerHTML = '₩ ' + sale.fee.toLocaleString('ko-KR');
					}
				}
			}
			
			if(!flag){
				salesData.push(0);
			}
		}
		let starCount = '${review.rvstar}';
		let starFloor = Math.floor(starCount);
		let starCeil = Math.ceil(starCount);
		for (var i = 1; i <= starFloor; i++) {
			$('#reviewStar').append($('<i>').addClass('fas fa-star'));
		}
		
		if((starFloor + starCeil) != 5 ){
			$('#reviewStar').append($('<i>').addClass('fas fa-star-half-alt'));
		}
		
		for (var i = starCeil; i < 5; i++) {
			$('#reviewStar').append($('<i>').addClass('far fa-star'));
		}
		
		var lineChart = new Chart(lineId, {
			type : 'line',
			data : {
				labels : monthChart,
				datasets : [ {
					label : '월 수입 ',
					backgroundColor : 'transparent',
					borderColor : 'red',
					borderWidth : 4,
					data : salesData
				} ]
			},
			// 옵션 
			options : {
				responseive : false,
				legend : {
					display : false
				},
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						},
						afterTickToLabelConversion : function(q) {
							for ( var tick in q.ticks) {
								q.ticks[tick] += '만 원';
							}
						}
					} ]
				}
			}
		});
	</script>
</body>
</html>