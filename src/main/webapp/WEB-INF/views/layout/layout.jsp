<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/responsive.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/_variables.css">
<link rel="stylesheet" href="resources/css/_testimonial.css">
<link rel="stylesheet" href="resources/css/_footer.css">
<script src="https://kit.fontawesome.com/00b1224df3.js"
	crossorigin="anonymous"></script>

        <script src="resources/js/jquery-3.2.1.min.js"></script>
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
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>