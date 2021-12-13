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

    <!-- 시작 -->
        <section class="testimonial_area section_gap">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="typography"></div>
                        <h3 class="mb-30 title_color">숙소 등록 / 수정</h3>
                    </div>
                </div>
                <br>
                <div class="row p-3 d-flex justify-content-center">
                    <div class="col-lg-8 col-md-8">
                        <h4 class="mb-20">숙소 상세 정보</h4>
                        <form>
                            <input type="text" name="name" placeholder="숙소명" onfocus="this.placeholder = ''" onblur="this.placeholder = '숙소명'" required="" class="single-input my-3">
                            <div class="row my-3">
                                <div class="col-md-4">
                                    <div class="default-select" id="default-select">
                                        <select style="display: none;">
                                            <option value="1">아파트</option>
                                            <option value="1">주택</option>
                                            <option value="1">호텔</option>
                                        </select>
                                        <div class="nice-select" tabindex="0">
                                            <span class="current">숙소 유형</span>
                                            <ul class="list">
                                                <li data-value="1" class="option selected">아파트</li>
                                                <li data-value="1" class="option">주택</li>
                                                <li data-value="1" class="option">호텔</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <!-- 숙소 종류 -->
                                    <div class="default-select" id="default-select">
                                        <select style="display: none;">
                                            <option value="1">개인실</option>
                                            <option value="1">다인실</option>
                                        </select>
                                        <div class="nice-select" tabindex="0">
                                            <span class="current">숙소 종류</span>
                                            <ul class="list">
                                                <li data-value="1" class="option selected">개인실</li>
                                                <li data-value="1" class="option">다인실</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <input type="number" name="price" placeholder="1박 요금" onfocus="this.placeholder = ''" onblur="this.placeholder = '1박 요금'" required="" class="single-input">
                                </div>
                            </div>
                            <textarea class="single-textarea h-25" rows="10" placeholder="내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요'" required=""></textarea>
                            <h4 class="mb-20 my-5">주소 입력</h4>
                            <div>
                                <input id="member_post" class="single-input mt-10 my-3" placeholder="Post" readonly onclick="findAddr()">
                                <input id="member_addr" class="single-input mt-10 my-3" placeholder="Address" readonly>
                                <input type="text" class="single-input mt-10 my-3" placeholder="Detailed Address">
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4">
                            <h4 class="mb-20">최대 인원 수</h4>
                            <div class="row m-2">
                                <p>게스트</p>&nbsp;&nbsp;&nbsp;
                                <input type="number" name="price" placeholder="1박 요금" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" required="" class="single-input w-50" value="4">
                            </div>
                            <div class="row m-2">
                                <p>침대</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" name="price" placeholder="1박 요금" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" required="" class="single-input w-50" value="1">
                            </div>
                            <div class="row m-2">
                                <p>욕실</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" name="price" placeholder="1박 요금" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" required="" class="single-input w-50" value="1">
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="typography"></div>
                            <h4 class="mb-20">편의시설</h4>
                        </div>
                    </div>
                    <div class="row m-5 d-flex justify-content-center">
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                        <div class="col-2">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                            <input type="button" class="genric-btn primary-border radius m-3" value="수영장">
                        </div>
                    </div>

                    <div class="row m-5 d-flex justify-content-center">
                        <button type="submit" class="genric-btn primary radius">등록/수정</button>
                    </div>
                </form>
            </div>
        </section>
        
	    
	    <!-- 다음 주소 api -->
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



	    <script>
	    function findAddr() {
	        new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	    }
	
	    </script>

</body>
</html>