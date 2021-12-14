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
	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain.html">Main</a></li>
					<li class="breadcrumb-item"><a href="adminCS.html">Customer
							Service</a></li>
					<li class="breadcrumb-item active">Customer Voice</li>
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
							<!--  처리상태,이메일,말머리 추가 -->
								<div class="media">
									<div class="media-body mt-3">
										<h5 class="m-b-3">${voice.qTitle }</h5>
										<p class="m-b-2">${voice.name }</p>
									</div>
								</div>
								<hr>
								<div class="mt-4 mb-4">
									<p>${voice.qAnswer }</p>
								</div>
								<hr>
								<div class="mt-4">
									<c:if test="${not empty voice.qFile}">
										<h6 class="p-t-15">
											<i class="fa fa-download mb-2"></i> Attachment
										</h6>
									</c:if>
								</div>
								<div class="mt-4">
									<!-- 처리상태 변경 -->
									 <a type="button" href="#" class="btn mb-1 btn-rounded btn-outline-dark">상태수정</a>
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