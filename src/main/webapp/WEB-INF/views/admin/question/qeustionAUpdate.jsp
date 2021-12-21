<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
					<li class="breadcrumb-item"><a href="questionAList.do">Customer
							Service</a></li>
					<li class="breadcrumb-item active">Q n A</li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="card-title ml-3">
									<h3 class="text-warning">Q &amp; A UPDATE</h3>
								</div>
							</div>
							<div class="basic-form">
								<!-- insert 혹은 update에 따라 id값이 다르게 해야함 -->
								<form id="CS-frm-update" action="qeustionAUpdateForm.do" method="post" class="CS-valide">
									<!-- 말머리,제목,내용 -->
									<div class="row">
										<div class="form-group col-md-3 pl-0">
											<label class="col-lg-4 col-form-label">말머리</label>
											<div class="col-lg-12">
												<select id="fCategory" name="fCategory" class="form-control">
                                                        <option value="결제 및 환불">결제 및 환불</option>
                                                        <option value="계정">계정</option>
                                                        <option value="후기">후기</option>
                                                        <option value="숙소 및 호스팅">숙소 및 호스팅</option>
                                                        <option value="예약 및 여행">예약 및 여행</option>
                                                        <option value="코로나19">코로나19</option>
                                                </select>
											</div>
										</div>
										<div class="form-group col-9">
											<label class="col-lg-4 col-form-label" for="fTitle">title
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-12">
												<input type="text" value="${QnA.fTitle }" class="form-control" id="fTitle"
													name="fTitle" placeholder="Enter Title..."
													required="required">
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="fAnswer">Answer
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-12">
											<textarea class="form-control" id="fAnswer" name="fAnswer"
												rows="10" placeholder="Enter Subject..." required="required">${QnA.fAnswer }</textarea>
										</div>
									</div>
									<div class="row d-flex justify-content-end mr-1">
										<button type="submit" class="btn btn-rounded btn-outline-dark">UPDATE</button>
									</div>
									<div>
										<input type="hidden" id="fNo" name="fNo" value="${QnA.fNo }">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #/ container -->
	<script type="text/javascript">
		document.querySelector('#fCategory > option[value = "${QnA.fCategory }"]').setAttribute('selected','selected');
	</script>
</body>
</html>