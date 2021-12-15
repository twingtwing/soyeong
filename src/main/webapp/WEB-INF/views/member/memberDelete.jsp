<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#pwShow-D {
		display: inline-block;
		position: absolute;
		margin-left: 245px;
		margin-top: -43px;
		cursor: pointer;
	}
</style>
</head>
<body>

	<!--================Banner Area =================-->
	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h2>Relax Your Mind</h2>
				</div>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->

	<!--================ start body Area =================-->
        <section class="section_gap">
            <div class="container" style="min-width: 1000;">
                <div class="row ml-3">
                    <h3 class="title_color text-muted">
                        <i class="fas fa-unlock-alt mr-3 text-danger"></i>비밀번호 확인
                    </h3>
                </div>
                <hr class="my-1">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-auto d-flex align-items-center" style="height: 65vh; width: 400px;">
                        <div id="pwBox" class="w-100">
                            <div class="row d-flex justify-content-center w-100">
                                <p class="text-center h6">
                                    회원님의 개인정보를 안전하게 보호하기 위해 <br> <strong
                                        class="text-danger font-weight-bold">인증 후 변경이 가능</strong>합니다.
                                </p>
                            </div>
                            <div class="row w-100 mt-3">
                                <div class="card w-100">
                                    <div class="card-body pl-5 pr-5 mt-4 mb-4">
                                        <h5 class="card-title mb-3">${name}님의 아이디 ${id}</h5>
                                        <!-- 중복 id걸려서 값을 제대로 안가져옴 그래서 일부러 id값을 passwrod를 안함 -->
                                        <input class="w-100 mb-3" type="password" name="pwInput" id="pwInput" required="required" placeholder="Enter password..">
                                        <div id="pwShow-D">
                                            <i class="far fa-eye-slash"></i>
                                        </div>
                                        <a href="#" id="pwCheck" class="button_hover theme_btn_two w-100">확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="deleteBox" class="w-100 d-none">
                            <div class="row w-100 mt-3">
                                <div class="card w-100">
                                    <div class="card-body text-center pl-5 pr-5 mt-4 mb-4">
                                        <h5 class="card-title mb-3">탈퇴하시겠습니까?</h5>
                                        <div class="row d-flex justify-content-between pt-3">
                                            <a href="#" id="mDelete" class="col-5 button_hover theme_btn_two w-100">탈퇴</a>
                                            <a href="home.do" class="col-5 button_hover theme_btn_two w-100">취소</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	<!--================ body Area  =================-->

	<script type="text/javascript">
	    document.getElementById('pwShow-D').addEventListener('click',function(){
    	    let pw = document.getElementById('pwInput');
        	if(pw.getAttribute('type')=="password"){
            	pw.setAttribute('type','text');
	            this.innerHTML = '<i class="far fa-eye"></i>';
    	    }else {
        	    pw.setAttribute('type','password');
            	this.innerHTML = '<i class="far fa-eye-slash"></i>';
        	}
    	});
    	
    	document.getElementById('pwCheck').addEventListener('click',function(){
    		let pwVal = document.getElementById('pwInput').value;
    	   	fetch("pwCheck.do",{
    	    	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "password="+pwVal
    	    })
    	    .then(response => response.text())
    	    .then(data => {
    	    	if(data.trim() === 'Y'){
    	    		document.getElementById('pwBox').classList.add('d-none');
    	    		document.getElementById('deleteBox').classList.remove('d-none');
    	    	}
    	    });
    	});
    	
    	document.getElementById('pwInput').addEventListener('keypress',function(event){
    		if(event.keyCode === 13){
    			document.getElementById('pwCheck').click();
    		}
    	});
    	
    	document.getElementById('mDelete').addEventListener('click',function(){
    		let pwVal = document.getElementById('pwInput').value;
    		fetch("memberWithdraw.do",{
    	    	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "password="+pwVal
    	    })
    	    .then(response => response.text())
    	    .then(data => {
    	    	if(data.trim() === 'Y'){
    	    		alert("성공적으로 탈퇴되었습니다.\n다음에 다시 만나기를 기원합니다.")
    	    		location.href="home.do";
    	    	}else if(data.trim() === 'N'){
    	    		alert("탈퇴과정 중에 오류가 발생하였습니다.")
    	    		location.href="home.do";
    	    	}
    	    });
    	});
	</script>

</body>
</html>