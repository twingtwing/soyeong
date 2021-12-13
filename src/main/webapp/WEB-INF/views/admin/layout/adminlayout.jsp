<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/admin/images/favicon.png">
<!-- Pignose Calender -->
<link
	href="resources/admin/plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="resources/admin/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="resources/admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="resources/admin/css/style.css" rel="stylesheet">
</head>

<body>
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
	<!-- Circle progress -->
	<script
		src="resources/admin/plugins/circle-progress/circle-progress.min.js"></script>
	<!-- Datamap -->
	<script src="resources/admin/plugins/d3v3/index.js"></script>
	<script src="resources/admin/plugins/topojson/topojson.min.js"></script>
	<script src="resources/admin/plugins/datamaps/datamaps.world.min.js"></script>
	<!-- Morrisjs -->
	<script src="resources/admin/plugins/raphael/raphael.min.js"></script>
	<script src="resources/admin/plugins/morris/morris.min.js"></script>
	<!-- Pignose Calender -->
	<script src="resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="resources/admin/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
	<!-- ChartistJS -->
	<script src="resources/admin/plugins/chartist/js/chartist.min.js"></script>
	<script
		src="resources/admin/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



	<script src="resources/admin/js/dashboard/dashboard-1.js"></script>
</body>
</html>