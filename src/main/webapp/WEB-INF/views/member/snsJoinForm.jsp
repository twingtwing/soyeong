<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#id, .password, #tel, #name {
	width: 20rem;
	padding: 0.3rem;
	border: 1px solid #04091e;
	border-radius: 5px;
}

#joinBox {
	padding: 3rem;
	margin: 3rem;
	width: 50rem;
	background-color: #ededed;
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

button {
	background-color: #04091e;
	color: lightgray;
	border: #04091e 1px solid;
	border-radius: 5px;
	font-size: 0.7rem;
	font-weight: bolder;
	padding: 5px;
}

div>label, #btn {
	cursor: pointer;
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
				<div
					style="display: flex; align-items: center; width: 20rem; justify-content: space-between;">
					<input type="text" name="id" id="joinId" style="width: 20rem;"
						value="${member.id }" readonly="readonly">
				</div>
				<br> <input type="password" placeholder="Password"
					name="password" class="password"><br> <input
					type="password" placeholder="Password 확인" name="password2"
					class="password"><br>
				<div
					style="display: flex; align-items: center; width: 20rem; justify-content: space-between;">
					<input type="text" style="width: 15rem;" id="name"
						value="${member.name }" name="name" readonly="readonly"> <input
						type="text" style="width: 4rem;" value="${member.gender }"
						name="gender" readonly="readonly">
				</div>
				<br> <input type="text" name="tel" value="${member.tel }"
					id="tel"><br>
				<div style="display: flex; align-items: center;">
					<label><input type="checkbox" class="law">&nbsp;
						이용약관 확인</label>
				</div>
				<c:if test="${not empty member.naver }">
					<input type="hidden" value="Y" name="naver">
				</c:if>
				<button type="button" id="btn" style="margin-top: 3rem;">회원가입</button>
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