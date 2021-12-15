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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
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
                                       <div class="media mb-4 mt-1">
                                           <div class="media-body">
                                                <span class="float-right">작성자 : ${notice.id }&nbsp;&nbsp;&nbsp;작성일 : ${notice.bdate }</span>
                                                <h4 class="m-0 text-primary">${notice.btitle }</h4>
                                                <hr>
                                                <p class="my-3">내용</p>
                                                <div class="row justify-content-end">
                                                    <input type="button" class="btn mb-1 btn-primary m-1" onclick="location.href='adminNoticeUpdate.do?bno=${notice.bno}'" value="수정">
                                                    <input type="button" class="btn mb-1 btn-primary m-1" onclick="location.href='adminNoticeDelete.do?bno=${notice.bno}'" value="삭제">
                                                </div>
                                           </div>
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