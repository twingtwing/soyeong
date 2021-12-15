<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="resources/image/favicon.png" type="image/png">
<meta charset="UTF-8">
<title>SYbnb</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="resources/css/bootstrap.css">
        <link rel="stylesheet" href="resources/vendors/linericon/style.css">
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="resources/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="resources/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="resources/css/style.css">
        <link rel="stylesheet" href="resources/css/responsive.css">



<style>
#mapWrapper {
	text-align: center;
	
}

#googleMap {
	width:65%;
	height: 500px;
	border: 2px solid black;
	margin: 0px auto;
	display: inline-block;
}
</style>
</head>

<body>
	<div>
		<!--================Banner Area =================-->
		<section class="banner_area">
			<div class="booking_table d_flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h6>잠깐의 여행길도 편안하게</h6>
						<h2>소영과 아이들</h2>
						<p>
							저희 소영과 아이들은<br>최고의 서비스를 자랑합니다.
						</p>
						<a href="myReserv.do" class="btn theme_btn button_hover">내예약</a>
						<a href="detailedInfo.do" class="btn theme_btn button_hover">상세정보</a>
						<a href="#" class="btn theme_btn button_hover" id="listAll">리스트 보기</a>
						<a href="hostManage.do" class="btn theme_btn button_hover">호스트 숙소관리 test</a>
						<a href="admin.do" class="btn theme_btn button_hover">관리자 페이지 test</a>
					</div>
				</div>
			</div>
			<div class="hotel_booking_area position">
				<div class="container">
					<div class="hotel_booking_table">
						<div class="col-md-3">
							<h2>
								빠른 예약
							</h2>
						</div>
						<div class="col-md-9">
							<div class="boking_table">
								<div class="row">
									<div class="col-md-4">
										<div class="book_tabel_item">
											<div class="form-group">
												<!-- 일까지만 선택하도록 수정했어요 -->
												<div class='input-group date' id='datetimepicker-in'>
													<input type='text' class="form-control"
														placeholder="Check in" id="checkin"/> <span
														class="input-group-addon"> <i
														class="fa fa-calendar" aria-hidden="true"></i>
													</span>
												</div>
											</div>
											<div class="form-group">
												<div class='input-group date' id='datetimepicker-out'>
													<input type='text' class="form-control"
														placeholder="Check out" id="checkout"/> <span
														class="input-group-addon"> <i
														class="fa fa-calendar" aria-hidden="true"></i>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="book_tabel_item">
											<div class="input-group">
												<select class="wide" id="bookadult">
													<option data-display="Adult" value="1">Adult</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
												</select>
											</div>
											<div class="input-group">
												<select class="wide" id="bookkid">
													<option data-display="Child" value="0">Child</option>
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="book_tabel_item">
											<div class="input-group">
												<select class="wide" id="rcategory">
													<option data-display="숙소유형" value="A">숙소유형</option>
													<option value="게스트하우스">게스트하우스</option>
													<option value="호텔">호텔</option>
													<option value="한옥">한옥</option>
												</select>
											</div>
											<a class="book_now_btn button_hover" href="#">Book Now</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section><br>
		<form action="quickBook.do" method="post" id="frm">
			<input type="hidden" name="rcheckin">
			<input type="hidden" name="rcheckout">
			<input type="hidden" name="rguest">
			<input type="hidden" name="rcategory">
		</form>
		<!--================Banner Area =================-->

		<section>
		
		<div id="mapWrapper">
			<div id="googleMap" style="overflow:auto"></div>
		</div>
		
		</section><br>
		<section>
			<div style="text-align: center">소영과 아이들에서 가족 같이 편안한 시간 보내세요.</div>
		</section><br>
	</div>


	<script>
		// 빠른예약
		$('.book_now_btn').click(()=>{		
			let ok = $('#checkin').val()&&$('#checkout').val();
			if(!Boolean(ok)){
				window.alert('날짜를 지정해주세요.');
				return;
			}			
			let num = Number(parseInt($('#bookadult').val())+parseInt($('#bookkid').val()));
			let date = $('#checkin').val();
			date = new Date(date);
			date.setDate(date.getDate()-1);
			date = date.toISOString().substring(0,10);
			let endDate = $('#checkout').val();
			endDate = new Date(endDate);
			endDate.setDate(endDate.getDate()-1);
			endDate = endDate.toISOString().substring(0,10);
			sendForm(date,endDate,num,$('#rcategory').val(),'quickBook.do');
		})
		
		
		// 전체보기
		$('#listAll').on('click',()=>{
			// 오늘날짜부터 한달 사이에 있는 모든 방 보여줌
			let today = new Date();
			today = today.toISOString().substring(0,10);
			
			let checkout = new Date();
			checkout.setMonth(checkout.getMonth()+1); 
			checkout = checkout.toISOString().substring(0,10);
			sendForm(today,checkout,1,'A','houseList.do');
		})
		
		
		// 메인화면에서 두개의 버튼으로 다른검색하는 함수
		let sendForm = function(checkin,checkout,guest,category,action){
			$('#frm').attr('action',action);
			$('#frm>input:nth-child(1)').val(checkin);
			$('#frm>input:nth-child(2)').val(checkout); 
			$('#frm>input:nth-child(3)').val(guest);
			$('#frm>input:nth-child(4)').val(category);
			$('#frm').submit();
		}
		
		// 구글 맵
		function myMap() {
			var mapOptions = {
				center : new google.maps.LatLng(35.869103, 128.593390),
				zoom : 17,
				mapTypeControl: false
			};
			var yedam = {lat:35.869103, lng:128.593390};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);
			
			var marker = new google.maps.Marker({position: yedam, map: map});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRPuOyu6ap_iXZxFMQ4R_6XSShKgRuuQ&callback=myMap"></script>

	
</body>
</html>