<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>소영과 아이들 예약 페이지</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->

	<!--================ start body Area =================-->
	<section class="section_gap">
		<div class="container">
			<div class="row mb-30">
				<a href="home.do"
					class="genric-btn warning-border circle arrow pl-4"><span
					class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>뒤로가기</a>
			</div>
			<div class="section_title text-center">
				<h2 class="title_color">
					<strong>확인 및 결제</strong>
				</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="m-3 ml-5">
						<div class="mb-4">
							<h4 class="text-dark ml-1 mb-3">예약 정보</h4>
							<div class="ml-1">
								<h6 class="mb-0">날짜</h6>
								<p>
								<!-- fmt 사용해야할듯 -->
									<span id="checkin">
										${checkin}
									</span> ~ 
									<span id="checkout">
										${checkout}
									</span>
								</p>
							</div>
							<div class="ml-1">
								<h6 class="mb-0">체크인-체크아웃</h6>
								<p>${rcheckin} – ${rcheckout}</p>
							</div>
							<div class="ml-1">
								<h6 class="mb-0">총 인원(${hotel.rguest}인실)</h6>
								<p>성인 ${bookadult}명 아동 ${bookkid}명</p>
							</div>
							<div>
								<h6 class="mb-1 ml-1">요청사항</h6>
								<textarea class="single-textarea bg-light"
									placeholder="내용을 입력해주세요" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '내용을 입력해주세요'"></textarea>
							</div>
						</div>
						<hr class="border-warning my-1">
						<div class="mt-4 mb-4 ml-1">
							<h4 class="text-dark mb-3">결제 수단</h4>
							<p><button>카카오 페이</button></p>
							<p><button>네이버 페이</button></p>
							<p><button>무통장 입금</button></p>
							<p><button>신용카드</button></p>
						</div>
						<hr class="border-warning my-1">
						<div class="mt-4 mb-4 ml-1">
							<h4 class="text-dark mb-3">환불 정책</h4>
							<!-- 3일 전까지 가능 -->
							<p><span id="refundTime"></span> 이전에 예약을 취소하면, 숙박 요금 및 서비스 수수료를 제외한 요금 전액이
								환불됩니다.</p>
						</div>
						<hr class="border-warning my-1">
						<div class="mt-4 mb-4 ml-1">
							<div class="switch-wrap d-flex justify-content-between">
								<div width="16" class="mr-1 mt-1">
									<div class="primary-checkbox">
										<input type="checkbox" id="primary-checkbox">
										<label for="primary-checkbox"></label>
									</div>
								</div>
								<small>호스트가 설정한 숙소 이용규칙, 에어비앤비 코로나19 방역 수칙 및 게스트 환불 정책에
									동의합니다.</small>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 position-relative">
					<div class="col sticky-top" style="z-index: 10;">
						<div class="card border-warning p-2">
							<div class="card-body">
								<h4 class="card-title text-center mb-4 mt-2">요금 세부 정보</h4>
								<div class="d-flex justify-content-between">
									<p class="font-weight-bold">숙소 요금</p>
									<p>₩ <fmt:formatNumber>${price}</fmt:formatNumber></p>
								</div>
								<div class="d-flex justify-content-between">
									<p class="font-weight-bold">서비스 수수료</p>
									<p class="text-primary">₩ <fmt:formatNumber>${serviceFee}</fmt:formatNumber></p>
								</div>
								<div class="d-flex justify-content-between">
									<p class="font-weight-bold">부가세</p>
									<p class="text-primary">₩ <fmt:formatNumber>${serviceTax}</fmt:formatNumber></p>
								</div>
								<hr class="my-1">
								<div class="d-flex justify-content-between mt-3">
									<p class="font-weight-bold">합계</p>
									<p>₩ <fmt:formatNumber>${total}</fmt:formatNumber> 원</p>
								</div>
								<a href="#" class="book_now_btn button_hover mt-2"> <strong data-id="${id}">예약하기</strong>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		<form action="booking.do" method="post" id="frm">
		<input type="hidden" name="rno" value="${hotel.rno}">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="checkin" value="${checkin}">
		<input type="hidden" name="checkout" value="${checkout}">
		<input type="hidden" name="bookadult" value="${bookadult}">
		<input type="hidden" name="bookkid" value="${bookkid}">
		<input type="hidden" name="bookrequest" value="">
		</form>
	<!--================ body Area  =================-->
	<script type="text/javascript">
		/*
		let checkin = new Date($('#checkin').text());
		let checkout = new Date($('#checkout').text());
		// checkin, checkout nan뜨는거 고쳐오겠습니다 ,,
		$('#checkin').text(
				checkin.getFullYear() + '년 ' + parseInt(checkin.getMonth() + 1)
						+ '월 ' + checkin.getDate() + '일');
		$('#checkout').text(
				checkout.getFullYear() + '년 '
						+ parseInt(checkout.getMonth() + 1) + '월 '
						+ checkout.getDate() + '일');
		
		$('#refundTime').text((checkout.getMonth()+1)+'월 '+(checkout.getDate()-3)+'일 오후 03시')
		*/
		
		
		
		// 버튼 클릭시
		$('.book_now_btn').first().on('click',(e)=>{
			if(!$('#primary-checkbox').is(':checked')){
				window.alert('소영과 아이들의 환불정책에 동의해주시기 바랍니다.');
				return;
			}
			$('#frm>input').last().val($('.single-textarea').val());
			if($('.book_now_btn>strong')[0].dataset.id==''){
				window.alert('로그인을 해주세요.');
				location.href='home.do';
				return;
			}
			$('#frm').submit();
			window.alert('예약이 완료되었습니다. 마이페이지에서 결제를 진행해주세요.');
		})
	</script>
</body>
</html>