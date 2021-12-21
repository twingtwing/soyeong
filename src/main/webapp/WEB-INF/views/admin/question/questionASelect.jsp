<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contentBox {
	height : 40vh;
}
</style>
</head>
<body>

	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
					<li class="breadcrumb-item active"><a href="questionAList.do">Q &amp; A</a></li>
					<li class="breadcrumb-item active">Q n A Detail page</li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="read-content">
								<div class="media">
									<div class="media-body d-flex justify-content-between mt-3">
										<div>
											<h5 class="m-b-3"><strong>질문</strong></h5>
											<h5 class="m-b-3 text-warning">${QnA.fTitle }</h5>
										</div>
										<div class="d-flex align-items-end">
											<h6 class="text-muted">${QnA.fCategory }</h6>
										</div>
									</div>
								</div>
								<hr>
								<div class="contentBox mt-5">
									<h5 class="mb-3"><strong>답변</strong></h5>
									<h5 class="text-muted">${QnA.fAnswer }</h5>
								</div>
								<div class="row d-flex justify-content-end mt-5 mr-2">
									<a type="button" href="qeustionAUpdate.do?fNo=${QnA.fNo }"
										class="btn btn-rounded btn-outline-dark">수정</a> <a
										type="button" href="qeustionADelete.do?fNo=${QnA.fNo }"
										class="btn btn-rounded btn-outline-dark ml-3">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>

</body>
</html>