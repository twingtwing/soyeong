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

<div class="section_gap">
        <div class="container">
            <div class="col-lg-12 col-md-12 m-3">
                <h3 class="mb-30 title_color">공지사항</h3>
                <form id="noticeForm" name="noticeForm" action="post">
                    <input type="text" style="background-color: #f9f9ff;" name="title" placeholder="제목을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력해주세요'" required="required" class="single-input m-3">
                    <textarea class="single-textarea h-25 m-3" style="background-color: #f9f9ff;" rows="7" placeholder="내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요'" required="required"></textarea>
                    <input type="file" class="single-input">
                    <div class="col text-center">
                        <button type="submit" class="genric-btn primary radius m-5" onclick="fn_addtoNotice()">등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script>
	//글쓰기
	function fn_addtoNotice(){
	    
	    var form = document.getElementById("noticeForm");
	    
	    form.action = "<c:url value='/notice/noticeList.do'/>";
	    form.submit();
	    
	}
	
</script>

</body>
</html>