<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#myReservationName {
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

.text-center {
	text-align: left !important;
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

#reservation {
	display: inline-block;
}

#traveled, #cancelTrip {
	display: none;
}

.banner_content {
	padding-top: 150px;
}

#modal1 {
	overflow: auto;
	padding: 0;
}

#modal1>img {
	max-width: 100%;
}

th {
	background-Color: black;
	color: white;
}

.carousel-indicators {
	bottom: -25px;
}

.controls-top {
	text-align: center;
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<div id="myReservationName">
						<h3>나의 예약 정보</h3>
					</div>
					<div class="buttonWrapper">
						<button type="button" id="btn1">예약된 여행</button>
						<button type="button" id="btn2">여행 간 곳</button>
						<button type="button" id="btn3">취소 내역</button>
					</div>


					<div class="cardWrapper" id="reservation">
						<div id="multi-item-example"
							class="carousel slide carousel-multi-item" data-ride="carousel">

							<!--Controls-->
							<div class="controls-top">
								<a class="btn-floating" href="#multi-item-example"
									data-slide="prev"><i class="fas fa-chevron-left"></i></a> <a
									class="btn-floating" href="#multi-item-example"
									data-slide="next"><i class="fas fa-chevron-right"></i></a>
							</div>
							<!--/.Controls-->

							<!--Indicators-->
							<ol class="carousel-indicators">
								<li data-target="#multi-item-example" data-slide-to="0"
									class="active"></li>
								<li data-target="#multi-item-example" data-slide-to="1"></li>
							</ol>
							<!--/.Indicators-->

							<!--reservation Slides-->
							<div class="carousel-inner" role="listbox">
								<!--First slide-->
								<div class="carousel-item active">

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">Card title</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary">예약 상세 정보 ></a>
										</div>
									</div>

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
								</div>
								<!--/.First slide-->

								<!--Second slide-->
								<div class="carousel-item">

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>
								</div>
								<!--/.Second slide-->
							</div>
						</div>
						<!--/.Slides-->
					</div>
					
					
					
					<div class="cardWrapper" id="traveled">
						<div id="multi-item-example"
							class="carousel slide carousel-multi-item" data-ride="carousel">

							<!--Controls-->
							<div class="controls-top">
								<a class="btn-floating" href="#multi-item-example"
									data-slide="prev"><i class="fas fa-chevron-left"></i></a> <a
									class="btn-floating" href="#multi-item-example"
									data-slide="next"><i class="fas fa-chevron-right"></i></a>
							</div>
							<!--/.Controls-->

							<!--Indicators-->
							<ol class="carousel-indicators">
								<li data-target="#multi-item-example" data-slide-to="0"
									class="active"></li>
								<li data-target="#multi-item-example" data-slide-to="1"></li>
							</ol>
							<!--/.Indicators-->

							<!--reservation Slides-->
							<div class="carousel-inner" role="listbox">
								<!--First slide-->
								<div class="carousel-item active">

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">Card title</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary">예약 상세 정보 ></a>
										</div>
									</div>

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
								</div>
								<!--/.First slide-->

								<!--Second slide-->
								<div class="carousel-item">

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>
								</div>
								<!--/.Second slide-->
							</div>
						</div>
						<!--/.Slides-->
					</div>
					
					
					
					
					<div class="cardWrapper" id="cancelTrip">
						<div id="multi-item-example"
							class="carousel slide carousel-multi-item" data-ride="carousel">

							<!--Controls-->
							<div class="controls-top">
								<a class="btn-floating" href="#multi-item-example"
									data-slide="prev"><i class="fas fa-chevron-left"></i></a> <a
									class="btn-floating" href="#multi-item-example"
									data-slide="next"><i class="fas fa-chevron-right"></i></a>
							</div>
							<!--/.Controls-->

							<!--Indicators-->
							<ol class="carousel-indicators">
								<li data-target="#multi-item-example" data-slide-to="0"
									class="active"></li>
								<li data-target="#multi-item-example" data-slide-to="1"></li>
							</ol>
							<!--/.Indicators-->

							<!--reservation Slides-->
							<div class="carousel-inner" role="listbox">
								<!--First slide-->
								<div class="carousel-item active">

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">Card title</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>
											<a href="#" class="btn btn-primary">예약 상세 정보 ></a>
										</div>
									</div>

									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="resources/image/about_bg.jpg"
											alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">예약된 여행</h5>
											<p class="card-text">Some quick example text to build on
												the card title and make up the bulk of the card's content.</p>

											<a href="simpleInfo.do" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter">예약
												상세 정보 ></a>
										</div>
									</div>
								</div>
								<!--/.First slide-->

								<!--Second slide-->
								<div class="carousel-item">

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>

									<div class="col-md-3" style="float: left">
										<div class="card mb-2">
											<img class="card-img-top"
												src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
												alt="Card image cap">
											<div class="card-body">
												<h4 class="card-title">Card title</h4>
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
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
												<p class="card-text">Some quick example text to build on
													the card title and make up the bulk of the card's content.</p>
												<a class="btn btn-primary">Button</a>
											</div>
										</div>
									</div>
								</div>
								<!--/.Second slide-->
							</div>
						</div>
						<!--/.Slides-->
					</div>
					
					
				</div>
			</div>
		</div>
	</section>

























	<br>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body" id="modal1">

					<img src="resources/image/about_bg.jpg">

				</div>
				<div class="modal-body">
					<h3>예약 정보 확인</h3>

					<table class="table">

						<tr>
							<th>체크인</th>
							<td>체크인 DATA</td>
							<th>체크아웃</th>
							<td>체크아웃 DATA</td>
						</tr>
						<tr>
							<th>인원</th>
							<td colspan=3>인원수 DATA</td>
						</tr>
						<tr>
							<th>금액</th>
							<td colspan=3>금액 DATA</td>
						</tr>
						<tr>
							<th>요청사항</th>
							<td colspan=3>요청사항 DATA</td>
						</tr>
						<tr>
							<th>위치</th>
							<td colspan=3>위치 DATA</td>
						</tr>



					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">메세지 보내기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!--================Banner Area =================-->

	<script>
	let btn1 = document.getElementById("btn1");
    let btn2 = document.getElementById("btn2");
    let btn3 = document.getElementById("btn3");
    
    let reservation =document.getElementById('reservation')
    let traveled =document.getElementById('traveled')
    let cancelTrip =document.getElementById('cancelTrip')
    
    reservation.style.display='inline-block';
    traveled.style.display='none';
    cancelTrip.style.display='none';

    btn1.addEventListener('click', ()=>{
	    reservation.style.display='inline-block';
	    traveled.style.display='none';
	    cancelTrip.style.display='none';
    })
    
    btn2.addEventListener('click', ()=>{
	    reservation.style.display='none';
	    traveled.style.display='inline-block';
	    cancelTrip.style.display='none';
    })
    
    btn3.addEventListener('click', ()=>{
	    reservation.style.display='none';
	    traveled.style.display='none';
	    cancelTrip.style.display='inline-block';
    })
</script>

</body>

</html>