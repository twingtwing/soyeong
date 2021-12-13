<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Royal Hotel</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/_variables.css">
	<link rel="stylesheet" href="resources/css/_testimonial.css">
	<link rel="stylesheet" href="resources/css/_footer.css">
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
	
	<!-- main css -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/responsive.css">
    
	<style type="text/css">
		.active-Q {
            font-weight: bold;
            color: #f3c300;
            border-bottom: 3px solid #f3c300;
        }
	</style>

	<script src="https://kit.fontawesome.com/00b1224df3.js"	crossorigin="anonymous"></script>

	<script src="resources/js/jquery-3.2.1.min.js"></script>

</head>

<body>
	<tiles:insertAttribute name="header" />
	<!-- body가 페이지 맨 위로 들어가는 문제.이 부트스트랩에서는 모두 breadcrumb를 사용하였기 때문.-->
	<!-- 시각적으로 페이지 위치를 명확히 알도록 각 페이지 상단에 이미지 삽입하는 기법 -->
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

	<script src="resources/js/popper.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/mail-script.js"></script>
	<script src="resources/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/vendors/nice-select/js/jquery.nice-select.js"></script>
	<script src="resources/js/mail-script.js"></script>
	<script src="resources/js/stellar.js"></script>
	<script src="resources/vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="resources/js/custom.js"></script>

	<!-- validation -->
	<script src="resources/js/jquery.form.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>

	<!-- question -->
	<script src="resources/js/question.js"></script>
</body>
</html>