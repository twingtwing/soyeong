<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
#reportButton{
text-align : right;
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
				<h2 class="page-cover-tittle">숙소이름 @#@#@#</h2>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">About</li>
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
						<h2 class="title title_color">
							숙소 설명 / 간단, 기본설명<br>Our History<br>Mission & Vision
						</h2>
						<p>inappropriate behavior is often laughed off as “boys will
							be boys,” women face higher conduct standards especially in the
							workplace. That’s why it’s crucial that, as women, our behavior
							on the job is beyond reproach. inappropriate behavior is often
							laughed.</p>
						<a href="#" class="button_hover theme_btn_two">Request Custom
							Price</a>
					</div>
				</div>
				<div class="col-md-6">


					<!--================Booking Tabel Area =================-->
					<div class="hotel_booking_area position">
						<div class="container">
							<h3>예약</h3>
							<div class="hotel_booking_table">
								<div class="w-100"></div>
								<div class="col-md-11">
									<div class="boking_table">
										<div class="row">
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker11'>
															<input type='text' class="form-control"
																placeholder="Check in" /> <span
																class="input-group-addon"> <i
																class="fa fa-calendar" aria-hidden="true"></i>
															</span>
														</div>
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker1'>
															<input type='text' class="form-control"
																placeholder="Check out" /> <span
																class="input-group-addon"> <i
																class="fa fa-calendar" aria-hidden="true"></i>
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
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>
													</div>

												</div>
											</div>

											<div class="w-100"></div>
											<div class="col-md-12">
												<div class="book_tabel_item">
													<a class="book_now_btn button_hover" href="booking.do">Book Now</a>
												</div>
											</div>
											<div class="dataWrapper">
												<div class="w-100"></div>
												<div class="col-md-12" id="houseRent">숙소 1박 DATA</div>
												<div class="w-100"></div>
												<div class="col-md-12" id="servicePrice">서비스
													수수료(에어비앤비) DATA?</div>
												<div class="w-100"></div>
												<div class="col-md-12" id="totalPrice">총 금액</div>
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

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content ">
						<h2 class="title title_color">
							호스트 설명 ?? / 편의시설 <br>Our History<br>Mission & Vision
						</h2>
						<div class="single-sidebar-widget tag_cloud_widget">
                                <h4 class="widget_title">Tag Clouds</h4>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                <span class="badge badge-warning">세탁기</span>
                                
                            </div>
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
						<p>As conscious traveling Paupers we must always be concerned
							about our dear Mother Earth. If you think about it, you travel
							across her face, and She is the</p>
						<a href="#"><h4 class="sec_h4">Fanny Spencer</h4></a>
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
						<p>As conscious traveling Paupers we must always be concerned
							about our dear Mother Earth. If you think about it, you travel
							across her face, and She is the</p>
						<a href="#"><h4 class="sec_h4">Fanny Spencer</h4></a>
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
						<p>As conscious traveling Paupers we must always be concerned
							about our dear Mother Earth. If you think about it, you travel
							across her face, and She is the</p>
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
	<!--================ Testimonial Area  =================-->

	<script>
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