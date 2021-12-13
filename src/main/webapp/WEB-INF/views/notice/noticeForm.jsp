<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="section_gap">
        <div class="container">
            <div class="col-lg-12 col-md-12 m-3">
                <h3 class="mb-30 title_color">공지사항</h3>
                <form id="noticeForm" name="noticeForm" action="post">
                    <input type="text" style="background-color: #f9f9ff;" name="title" placeholder="제목을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력해주세요'" required="" class="single-input m-3">
                    <textarea class="single-textarea h-25 m-3" style="background-color: #f9f9ff;" rows="7" placeholder="내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요'" required=""></textarea>
                    <input type="file" class="single-input">
                    <div class="col text-center">
                        <button type="submit" class="genric-btn primary radius m-5" onclick="fn_addtoNotice()">제출</button>
                        </div>
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