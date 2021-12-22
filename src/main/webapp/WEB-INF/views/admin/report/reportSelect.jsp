<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li class="breadcrumb-item"><a href="admin.do">홈</a></li>
					<li class="breadcrumb-item"><a href="reportPage.do">신고 관리</a></li>
					<li class="breadcrumb-item active">신고 상세</li>
				</ol>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="read-content">
								<div class="media ml-1">
									<div class="media-body d-flex justify-content-between mt-3">
										<div>
											<h3 class="m-b-3 text-warning">
												<strong>신고내역</strong>
											</h3>
											<h5 class="m-b-3 mt-3">${report.rptitle }</h5>
										</div>
										<div class="d-flex align-items-end">
											<h6 class="text-muted">작성자: ${report.reporter} &nbsp;&nbsp;&nbsp; 작성일:
												${report.rpdate }</h6>
										</div>
									</div>
								</div>
								<hr>
								<div class="contentBox mt-5 ml-1">
									<p>${report.rpcontent }</p>
									<h5 class="text-muted">신고 대상자 : ${report.blackuser }</h5>
								</div>
								<div class="row d-flex justify-content-end mt-5 mr-2">
								<c:if test="${report.author ne 'BAN'}">
								<div class="bootstrap-modal">
                                    <button type="button" class="btn btn-rounded btn-outline-dark" data-toggle="modal" data-target="#reportBan">BAN</button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="reportBan" style="display: none;" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header mt-2">
                                                	<div class="col-11 text-center pl-5">
                                                    <h5 class="modal-title font-weight-bold">블랙리스트 처리</h5>
                                                	</div>
                                                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <p>해당 유저는 미처리 신고 중 총 <strong id="reportCount" class="text-danger"></strong> 개의 신고를 당하였습니다.</p>
                                                    <p>블랙리스트 처리 하시겠습니까?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button id="blackChange" type="button" class="btn btn-rounded btn-outline-danger">YES</button>
                                                    <button type="button" class="btn btn-rounded btn-outline-dark" data-dismiss="modal">NO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								</c:if>
								<c:if test="${report.author eq 'BAN'}">
								<div class="d-flex align-items-center">
									<p class="mb-0">신고 대상자는 이미 <b class="text-danger">블랙리스트</b>입니다.</p>
								</div>
								</c:if>
									<button class="btn btn-rounded btn-outline-dark ml-2 clear">처리완료</button>
									<button class="btn btn-rounded btn-outline-dark hold ml-2" onclick="location.href='reportPage.do'">보류</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<script type="text/javascript">
	
	//몇번 했는지 조회 
	(function(){
		$.ajax({
			url : 'reportCount.do',
			data : {'blackuser': '${report.blackuser }'},
			method : 'get'
		})
		.done((response)=>{
			console.log(response)
			$('#reportCount').text(response);
		})
	})();
	
	$('.clear').click((event)=>{
		let rpno = '${report.rpno}';
		console.log(rpno)
		$.ajax({
			url : 'reportClear.do',
			data : {'rpno': rpno},
			method : 'post'
		})
		.done((response)=>{
			console.log(response)
			if(response=='ok'){
				window.alert('처리가 완료되었습니다.');
				location.href='reportPage.do';
			} else{
				window.alert('에러가 발생하였습니다.');
			}
		})
	})
	
	
	//처리
	$('#blackChange').on('click',function(){
		$.ajax({
			url : "memberAuthorUpdate.do",
			data : {
				id : '${report.blackuser }',
				author : 'BAN'
			},
			method : 'post'
		})
		.done(data => {
			console.log(data)
			if(data=='Y'){
				$('.clear').click();
			} else{
				window.alert('에러가 발생하였습니다.');
			}
		})
	})
	
	//권한 바꾸기
	
	$('.backDiv button').click(()=>{history.back();})
	
</script>
</body>
</html>