<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pwShow-A {
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
                    <i class="fas fa-concierge-bell mr-3 text-danger"></i>Request to be the HOST.
                </h3>
            </div>
            <hr class="my-1">
            <div class="row d-flex justify-content-center">
                <div class="col-md-auto d-flex align-items-center" style="height: 65vh; width: 400px;">
                    <div class="w-100">
                        <div class="row d-flex justify-content-center w-100">
                            <p class="text-center h6">
                                호스트 신청은 <strong class="text-danger font-weight-bold">비밀번호 인증</strong> 하셔야
                                    가능합니다.
                            </p>
                        </div>
                        <div class="row w-100 mt-3">
                            <div class="card border-danger w-100">
                                <div class="card-body pl-5 pr-5 mt-4 mb-4">
                                    <h5 class="card-title mb-3 text-center">비밀번호 확인</h5>
                                    <input class="w-100 mb-3" type="password" name="pwAuthor" id="pwAuthor"
                                        required="required" placeholder="Enter password..">
                                    <div id="pwShow-A">
                                        <i class="far fa-eye-slash"></i>
                                    </div>
                                    <a href="javascript:void(0)" id="pwCheck-A" class="button_hover theme_btn_two mt-2 w-100">확인</a>
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
	    document.getElementById('pwShow-A').addEventListener('click',function(){
    	    let pw = document.getElementById('pwAuthor');
        	if(pw.getAttribute('type')=="password"){
            	pw.setAttribute('type','text');
	            this.innerHTML = '<i class="far fa-eye"></i>';
    	    }else {
        	    pw.setAttribute('type','password');
            	this.innerHTML = '<i class="far fa-eye-slash"></i>';
        	}
    	});
    	
    	document.getElementById('pwCheck-A').addEventListener('click',function(){
    		event.stopPropagation();
    		let pwVal = document.getElementById('pwAuthor').value;
    		if(pwVal.length != 0){
    	   	fetch("pwCheck.do",{
    	    	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "password="+pwVal
    	    })
    	    .then(response => response.text())
    	    .then(data => {
    	    	console.log(data);
    	    	if(data.trim() === 'Y'){
    	    		authorHost();
    	    	}else if(data.trim() === 'N'){
    	    		alert('잘못된 비밀번호를 입력하셨습니다.\n다시 입력해주세요');
    	    		pwAuthor.value = '';
    	    		pwAuthor.focus();
    	    	}
    	    });	
    		}else{
    			alert('비밀번호를 먼저 입력해주세요');
    			pwAuthor.focus();
    		}
    	});
    	
    	document.getElementById('pwAuthor').addEventListener('keypress',function(event){
    		if(event.keyCode === 13){
    			document.getElementById('pwCheck-A').click();
    		}
    	});
    	
    	function authorHost(){
    		fetch("memberHostUpdate.do",{
    			method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"}
    		})
    		.then(response => response.text())
    		.then(data => {
    			if(data.trim() ==='Y'){
    				alert('호스트가 되셨습니다. \n축하드립니다.');
    				location.href="home.do";
    			}else if(data.trim()==='N'){
    				alert('권한 수정 중에 오류가 발생하였습니다.');
    	    		pwAuthor.value = '';
    	    		pwAuthor.focus();
    			}
    		})
    	}

    </script>
</body>
</html>