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
	margin: 2rem;
}

#googleMap {
	width:65%;
	height: 500px;
	border: 2px solid black;
	margin: 0px auto;
	display: inline-block;
}
#selectKey{
	height: 40px;
	width:  25rem;
	padding : 0px 10px;
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
						
						<a href="#" class="btn theme_btn button_hover" id="myBook">내예약</a>
						<a href="#" class="btn theme_btn button_hover">상세정보</a>
						<a href="hostManage.do" class="btn theme_btn button_hover">호스트 숙소관리 test</a>
					</div>
					<div align="center">
						<input type="text" id="selectKey">
						<a href="#" class="btn theme_btn button_hover" id="listAll">검색</a>
					</div>
				</div>
			</div>
		
		</section><br>
		<form action="houseList.do" method="post" id="frm">
			<input type="hidden" name="searchKey" id="searchKey">
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
	$('#myBook').on('click',()=>{
		if('${id}'==''){
			window.alert('로그인이 필요합니다.');
			return;
		} else{
			location.href='myReserv.do';						
		}
	})
		
		$('#selectKey').on('keypress',(e)=>{
			if(e.keyCode=='13'){
				$('#listAll').click();
			}
		})
		
		
		// 제목/내용으로 검색
		$('#listAll').on('click',()=>{
			$('#searchKey').val($('#selectKey').val());
			$('#frm').submit();
		})
		
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