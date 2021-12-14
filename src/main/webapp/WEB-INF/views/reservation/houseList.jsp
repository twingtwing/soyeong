<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.booking_table {
	min-height: 200px;
}

.listPage>div {
	padding: 0px;
	margin: 0px;
}

#houseList {
	display: grid;
	height: 735px;
	overflow: auto;
	-ms-overflow-style: none;
}

#houseList::-webkit-scrollbar {
	display: none;
	width: 0 !important;
}

#mapWrapper {
	text-align: center;
	height: 100%;
}

#mapWrap {
	padding-right: 0px;
}

#googleMap {
	z-index: 3;
	width: 100%;
	height: 100%;
	margin: 0px auto;
	display: inline-block;
}

.about_content {
	padding: 30px 10px;
	border-top: 1px solid gray;
}

footer {
	display: none;
}

#listSection {
	padding: 0px;
	width: 100%;
}
.about_content span{
	display: none;
}
</style>
</head>
<body>
	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container-fluid"
				style="padding-top: 120px; text-align: center;">
				<a href="#" class="genric-btn primary-border circle">요금</a> <a
					href="#" class="genric-btn primary-border circle">장소</a> <a
					href="#" class="genric-btn primary-border circle">편의시설1</a> <a
					href="#" class="genric-btn primary-border circle">편의시설2</a> <a
					href="#" class="genric-btn primary-border circle">편의시설3</a> <a
					href="#" class="genric-btn primary-border circle">편의시설4</a>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->
	<!--=================List Area ==================-->
	<section class="about_history_area section_gap" id="listSection">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center" id="houseList">
					<c:forEach items="${lists}" var="list">
						<div class="about_content ">
							<h2 class="title title_color">${list.rname}</h2>
							<p>${list.rcontent}</p>
							<a href="#" class="button_hover theme_btn_two">Request Custom
								Price</a>
							<span class="fee">${list.fee}</span>
							<span class="checkin">${list.rcheckin}</span>
							<span class="checkout">${list.rcheckout}</span>
						</div>
					</c:forEach>
					<div class="about_content ">
						<h2 class="title title_color">
							About Us <br>Our History<br>Mission & Vision
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
				<div class="col-md-6 visible" id="mapWrap">
					<div id="mapWrapper">
						<div id="googleMap" style="overflow: auto"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--=================List Area ==================-->


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
		
		$('.theme_btn_two').click((event)=>{
			let fee = event.target.nextSibling.nextSibling;
			let checkin = event.target.nextSibling.nextSibling.nextSibling.nextSibling;
			let checkout = event.target.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling;
			checkin = new Date(checkin.textContent);
			checkout = new Date(checkout.textContent);
			console.log(checkin,checkout,checkout-checkin)
		})
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRPuOyu6ap_iXZxFMQ4R_6XSShKgRuuQ&callback=myMap"></script>


</body>
</html>


