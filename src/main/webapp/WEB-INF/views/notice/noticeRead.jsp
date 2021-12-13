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

<!--================Banner Area =================-->

    <!-- 시작 -->
    <div class="whole-wrap">
        <div class="section_gap">
            <div class="container" style="width: 70%;">
                <div class="section-top-border">
	                <form id="noticeReadForm" name="noticeReadForm" method="post">
	                    <h3 class="mb-30 title_color"><c:out value="${notice.title}"/></h3>
	                
	                    <div class="col-lg-12">
	                        <h6 class="typo-list row m-2 d-flex justify-content-end">"작성자 : "<c:out value="${notice.id}"/></h6>
	                        <blockquote class="generic-blockquote">
	                            <c:out value="${notice.bcontent}"/>
	                        </blockquote>
	                    </div>
	                    <div class="row m-2 d-flex justify-content-end">
	                        <button class="genric-btn primary small font-weight-bold m-2" onclick="fn_update()">수정</button>
	                        <button class="genric-btn primary small font-weight-bold m-2" onclick="fn_delete()">삭제</button>
	                    </div>
	                </form>
                </div>    
            </div>
        </div>    
    </div>
    
    <script>
	  //수정
	    function fn_update(){
	        
	        var form = document.getElementById("noticeReadForm");
	        
	        form.action = "<c:url value='/notice/noticeUpdate.do'/>";
	        form.submit();
	    }
	  
	  //삭제
	  function fn_delete(){
		  
		  var form = document.getElementById("noticeReadForm");
		  
		  form.action = "<c:url value='/notice/noticeDelete.do'/>";
		  form.submit();
	  }
    </script>

</body>
</html>