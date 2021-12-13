<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-color: white;
}
#all, .contentBox{
	display:flex;
	flex-direction:column;
	align-items: center;
	justify-content: center;
	margin: 3rem;
}
#all, .contentBox,.title,h3,.content,.writeInfo{
	width: 45vw;
}
h3{
	text-align: left;
}

.title{
	border-bottom: 1px solid gray;
}
.writeInfo{
	display : flex;
	justify-content : right;
	font-size: 0.8rem;
	color: gray;
	margin: 5px;
}
.content, .title{
	text-align:left;
	padding : 5px 15px;
}
div>button{
	background-color: #7571F9;
	border : 1px solid #7571F9;
	padding : 0.5rem 1rem;
	border-radius: 5px;
	margin : 1rem;
	color: white;
	font-weight: bold;
	cursor: pointer;
}
</style>
</head>
<body>
<div align="center">
	<div id="all">
        <h3>신고내역</h3>
		<div class="contentBox" id="${report.rpno}">
			<div class="title">사기를 치네요${report.rptitle}</div>
			<div class="writeInfo">
				<span class="writer">작성자: ${report.reporter}</span><span class="date">작성일: ${report.rpdate }</span>
			</div>
			<div class="content">돈다냇늗데 가보니까 없는 곳이내요 하${report.rpcontent }</div>
		</div>
		<div>
            <button class="clear">처리완료</button>
            <button class="hold">보류</button>
        </div>
    </div>
</div>
<script type="text/javascript">
	$('.clear').click((event)=>{
		let rpno = $('.clear').parent().prev().attr('id');
		console.log(rpno)
		$.ajax({
			url : 'reportClear.do',
			data : {'rpno': rpno},
			method : 'post'
		})
		.done((response)=>{
			console.log(response)
			if(response=='ok'){
				window.alert('처리가 완료되었습니다.');
				location.href='reportList.do';
			} else{
				window.alert('에러가 발생하였습니다.');
			}
		})
	})
</script>
</body>
</html>