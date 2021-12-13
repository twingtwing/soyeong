<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            	<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>Relax Your Mind</h2>
					</div>
				</div>
            </div>
        </section>
        <!--================Banner Area =================-->
        
        <!--================ start body Area =================-->
        <section class="section_gap">
            <div class="container">
                <div class="row mb-30">
                    <a href="#" class="genric-btn warning-border circle arrow pl-4"><span class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>Prev</a>
                </div>
                <div class="section_title text-center">
                    <h2 class="title_color"><strong>확인 및 결제</strong></h2>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="m-3 ml-5">
                            <div class="mb-4">
                                <h4 class="text-dark ml-1 mb-3">예약 정보</h4>
                                <div class="ml-1">
                                    <h6 class="mb-0">날짜</h6>
                                    <p>2021년 12월 20일 ~ 2022년 1월 17일</p>
                                </div>
                                <div class="ml-1">
                                    <h6 class="mb-0">체크인 시간</h6>
                                    <p>오전 8:00 – 오전 10:00</p>
                                </div>
                                <div class="ml-1">
                                    <h6 class="mb-0">게스트</h6>
                                    <p>게스트 2명</p>
                                </div>
                                <div>
                                    <h6 class="mb-1 ml-1">요청사항</h6>
                                    <textarea class="single-textarea bg-light" placeholder="내용을 입력해주세요..." onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요...'" ></textarea>
                                </div>
                            </div>
                            <hr class="border-warning my-1">
                            <div class="mt-4 mb-4 ml-1">
                                <h4 class="text-dark mb-3">결제 수단</h4>
                                <p>how?</p>
                            </div>
                            <hr class="border-warning my-1">
                            <div class="mt-4 mb-4 ml-1">
                                <h4 class="text-dark mb-3">환불 정책</h4>
                                <!-- 3일 전까지 가능 -->
                                <p>12월 17일 오후 3:00 이전에 예약을 취소하면, 숙박 요금 및 서비스 수수료를 제외한 요금 전액이 환불됩니다.</p>
                            </div>
                            <hr class="border-warning my-1">
                            <div class="mt-4 mb-4 ml-1">
                                <div class="switch-wrap d-flex justify-content-between">
                                    <div width = "16" class="mr-1 mt-1">
                                        <div class="primary-checkbox">
                                            <input type="checkbox" id="primary-checkbox" checked="">
                                            <label for="primary-checkbox"></label>
                                        </div>
                                    </div>
                                    <small>호스트가 설정한 숙소 이용규칙, 에어비앤비 코로나19 방역 수칙 및 게스트 환불 정책에 동의합니다.</small>
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
                                        <p>₩4,392,686</p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="font-weight-bold">서비스 수수료</p>
                                        <p class="text-primary">₩439,268</p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="font-weight-bold">숙박세와 수수료</p>
                                        <p class="text-primary">₩43,926</p>
                                    </div>
                                    <hr class="my-1">
                                    <div class="d-flex justify-content-between mt-3">
                                        <p class="font-weight-bold">합계</p>
                                        <p>₩4,875,880</p>
                                    </div>
                                    <a href="#" class="book_now_btn button_hover mt-2">
                                        <strong>Reservation</strong>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ body Area  =================-->

</body>
</html>