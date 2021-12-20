<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--**********************************
            Sidebar start
        ***********************************-->
	<div class="nk-sidebar">
		<div class="nk-nav-scroll">
			<ul class="metismenu" id="menu">
				<li class="nav-label">
				<span style="text-align: center; margin:2rem;">관리자님(${id}),<br>환영합니다!</span>
				</li>
			
				<li class="nav-label">Dashboard</li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="icon-speedometer menu-icon"></i><span
						class="nav-text">대시보드</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="home.do">홈페이지로</a></li>
						<li><a href="reportPage.do">신고 내역</a></li>
					</ul>
				</li>
				<li class="nav-label">Management</li>
				<li><a href="adminMemberList.do"> 
				<i class="icon-user menu-icon"></i><span
						class="nav-text">회원 관리</span>
				</a></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="icon-envelope menu-icon"></i>
						<span class="nav-text">문의 / 질문</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="questionAList.do">Q &amp; A</a></li>
						<li><a href="questionVList.do">고객의 소리</a></li>
					</ul></li>
				<li><a href="adminNoticeList.do"> 
				<i class="icon-note menu-icon"></i><span
						class="nav-text">공지사항 관리</span>
				</a></li>

				
			</ul>
		</div>
	</div>
</body>
</html>