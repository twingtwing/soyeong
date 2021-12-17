<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
textarea {
	border: 1px white solid;
	width: 100%;
	height: 180px;
}

th, td {
	padding: 1rem;
	text-align: center;
}

#infoBox, #all {
	margin: 1rem;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

#infoBox img {
	margin: 1rem;
}

#starsBox {
	display: flex;
	justify-content: center; padding : 1rem;
	height: 3rem;
	text-align: center;
	padding: 1rem;
	margin-bottom: 2rem;
}

#starsBox i {
	font-size: 2.5rem;
	color: #DBDBDB;
	cursor: pointer;
	margin: 0px;
}

#starsBox selected {
	color: #f3c300;
	transition: all 0.3s;
}

#starsBox>div {
	position: absolute;
}

#fullStar .fa-star{
/*
	z-index: 1;
*/
}

table {
	margin-bottom: 1rem;
}

.buttons button {
	background-color: #f3c300;
	border: 1px solid white;
	padding: 1rem;
	border-radius: 3rem;
	font-weight: bold;
	color: white;
	margin: 1rem;
	width: 5rem;
	cursor: pointer;
}

.buttons button:nth-child(2) {
	background-color: lightgray;
}

#write {
	margin: 2rem;
}
</style>
<script src="https://kit.fontawesome.com/8d99e6c8fb.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<section class="breadcrumb_area">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""
			style="transform: translateY(0px);">
			<img alt="" src="resources/img/facilities_bg.jpg">
		</div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">리뷰 작성</h2>
			</div>
		</div>
	</section>
	<div id="all">
		<div id="infoBox">
			<h4>${reservInfo.rname}</h4>
			<img src="http://localhost/prj/resources/img/${reservInfo.rphoto}">
			<span>${reservInfo.rcategory}-${reservInfo.rtype}(${reservInfo.rguest}인실)</span>
			<span>${reservInfo.rtel}</span> <span>${reservInfo.raddress}</span> <span>${reservInfo.rcontent}</span>
		</div>
		<div>
			<div id="write">
				<table>
					<tbody>
						<tr>
							<td colspan="4">
							<div id="starsBox">
								<div id="halfStar">
									<i class="fas fa-star-half"></i> <i class="fas fa-star-half"></i>
									<i class="fas fa-star-half"></i> <i class="fas fa-star-half"></i>
									<i class="fas fa-star-half"></i>
								</div>
								<div id="fullStar">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${id}</td>
							<th>이름</th>
							<td>${name}</td>
						</tr>
						<tr>
							<td colspan="4"><textarea id="rvcontent"
									placeholder="250자 내외로 작성"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="buttons" align="center">
					<button id="letsGo">작성</button>
					<button onclick="location.href='home.do'">취소</button>
				</div>
			</div>
		</div>
	</div>
	<form action="reviewInsert.do" method="post">
		<input type="hidden" name="rno" value="${reservInfo.rno}">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="rvstar">
		<input type="hidden" name="rvcontent">
	</form>
	
	
	<script type="text/javascript">
		$('#fullStar i').on('mouseover', (e) => {
			e.target.style.color='#f3c300';
			for(let i=0; i<$(e.target).index();i++){
				$('#fullStar>i')[i].style.color='#f3c300';
			}
		})		
		let gr = function(e){
			$(e.target).parent().children().css('color','#DBDBDB');			
		}
		$('#fullStar i').on('mouseout', gr)
	
		$('#fullStar i').on('click',(e)=>{
			e.target.style.color='#f3c300';
			for(let i=0; i<=$(e.target).index();i++){
				$('#fullStar>i')[i].classList.add('selected');
			}
			
			
			for(let i=0; i<$('.selected').length;i++){
				$('#fullStar>i')[i].style.color='#f3c300';		
			}
			$('#fullStar i').off();
		})
		
		$('#letsGo').on('click',()=>{
			$('form>input:nth-child(3)')[0].value=$('.selected').length;
			$('form>input:nth-child(4)')[0].value=$('textarea')[0].value;	
			$('form')[0].submit();
		})
		
	</script>
</body>

</html>