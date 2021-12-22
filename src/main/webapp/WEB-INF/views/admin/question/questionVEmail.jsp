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
					<li class="breadcrumb-item"><a href="admin.do">홈</a></li>
                    <li class="breadcrumb-item"><a href="questionVList.do">고객의 소리</a></li>
					<li class="breadcrumb-item"><a href="questionVSelect.do?qNo=${qNo }">고객의 소리 상세</a></li>
					<li class="breadcrumb-item active">고객의 소리 이메일</li>
				</ol>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title pb-2 pt-1">
							<h3 class="text-warning ml-2">EMAIL</h3>
						</div>
							<div class="compose-content mt-2">
								<form action="#">
									<div class="form-group">
										<input type="text" id="toEmail" class="form-control bg-transparent"
											placeholder=" To" value="TO. ${email }" readonly="readonly">
									</div>
									<div class="form-group">
										<input type="text" class="form-control bg-transparent"
											placeholder=" title ... " id="titleE" required="required">
									</div>
									<div class="form-group">
										<textarea class="textarea_editor form-control bg-light"
											rows="15" placeholder="Enter text ..." id="contentE" required="required"></textarea>
									</div>
									<input type="hidden" id="qNo" value="${qNo }">
								</form>
							</div>
							<div class="text-right m-t-15">
								<button
									class="btn btn-rounded btn-outline-dark mr-2"
									type="button" id="emailBtn">
									<i class="fa fa-paper-plane m-r-5"></i> Send
								</button>
								<a class="btn btn-rounded btn-outline-dark mr-2"
									href="javascript:history.go(-1)">
									<i class="ti-close m-r-5 f-s-12"></i> Discard
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 	$('contentE').on('keypress',function(){
	 		if(event.keyCode === 13){
	 			$('#emailBtn').click();
	 		}
	 	})
	
		$('#emailBtn').on('click',function(){
			let title = $('#titleE').val();
			let content =  $('#contentE').val();
			if(title === ''){
				alert('제목을 적어주세요')
				return;
			}else if(content ===''){
				alert('내용을 적어주세요')
				return;
			}
			$.ajax({
				url : "questionVSend.do",
				data : {
					email : '${email }',
					title : title,
					content : content
				},
				type : 'post'
			})
			.done((data)=>{
				if(data.trim() === "Y"){
					back();
				}
			}) 
		})
		
		function back(){
 		fetch('questionChangeProcess.do',{
				method : 'post',
				headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "qNo="+'${qNo }'
			})
			.then(
				response => response.text()	
			)
			.then(data =>{
				if(data.trim() === 'Y'){
					alert('성공')
					location.href="questionVSelect.do?qNo="+'${qNo }';
				}else if(data.trim() === 'F'){
					alert('변경 실패하였습니다.')
				}
			})
	 	}
	</script>
</body>
</html>