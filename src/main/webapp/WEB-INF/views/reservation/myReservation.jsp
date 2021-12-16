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
			height: 550px;
			margin: 0px;
			width: 987px;
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

		.card-text,
		.card-title {
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

		#reservation,
		.carousel slide carousel-multi-item {
			display: inline-block;
		}

		#traveled,
		#cancelTrip {
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

		.container {
			display: flex;
			justify-content: center;
		}

		.carousel-item.active,
		.carousel-item-next,
		.carousel-item-prev {
			display: flex;

		}
		
		
	</style>
</head>

<body>

	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background="">
			</div>
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

					<!-- 예약된 여행 -->
					<div class="cardWrapper" id="reservation">
						<div class="carousel-item active">
								<div style="display: flex;">
							<c:forEach items="${cards }" var="reserv" varStatus="status">
									<div class="card" style="width: 18rem;">
										<img class="card-img-top" src="${reserv.rphoto}" alt="Card image cap">
										<div class="card-body">
											<h5 class="card-title">${reserv.rname }</h5>
											<p class="card-text">${reserv.rcontent }</p>

											<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
												data-checkin='${reserv.rcheckin }' data-checkout='${reserv.rcheckout }'
												data-adult='${reserv.bookadult }' data-kid='${reserv.bookkid }' data-pay='${reserv.fee }'
												data-addr='${reserv.raddress }' data-request='${reserv.bookrequest }'
												data-photo='${reserv.rphoto }' data-state='${reserv.ispaid }' data-bookno='${reserv.bookno}'>예약
												상세 정보>
											</a>
										</div>
									</div>
							</c:forEach>
								</div>
						</div>
					</div>
					<!-- 예약된 여행 -->
				</div>
			</div>
		</div>
	</section>

	<br>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
							<th>체크인 가능시간</th>
							<td id="mdCheckin"></td>
							<th>체크아웃</th>
							<td id="mdCheckout">checkout</td>
						</tr>
						<tr>
							<th>인원</th>
							<td colspan=3 id="mdCnum">${adult }</td>
						</tr>
						<tr>
							<th>금액</th>
							<td colspan=3 id="mdPay">금액 DATA</td>
						</tr>
						<tr>
							<th>요청사항</th>
							<td colspan=3 id="mdRequest">요청사항 DATA</td>
						</tr>
						<tr>
							<th>위치</th>
							<td colspan=3 id="mdAddr">위치 DATA</td>
						</tr>
						<tr>
							<th>결제 상태</th>
							<td colspan=3 id="state"></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary dt">상세정보 페이지</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<form action="myReservDetail.do" method="post" id="frm">
		<input type="hidden" name="bookno">
	</form>

	<form action="myReserv.do" id="sortFrm">
		<input type="hidden" name="ispaid">
	</form>
	<!--================Banner Area =================-->

	<script>
		$('.dt')[0].addEventListener('click', (e) => {
			let bookno = $('.dt')[0].dataset.no;
			$('#frm>input').val(+bookno)
			$('#frm').submit();
		})

		// 현재 예약중
		$('#btn1').on('click', (e) => {
			location.href='myReserv.do';
		})


		// 과거에 갔던 곳
		$('#btn2').on('click', (e) => {
			let param = {id : '${id}', ispaid : 'E'}
			sortBookAjax('endedJourney.do',param);
		})

		// 취소 목록
		$('#btn3').on('click', (e) => {
			let param = {
				id: '${id}',
				ispaid: 'X'
			}
			sortBookAjax('canceledJourney.do', param);
		})


		// ajax 호출 함수
		let sortBookAjax = function (action, param) {
			$.ajax({
					url: action,
					data: param,
					dataType: 'json'
				})
				.done((result) => {
					console.log(result);
				})
		}


		// ajax 호출 후 화면 바뀌는 함수.. 저걸 다붙인다고..?
		let makeList = function (datas) {
			for (let data of datas) {

			}
		}




		$('#exampleModalCenter').on('show.bs.modal', function (e) {
			var checkin = $(e.relatedTarget).data('checkin');
			var checkout = $(e.relatedTarget).data('checkout');
			var adult = $(e.relatedTarget).data('adult');
			var kid = $(e.relatedTarget).data('kid');
			var pay = $(e.relatedTarget).data('pay');
			var addr = $(e.relatedTarget).data('addr');
			var request = $(e.relatedTarget).data('request');
			var photo = $(e.relatedTarget).data('photo');
			let bookno = $(e.relatedTarget).data('bookno');
			$('#mdCheckin').html(checkin + '시');
			$('#mdCheckout').html(checkout + '시');
			$('#mdCnum').html('어른 : ' + adult + '명, 아이 : ' + kid + '명');
			$('#mdPay').html(pay + '원');
			$('#mdRequest').html(request);
			if (request == '') {
				$('#mdRequest').text('없음');
			}
			$('#mdAddr').html(addr);
			// if문
			if ($(e.relatedTarget).data('state')) {
				$('#state').text('결제완료').css('color', 'green').css('font-weight', 'bolder');
			} else {
				$('#state').text('결제 전').css('color', 'darkred').css('font-weight', 'bolder');
			}
			$('.dt')[0].dataset.no = bookno;
		})
	</script>


	<script>
		let btn1 = document.getElementById("btn1");
		let btn2 = document.getElementById("btn2");
		let btn3 = document.getElementById("btn3");

		let reservation = document.getElementById("reservation");
		let traveled = document.getElementById("traveled");
		let cancelTrip = document.getElementById("cancelTrip");

		reservation.style.display = 'inline-block';
		traveled.style.display = 'none';
		cancelTrip.style.display = 'none';

		btn1.addEventListener('click', () => {
			reservation.style.display = 'inline-block';
			traveled.style.display = 'none';
			cancelTrip.style.display = 'none';
		})

		btn2.addEventListener('click', () => {
			reservation.style.display = 'none';
			traveled.style.display = 'inline-block';
			cancelTrip.style.display = 'none';
		})

		btn3.addEventListener('click', () => {
			reservation.style.display = 'none';
			traveled.style.display = 'none';
			cancelTrip.style.display = 'inline-block';
		})
	</script>

</body>

</html>