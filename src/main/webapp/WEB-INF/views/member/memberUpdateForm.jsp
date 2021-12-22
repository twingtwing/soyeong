<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		#joinId,
		.password,
		#tel,
		#name {
			width: 20rem;
			padding: 0.3rem;
			border: 1px solid #DBDBDB;
			border-radius: 5px;
		}

		#infoBox {
			padding: 3rem;
			margin: 3rem;
			width: 50rem;
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

        <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""
            style="transform: translateY(0px);"><img src="resources/img/banner_bg.jpg"></div>
        <div class="container">
            <div class="page-cover text-center">
                <h2 class="page-cover-tittle">회원정보 수정</h2>
            </div>
        </div>
    </section>
	<div align="center">
		<div id="infoBox">
		<span style="font-size: 1.1rem;">${name}님 (${id})</span><br>
			<form action="memberUpdate.do" method="post" id="frm">
				<input type="password" placeholder="Password" name="password" class="password"><br>
				<input type="password" placeholder="Password 확인" name="password2" class="password"><br>
				<input type="text" name="name" placeholder="이름" value="${name}" id="name"><br>
				<input type="text" name="tel" placeholder="전화번호" id="tel"><br>
				<button type="button" id="btn" style="margin-top:3rem;" onclick="memberUpdate()">수정</button>
				<input type="hidden" name="id" value="${id}">
			</form>
		</div>
	</div>
	<script type="text/javascript">
	function memberUpdate(){
		let pw = document.getElementsByClassName('password');
		if(pw[0].value != pw[1].value){
			window.alert('비밀번호 확인이 틀렸습니다.');
			return;
		}
		
		if(document.getElementsByName('name')[0].value==''||document.getElementsByClassName('password')[0].value==''){
			window.alert('비밀번호와 이름은 필수 입력 값입니다.');
			return;
		}
		window.alert('수정이 완료되었습니다.')
		frm.submit();
	}
	</script>
</body>
</html>