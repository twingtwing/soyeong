<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.search {
	display: flex;
	justify-content: right;
}


#grid {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 3rem;
}

td{
	text-align: center;
}
.search, h3 ,#grid{
	width: 65vw;
}

.search>input, .search>button {
	padding: 5px 10px;
	margin: 5px;
	border-radius: 5px;
	background-color: white;
	border: 1px solid lightgray;
}

.search>input {
	width: 15rem;
}

.search>button:hover{
	background-color: #F3F3F9;
	cursor: pointer;
	color: black;
}

h3 {
	text-align: left;
	margin:2rem;
}
</style>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>
	<div align="center">
		<div id="all">
			<h3>신고내역</h3>
			<div class="search">
				<input type="search" placeholder="내용을 입력해주세요.">
				<button>검색</button>
			</div>
			<div align="center">
			<div id="grid"></div>
				
			</div>
		</div>
	</div>

	<form action="reportSelect.do" id="frm">
		<input type="hidden" id="rpno" name="rpno">
	</form>

	<script type="text/javascript">	
	
	$("tbody").click($('tr'),(event)=>{
			let rpno = event.target.parentNode.className;
			console.log(rpno)
			$('#rpno').val(rpno);
			$('#frm').submit();
		})
		
</script>

<script type="text/javascript">
(function(){
	$.ajax({
		url:'reportList.do',
		dataType : 'json'
	})
	.done((response)=>{
		response.forEach((val,ind)=>{
			if(val.iscleared=='TRUE'){
				val.iscleared='처리완료';
			}else{
				val.iscleared='처리 전';
			}
		})
		grid.resetData(response);
	})
})();


const grid = new tui.Grid({
     el : document.getElementById('grid'),
     scrollX : false,
     scrollY : false,
     pageOptions: {
    	    useClient: true,
    	    perPage: 10
    	  },
     columns : [    
     {
        header : '신고번호',
        name : 'rpno'
     }, {
        header : '신고자',
        name : 'reporter'
     }, {
        header : '신고사유',
        name : 'rptype'
     }, {
        header : '신고된 호스트명',
        name : 'repr'
     }, {
        header : '신고된 게시글',
        name : 'rptype'
     }, {
        header : '처리상태',
        name : 'iscleared'
     }
     ]
  });
  
  
  
  
</script>
</body>
</html>