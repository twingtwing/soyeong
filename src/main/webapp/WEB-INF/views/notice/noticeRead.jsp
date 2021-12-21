<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--================ start Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>공지사항</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================ Banner Area =================-->

<!--================Banner Area =================-->

    <!-- 시작 -->
    <div class="whole-wrap">
        <div class="section_gap">
            <div class="container" style="width: 70%;">
                <div class="section-top-border">
	            	<h3 class="mb-30 title_color ml-3">${notice.btitle }</h3>
	                <div class="col-lg-12">
	                	<h6 class="typo-list row m-2 d-flex justify-content-end">작성자 : ${notice.id }&nbsp; &nbsp; &nbsp; 작성일 : ${notice.bdate }</h6>
	                    <blockquote class="generic-blockquote">${notice.bcontent }</blockquote>
	               </div>
                </div>    
            </div>
        </div>    
    </div>

</body>
</html>