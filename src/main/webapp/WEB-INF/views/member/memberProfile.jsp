<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 마이 페이지 -->
	
	<!--================Banner Area =================-->
    <section class="banner_area">
            <div class="booking_table d_flex align-items-center">
            	<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>내 정보</h2>
					</div>
				</div>
            </div>
        </section>
    <!--================Banner Area =================-->
        
    <!--================ start body Area =================-->
    <section class="section_gap">
            <div class="container">
                <div class="row mb-30">
                    <a href="javascript:history.back()" class="genric-btn warning-border circle arrow pl-4"><span class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>Prev</a>
                </div>
                <div class="section_title text-center">
                    <h2 class="title_color"><strong>Hello,&nbsp;&nbsp;My Page</strong></h2>
                </div>
                <div class="row d-flex justify-content-between mb-20">
                    <div class="row ml-3">
                        <h3 class="mb-0"><i class="fas fa-user-circle text-warning"></i> <b>${name}</b>님 어서오세요!!</h3>
                    </div>
                    <!-- host여야 입장가능 -->
                    <c:if test="${author eq 'HOST'}">
                    	<div class="d-flex align-items-end">
                        	<a href="memberSales.do" class="genric-btn warning medium pb-0"><strong>결제 및 환불 처리</strong></a>
                    	</div>
					</c:if>
                    <!-- host여야 입장가능  -->
                </div>
                <div class="row mb-5 mt-5">
                    <table class="table text-center ">
                        <tr>
                            <th class="p-4 align-middle">ID</th>
                            <td class="align-middle" colspan="2">${id}</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">이름</th>
                            <td class="align-middle" colspan="2">${name}</td>
                        </tr>
                        <tr>
                            <th class="align-middle" rowspan="2">전화번호/성별</th>
                            <th class="p-4 align-middle" >전화번호</th>
                            <td class="align-middle">${member.tel }</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">성별</th>
                            <td class="align-middle">${member.gender }</td>
                        </tr>
                        <tr>
                            <th class="align-middle" rowspan="2">권한/가입날짜</th>
                            <th class="p-4 align-middle">권한</th>
                            <td class="align-middle">${author}</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">가입날짜</th>
                            <td class="align-middle">${member.joinDate }</td>
                        </tr>
                        <c:if test="${not empty member.kakao or not empty member.naver}">
                        <tr>
                            <th class="p-4 align-middle">SNS 연동</th>
                            <td class="align-middle" colspan="2">
                            	<div class="d-flex justify-content-around">
                            			<c:if test="${member.naver eq 'Y'}">
                            				<div class="row">
                            					<img alt="naver" src="resources/img/naverLogo.png" height ="30">
                            					<h6 class="text-muted ml-2 mt-1">네이버 연동</h6>
                            				</div>
                            			</c:if>
                            			<c:if test="${member.kakao eq 'Y'}">
                            				<div class="row">
                            					<img alt="naver" src="resources/img/kakaoLogo.png" height ="30">
                            					<h6 class="text-muted ml-2 mt-1">카카오 연동</h6>
                            				</div>
                            			</c:if>
                            	</div>
                            </td>
                        </tr>
                        </c:if>
                    </table>
                </div>
                <div class="row d-flex justify-content-around">
                    <a href="memberUpdateForm.do" class="button_hover theme_btn_two">회원정보 수정</a>
                    <a href="memberDelete.do" class="button_hover theme_btn_two">회원 탈퇴</a>
                </div>
            </div>
        </section>
    <!--================ body Area  =================-->

</body>
</html>