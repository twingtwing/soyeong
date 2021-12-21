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
                        <li class="breadcrumb-item"><a href="home.do">Main</a></li>
					<li class="breadcrumb-item"><a
						href="adminNoticeList.do">Notice Management</a></li>
						<li class="breadcrumb-item"><a
						href="javascript:void(0)">Notice Detail</a></li>
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
                                    <form id="notice
                                    ''''..ReadForm" name="noticeReadForm" method="post">
                                       <div class="media mb-4 mt-3 ml-1">
                                           <div class="media-body">
                                                <span class="float-right">작성자 : ${notice.id }&nbsp;&nbsp;&nbsp;작성일 : ${notice.bdate }</span>
                                                <h4 class="m-0 text-warning">${notice.btitle }</h4>
                                           </div>
                                        </div>
                                         <hr>
										<div class="contentBox mt-5 ml-1">
											<h5 class="text-muted">${notice.bcontent  }</h5>
										</div>
                                           <div class="row justify-content-end mt-5 mr-2">
                                           		<input type="button" class="btn btn-rounded btn-outline-dark" onclick="location.href='adminNoticeUpdate.do?bno=${notice.bno}'" value="수정">
                                                <input type="button" class="btn btn-rounded btn-outline-dark ml-3" onclick="location.href='adminNoticeDelete.do?bno=${notice.bno}'" value="삭제">
                                                <input type="button" class="btn btn-rounded btn-outline-dark ml-3" onclick="location.href='adminNoticeList.do'" value="목록보기">
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
     
		
	</script>

</body>
</html>