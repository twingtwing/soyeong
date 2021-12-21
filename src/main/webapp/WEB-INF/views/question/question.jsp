<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--================ start Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>고객센터</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================ Banner Area =================-->

	<!--================ start body Area =================-->
	<section class="section_gap">
		<div class="container">
			<div class="section_title mb-4 ml-2">
				<h2 class="title_color">
					<strong>고객센터</strong>
				</h2>
			</div>
			<div
				class="row mb-4 border border-right-0 border-top-0 border-left-0">
				<div class="btn-Q active-Q ml-3 mr-3" style="cursor: pointer;">
					<h5>Q n A</h5>
				</div>
				<c:if test="${not empty id}">
					<div class="btn-Q ml-3" style="cursor: pointer;">
						<h5>고객의 소리</h5>
					</div>
				</c:if>
			</div>
			<!-- QnA div -->
			<div class="btn-Q-div">
				<!-- 여기에 Icon 추가해야함 -->
				<!-- li은 10개 / foreach 쓸때 id값 바꾸기(varStatus) -->
				<ul class="list-group list-group-flush m-1">
					<li class="list-group-item">
						<c:forEach var="j" begin="0" end="${size}">
								<c:if test="${j eq 0}">
									<div>
										<c:forEach var="i" begin="0" end="9">
											<!-- i -->
											<div class="mt-2 mb-3 pt-3 pb-3">
												<table class="w-100">
													<tr>
														<td class="text-center text-warning" width="5%"><strong>Q</strong></td>
														<td class="pl-3 font-weight-bold" width="89%">[${QnAs.get(i).fCategory }] ${QnAs.get(i).fTitle }</td>
														<td class="text-center" width="5%">
															<a class="text-dark" href="#collapse-Q-${i}" data-toggle="collapse"><i class="fas fa-chevron-up"></i></a>
														</td>
													</tr>
												</table>
											</div>
											<div id="collapse-Q-${i}" class="collapse collapse-Q mb-3">
												<table class="w-100">
													<tr>
														<td class="text-center" width="5%"><strong>A</strong></td>
														<td class="pl-3" width="94%">${QnAs.get(i).fAnswer }</td>
													</tr>
												</table>
											</div>
										</c:forEach>
										<div class="mt-2 mb-3 text-center">
											<a href="#collapse-1" class="more-collapse" data-toggle="collapse">더보기</a>
										</div>
									</div>
								</c:if>
								<c:if test="${j ne 0 and j ne size}">
									<div id="collapse-${j }" class="collapse collapse-Q-more">
										<c:forEach var="i" begin="${j * 10}" end="${j * 10 + 9}">
											<div class="mt-2 mb-3 pt-3 pb-3">
												<table class="w-100">
													<tr>
														<td class="text-center text-warning" width="5%"><strong>Q</strong></td>
														<td class="pl-3 font-weight-bold" width="89%">[${QnAs.get(i).fCategory}]
															${QnAs.get(i).fTitle }</td>
														<td class="text-center" width="5%"><a
															class="text-dark" href="#collapse-Q-${i}"
															data-toggle="collapse"><i class="fas fa-chevron-up"></i></a>
														</td>
													</tr>
												</table>
											</div>
											<div id="collapse-Q-${i}" class="collapse collapse-Q mb-3">
												<table class="w-100">
													<tr>
														<td class="text-center" width="5%"><strong>A</strong></td>
														<td class="pl-3" width="94%">${QnAs.get(i).fAnswer }</td>
													</tr>
												</table>
											</div>
										</c:forEach>
										<div class="mt-2 mb-3 text-center">
											<a href="#collapse-${j + 1}" class="more-collapse" data-toggle="collapse">더보기</a>
										</div>
									</div>
								</c:if>
								<c:if test="${j eq size}">
									<div id="collapse-${j }" class="collapse collapse-Q-more">
										<c:forEach var="i" begin="${j * 10}" end="${j * 10 + extra -1}">
											<div class="mt-2 mb-3 pt-3 pb-3">
												<table class="w-100">
													<tr>
														<td class="text-center text-warning" width="5%"><strong>Q</strong></td>
														<td class="pl-3 font-weight-bold" width="89%">[${QnAs.get(i).fCategory}]
															${QnAs.get(i).fTitle }</td>
														<td class="text-center" width="5%"><a
															class="text-dark" href="#collapse-Q-${i}"
															data-toggle="collapse"><i class="fas fa-chevron-up"></i></a>
														</td>
													</tr>
												</table>
											</div>
											<div id="collapse-Q-${i}" class="collapse collapse-Q mb-3">
												<table class="w-100">
													<tr>
														<td class="text-center" width="5%"><strong>A</strong></td>
														<td class="pl-3" width="94%">${QnAs.get(i).fAnswer }</td>
													</tr>
												</table>
											</div>
										</c:forEach>
									</div>
								</c:if>
						</c:forEach>
					</li>
				</ul>
				<div class="br"></div>
			</div>
			<!-- 고객의 소리 div -->
			<div class="btn-Q-div d-none">
				<!-- input박스 border색 고민됨 -->
				<form id="frm-Q" class="contact_form" action="ajaxQuestion.do" method="post" novalidate="novalidate" enctype="multipart/form-data">
					<div class="blog_right_sidebar border-warning m-1 mt-5 p-5">
						<div class="form-row col-md-12 mb-4">
							<div class="form-group col-md-3">
								<h6>말머리</h6>
								<div class="default-select" id="default-select">
									<select style="display: none;" id="qCategory" name="qCategory">
										<option value="예약 및 여행">예약 및 여행</option>
										<option value="숙소 및 호스팅">숙소 및 호스팅</option>
										<option value="후기">후기</option>
										<option value="계정">계정</option>
										<option value="결제 및 환불">결제 및 환불</option>
										<option value="코로나19">코로나19</option>
									</select>
									<div class="nice-select bg-warning" tabindex="0">
										<span class="current">예약 및 여행</span>
										<ul class="list bg-light">
											<li data-value="예약 및 여행" class="option selected focus">예약 및 여행</li>
											<li data-value="숙소 및 호스팅" class="option">숙소 및 호스팅</li>
											<li data-value="후기" class="option">후기</li>
											<li data-value="계정" class="option">계정</li>
											<li data-value="결제 및 환불" class="option">결제 및 환불</li>
											<li data-value="코로나19" class="option">코로나19</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group col-md-9">
								<h6>제목</h6>
								<input type="text" class="form-control bg-light border-secondary" id="qTitle" name="qTitle" placeholder="Enter title">
							</div>
						</div>
						<div class="col-md-12 mb-4">
							<div class="form-group">
								<h6>내용</h6>
								<textarea id="qAnswer" name="qAnswer" class="form-control bg-light border-secondary" rows="7" placeholder="Enter Contents"></textarea>
							</div>
						</div>
						<div class="form-row col-md-12 mb-4">
							<div class="form-group col-md-3">
								<h6><i class="fa fa-paperclip"></i>첨부파일</h6>
								<input type="file" id="fileQ" name="fileQ" class="form-control-file">
							</div>
							<div class="form-group col-md-9">
								<h6>답변 이메일 주소</h6>
								<input type="email" class="form-control bg-light border-secondary" id="qEmail" name="qEmail" placeholder="Enter email address">
							</div>
						</div>
						<div class="col-md-12 d-flex justify-content-center mt-4">
							<!-- primary or warning 정해야함 -->
							<!-- 또한 각 페이지 색깔 일치 시켜야함 -->
							<input type="submit" id="submit-Q" class="btn theme_btn button_hover" value="Submit">
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!--================ body Area  =================-->

	<!--================Contact Success and Error message Area =================-->
	<div id="success" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<h2>Thank you !</h2>
					<p>Your answer is successfully sent</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Modals error -->

	<div id="error" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<h2>Sorry !</h2>
					<p>Something went wrong</p>
				</div>
			</div>
		</div>
	</div>
	<!--================End Contact Success and Error message Area =================-->
	
	<!-- question -->
	<script src="resources/js/question.js"></script>
	
	<!-- chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	
</body>
</html>