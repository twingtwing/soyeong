<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

        <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""
            style="transform: translateY(0px);"><img src="resources/img/banner_bg.jpg"></div>
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
					<input type="text" placeholder="ID" name="id" id="joinId" style="width: 15rem;">
					<button type="button" style="position: relative; right:0px;" id="idChk">중복확인</button>
				</div>
				<br>
				<input type="password" placeholder="Password" name="password" class="password"><br>
				<input type="password" placeholder="Password 확인" name="password2" class="password"><br>
				<div class="ng">
					<input type="text" placeholder="이름" id="name" name="name">
					<input type="radio" value="M" name="gender" checked="checked">남성
					<input type="radio" value="F" name="gender">여성
				</div><br>
				<input type="text" name="tel" placeholder="전화번호" id="tel"><br>
				<div style="display: flex; align-items: center;">
					<label><input type="checkbox" class="law">&nbsp; 이용약관 확인</label>
				</div>
				<button type="button" id="btn" style="margin-top:3rem;">회원가입</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function idCheck(){
			let id = $('#joinId').val();
			let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!regExp.test(id)){
				window.alert('이메일 형식으로 작성해주세요.');
				return;
			}
			
			let data = {'id':id};
			$.ajax({
				url: "idChk.do",
				data : data,
				dataType : 'text',
				success : (result)=>{
					if(result=='ok'){
						window.alert('사용할 수 있는 아이디 입니다.');
						let checkBtn = document.getElementById('idChk')
						checkBtn.innerHTML='✔체크 완료';
						checkBtn.disabled=true;
						checkBtn.style.backgroundColor='#f3c300';
						checkBtn.style.color='green';
						checkBtn.style.border='1px solid green';
						checkBtn.className = 'ok';
						
					} else{
						window.alert('이미 사용중인 아이디 입니다.');
					}
				},
				error : (error)=>{
					window.alert('에러가 발생했습니다. 관리자에게 문의하세요.');
					console.log(error);
				}
			})
		}
		
		function join(){
			let pw = document.getElementsByClassName('password');
			if(pw[0].value != pw[1].value){
				window.alert('비밀번호 확인이 틀렸습니다.');
				return;
			}
			
			if($('#name').val()==''||document.getElementsByClassName('password')[0].value==''||$('#joinId').val()==''){
				window.alert('아이디, 비밀번호, 이름은 필수 입력 값입니다.');
				return;
			}
			
			if(document.getElementById('idChk').className !='ok'){
				window.alert('아이디 중복체크를 진행해주세요.');
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
		$('#idChk').click(()=>idCheck());
		</script>
</body>

</html>