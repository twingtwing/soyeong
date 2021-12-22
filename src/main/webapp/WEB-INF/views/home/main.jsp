<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="resources/image/favicon.png" type="image/png">
<meta charset="UTF-8">
<title>SYbnb</title>
<style>
#mapWrapper {
	text-align: center;
	margin: 2rem;
}

#googleMap {
	width: 65%;
	height: 500px;
	border: 2px solid black;
	margin: 0px auto;
	display: inline-block;
}

#selectKey {
	height: 40px;
	width: 25rem;
	padding: 0px 10px;
}

@font-face {
   font-family: 'WandohopeB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/WandohopeB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body,h2,h6{
   font-family: 'WandohopeB' !important;
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
						<!-- 
						<a href="#" class="btn theme_btn button_hover" id="myBook">내예약</a>
						<a href="#" class="btn theme_btn button_hover">상세정보</a>
						<c:if test="${author eq 'HOST'}">
						<a href="#" class="btn theme_btn button_hover" id="hostManage">숙소관리(호스트 전용)</a>
						</c:if>
             -->
					</div>
					<!-- 로그인 ban을 하면 뜯어고칠게 많아서 이렇게함 -->
					<c:if test="${author ne 'BAN'}">
						<div align="center">
							<input type="text" id="selectKey"> <a href="#"
								class="btn theme_btn button_hover" id="listAll">검색</a>
						</div>
					</c:if>
					<c:if test="${author eq 'BAN'}">
						<div class="text-center">
							<h3 class="text-white">
								현재 서비스 이용이 <strong class="text-danger">불가</strong>합니다.
							</h3>
							<p class="text-white">
								현재 유저님에게 신고가 접수되어 BAN이 된 상태입니다. <br> 자세한 정보를 듣고 싶으신 경우 <a
									href="question.do">고객의 소리</a>에 접수해 주시기를 부탁드립니다.
							</p>
						</div>
					</c:if>
				</div>
			</div>

		</section>
		<br>
		<c:if test="${author ne 'BAN'}">
			<form action="houseList.do" method="post" id="frm">
				<input type="hidden" name="searchKey" id="searchKey">
			</form>
		</c:if>
		<!--================Banner Area =================-->


		<section class="accomodation_area section_gap">
			<div class="container">
				<div class="section_title text-center">
					<h2 class="title_color">Recommended dorm</h2>
					<p>소영과 아이들에서 가족 같이 편안한 시간 보내세요.</p>
				</div>
				<div class="row accomodation_two">
					<c:forEach items="${list }" var="room">
						<div class="col-lg-3 col-sm-6">
							<div class="accomodation_item text-center">
								<div class="hotel_img">
									<img src="${room.rphoto }" width="263" height="270" alt="">
									<a href="detailedInfo.do?rno=${room.rno }" class="btn theme_btn button_hover">Book Now</a>
								</div>
								<a href="#"><h4 class="sec_h4">${room.rname }</h4></a>
								<h5>${room.fee }<small>/night</small>
								</h5>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<hr>
		<section class="about_history_area section_gap">
			<div class="container">
				<div class="row mb-5">
                    <div class="col-md-6 d_flex align-items-center">
                        <div class="about_content ">
                            <h2 class="title title_color">About Us <br>Our History<br>Mission &amp; Vision</h2>
                            <p>저희 회사는 현지에서 보다 밀도있게 즐기기 위한 목적으로 설립되었습니다. 개인 대 기업이 아닌 개인 대 개인의 장을 만들어
                            그 속에서 원활하고 의사소통과 안전한 울타리를 만들기 위해 지금도 노력하고 있습니다. 만약에 현지의 분위기를 느끼고 싶은 동시에
                            안전한 울타리 안에서 여행을 하고 싶다면 주저하지 마시고 저희 회사를 기억해주시기를 바랍니다.</p>
                        </div>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="resources/image/instagram/img1.jpg" class="img-responsive" width="510" height="420" alt="">
                        <div class="carousel-caption ml-5 pl-4 pb-0">
                        	<h4 class="mb-0 ml-5"><i class="fas fa-crown text-warning" aria-hidden="true"></i></h4>
                        	<h3>CEO 오재준</h3>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <h2 class="title_color"><strong>Our Componey Location</strong></h2>
                </div>
				<div id="mapWrapper">
					<div id="googleMap" style="overflow: auto" class="w-100"></div>
				</div>
				<div class="row">
                    <div class="col-md-4 ml-5">
                        <div class="contact_info">
                            <div class="info_item">
                                <i class="lnr lnr-home"></i>
                                <h6>Deagu, South Korea</h6>
                                <p>Jungang-daero 403</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-phone-handset"></i>
                                <h6>(053) 421 2460</h6>
                                <p>Mon to Fri 9am to 6 pm</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-envelope"></i>
                                <h6>soyoungbnb@gmain.com</h6>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
						<div class="contact_info ml-5">
							<div class="info_item">
								<i class="lnr lnr-location"></i>
								<h6>Transportation</h6>
							</div>
							<div class="ml-3 mt-3">
								<div class="info_item">
									<i class="fas fa-subway text-danger"></i>
									<h6>1 호선 중앙로역 도보 4분</h6>
								</div>
								<div class="info_item mt-3">
									<i class="fas fa-subway text-success"></i>
									<h6>2 호선 반월당 역 도보 8분</h6>
								</div>
								<div class="info_item mt-3">
									<i class="fas fa-subway"></i>
									<h6>3 호선 청라언덕역 하차 후 2호선 환승 반월당역 도보 8분</h6>
								</div>
								<div class="info_item mt-3">
									<i class="fas fa-bus-alt text-primary"></i>
									<h6>bus 약령시 앞</h6>
									<p>909 410-1 650 급행2 401 204 349 518 북구2 730</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<script>
	$('#myBook').on('click',()=>{
		if('${id}'==''){
			$('#loginBtn').click();
			return;
		} else{
			location.href='myReserv.do?ispaid=A';						
		}
	})
	$('#hostManage').on('click',()=>{
		if('${id}'==''){
			$('#loginBtn').click();
			return;
		} else {
			location.href='hostManage.do?ruse=A';
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