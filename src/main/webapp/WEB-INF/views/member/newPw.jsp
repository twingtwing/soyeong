<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                    <h5 class="card-title text-center mt-2">비밀번호 확인</h5>
                                    <input class="w-100 mb-3" type="password" name="checkPasswrod" id="checkPasswrod" required="required" placeholder=" Check passwrod . . .">
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
	    document.getElementById('pChange').addEventListener('click',function(){
	    	let newP = newPasswrod.value;
	    	let checkP = checkPasswrod.value;
	    	if(newP.length === 0){
	    		alert('새로 설정할 비밀번호를 입력해주세요.');
	    		newP.focus();
	    	}else if(checkP.length === 0){
	    		alert('비밀번호을 한 번 더 입력해주세요.');
	    		checkP.focus();
	    	}else if(checkP != newP){
	    		alert('비밀번호가 서로 일치하지 않습니다. \n다시 입력해주세요.');
	    		checkP.value ='';
	    		checkP.focus();
	    	}else{
	    		changePw();
	    	}
	    	
    	});
	    
	    function changePw(){
	    	let newP = newPasswrod.value;
	    	fetch('changePw.do',{
            	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "id="+'${newId}'+'&password'+newP
            })
            .then(response => response.text())
            .then(data =>{
                console.log(data);
                
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