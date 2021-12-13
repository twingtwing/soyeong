<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 마이페이지에서 호스트 매출관리 -->

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
                    <a href="javascript:history.back()" class="genric-btn warning-border circle arrow pl-4"><span class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>Prev</a>
                </div>
                <div class="section_title text-center">
                    <h2 class="title_color"><strong>결제 및 환불 처리</strong></h2>
                </div>
                <!-- 모두 첨에는 기본으로 1개월 가져옴 -->
                <div class="btn-Pay row mb-4 border border-right-0 border-top-0 border-left-0">
                    <div class="active-btn-Pay ml-4">
                        <h5>대금 수령 완료</h5>
                    </div>
                    <div class="ml-5">
                        <h5>수령 예정</h5>
                    </div>
                    <div class="ml-5">
                        <h5>환불 요청</h5>
                    </div>
                    <div class="ml-5">
                        <h5>통계</h5>
                    </div>
                </div>
                <div class="div-Pay pt-3">
                    <!-- 대금수령완료 div -->
                    <div class="active-div-Pay">
                        <div class="row pt-2">
                            <div class="col-md-12 d-flex justify-content-between">
                                <div class="btn-Pay-date">
                                    <button type="button" class="genric-btn default" value="1">1 개월</button>
                                    <button type="button" class="genric-btn default" value="2">3 개월</button>
                                    <button type="button" class="genric-btn default">직접 설정</button>
                                </div>
                                <div>
                                    <button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
                                </div>
                            </div>
                            <div class="pay-date-detail col-md-12 d-print-block d-flex justify-content-center mt-3">
                                <div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
                                    <div class="book_tabel_item d-flex justify-content-around">
                                        <div class="form-group mr-3">
                                            <div class='input-group date' id='datetimepicker-pay-start-1'>
                                                <h5 class="pt-2 pl-2 pr-3">start :</h5>
                                                <input type='text' class="form-control" placeholder="Start Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker-pay-end-1'>
                                                <h5 class="pt-2 pl-2 pr-3">end :</h5>
                                                <input type='text' class="form-control" placeholder="End Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 더보기 10개 반복 -->
                        <div class="row mt-4 pt-4">
                            <table class="table text-center align-middle">
                                <tr>
                                    <th>예약 날짜</th>
                                    <th>대금</th>
                                    <th>예약자</th>
                                    <th>체크인 - 체크아웃</th>
                                    <th>숙소</th>
                                </tr>
                                <tr>
                                    <td>11월 28,2020</td>
                                    <td>$592,000</td>
                                    <td>홍갈동</td>
                                    <td>2021/10/9 - 2021/11/9</td>
                                    <td>강릉 숙소</td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-center"><a href="#collapse-PayY-1"
                                            data-toggle="collapse">더보기</a></td>
                                </tr>
                                <tr id="collapse-PayY-1" class="collapse collapse-Pay-more">
                                    <td>11월 28,2020</td>
                                    <td>$592,000</td>
                                    <td>홍갈동</td>
                                    <td>2021/10/9 ~ 2021/11/9</td>
                                    <td>강릉 숙소</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 수령 예정 div -->
                    <div class="d-none">
                        <div class="row pt-2">
                            <div class="col-md-12 d-flex justify-content-between">
                                <div class="btn-Pay-date">
                                    <button type="button" class="genric-btn default" value="1">1 개월</button>
                                    <button type="button" class="genric-btn default" value="2">3 개월</button>
                                    <button type="button" class="genric-btn default">직접 설정</button>
                                </div>
                                <div>
                                    <button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
                                </div>
                            </div>
                            <div class="pay-date-detail d-print-block col-md-12 d-flex justify-content-center mt-3">
                                <div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
                                    <div class="book_tabel_item d-flex justify-content-around">
                                        <div class="form-group mr-3">
                                            <div class='input-group date' id='datetimepicker-pay-start-2'>
                                                <h5 class="pt-2 pl-2 pr-3">start :</h5>
                                                <input type='text' class="form-control" placeholder="Start Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker-pay-end-2'>
                                                <h5 class="pt-2 pl-2 pr-3">end :</h5>
                                                <input type='text' class="form-control" placeholder="End Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 더보기 10개 반복 -->
                        <div class="row mt-4 pt-4">
                            <table class="table text-center">
                                <tr>
                                    <th>예약 날짜</th>
                                    <th>대금</th>
                                    <th>예약자</th>
                                    <th>체크인 - 체크아웃</th>
                                    <th>숙소</th>
                                </tr>
                                <tr>
                                    <td>2월 28,2020</td>
                                    <td>$592,000</td>
                                    <td>홍갈동</td>
                                    <td>2021/10/9 ~ 2021/11/9</td>
                                    <td>강릉 숙소</td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-center"><a href="#collapse-PayN-1"
                                            data-toggle="collapse">더보기</a></td>
                                </tr>
                                <tr id="collapse-PayN-1" class="collapse collapse-Pay-more">
                                    <td>11월 28,2020</td>
                                    <td>$592,000</td>
                                    <td>홍갈동</td>
                                    <td>2021/10/9 - 2021/11/9</td>
                                    <td>강릉 숙소</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 환불 요청 div -->
                    <div class="d-none">
                        <div class="row pt-2">
                            <div class="col-md-12 d-flex justify-content-between">
                                <div class="btn-Pay-date">
                                    <button type="button" class="genric-btn default" value="1">1 개월</button>
                                    <button type="button" class="genric-btn default" value="2">3 개월</button>
                                    <button type="button" class="genric-btn default">직접 설정</button>
                                </div>
                                <div>
                                    <button type="button" class="btn-Pay-ajax genric-btn warning">확인</button>
                                </div>
                            </div>
                            <div class="pay-date-detail d-print-block col-md-12 d-flex justify-content-center mt-3">
                                <div class="col-md-10 border border-warning mt-3 pt-3 pb-1">
                                    <div class="book_tabel_item d-flex justify-content-around">
                                        <div class="form-group mr-3">
                                            <div class='input-group date' id='datetimepicker-pay-start-3'>
                                                <h5 class="pt-2 pl-2 pr-3">start :</h5>
                                                <input type='text' class="form-control" placeholder="Start Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker-pay-end-3'>
                                                <h5 class="pt-2 pl-2 pr-3">end :</h5>
                                                <input type='text' class="form-control" placeholder="End Date" />
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 더보기 10개 반복 -->
                        <div class="row mt-4 pt-4">
                            <table class="table text-center">
                                <tr>
                                    <th>예약 날짜</th>
                                    <th>대금</th>
                                    <th>예약자</th>
                                    <th>체크인 - 체크아웃</th>
                                    <th>숙소</th>
                                    <th>환불 요청 날짜</th>
                                    <th>환불</th>
                                </tr>
                                <tr>
                                    <td class="align-middle">2월 28,2020</td>
                                    <td class="align-middle">$592,000</td>
                                    <td class="align-middle">홍갈동</td>
                                    <td class="align-middle">2021/10/9 ~ 2021/11/9</td>
                                    <td class="align-middle">강릉 숙소</td>
                                    <td class="align-middle">9월 28,2020</td>
                                    <td class="d-flex justify-content-around align-middle">
                                        <button type="button" class="btn btn-primary refund-Y"><i
                                                class="far fa-circle"></i></button>
                                        <button type="button" class="btn btn-danger refund-N"><i
                                                class="far fa-times-circle"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" class="text-center"><a href="#collapse-Ref-1"
                                            data-toggle="collapse">더보기</a></td>
                                </tr>
                                <tr id="collapse-Ref-1" class="collapse collapse-Pay-more">
                                    <td class="align-middle">11월 28,2020</td>
                                    <td class="align-middle">$592,000</td>
                                    <td class="align-middle">홍갈동</td>
                                    <td class="align-middle">2021/10/9 - 2021/11/9</td>
                                    <td class="align-middle">강릉 숙소</td>
                                    <td class="align-middle">9월 28,2020</td>
                                    <td class="d-flex justify-content-around align-middle">
                                        <button type="button" class="btn btn-primary refund-Y"><i
                                                class="far fa-circle"></i></button>
                                        <button type="button" class="btn btn-danger refund-N"><i
                                                class="far fa-times-circle"></i></button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 통계 div -->
                    <div class="d-none">
                        <div class="row d-flex justify-content-end">
                            <div class="book_tabel_item">
                                <div class="form-group mr-3">
                                    <div class='input-group date' id='datetimepicker-math'>
                                        <input type='text' class="form-control" placeholder="Enger Date" />
                                        <span class="input-group-addon">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="genric-btn warning">확인</button>
                            </div>
                        </div>
                        <div class="refund-div">
                            <div class="row mt-5 text-center">
                                <div class="col-md-3">
                                    <div class="card border-light bg-light">
                                        <div class="card-body pt-4">
                                            <div class="text-center pt-3">
                                                <span class="display-4">
                                                    <i class="fas fa-dollar-sign text-warning" aria-hidden="true"></i>
                                                </span>
                                                <h4 class="mt-4">?월 전체 총 수입</h4>
                                                <h3 class="text-warning mt-4 mb-4">$13,123,000</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card border-light bg-light">
                                        <div class="card-body pt-4">
                                            <div class="text-center pt-3">
                                                <span class="display-4">
                                                    <i class="fas fa-book-reader text-warning" aria-hidden="true"></i>
                                                </span>
                                                <h4 class="mt-4">?월 전체 예약수</h4>
                                                <h3 class="text-warning mt-4 mb-4">$13,123,000</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card border-light bg-light">
                                        <div class="card-body pt-4">
                                            <div class="text-center pt-3">
                                                <span class="display-4">
                                                    <i class="fas fa-heart text-warning" aria-hidden="true"></i>
                                                </span>
                                                <h4 class="mt-4">?월 전체 평점</h4>
                                                <h3 class="text-warning mt-4 mb-4">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card border-light bg-light">
                                        <div class="card-body pt-4">
                                            <div class="text-center pt-3">
                                                <span class="display-4">
                                                    <i class="fas fa-retweet text-warning" aria-hidden="true"></i>
                                                </span>
                                                <h4 class="mt-4">?월 전체 후기수</h4>
                                                <h3 class="text-warning mt-4 mb-4">$13,123,000</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-5 pb-5">
                            <div class="container">
                                <div class="row my-4 pb-3">
                                    <div class="col text-center">
                                        <h2>
                                            <i class="fas fa-chart-line text-warning"></i>&nbsp;&nbsp; 1년간 월간 수입 그래프
                                        </h2>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col">
                                        <div class="card pt-3 pl-3">
                                            <div class="card-body"> 
                                                <canvas id="lineChart" height="45vh" width="80vh"></canvas> 
                                            </div>
                                        </div>
                                    </div>
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