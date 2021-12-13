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
						<h2>Relax Your Mind</h2>
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
                        <h3 class="mb-0"><i class="fas fa-user-circle text-warning"></i> <b>홍길동</b>님 어서오세요!!</h3>
                    </div>
                    <!-- host여야 입장가능 -->
                    <div class="d-flex align-items-end">
                        <a href="memberSales.do" class="genric-btn warning medium pb-0"><strong>결제 및 환불 처리</strong></a>
                    </div>
                    <!-- host여야 입장가능  -->
                </div>
                <div class="row mb-30">
                    <table class="table text-center ">
                        <tr>
                            <th class="p-4 align-middle">ID</th>
                            <td class="align-middle" colspan="2">abcd123@yedam.kr</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">이름</th>
                            <td class="align-middle" colspan="2">홍길동</td>
                        </tr>
                        <tr>
                            <th class="align-middle" rowspan="2">전화번호/성별</th>
                            <th class="p-4 align-middle" >전화번호</th>
                            <td class="align-middle">010-1111-2222</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">성별</th>
                            <td class="align-middle">여자</td>
                        </tr>
                        <tr>
                            <th class="align-middle" rowspan="2">권한/가입날짜</th>
                            <th class="p-4 align-middle">권한</th>
                            <td class="align-middle">UESR</td>
                        </tr>
                        <tr>
                            <th class="p-4 align-middle">권한</th>
                            <td class="align-middle">2021-10-10</td>
                        </tr>
                    </table>
                </div>
                <div class="row d-flex justify-content-around">
                    <a href="memberUpdateForm.do" class="button_hover theme_btn_two">회원정보 수정</a>
                    <a href="#" class="button_hover theme_btn_two">회원 탈퇴</a>
                </div>
            </div>
        </section>
    <!--================ body Area  =================-->

</body>
</html>