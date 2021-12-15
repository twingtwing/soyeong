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
					<li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Home</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->
		<div class="container-fluid">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">공지사항</h4>
						<form action="adminNoticeUpdateForm.do" id="noticeForm" name="noticeForm" method="post">
							<input type="text" id="btitle" name="btitle" class="form-control input-default my-3"
								placeholder="제목을 입력하세요">
							<textarea id="bcontent" name="bcontent" class="form-control h-150px" rows="6"></textarea>
							<div class="row justify-content-end">
								<input type="submit" class="btn mb-1 btn-primary m-2" value="완료">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>



		<!-- #/ container -->
	</div>

	<script>
		
	</script>

</body>
</html>