<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#all {
	display: grid;
	grid-template-columns: 1fr 2fr;
	justify-content: center;
	align-items: center;
	width: 80vw;
	margin: 10rem;
	margin-top: 0px;
}

.bookInfo {
	display: flex;
	flex-direction: column;
	margin: 1rem;
	align-items: center;
}

.bookDetails {
	display: flex;
	flex-direction: column;
	margin-top: 2.5rem;
}

.back {
	background-color: white;
	border: 1px solid #F3C300;
	border-radius: 5rem;
	padding: 0.5rem 1rem;
	position: inherit;
	margin-top: 5rem;
	margin-left: 5rem;
	z-index: 2;
	cursor: pointer;
	font-size: 0.8rem;
	color: lightgray;
}

.bookInfo>div>div {
	cursor: pointer;
	display: inline-block;
	padding: 0.5rem 1rem;
	margin: 7px;
}

.bookInfo button {
	width: 15rem;
	padding: 5px;
	border-radius: 5px;
	color: white;
}

.bookImg {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-evenly;
}

.bookImg>div>span:nth-child(1) {
	font-size: 1.1rem;
	font-weight: bold;
}

.state {
	display: flex;
	justify-content: space-between;
}

.bookDetails>span:nth-child(2n) {
	border-top: 1px solid lightgray;
	font-size: 1.05rem;
	font-weight: bold;
}

.bookDetails>span:nth-child(1), .bookDetails>span:nth-child(8),
	.bookDetails>span:nth-child(10) {
	font-size: 1.3rem;
	font-weight: bold;
	border-top: 1px solid lightgray;
	color: #F8B600;
}

.bookDetails>span {
	padding: 0.5rem 1rem;
}

.refundBar {
	background-color: lightgray;
	padding: 1rem;
	border: 1px solid lightgray;
	border-radius: 10rem;
	width: 35vw;
}
.refundBar>span{
	display: inline-block;
	width: 10rem;
	background-color: #F3C300;
	z-index: 2;
}

button {
	background-color: #F3C300;
	border: 1px solid #F3C300;
	cursor: pointer;
}

.bookImg button {
	color: #04091e;
	border: 1px solid #F3C300;
	padding: 5px 1rem;
	border-radius: 3px;
	margin: 0.5rem;
	margin-top: 1.5rem;
}

.bookInfo button:hover {
	background-color: #F8B100;
	transition: all 0.4s;
}

.bookImg img {
	
}
</style>
<script src="https://kit.fontawesome.com/00b1224df3.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<section class="breadcrumb_area">

		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""
			style="transform: translateY(0px);">
			<img src="resources/img/banner_bg.jpg">
		</div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">예약 세부 정보</h2>
			</div>
		</div>
	</section>



	<button type="button" onclick="location.href='home.do'" class="back">
		 &lt; PREV
	</button>
	<div id="all">
		<div class="bookInfo">
			<div align="center">
				<div>체크인</div>
				<div>체크아웃</div>
				<br>
				<button>메시지 보내기</button>
			</div>
			<div class="bookDetails">
				<span>예약 세부정보</span> <span>게스트</span> <span>성인
					${reservInfo.bookadult}명</span> <span>예약번호</span> <span>${reservInfo.bookno}</span>
				<span>환불정책</span> <span>${reservInfo.bookrefund}</span> <span>찾아오시는
					길</span> <span>${reservInfo.raddress}</span> <span>결제정보</span> <span>응?</span>
			</div>
		</div>
		<div class="bookImg">
			<img alt=""
				src="<%=request.getSession().getServletContext().getContextPath() %>/${reservInfo.rphoto}">
				<img alt="" src="http://localhost/prj/resources/img/${reservInfo.rphoto}">
				<!-- 임시사진? -->
			(대충 방 사진)
			<div id="cancel">
				<span>취소 진행사항</span><br>
				<div class="state">
					<span>요청</span><span>지급</span><span>처리</span>
				</div>
				<div class="refundBar"><span></span></div>
				<div align="right">
					<button>메시지</button>
					<button>취소</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		let bookcancel = '${reservInfo.bookcancel}';
		if (bookcancel == 'N') {
			$('#cancel').children().remove();
		}
		if ('${reservInfo.bookkid}' != '0') {
			$('.bookDetails>span:nth-child(3)').text(
					'성인 ${reservInfo.bookadult}명\n아동 ${reservInfo.bookkid}명');
		}
		if ('${reservInfo.bookrefund}' == '') {
			$('.bookDetails>span:nth-child(7)').text('소영과 아이들의 내규에 따름');
		}
	</script>
</body>

</html>