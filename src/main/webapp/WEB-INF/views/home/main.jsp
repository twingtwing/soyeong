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
						<input type="text" id="selectKey">
						<a href="#" class="btn theme_btn button_hover" id="listAll">검색</a>
					</div>
					</c:if>
					<c:if test="${author eq 'BAN'}">
						<div class="text-center">
							<h3 class="text-white">현재 서비스 이용이 <strong class="text-danger">불가</strong>합니다.</h3>
							<p class="text-white">현재 유저님에게 신고가 접수되어 BAN이 된 상태입니다. <br>
							자세한 정보를 듣고 싶으신 경우 <a href="question.do">고객의 소리</a>에 접수해 주시기를 부탁드립니다.</p>
						</div>
					</c:if>
				</div>
			</div>
		
		</section><br>
		<c:if test="${author ne 'BAN'}">
			<form action="houseList.do" method="post" id="frm">
				<input type="hidden" name="searchKey" id="searchKey">
			</form>
		</c:if>
		<!--================Banner Area =================-->

		<section>
		
		<div id="mapWrapper">
			<div id="googleMap" style="overflow:auto"></div>
		</div>
		
		</section>
		
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
                            	<!-- 이미지 어떻게 가녀온느지 알아야함 -->
                                <img src="${room.rphoto }" width="263" height="270" alt="">
                                <a href="detailedInfo.do?rno=${room.rno }" class="btn theme_btn button_hover">Book Now</a>
                            </div>
                            <a href="#"><h4 class="sec_h4">${room.rname }</h4></a>
                            <h5>${room.fee }<small>/night</small></h5>
                        </div>
                    </div>
                	</c:forEach>
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