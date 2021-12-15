<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/vendors/linericon/style.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="resources/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<!-- main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/responsive.css">
<style>
#mapWrapper {
	text-align: center;
}

#googleMap {
	width: 100%;
	height: 500px;
	border: 2px solid black;
	margin: 0px auto;
	display: inline-block;
}

.dataWrapper>.col-md-12 {
	color: white;
}

#reportButton {
	text-align: right;
}

.dataWrapper {
	width: 100%;
}

.dataWrapper div {
	margin: 0.5rem;
}

</style>
</head>
<body>
	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">상세정보</h2>
				<ol class="breadcrumb">
					<li><a href="home.do">예약하기</a></li>
					<li class="active">${hotelDetail.rname}</li>
				</ol>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content ">
						<h2 class="title title_color">${hotelDetail.rname}</h2>
						<p>${hotelDetail.raddress}</p>
						<a href="#" class="button_hover theme_btn_two">비용 계산하기</a>
					</div>
				</div>
				<div class="col-md-6">


					<!--================Booking Tabel Area =================-->
					<div class="hotel_booking_area position">
						<div class="container" align="center">
							<h3>지금 바로 예약하기</h3>
							<div class="hotel_booking_table">
								<div class="w-100"></div>
								<div class="col-md-11">
									<div class="boking_table">
										<div class="row">
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker-in'>
															<input type='text' class="form-control"
																placeholder="Check in" id="rcheckin" required="required" />
															<span class="input-group-addon"> <i
																class="fa fa-calendar" aria-hidden="true"></i>
															</span>
														</div>
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker-out'>
															<input type='text' class="form-control"
																placeholder="Check out" id="rcheckout"
																required="required" /> <span class="input-group-addon">
																<i class="fa fa-calendar" aria-hidden="true"></i>
															</span>
														</div>
													</div>
												</div>
											</div>

											<div class="w-100"></div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="input-group">
														<select class="wide">
															<option data-display="Adult">Adult</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="input-group">
														<select class="wide">
															<option data-display="Child">Child</option>
															<option value="0">없음</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>
													</div>

												</div>
											</div>
											<span id="rguest" style="display: none;">${hotelDetail.rguest}</span>
											<div class="w-100"></div>
											<div class="col-md-12">
												<div class="book_tabel_item">
													<a class="book_now_btn button_hover" href="#">바로 예약하기</a>
												</div>
											</div>
											<div class="dataWrapper">
												<div class="w-100"></div>
												<div class="col-md-12" id="houseRent">1박
													${hotelDetail.fee}원</div>
												<div class="w-100"></div>
												<div class="col-md-12" id="houseRentAll"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="serviceFee"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="serviceTax"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="totalPrice"></div>
												<div class="w-100"></div>
											</div>
											<div class="col-md-12" id="reportButton">
												<a href="#" class="genric-btn danger circle">신고하기</a>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--================Booking Tabel Area  =================-->
				</div>
			</div>
		</div>
	</section>
	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container" align="center">
			<img src="#"/>
			<div align="center">${hotelDetail.rphoto}</div>
		</div>
	</section>

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content ">
						<h2 class="title title_color">
							상세정보 및 편의시설
						</h2>
						<div class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">${hotelDetail.rcontent}</h4>
							<span class="badge badge-warning" data-am="${hotelDetail.am1}">와이파이</span>
							<span class="badge badge-warning" data-am="${hotelDetail.am2}">주방시설</span>
							<span class="badge badge-warning" data-am="${hotelDetail.am3}">편의점</span>
						</div>
						<div>연락처: ${hotelDetail.rtel}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div id="mapWrapper">
						<div id="googleMap" style="overflow: auto"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ About History Area  =================-->

	<!--================ Testimonial Area  =================-->
	<section class="testimonial_area section_gap">
		<div class="container">
			<div class="section_title text-center">
				<!--  반복문 사용해서 등록할때마다 추가 -->
				<h3 class="title_color">후기 / 별점</h3>
			</div>
			<div class="testimonial_slider owl-carousel">

				<div class="media testimonial_item">
					<img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
					<div class="media-body">
						<p>후기 내용 DATA</p>
						<a href="#"><h4 class="sec_h4">후기 작성자 DATA</h4></a>
						<div class="star">
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-half-o"></i></a>
						</div>
					</div>
				</div>

				<div class="media testimonial_item">
					<img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
					<div class="media-body">
						<p>부트스트랩에잇던 클래스랑 태그 똑같이 맞췃는데 안된다 js파일을 건드려야하나 정말 두렵다;;</p>
						<a href="#"><h4 class="sec_h4">Fanny Spencer</h4></a>
						<div class="star">
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
							<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
								class="fa fa-star-half-o"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form action="bookingForm.do" id="frm">
	<input type="hidden" value="${hotelDetail.rno}" name="rno">
	<input type="hidden" name="rcheckin" id="cki">
	<input type="hidden" name="rcheckout" id="cko">
	<input type="hidden" name="bookkid" id="bkid">
	<input type="hidden" name="bookadult" id="badult">
	<input type="hidden"name="day">
	</form>


	<!--================ Testimonial Area  =================-->

	<script>
	(function showTags(){
		for(let i=0; i<$('.tag_cloud_widget>span').length;i++){	
			if($('.tag_cloud_widget>span')[i].dataset.am=='N'){
				$('.tag_cloud_widget>span')[i].style.backgroundColor = 'gray';
			}
		}
		
	})();
	
	// ajax로 후기 데이터 가져오기
	let data = {rno:${hotelDetail.rno}};
	$.ajax({
		url : 'reviewList.do',
		data : data
	})
	.done((result)=>{
		result = JSON.parse(result);
		let outerDiv;
		for(let data of result){
			outerDiv = $('<div>').addClass('media testimonial_item');
			let innerDiv = $('<div>').addClass('media-body');
			innerDiv.append($('<p>').text(data.rvcontent),
					$('<a>').append($('<h4>').addClass('sec_h4').text(data.id)),
					makeStar(data.rvstar));
			outerDiv.append($('<img>').addClass('rounded-circle'),innerDiv);
			
			$('.container .testimonial_slider').append(outerDiv);
			}
	})
	
	let makeStar = function(rvstar){
		let fullstar = Math.floor(rvstar);
		let star = $('<div>').addClass('star');
		for(let i=0;i<fullstar;i++){
			star.append($('<a>').append($('<i>').addClass('fa fa-star')));
		}
		if(rvstar-fullstar>0){
			star.append($('<a>').append($('<i>').addClass('fa fa-star-half-o')));
		}
		return star;
	}
	
	
	
	let total;
	$('.theme_btn_two').first().on('click',()=>{
		if($('#rcheckin').val()==''||$('#rcheckout').val()==''){
			window.alert('날짜를 지정해주세요.');
			return;
		}
		if($('.wide:nth-child(2n-1)').first().val()=='Adult'||$('.wide:nth-child(2n-1)').last().val()=='Child'){
			window.alert('인원수를 지정해주세요.');
			return;
		}
		let guest = Number($('.wide:nth-child(2n-1)').first().val())+Number($('.wide:nth-child(2n-1)').last().val())
		if(+$('#rguest').text()<guest){
			window.alert($('#rguest').text()+'인을 초과할 수 없는 방입니다.');
			return;
		}
		let one = parseInt($('#houseRent').text().substring(3));
		let checkin = new Date($('#rcheckin').val());
		let checkout = new Date($('#rcheckout').val());
		let day = parseInt(+(checkout.getTime()-checkin.getTime())/(1000*3600*24));
		$('#houseRentAll').text(day+'박 '+(one*day)+'원');
		$('#serviceFee').text('수수료 '+parseInt(one*0.1)+'원');
		$('#serviceTax').text('부가세 '+parseInt(one*0.01)+'원');
		total = one*day+parseInt(one*0.1)+parseInt(one*0.01);
		$('#totalPrice').text('총액 '+total+'원'); 
		$('#totalPrice').css('color','#F3C300');
		$('#totalPrice').css('font-weight','bolder');
		$('#totalPrice').css('font-size','1.3rem');
		$('#totalPrice').css('text-align','right');
		$('#totalPrice').css('transition','all 0.7s');
		$('#totalPrice').css('margin-bottom','1rem');
		$('#frm>input').last().val(day);
		$('#frm>#cki').val($('#rcheckin').val());
		$('#frm>#cko').val($('#rcheckout').val());
		$('#frm>#badult').val($('.wide:nth-child(2n-1)').first().val());
		$('#frm>#bkid').val($('.wide:nth-child(2n-1)').last().val());
	})
	
	$('.book_now_btn').first().on('click',(e)=>{
		if($('#totalPrice').text().length>1){
			frm.submit();											
		} else{
			window.alert('좌측의 버튼을 통해 비용을 먼저 계산해주세요.');
			return;
		}
	})
	
	
		// google map
		function myMap() {
			var mapOptions = {
				center : new google.maps.LatLng(35.869103, 128.593390),
				zoom : 17,
				mapTypeControl : false
			};
			var yedam = {
				lat : 35.869103,
				lng : 128.593390
			};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);

			var marker = new google.maps.Marker({
				position : yedam,
				map : map
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRPuOyu6ap_iXZxFMQ4R_6XSShKgRuuQ&callback=myMap"></script>


</body>
</html>