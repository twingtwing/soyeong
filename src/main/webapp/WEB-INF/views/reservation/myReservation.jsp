<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			margin: 0px;
			width: 100%;

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
		.carousel-item.active,
		.carousel-item-next,
		.carousel-item-prev {
			display: flex;

		}
		
		
		#scroll ::-webkit-scrollbar{
			width: 30px;
			height: 30px;
		}
		#scroll ::-webkit-scrollbar-thumb:hover{
			background-color: #0069D9;
		}
		
		#scroll ::-webkit-scrollbar-track{
			background-color: #817958;
			border-radius: 10rem;
		}
		#scroll ::-webkit-scrollbar-thumb{
			background-color: #F3C300;
			border-radius: 10rem;
		}
		.reviewBtn{
			display: none;
			font-weight: bold;
			color:white;
			background-color: #007BFF;
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
						<button type="button" id="btn2">지난 여행</button>
						<button type="button" id="btn3">취소 내역</button>
					</div>

					<!-- 예약된 여행 -->
					<div id="scroll">
					<div class="cardWrapper" id="reservation">
						<div class="carousel-item active">
							<div style="display: flex; margin-bottom: 3rem;">
							<c:forEach items="${cards }" var="reserv" varStatus="status">
									<div class="card" style="width: 18rem;">
										<div align="center" style="margin-top: 5px;">
										<img alt="" src="${reserv.rphoto}" class="card-img-top">
										</div>
										<div class="card-body">
											<h5 class="card-title">${reserv.rname }</h5>
											<p class="card-text">${reserv.rcontent }</p>

											<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
												data-rcheckin='${reserv.rcheckin }' data-rcheckout='${reserv.rcheckout }'
												data-adult='${reserv.bookadult }' data-kid='${reserv.bookkid }' data-pay='${reserv.fee }'
												data-addr='${reserv.raddress }' data-request='${reserv.bookrequest }'
												data-photo='${reserv.rphoto }' data-state='${reserv.ispaid }' data-bookno='${reserv.bookno}'
												data-cancel='${reserv.bookcancel}' data-rno='${reserv.rno}'
												data-checkin='${reserv.checkin}' data-checkout='${reserv.checkout}'>예약
												상세 정보>
											</a>
										</div>
									</div>
							</c:forEach>
							</div>
						</div>
					</div>
					</div>
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
							<th>체크인 날짜</th>
							<td id="ckin"></td>
							<th>체크아웃 날짜</th>
							<td id="ckout"></td>
						</tr>
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
					</table>

				</div>
				<div class="modal-footer">	
					<button type="button" class="btn reviewBtn">리뷰 작성하기</button>
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
	
	<form action="reviewForm.do" id="chkRv">
		<input type="hidden" name="bookno">
		<input type="hidden" name="id" value="${id}">
	</form>
	<!--================Banner Area =================-->

	<script>
	let shorten = function(elements, l){
		for(let i=0; i<elements.length;i++){
			if(elements[i].textContent.length>l){
				elements[i].textContent = elements[i].textContent.substring(0,l)+'...';
			}
		}
	}
	shorten($('.card-title'),16);
	shorten($('.card-text'),100);
		
	$('.navbar')[0].style.width='100%';
	
		$('.dt')[0].addEventListener('click', (e) => {
			let bookno = +$('.dt')[0].dataset.no;
			$('#frm>input').val(bookno)
			$('#frm').submit();
		})

		// 현재 예약중
		$('#btn1').on('click', (e) => {
			$('#sortFrm>input').val('A');
			$('#sortFrm').submit();
		})


		// 과거에 갔던 곳
		$('#btn2').on('click', (e) => {
			$('#sortFrm>input').val('E')
			$('#sortFrm').submit();
		})

		// 취소 목록
		$('#btn3').on('click', (e) => {
			$('#sortFrm>input').val('X')
			$('#sortFrm').submit();
		})




		$('#exampleModalCenter').on('show.bs.modal', function (e) {
			var rcheckin = $(e.relatedTarget).data('rcheckin');
			var rcheckout = $(e.relatedTarget).data('rcheckout');
			var adult = $(e.relatedTarget).data('adult');
			var kid = $(e.relatedTarget).data('kid');
			var pay = $(e.relatedTarget).data('pay');
			var addr = $(e.relatedTarget).data('addr');
			var request = $(e.relatedTarget).data('request');
			var photo = $(e.relatedTarget).data('photo');
			let bookno = $(e.relatedTarget).data('bookno');
			let rno = +$(e.relatedTarget).data('rno');
			let checkin = $(e.relatedTarget).data('checkin');
			let checkout = $(e.relatedTarget).data('checkout');
			
			$('#ckin').text(checkin);
			$('#ckout').text(checkout);
			$('#mdCheckin').html(rcheckin + '시');
			$('#mdCheckout').html(rcheckout + '시');
			$('#mdCnum').html('어른 : ' + adult + '명, 아이 : ' + kid + '명');
			$('#mdPay').html(pay + '원');
			$('#mdRequest').html(request);
			if (request == '') {
				$('#mdRequest').text('없음');
			}
			$('#mdAddr').html(addr);
			//취소여부
			if(e.relatedTarget.dataset.cancel=='Y'){
				$('#state').text('취소 처리됨').css('color', 'darkgray').css('font-weight', 'bold');
			}
			checkout = new Date(checkout)
			checkout.setDate(checkout.getDate()+1);
			$('form')[2].children[0].value = $(e.relatedTarget).data('bookno');
			if(checkout < new Date() && e.relatedTarget.dataset.cancel!='Y'){
				checkRv('reviewCheckdup.do','${id}',rno);
				$('.reviewBtn').css('display','inline-block');
			}
			$('.dt')[0].dataset.no = bookno;
		})
		
		// ajax로 이미 리뷰 작성했는지 체크
		let checkRv = function(action,id,rno){
			$.ajax({
				url : action,
				dataType : 'text',
				data : {'id':id,'rno':rno}
			})
			.done((result)=>{
				if(result=='ok'){
					$('.reviewBtn').on('click',()=>$('#chkRv').submit());
				} else{
					$('.reviewBtn').css('display','none');
					return;
				}
			})
			.fail((error)=>{
				console.log(error)
			})
		}
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