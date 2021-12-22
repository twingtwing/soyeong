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
					<li class="breadcrumb-item"><a href="home.do">Main</a></li>
					<li class="breadcrumb-item"><a
						href="adminNoticeList.do">Notice Management</a></li>
						<li class="breadcrumb-item"><a
						href="javascript:void(0)">Notice Update</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->
		<div class="container-fluid">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h3 class="card-title text-warning ml-1">Notice Update</h3>
						<input type="text" id="btitle" name="btitle"
							class="form-control input-default my-3" value="${notice.btitle }">
						<input class="form-control input-default my-3" type="text" name="id" value="${notice.id}" readonly="readonly">
						<textarea class="form-control h-150px" rows="6" id="bcontent"
							name="bcontent">${notice.bcontent }</textarea>
						<div class="row justify-content-end">
							<input type="button" id="bSubmit" class="btn btn-rounded btn-outline-dark mb-1 m-3" value="완료">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	$('#bcontent').val($('#bcontent').val().replace(/<br>/gi,'\n'));
	
	/* ajax를 사용한 수정처리 */
	$('#bSubmit').on('click',function(){
		console.log('hi');
		var data = {
			btitle : $('#btitle').val(),
			bcontent : $('#bcontent').val().replace(/(?:\r\n|\r|\n)/g, '<br>'),
			bno :"${notice.bno }"
		};
	
		$.ajax({
			url:'adminNoticeUpdateForm.do',
			data: data,
			dataType: 'text',
			method: 'POST',
			success : function(data){
				console.log(data);
				if(data.trim() === 'Y'){
					alert("글수정이 완료되었습니다.");
					location.href="adminNoticeRead.do?bno="+"${notice.bno }";
				}else if(data.trim() === 'F'){
					alert("글수정 중 에러가 발생하였습니다.");
				}
			},
			error : function(data){
				console.log(data);
			}
		})
	});
	</script>
</body>
</html>