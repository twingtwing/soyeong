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
                    <h2>비밀번호 찾기</h2>
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
                    <i class="fas fa-key mr-3 text-danger"></i>Find Password.
                </h3>
            </div>
            <hr class="my-1">
            <div class="row d-flex justify-content-center">
                <div class="col-md-auto d-flex align-items-center" style="height: 70vh; width: 400px;">
                    <div id="idBox" class="w-100">
                        <div class="row d-flex justify-content-center w-100">
                            <p class="text-center h6">
                                비밀번호 찾기 전에 <strong class="text-danger font-weight-bold">아이디 인증</strong> 하셔야
                                    가능합니다.
                            </p>
                        </div>
                        <div class="row w-100 mt-3">
                            <div class="card border-danger w-100">
                                <div class="card-body pl-5 pr-5 mt-4 mb-4">
                                    <h5 class="card-title mb-3 text-center">아이디 확인</h5>
                                    <input class="w-100 mb-3" type="email" name="idInput" id="idInput"
                                        required="required" placeholder=" Enter ID . . .">
                                    <a href="javascript:void(0)" id="idCheck" class="button_hover theme_btn_two mt-2 w-100">확인</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="pwBox" class="w-100 d-none">
                    	<div class="row d-flex justify-content-center w-100">
                            <p class="text-center h6">
                                비밀번호 찾기 전에 <strong class="text-danger font-weight-bold">아이디 인증</strong> 하셔야
                                    가능합니다.
                            </p>
                        </div>
                        <div class="row w-100 mt-3">
                            <div class="card border-danger w-100">
                                <div class="card-body pl-5 pr-5 mt-4 mb-4">
                                    <h5 class="card-title text-center">인증 이메일</h5>
                                    <input class="w-100 mb-3" type="email" name="emailInput" id="emailInput"
                                        required="required" placeholder=" Enter email . . .">
                                    <a href="javascript:void(0)" id="emailCheck" class="button_hover theme_btn_two mt-2 w-100">인증번호 전송</a>
                                    <h5 class="card-title mt-4 text-center">인증 번호</h5>
                                    <input class="w-100 mb-3" type="text" name="nInput" id="nInput"
                                        required="required" placeholder=" Enter number . . ." disabled>
                                    <button type="button" id="nCheck" class="mt-2 w-100" disabled>인증번호 확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        	<input type="hidden" id="numberPw" name="numberPw" value="">
        </div>
    </section>
    <!--================ body Area  =================-->
    
    <script>
    	document.getElementById('idCheck').addEventListener('click',function(){
    		event.stopPropagation();
            let emailReg =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            let id = idInput.value;
            if(id.length === 0){
                alert('아이디를 입력해주세요.');
                idInput.focus();
            }else if(!emailReg.test(id)){
                alert('이메일 형식을 지켜주세요.');
                idInput.value = '';
                idInput.focus();
            }else{
                ajaxId(id);
            }
        });
    	
    	document.getElementById('idInput').addEventListener('keypress',function(event){
    		if(event.keyCode === 13){
    			document.getElementById('idCheck').click();
    		}
    	});

        function ajaxId(id){
        	let path = 'idChk.do?id='+id;
            fetch(path)
            .then(response => response.text())
            .then(data =>{
                if(data.trim() ==='ng'){
                	idBox.classList.add('d-none');
                	pwBox.classList.remove('d-none');
                }else if(data.trim() ==='ok'){
                	alert('입력하신 아이디는 존재하지 않습니다.');
                    idInput.value = '';
                    idInput.focus();
                }
            })
        }
        
        document.getElementById('emailCheck').addEventListener('click',function(){
        	event.stopPropagation();
        	let emailReg =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        	let email = emailInput.value;
        	if(email.length === 0){
                alert('이메일을 입력해주세요.');
                emailInput.focus();
            }else if(!emailReg.test(email)){
                alert('이메일 형식을 지켜주세요.');
                emailInput.value = '';
                emailInput.focus();
            }else{
               ajaxEamil(email);
               alert("인증번호를 전송하였습니다.");
               nInput.disabled= false;
               nCheck.disabled= false;
               nCheck.classList.add('button_hover','theme_btn_two');
            }
        	
        });
        
        document.getElementById('emailInput').addEventListener('keypress',function(event){
    		if(event.keyCode === 13){
    			document.getElementById('emailCheck').click();
    		}
    	});
        
        function ajaxEamil(email){
            fetch('emailVerify.do',{
            	method : 'post',
    	    	headers :{"Content-type":"application/x-www-form-urlencoded"},
				body : "email="+email
            })
            .then(response => response.text())
            .then(data =>{
                console.log(data);
                numberPw.value = data;
            })
        }
        
        document.getElementById('nCheck').addEventListener('click',function(){
        	event.stopPropagation();
        	let n = nInput.value;
        	if(n.length == 0){
        		alert('값을 입력해주세요.');
        	}else if(n === numberPw.value){
        		let f = document.createElement('form');
        		let input = document.createElement('input');
        		input.setAttribute('type', 'hidden');
        		input.setAttribute('name', 'id');
        		input.setAttribute('value', idInput.value);
            	f.setAttribute('method', 'post');
            	f.setAttribute('action', 'newPw.do');
            	f.appendChild(input);
            	document.body.appendChild(f);
            	f.submit();
        	}
        });
        
        document.getElementById('nInput').addEventListener('keypress',function(event){
    		if(event.keyCode === 13){
    			document.getElementById('nCheck').click();
    		}
    	});
        
    </script>

</body>
</html>