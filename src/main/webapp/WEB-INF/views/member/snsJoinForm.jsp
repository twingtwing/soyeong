<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#joinId,
		.password,
		#tel,
		#name {
			width: 20rem;
			padding: 0.3rem;
			border: 1px solid #DBDBDB;
			border-radius: 5px;
		}

		#joinBox {
			padding: 3rem;
			margin: 3rem;
			width: 50rem;
		}

		#name {
			width: 12rem;
		}

		form {
			display: flex;
			align-items: center;
			flex-direction: column;
			justify-content: space-evenly;
			padding-top: 3rem;
		}

		.ng {
			display: flex;
			justify-content: center;
			align-items: center;
			justify-content: space-between;
			width: 20rem;
		}

		button {
			background-color: #f3c300;
			color: black;
			border: #f3c300 1px solid;
			border-radius: 5px;
			font-size: 0.7rem;
			font-weight: bolder;
			padding: 5px 0.5rem;
		}

		div>label, #btn,#idChk{
			cursor: pointer;
		}
		#btn{
			padding: 5px 1.5rem;
			font-weight: bold;
		}
		#btn:hover{
			background-color: #0069D9;
			color: white;
			border: 1px solid #0069D9;
			transition : all 0.3s;
		}
</style>
</head>

<body>
	<section class="breadcrumb_area">

		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""
			style="transform: translateY(0px);">
			<img src="resources/img/banner_bg.jpg">
		</div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">회원가입</h2>
			</div>
		</div>
	</section>
	<div align="center">
		<div id="joinBox">
			<form action="join.do" method="post" id="frm">
				<div style="display: flex; align-items: center; width: 20rem; justify-content: space-between;">
					<input type="text" placeholder="ID" name="id" id="joinId" style="width: 15rem;" value="${member.id }" readonly="readonly">
					<button type="button" style="position: relative; right:0px;" id="idChk">중복확인</button>
				</div>
				<br>
				<input type="password" placeholder="Password" name="password" class="password"><br>
				<input type="password" placeholder="Password 확인" name="password2" class="password"><br>
				<div class="ng">
					<input type="text" placeholder="이름" id="name" value="${member.name }" name="name" readonly="readonly">
					<input type="text" style="width: 4rem;border: 1px solid white;"value="${member.gender }" name="gender" readonly="readonly">					
				</div><br>
				<input type="text" name="tel" id="tel" placeholder="tel" <c:if test="${ not empty member.tel }">value="${member.tel }" readonly="readonly"</c:if>><br>
				<div style="display: flex; align-items: center;">
					<label><input type="checkbox" class="law">&nbsp;
						이용약관 확인</label>
				</div>
				<c:if test="${not empty member.naver }">
					<input type="hidden" value="Y" name="naver">
				</c:if>
				<c:if test="${not empty member.kakao }">
					<input type="hidden" value="Y" name="kakao">
				</c:if>
				<button type="button" id="btn" style="margin-top:3rem;">회원가입</button>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function join(){
			let pw = document.getElementsByClassName('password');
			if(pw[0].value != pw[1].value){
				window.alert('비밀번호 확인이 틀렸습니다.');
				return;
			}
			
			if(document.getElementsByClassName('password')[0].value==''){
				window.alert('비밀번호은 필수 입력 값입니다.');
				return;
			}
			
			if(document.getElementsByClassName('tel').value==''){
				window.alert('전화번호는 필수 입력 값입니다.');
				return;
			}
			
			if(document.getElementsByClassName('law')[0].checked){
				window.alert('환영합니다!');
				document.getElementById('frm').submit();
			} else{
				window.alert('이용약관에 동의해주세요.');
			}
		}
		
		$('#btn').click(()=>join());
		</script>
</body>

</html>