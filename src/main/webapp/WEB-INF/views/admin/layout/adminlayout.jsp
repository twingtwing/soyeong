<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title><tiles:getAsString name="title" /></title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="resources/admin/images/favicon.png">
	<!-- Pignose Calender -->
	<link href="resources/admin/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
	<!-- Chartist -->
	<link rel="stylesheet" href="resources/admin/plugins/chartist/css/chartist.min.css">
	<link rel="stylesheet" href="resources/admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
	<!-- Custom Stylesheet -->
	<link href="resources/admin/css/style.css" rel="stylesheet">

	<script src="https://kit.fontawesome.com/00b1224df3.js"	crossorigin="anonymous"></script>

   <!-- toast.ui -->
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
    <script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>

<body>
	
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->
    
	<div id="main-wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="side" />
		<!-- side가 breadcrumb를 사용했으니 주의할것 -->
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>

	<script src="resources/admin/plugins/common/common.min.js"></script>
	<script src="resources/admin/js/custom.min.js"></script>
	<script src="resources/admin/js/settings.js"></script>
	<script src="resources/admin/js/gleek.js"></script>
	<script src="resources/admin/js/styleSwitcher.js"></script>

	<!-- Chartjs -->
	<script src="resources/admin/plugins/chart.js/Chart.bundle.min.js"></script>
	
	<!-- main -->
	<script src="resources/admin/js/main.js"></script>
	
	<!-- validation -->
	<script src="resources/admin/plugins/validation/jquery.validate.min.js"></script>
	<script src="resources/admin/js/adminValidation.js"></script>
	
</body>
</html>