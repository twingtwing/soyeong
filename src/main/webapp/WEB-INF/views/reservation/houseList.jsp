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
	margin: 1rem;
	font-weight: bold;
	font-size: 1.2rem;
	color: #F8B100;
	transition : all 1s;
}
.about_content a{
 	width: 15rem;
}
.hotelInfo{
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.about_content{
	display: flex;
	align-items: center;
	justify-content: space-between;
}
#tags .isChecked{
	background-color: #F8B600;
	color: white;
}
.hotelInfo>h2{
	cursor: pointer;
}
.hotelInfo>h2:hover{
	background-color: #F8B100;
	color:white;
	transition : all 0.3s;
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
				style="padding-top: 120px; text-align: center;" id="tags">
				<a href="#" class="genric-btn primary-border circle" id="am1" data-am="N">와이파이</a>
				<a href="#" class="genric-btn primary-border circle" id="am2" data-am="N">주방</a>
				<a href="#" class="genric-btn primary-border circle" id="am3" data-am="N">편의점</a>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->
	<!--=================List Area ==================-->
	<section class="about_history_area section_gap" id="listSection">
		<div class="container-fluid">
			<div class="row" id="row">
				<div class="col-md-6 d_flex align-items-center" id="houseList">
					<c:forEach items="${lists}" var="list">
						<div>
						<div class="about_content">
						<div class="hotelInfo">
							<h2 class="title title_color" style="margin-top:1.5rem;" data-rno="${list.rno}">${list.rname}</h2>
							<p>${list.rcontent}</p>
							<span class="rguest">${list.rguest}</span>
							<span class="fee">${list.fee}</span>
							<span class="rcheckin">${list.rcheckin}</span>
							<span class="rcheckout">${list.rcheckout}</span>
							<span class="rcategory">${list.rcategory}</span>
						</div>
							<div>
							<img alt="" src="${list.rphoto}">
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
				<div class="col-md-6 visible" id="mapWrap">
					<div id="mapWrapper">
						<div id="googleMap" style="overflow: auto"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
<form action="detailedInfo.do" id = "frm">
<input type="hidden" name="rno">
</form>
	<!--=================List Area ==================-->


	<script>
	$('#houseList').on('click','.hotelInfo .title',(e)=>{
		detailedInfo(e.target.getAttribute('data-rno'));		
	})
	
		// 구글 지도
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
		
		// detailInfo.do
		function detailedInfo(rno){
			$('#frm>input').val(rno);
			$('#frm').submit();
		}
		
		
		
		
		// ajax에 실어보낼 데이터. 전역변수여야 작동함	 	
	 	let checkDiff = function(elements){
	 		let arr = [];
	 		for(let e of elements){
	 			arr.push(e.textContent);
	 		}
	 		arr = new Set(arr);
	 		if(arr.size<=1){
	 			return false;
	 		} else{
	 			return true;
	 		}
	 	}
	 	 	
	 	let category = document.getElementsByClassName('rcategory');
		if(checkDiff(category)){
			category = 'A';
		} else{
			category = $('.rcategory').first().text();
		}
				
	 	let guest = document.getElementsByClassName('rguest');
	 	let arr = [];
	 	for(let g of guest){
	 		arr.push(+g.textContent)
	 	}
	 	guest = Math.min(...arr);
	 	
	 	
		// 분류태그 클릭시 스타일, isChecked 클래스 추가, ajax함수호출
		let am1, am2, am3;
 		$('#tags').on('click','a',(event)=>{
			$(event.target).toggleClass('isChecked');
			event.target.dataset.am = event.target.dataset.am == 'N' ? 'Y': 'N'; 
			am1 = document.getElementById('am1').dataset.am;
			am2 = document.getElementById('am2').dataset.am;
			am3 = document.getElementById('am3').dataset.am;
			sortByTag(am1,am2,am3); //ajax호출
		})
		
 		// 태그별 ajax 호출 함수
		let sortByTag = function(am1, am2, am3){		
			let data = {
				rguest : guest,
				rcategory : category,
				am1 : am1,
				am2 : am2,
				am3 : am3 
			}
			$.ajax({
				url : 'hotelSort.do',
				data : data,
				method : 'post',
				dataType : 'json'
			})
			.done((result)=>{
				changeList(result); // 화면바뀜
			})
		}
		
 		
 		// ajax 호출 후 화면 바꾸는 함수
 		let changeList = function(result){
 			$('#houseList').children().remove();
			for(let hotel of result){
				$('#houseList').append($('<div>').append($('<div>').attr('class','about_content')
														.append($('<div>').attr('class','hotelInfo')
																.append($('<h2>').attr('class','title title_color').attr('data-rno',hotel.rno).css('margin-top','1.5rem').text(hotel.rname),$('<p>').text(hotel.rcontent),
															),
														$('<div>').append($('<img>').attr('src',hotel.rphoto)))))
			}

 		}
			
	
	</script>
	
	
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRPuOyu6ap_iXZxFMQ4R_6XSShKgRuuQ&callback=myMap"></script>
</body>
</html>


