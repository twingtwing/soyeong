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
					<li class="breadcrumb-item"><a href="adminNoticeList.do">Notice
							Management</a></li>
					<li class="breadcrumb-item active">Notice Form</li>
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
									<h3 class="text-warning">NOTICE INSERT</h3>
								</div>
							</div>
							<div class="basic-form">
								<form id="noticeForm" name="noticeForm">
									<div class="form-group row mb-0">
                                        <label class="col-lg-4 col-form-label" for="btitle">제목 <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-12">
											<input type="text" id="btitle" name="btitle"  class="form-control input-default my-3" placeholder="제목을 입력하세요"> 
                                    	</div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="bcontent">내용 <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-12">
											<textarea id="bcontent" name="bcontent" class="form-control h-150px" rows="6" placeholder="내용을 입력해주세요"></textarea>
                                    	</div>
                                    </div>
									<div class="row justify-content-end mr-1 mt-4">
										<input type="submit" id="nsubmit" class="btn btn-rounded btn-outline-dark" value="완료">
									</div>
									<div>
										<input class="form-control input-default my-3" type="hidden" name="id" value="${id}" readonly="readonly"> 
										<input class="form-control input-default my-3" type="hidden" name="name" value="${name}">
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

	<script>
	
	
	$('#nsubmit').on('click',function(){
		event.stopPropagation();
        event.preventDefault();
		$('#bcontent').val($('#bcontent').val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
		$.ajax({
			url:'adminNoticeFormInsert.do',
			data: $('#noticeForm').serialize(),
			type : 'post',
			success : function(data){
				alert("글 등록이 완료되었습니다.");
				location.href = 'adminNoticeList.do';
			},
			error : function(data){
				console.log(data);
			}
		})
	});
	</script>

</body>
</html>