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
					<i class="fas fa-crown text-warning"></i>
					관리자님, 환영합니다!<br>(${id})
				</li>
			
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="icon-grid menu-icon"></i><span
						class="nav-text">Dashboard</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="admin.do">MAIN PAGE</a></li>
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
				<li><a href="reportPage.do"> 
				<i class="icon-dislike menu-icon"></i><span
						class="nav-text">신고 내역</span>
				</a></li>
				
			</ul>
		</div>
	</div>
</body>
</html>