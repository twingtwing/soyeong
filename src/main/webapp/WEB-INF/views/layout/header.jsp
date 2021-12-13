<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--================Header Area =================-->
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <a class="navbar-brand logo_h" href="home.do"><img src="resources/img/Logo.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="index.html">메인화면</a></li> 
                            <li class="nav-item"><a class="nav-link" href="about.html">공지사항</a></li>
                            <li class="nav-item"><a class="nav-link" href="accomodation.html">고객센터</a></li>
                            <!-- 로그인 되어 있을시 -->
                            <li class="nav-item"><a class="nav-link" href="gallery.html">호스트 모드</a></li>
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">로그인</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
                                    <!-- 권한에 따라 보여지는게 다름 -->
                                    <li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                                    
                                </ul>
                            </li> 
                        </ul>
                    </div> 
                </nav>
            </div>
        </header>
<!--================Header Area =================-->

        
</body>
</html>