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
					<li class="breadcrumb-item"><a href="adminQuestion.do">Customer
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
									<h3 class="gradient-3-text">Q & A Update</h3>
								</div>
							</div>
							<div class="basic-form">
								<!-- insert 혹은 update에 따라 id값이 다르게 해야함 -->
								<form id="CS-frm-update" action="#" method="post" class="CS-valide">
									<!-- 말머리,제목,내용 -->
									<div class="row">
										<div class="form-group col-md-3 pl-0">
											<label class="col-lg-4 col-form-label">말머리</label>
											<div class="col-lg-12">
												<select id="??" class="form-control">
													<option selected="selected">말머리 1</option>
													<option>말머리 2</option>
													<option>말머리 3</option>
													<option>말머리 4</option>
												</select>
											</div>
										</div>
										<div class="form-group col-9">
											<label class="col-lg-4 col-form-label" for="fTitle">title
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-12">
												<input type="text" class="form-control" id="fTitle"
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
												rows="10" placeholder="Enter Subject..." required="required"></textarea>
										</div>
									</div>
									<div class="row d-flex justify-content-end mr-1">
										<button type="submit" class="btn btn-rounded btn-outline-dark">글쓰기</button>
									</div>
								</form>
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