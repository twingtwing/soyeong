<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pwShow-U-1 {
	display: inline-block;
	position: absolute;
    margin-left: -25px;
    margin-top: 3px;
	cursor: pointer;
}
#pwShow-U-2 {
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
            <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0"
                data-background=""></div>
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
                    <i class="fas fa-key mr-3 text-danger"></i>New Password.
                </h3>
            </div>
            <hr class="my-1">
            <div class="row d-flex justify-content-center">
                <div class="col-md-auto d-flex align-items-center" style="height: 70vh; width: 400px;">
                    <div class="w-100">
                    	<div class="row d-flex justify-content-center w-100">
                            <p class="text-center h6">
                                인증이 완료되었습니다.<br>
                                <strong class="text-danger font-weight-bold">새로운 비밀번호</strong>를 입력해주세요.
                            </p>
                        </div>
                        <div class="row w-100 mt-3">
                            <div class="card border-danger w-100">
                                <div class="card-body pl-5 pr-5 mt-4 mb-4">
                                    <h5 class="card-title text-center">새로운 비밀번호</h5>
                                    <input class="w-100 mb-3" type="password" name="newPasswrod" id="newPasswrod" required="required" placeholder=" Enter passwrod . . .">
                                    <div id="pwShow-U-1">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                                    <h5 class="card-title text-center mt-2">비밀번호 확인</h5>
                                    <input class="w-100 mb-3" type="password" name="checkPasswrod" id="checkPasswrod" required="required" placeholder=" Check passwrod . . .">
                                    <div id="pwShow-U-2">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                                    <a href="javascript:void(0)" id="pChange" class="button_hover theme_btn_two mt-2 w-100">비밀번호 변경</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
    	document.getElementById('pwShow-U-1').addEventListener('click',function(){
	    	let pw = document.getElementById('newPasswrod');
    		if(pw.getAttribute('type')=="password"){
	        	pw.setAttribute('type','text');
            	this.innerHTML = '<i class="far fa-eye"></i>';
	    	}else {
    		    pw.setAttribute('type','password');
	        		this.innerHTML = '<i class="far fa-eye-slash"></i>';
    		}
		});
    	
    	document.getElementById('pwShow-U-2').addEventListener('click',function(){
	    	let pw = document.getElementById('checkPasswrod');
    		if(pw.getAttribute('type')=="password"){
	        	pw.setAttribute('type','text');
            	this.innerHTML = '<i class="far fa-eye"></i>';
	    	}else {
    		    pw.setAttribute('type','password');
	        		this.innerHTML = '<i class="far fa-eye-slash"></i>';
    		}
		});
    
	    document.getElementById('pChange').addEventListener('click',function(){
	    	let newP = newPasswrod.value;
	    	let checkP = checkPasswrod.value;
	    	if(newP.length === 0){
	    		alert('새로 설정할 비밀번호를 입력해주세요.');
	    		newPasswrod.focus();
	    	}else if(checkP.length === 0){
	    		alert('비밀번호을 한 번 더 입력해주세요.');
	    		checkPasswrod.focus();
	    	}else if(checkP != newP){
	    		alert('비밀번호가 서로 일치하지 않습니다. \n다시 입력해주세요.');
	    		checkPasswrod.value ='';
	    		checkPasswrod.focus();
	    	}else{
	    		changePw();
	    	}
	    	
    	});
	    
	    function changePw(){
	    	fetch('changePw.do',{
            	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "id="+'${newId}'+'&password='+newPasswrod.value
            })
            .then(response => response.text())
            .then(data =>{
                console.log(data);
                if(data.trim()==='Y'){
                	alert('비밀번호 변경이 성공적으로 이루어졌습니다.');
                	location.href='home.do';
                }else if(data.trim()==='N'){
                	alert('비밀번호 변경 중에 오류가 발생하였습니다.');
                	newPasswrod.value ='';
                	checkPasswrod.value ='';
                	newPasswrod.focus();
                }
            })
	    }
    
	    document.getElementById('newPasswrod').addEventListener('keypress',function(event){
			if(event.keyCode === 13){
				document.getElementById('checkPasswrod').focus();
			}
		});
	    
    	document.getElementById('checkPasswrod').addEventListener('keypress',function(event){
			if(event.keyCode === 13){
				document.getElementById('pChange').click();
			}
		});
    	
    </script>
</body>
</html>