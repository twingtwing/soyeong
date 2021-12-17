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

.cardWrapper {
	padding-top: 35px;
	text-align: left;
	overflow: auto;
	height: 700px;
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

.btn {
	background-Color: #f3c300;
	border: 1px solid white;
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
							<div style="text-align: right;">
								<button type="button" onclick="location.href='hostInsertForm.do'">숙소등록</button>
							</div>
						</c:if>
						
					</div>

				</div>

				<!-- 현재 호스팅 중 -->
				<div class="cardWrapper" id="hostingNow">
					<c:forEach items="${lodges }" var="lodge" varStatus="status">
					<div class="col-md-3" style="float: left">
						<div class="card mb-2">
							<img class="card-img-top"
								src="${lodge.rphoto }"
								alt="Card image cap">
							<div class="card-body">
							<div>${lodge.rno }</div>
								<h4 class="card-title">${lodge.rname }</h4>
								<p class="card-text">${lodge.rcontent }</p>
								<a class="btn btn-primary" onclick="lodgeInfo(${lodge.rno})">Button</a>
							</div>
						</div>
					</div>
					</c:forEach>
					
				</div>

				<!-- 체크인 예정 -->
				<div class="cardWrapper" id="checkinPlan">
					<div class="col-md-3" style="float: left">
						<div class="card mb-2">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
								alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a class="btn btn-primary">Button</a>
							</div>
						</div>
					</div>
					<div class="col-md-3" style="float: left">
						<div class="card mb-2">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
								alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a class="btn btn-primary">Button</a>
							</div>
						</div>
					</div>
				</div>

				<!-- 체크아웃 예정 -->
				<div class="cardWrapper" id="checkoutPlan">
					<div class="col-md-3" style="float: left">
						<div class="card mb-2">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
								alt="Card image cap">
							<div class="card-body">
								<h4 class="card-title">Card title</h4>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a class="btn btn-primary">Button</a>
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
	</div>


	<script>
	
	
	
	
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
</script>
</body>
</html>