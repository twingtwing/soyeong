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
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
                    <li class="breadcrumb-item active"><a href="questionVList.do">The Sound of Customers</a></li>
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
										<h5 class="m-b-3 font-weight-bold">${voice.qTitle }</h5>
										<div class="d-flex justify-content-between mt-3">
                                            <p class="mb-0">${voice.name }</p>
                                            <c:if test="${voice.qProcess eq 'N'}">
                                        		<a href="#" id="processChange" class="text-muted">처리 상태 변경</a>
                                            </c:if>
                                            <c:if test="${voice.qProcess eq 'Y'}">
                                        		<p class="mb-0">처리 완료</p>
                                            </c:if>
                                        </div>
									</div>
								</div>
								<hr>
								<div class="mt-4 mb-4 pt-3 pb-2">
									<h5 class="text-primary mb-3 font-weight-bold">${voice.qCategory }</h5>
									<p>${voice.qAnswer }</p>
									<h5 class="m-b-5 p-t-15">${voice.qEmail }</h5>
								</div>
								<hr>
								<div class="row mt-4 pt-1 ml-1">
									<c:if test="${not empty voice.qFile}">
										<h6 class="mr-3 p-t-5"><i class="fa fa-download"></i>&nbsp;&nbsp; Attachments </h6>
										<!-- 파일 다운로드 -->
                                        <h6 class="mr-3 p-t-5">
                                        	<a href="questionDownload.do?qPFile=${voice.qPFile }" id="download-SC" class="text-muted">${voice.qFile}</a>
                                        </h6>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
		<script type="text/javascript">
			document.getElementById('processChange').addEventListener('click',function(){
				let a = event.target
				let div = event.target.closest('div');
				let p = document.createElement('p');
				p.classList.add('mb-0');
				p.innerHTML = '처리 완료';
				fetch('questionChangeProcess.do',{
					method : 'post',
					headers :{"Content-type":"application/x-www-form-urlencoded"},
					body : "qNo="+'${voice.qNo }'
				})
				.then(
					response => response.text()	
				)
				.then(data =>{
					if(data.trim() === 'Y'){
						alert('성공')
						div.appendChild(p);
						a.remove();
					}else if(data.trim() === 'F'){
						alert('변경 실패하였습니다.')
					}
				})
			});
			
			/* document.getElementById('download-SC').addEventListener('click',function(){
				let path = 'questionDownload.do?qPFile='+'${voice.qPFile }'
				fetch(path);
			}) */
		</script>
	</div>
</body>
</html>