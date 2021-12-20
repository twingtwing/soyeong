<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.banner_content {
	padding-top: 150px;
}

#hostInfoName {
	text-align: left;
	padding-bottom: 20px;
	font-size: x-large;
	color: #f3c300;
}

.carousel-item.active, .carousel-item-next, .carousel-item-prev {
	display: flex;
}

.cardWrapper {
    text-align: left;
    overflow: auto;
    margin: 0px;
    margin-bottom: 5rem;
}
.card-body {
	border-top: 1px solid rgb(214, 214, 214);
	text-align: center;
}

.card {
	border-radius: 10px;
	background-color: white;
	display: inline-block;
	margin: 20px 30px;
	width: 18rem;
}

.card-text, .card-title {
	color: black;
}

.buttonWrapper>button {
	width: 15%;
	height: 10%;
	border: 1px solid #f3c300;
	border-radius: 5px;
	background-color: white;
	color: black;
	padding: 5px;
	margin-top: 15px;
	margin-right: 10px;
}

button:hover {
	transition-duration: 0.5s;
	color: white;
	background-color: #007bff;
	cursor: pointer;
	border: 1px solid #007bff;
}

.buttonWrapper {
	padding-bottom: 25px;
	border-bottom: 2px solid rgb(214, 214, 214);
	text-align: left;
}
.btn-primary{
	font-weight: bold;
}
.btn {
	background-Color: #f3c300;
	border: 1px solid white;
}

#scroll ::-webkit-scrollbar {
	width: 30px;
	height: 30px;
}

#scroll ::-webkit-scrollbar-thumb:hover {
	background-color: #0069D9;
}

#scroll ::-webkit-scrollbar-track {
	background-color: #817958;
	border-radius: 10rem;
}

#scroll ::-webkit-scrollbar-thumb {
	background-color: #F3C300;
	border-radius: 10rem;
}
.card-img-top{
	height: 190px;
}
.card-text{
	height: 120px;
}
</style>
</head>
<body>
	<script>
	function lodgeInfo(rno){
			frm.rno.value = rno;
			frm.submit();
		}
</script>
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<div id="hostInfoName">
						<h3>숙소 예약 정보</h3>
					</div>
					<div class="buttonWrapper">
						<button type="button" id="btn1">현재 호스팅 중</button>
						<button type="button" id="btn2">체크인 예정</button>
						<button type="button" id="btn3">체크아웃 예정</button>
						<button type="button" id="btn4">취소 내역</button>
						<c:if test="${not empty id }">
							<button type="button" onclick="location.href='hostInsertForm.do'"
								style="float: right; background-color: #f3c300; font-weight: bold">숙소등록</button>
						</c:if>

					</div>

				</div>

				<div id="scroll">
					<div class="cardWrapper" id="reservation">
						<div class="carousel-item active">
							<div style="display: flex; margin-bottom: 3rem;">
								<c:forEach items="${lodges }" var="lodge" varStatus="status">
								<div class="card" style="width: 18rem;">
										<div align="center" style="margin-top: 5px;">
										<img class="card-img-top" src="${lodge.rphoto}"
											alt="Card image cap">
										</div>
										<div class="card-body">
											<div>${lodge.rno }</div>
											<h4 class="card-title">${lodge.rname }</h4>
											<p class="card-text">${lodge.rcontent }</p>
											<a class="btn btn-primary" onclick="lodgeInfo(${lodge.rno})" style="color: white;cursor: pointer;">상세보기</a>
										</div>
										</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<!-- 취소 -->
				<div class="cardWrapper" id="cancelReserv"></div>
			</div>
		</div>
	</section>

	<div>
		<form id="frm" action="lodgingInfo.do" method="post">
			<input type="hidden" id="rno" name="rno">
		</form>

		<form action="hostManage.do" id="sortFrm">
			<input type="hidden" name="id" value="${id}">
			<input type="hidden" name="ruse" id="ruse">
		</form>
	</div>


	<script>
	let shorten = function(){
		for(let i=0; i<$('.card-text').length;i++){
			if($('.card-text')[i].textContent.length>100){
				$('.card-text')[i].textContent = $('.card-text')[i].textContent.substring(0,100)+'...';
			}
		}
	}
	shorten();
	
	
	
	$('#btn1').on('click',()=>{
		$('#ruse').val(null);
		location.href='hostManage.do'
	})
	
	$('#btn2').on('click',()=>{
		$('#ruse').val('B');
		$('#sortFrm').submit();
	})
	
	$('#btn3').on('click',()=>{
		$('#ruse').val('C');
		$('#sortFrm').submit();
	})
	$('#btn4').on('click',()=>{
		$('#ruse').val('D');
		$('#sortFrm').submit();
	})
	
	
	/*
	let btn1 = document.getElementById("btn1");
    let btn2 = document.getElementById("btn2");
    let btn3 = document.getElementById("btn3");
    let btn4 = document.getElementById("btn4");
    
    let hostingNow = document.getElementById("hostingNow");
    let checkinPlan = document.getElementById("checkinPlan");
    let checkoutPlan = document.getElementById("checkoutPlan");
    let cancelReserv = document.getElementById("cancelReserv");
    
    hostingNow.style.display='inline-block';
    checkinPlan.style.display='none';
    checkoutPlan.style.display='none';
    cancelReserv.style.display='none';

    btn1.addEventListener('click', ()=>{
	    hostingNow.style.display='inline-block';
	    checkinPlan.style.display='none';
	    checkoutPlan.style.display='none';
	    cancelReserv.style.display='none';
    })
    
    btn2.addEventListener('click', ()=>{
	    hostingNow.style.display='none';
	    checkinPlan.style.display='inline-block';
	    checkoutPlan.style.display='none';
	    cancelReserv.style.display='none';
    })
    
    btn3.addEventListener('click', ()=>{
	    hostingNow.style.display='none';
	    checkinPlan.style.display='none';
	    checkoutPlan.style.display='inline-block';
	    cancelReserv.style.display='none';
    })
    btn4.addEventListener('click', ()=>{
	    hostingNow.style.display='none';
	    checkinPlan.style.display='none';
	    checkoutPlan.style.display='none';
	    cancelReserv.style.display='inline-block';
    })
    */
</script>
</body>
</html>