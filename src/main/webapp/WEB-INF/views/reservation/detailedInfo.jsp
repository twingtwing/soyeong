detailedInfo 백업

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/vendors/linericon/style.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="resources/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<!-- main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/responsive.css">
<style>
#mapWrapper {
	text-align: center;
}

#googleMap {
	width: 100%;
	height: 500px;
	border: 2px solid black;
	margin: 0px auto;
	display: inline-block;
}

.dataWrapper>.col-md-12 {
	color: white;
}

#reportButton {
	text-align: right;
}

.dataWrapper {
	width: 100%;
}

.dataWrapper div {
	margin: 0.5rem;
}
</style>
</head>
<body>
	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">상세정보</h2>
				<ol class="breadcrumb">
					<li><a href="home.do">예약하기</a></li>
					<li class="active">${hotelDetail.rname}</li>
				</ol>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content ">
						<h2 class="title title_color">${hotelDetail.rname}</h2>
						<p>${hotelDetail.raddress}</p>
						<a href="#" class="button_hover theme_btn_two">비용 계산하기</a>
					</div>
				</div>
				<div class="col-md-6">


					<!--================Booking Tabel Area =================-->
					<div class="hotel_booking_area position">
						<div class="container">
							<h3 style="text-align: center;">지금 바로 예약하기</h3>
							<div class="hotel_booking_table">
								<div class="w-100"></div>
								<div class="col-md-11">
									<div class="boking_table">
										<div class="row">
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker-in'>
															<input type='text' class="form-control"
																placeholder="Check in" id="rcheckin" required="required" />
															<span class="input-group-addon"> <i
																class="fa fa-calendar" aria-hidden="true"></i>
															</span>
														</div>
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker-out'>
															<input type='text' class="form-control"
																placeholder="Check out" id="rcheckout"
																required="required" /> <span class="input-group-addon">
																<i class="fa fa-calendar" aria-hidden="true"></i>
															</span>
														</div>
													</div>
												</div>
											</div>

											<div class="w-100"></div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="input-group">
														<select class="wide">
															<option data-display="Adult">Adult</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="book_tabel_item">
													<div class="input-group">
														<select class="wide">
															<option data-display="Child">Child</option>
															<option value="0">없음</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>
													</div>

												</div>
											</div>
											<span id="rguest" style="display: none;">${hotelDetail.rguest}</span>
											<div class="w-100"></div>
											<div class="col-md-12">
												<div class="book_tabel_item">
													<a class="book_now_btn button_hover" href="#">바로 예약하기</a>
												</div>
											</div>
											<div class="dataWrapper">
												<div class="w-100"></div>
												<div class="col-md-12" id="houseRent">1박
													${hotelDetail.fee}원</div>
												<div class="w-100"></div>
												<div class="col-md-12" id="houseRentAll"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="serviceFee"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="serviceTax"></div>
												<div class="w-100"></div>
												<div class="col-md-12" id="totalPrice"></div>
												<div class="w-100"></div>
											</div>
											<div class="col-md-12" id="reportButton">
												<button type="button" id="openModalBtn" class="genric-btn danger circle">신고하기</button> 
												<!-- 신고 insert 페이지로 이동 -->
												<!-- 신고 insert modal 시작 -->
												    <div class="modal" id="reportModal" tabindex="-1" role="dialog">
												        <div class="modal-dialog" role="document">
												            <div class="modal-content">
												                <div class="comment-form">
												                    <h4>신고하기</h4>
												                    <form id="rpfrm">
												                        <div class="form-group">
												                            <input type="text" class="form-control" id="rptitle" name="rptitle" placeholder="제목을 입력하세요"
												                                onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력하세요'" required="">   
												                        </div>
												                        <div class="form-group">
												                            <div class="default-select" id="default-select">
												                                <select style="display: none;" id="rptype" name="rptype">
												                                    <option value="안전">안전 문제</option>
												                                    <option value="금전">금전</option>
												                                    <option value="불법 운영">불법 운영</option>
												                                </select>
												                                <div class="nice-select" tabindex="0">
												                                    <span class="current">신고 사유 선택</span>
												                                    <ul class="list">
												                                        <li data-value="안전" class="option selected">안전 문제</li>
												                                        <li data-value="금전" class="option">금전 문제</li>
												                                        <li data-value="불법 운영" class="option">불법 운영</li>
												                                    </ul>
												                                </div>
												                            </div>
												                        </div>
												                        <div class="form-group">
												                            <textarea class="form-control mb-10" rows="5" id="rpcontent" name="rpcontent" placeholder="내용을 입력하세요"
												                                onblur="this.placeholder = '내용을 입력하세요'"
												                                required="required"></textarea>
												                        </div>
												                        <div class="row justify-content-between">
												                            <div class="row md-3 m-2">
												                                <button id="reportsave" type="submit" class="primary-btn button_hover">Save</button>
												                            </div>
												                            <div class="row md-3 m-2">
												                                <button type="button" id="closeModalBtn" class="primary-btn button_hover">Close</button>
												                            </div>
												                        </div>
												                        <div>
												                        	<input type="hidden" name="blackuser" value="${hotelDetail.id}">
												                        	<input type="hidden" id="reporter" name="reporter" value="${id}">
												                        </div>
												                    </form>
												                </div>
												            </div>
												        </div>
												    </div>
												    <!-- 신고 insert 모달 끝 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--================Booking Tabel Area  =================-->
				</div>
			</div>
		</div>
	</section>
	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container" align="center">
			<div style="display: flex; flex-direction: column; align-items: center;">
			<img alt="" src="${hotelDetail.rphoto}">
			<c:forEach items="${imgs}" var="img">
				<img alt="" src="${img.pfile}">
			</c:forEach>
			</div>
		</div>
	</section>

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content ">
						<h2 class="title title_color">상세정보 및 편의시설</h2>
						<div class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">${hotelDetail.rcontent}</h4>
							<span class="badge badge-warning" data-am="${hotelDetail.am1}">와이파이</span>
							<span class="badge badge-warning" data-am="${hotelDetail.am2}">주방시설</span>
							<span class="badge badge-warning" data-am="${hotelDetail.am3}">편의점</span>
						</div>
						<div>연락처: ${hotelDetail.rtel}</div>
					</div>
				</div>
				<div class="col-md-6">
					<div id="mapWrapper">
						<div id="googleMap" style="overflow: auto"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ About History Area  =================-->

	<!--================ Testimonial Area  =================-->
	<section class="testimonial_area section_gap">
		<div class="container">
			<div class="section_title text-center">
				<h3 class="title_color">후기 / 별점</h3>
			</div>
			<c:if test="${not empty avg}">
			<h4 style="text-align: center">${avg}</h4>
			</c:if>
			<div class="testimonial_slider owl-carousel">
				<c:forEach items="${reviews}" var="review">
				<div class="media testimonial_item">
					<img class="rounded-circle" src="image/testtimonial-1.jpg" alt="">
					<div class="media-body" data-star="${review.rvstar}">
						<p>${review.rvcontent}</p>
						<a href="#"><h4 class="sec_h4">${review.id}</h4></a>
					</div>
				</div>
				</c:forEach>


			</div>
		</div>
	</section>
	<form action="bookingForm.do" id="frm">
		<input type="hidden" value="${hotelDetail.rno}" name="rno"> <input
			type="hidden" name="rcheckin" id="cki"> <input type="hidden"
			name="rcheckout" id="cko"> <input type="hidden"
			name="bookkid" id="bkid"> <input type="hidden"
			name="bookadult" id="badult"> <input type="hidden" name="day">
	</form>


	<!--================ Testimonial Area  =================-->

	<script>
	(function showTags(){
		for(let i=0; i<$('.tag_cloud_widget>span').length;i++){	
			if($('.tag_cloud_widget>span')[i].dataset.am=='N'){
				$('.tag_cloud_widget>span')[i].style.backgroundColor = 'gray';
			}
		}
		
	})();
	

	let makeStar = function(rvstar){
		rvstar = Number(rvstar)
		let fullstar = Math.floor(rvstar);
		console.log(rvstar,fullstar)
		let star = document.createElement('div')
		star.className = 'star';
		let a, i;
		for(let j=0;j<fullstar;j++){
			a = document.createElement('a');
			i = document.createElement('i');
			i.className='fa fa-star';
			a.append(i);
			star.append(a);
		}
		if(rvstar-fullstar>0){
			a = document.createElement('a');
			i = document.createElement('i');
			i.className = 'fa fa-star-half-o';
			a.append(i);
			star.append(a);
		}
		return star;
	}
	
	for(let i=0; i<document.getElementsByClassName('media-body').length;i++){
		let rvstar = +document.getElementsByClassName('media-body')[i].getAttribute('data-star');
		document.getElementsByClassName('media-body')[i].append(makeStar(rvstar));
	}
	
	
	
	let total;
	$('.theme_btn_two').first().on('click',()=>{
		if($('#rcheckin').val()==''||$('#rcheckout').val()==''){
			window.alert('날짜를 지정해주세요.');
			return;
		}
		if($('.wide:nth-child(2n-1)').first().val()=='Adult'||$('.wide:nth-child(2n-1)').last().val()=='Child'){
			window.alert('인원수를 지정해주세요.');
			return;
		}
		let guest = Number($('.wide:nth-child(2n-1)').first().val())+Number($('.wide:nth-child(2n-1)').last().val())
		if(+$('#rguest').text()<guest){
			window.alert($('#rguest').text()+'인을 초과할 수 없는 방입니다.');
			return;
		}
		let one = parseInt($('#houseRent').text().substring(3));
		let checkin = new Date($('#rcheckin').val());
		let checkout = new Date($('#rcheckout').val());
		let day = parseInt(+(checkout.getTime()-checkin.getTime())/(1000*3600*24));
		$('#houseRentAll').text(day+'박 '+(one*day)+'원');
		$('#serviceFee').text('수수료 '+parseInt(one*0.1)+'원');
		$('#serviceTax').text('부가세 '+parseInt(one*0.01)+'원');
		total = one*day+parseInt(one*0.1)+parseInt(one*0.01);
		$('#totalPrice').text('총액 '+total+'원'); 
		$('#totalPrice').css('color','#F3C300');
		$('#totalPrice').css('font-weight','bolder');
		$('#totalPrice').css('font-size','1.3rem');
		$('#totalPrice').css('text-align','right');
		$('#totalPrice').css('transition','all 0.7s');
		$('#totalPrice').css('margin-bottom','1rem');
		$('#frm>input').last().val(day);
		$('#frm>#cki').val($('#rcheckin').val());
		$('#frm>#cko').val($('#rcheckout').val());
		$('#frm>#badult').val($('.wide:nth-child(2n-1)').first().val());
		$('#frm>#bkid').val($('.wide:nth-child(2n-1)').last().val());
	})
	
	$('.book_now_btn').first().on('click',(e)=>{
		if($('#totalPrice').text().length>1){
			frm.submit();											
		} else{
			window.alert('좌측의 버튼을 통해 비용을 먼저 계산해주세요.');
			return;
		}
	})
	
	
		// google map
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
	
		// 모달 버튼에 이벤트
	    $('#openModalBtn').on('click', function(){
	    	$('#reportModal').modal('show');
	    });
	
	    // 모달 안의 취소 버튼
	    $('#closeModalBtn').on('click', function(){
	    	$('#reportModal').modal('hide');
	    });
	    
	    
	    $("#reportsave").click(function(){
	    	event.stopPropagation();
            event.preventDefault();
            $.ajax({
            	url : 'reportInsert.do',
            	type : 'post',
            	data : $('#rpfrm').serialize(),
            	success : function(){
            		alert("신고가 완료되었습니다.");
            		$('#reportModal').modal('hide');
            	}
            })
	    });
	    
	    
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRPuOyu6ap_iXZxFMQ4R_6XSShKgRuuQ&callback=myMap"></script>


</body>
</html>