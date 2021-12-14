<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#loginModal {
	display: none;
	position: fixed; /* Stay in place */
	z-index: 3; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

#box {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 2px solid black;
	padding: 1.5rem;
	flex-direction: column;
	margin: 5rem;
	width: 35rem;
	height: 45rem;
	justify-content: space-evenly;
	background-color: white;
	transition: all 1s;
}

#box input, #box button {
	width: 25rem;
	border: solid #04091e 1px;
	border-radius: 5px;
	padding: 10px;
}

#box button {
	background-color: #04091e;
	color: lightgrey;
	font-weight: bold;
	cursor: pointer;
}

.findPw {
	border-bottom: darkslategrey 1px solid;
	width: 15rem;
	font-weight: bold;
	margin: 15px 0px;
	cursor: pointer;
}

.close {
	margin-left: 25rem;
	font-size: 1.5rem;
	cursor: pointer;
}

#login {
	cursor: pointer;
}
</style>
</head>
<body>
	<!--================Header Area =================-->
	<header class="header_area">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="home.do"><img
					src="resources/img/Logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="home.do">메인화면</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
						<li class="nav-item"><a class="nav-link"
							href="question.do">고객센터</a></li>
						<!-- 로그인 되어 있을시 -->
						<c:if test="${not empty id}">
							<li class="nav-item"><a class="nav-link" href="#">호스트
									모드</a></li>
						</c:if>
							<li class="nav-item"><a class="nav-link" href="admin.do">관리자
									모드</a></li>
						<c:if test="${author eq 'ADMIN'}">
						</c:if>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
								<c:if test="${empty id}">
									로그인
								</c:if> 
								<c:if test="${not empty id}">
									마이페이지
								</c:if>
							</a>
							<ul class="dropdown-menu">
								<!-- 권한에 따라 보여지는게 다름 -->
								<c:if test="${empty id}">
									<li class="nav-item" id="loginBtn"><a class="nav-link"
										href="#">로그인</a></li>
									<li class="nav-item"><a class="nav-link"
										href="joinForm.do">회원가입</a></li>
								</c:if>
								<c:if test="${not empty id}">
									<li class="nav-item"><a class="nav-link"
										href="memberProfile.do">상세 정보</a></li>
									<li class="nav-item"><a class="nav-link"
										href="detailVisit.do">나의 예약 정보</a></li>
									<li class="nav-item"><a class="nav-link" href="logout.do"
										onclick="kakaoLogout();">로그아웃</a></li>
								</c:if>
							</ul></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	<!--================Header Area =================-->

	<!-- login modal -->
	<div align="center" id="loginModal">

		<div id="box">
			<span class="close">&times;</span> <span>소영과 아이들에 오신 것을 환영합니다.</span>
			<input type="text" placeholder="ID" id="id" name="id"> <input
				type="password" placeholder="Password" id="password" name="password">
			<button type="button" id="login">로그인</button>
			<div align="center" class="findPw">비밀번호 찾기</div>
			<button type="button">페이스북으로 로그인하기~여기부터는 api찾기</button>
      <button type="button">페이스북으로 로그인하기~여기부터는 api찾기</button>
			<button type="button">페이스북으로 로그인하기~여기부터는 api찾기</button>
		</div>
	</div>
	
	<script type="text/javascript">

	// login
	document.getElementById('login').addEventListener('click',()=>{
		if(document.getElementById('id').value==''||document.getElementById('password').value==''){
			window.alert('아이디 또는 비밀번호를 입력해주세요.');
			return;
		}		
		let id = $('#id').val()
		let password = $('#password').val()
		loginSelect(id,password);	
	})
	
	// login ajax
	function loginSelect(id,password){
		$.ajax({
			method:'post',
			url: 'login.do',
			data : {'id':id,'password':password},
			dataType : 'text'
		})
		.done((response)=>{
			if(response=='ng'){
				window.alert('아이디 또는 비밀번호가 틀렸습니다.');
			}else{
				window.alert('환영합니다!');
				$('.close').click();
				location.href='home.do';
			}
		})
	}
	

	// 비밀번호 찾기 클릭시
	$('.findPw').click(()=>pwForm())
	
	function pwForm(){
		// 근데 여기서하는것보다 아싸리 새 창을 띄우는게 좋을것같기도해요....너무 한데 때려박는거같아서
		$('#box').children().not('.close').css('display','none');
		$('#box').css('justify-content','left');
		$('#box').append($('<h4>').text('비밀번호 찾기'));
		$('#box').append($('<input>').attr('placeholder','이메일 주소 입력'),
				$('<button>').html('인증번호 받기'),
				$('<input>').attr('placeholder','인증번호'),$('<button>').html('확인'));
		$('#box').children().not('.close').css('margin','1rem');
	}

	$('#loginBtn').on('click',()=>{
		$('#loginModal').css('display','block');
	})
	
	$('.close').on('click',()=>{
		$('#loginModal').css('display','none');
	})

	$('#password').keypress((event)=>{
		if(event.keyCode==13){
			$('#login').click();
		}
	})
</script>
</body>
</html>