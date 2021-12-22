<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contentsBox{
	height : 50vh;
}
</style>
</head>
<body>

	<!--================ start Banner Area =================-->
	<section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">공지사항</h2>
                </div>
            </div>
        </section>
	<!--================ Banner Area =================-->

<!--================Banner Area =================-->

    <!-- 시작 -->
    <div class="">
        <div class="section_gap">
            <div class="container" style="width: 70%;">
	            <h3 class="ml-5"><strong class="text-warning">제목  </strong> &nbsp;&nbsp; ${notice.btitle }</h3>
	           	<hr>
	        	<h6 class="typo-list mr-2 row d-flex justify-content-end">작성자 : ${notice.id }&nbsp; &nbsp; &nbsp; 작성일 : ${notice.bdate }</h6>
	            <div class="m-4 mt-5">
	                <blockquote class="generic-blockquote contentsBox" style="background-color: #f9f9ff;">${notice.bcontent }</blockquote>
	            </div>   
            </div>
        </div>    
    </div>

</body>
</html>