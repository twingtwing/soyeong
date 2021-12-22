<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REPORT</title>
<style type="text/css">
#gridReport {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 3rem;
}

td {
	text-align: center;
}

h3, #gridReport {
	width: 65vw;
}

h3 {
	text-align: left;
	margin: 2rem;
}

#gridReport td {
	cursor: pointer;
}

#gridReport div.tui-grid-cell-content {
	text-align: center;
}
.col-lg-12 .card{
	margin:30px;
	margin-top: 0px;
}

</style>
</head>
<body>
	<div class="content-body">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">홈</a></li>
					<li class="breadcrumb-item active"><a href="reportPage.do">신고 관리</a></li>
				</ol>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row mb-3 ml-4 mr-4 d-flex justify-content-between">
				<div>
					<div class="row">
						<div class="card">
							<div class="card-body pl-5 pr-5 mt-2">
								<h4 class="d-inline text-warning font-weight-bold">신고 관리</h4>
								<p class="text-muted">신고를 관리하는 페이지 입니다.</p>
								<p class="text-muted">신고 관리 페이지</p>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-end justify-content-end">
					<div class="row">
						<div class="card">
							<div class="card-body p-3">
								<div class="input-group icons">
									<div class="input-group icons">
										<div class="input-group-prepend">
											<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="rsearch">
												<i class="mdi mdi-magnify"></i>
											</span>
										</div>
										<input type="text" id="rptitle" name="rptitle" class="form-control" placeholder="제목으로 검색">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<h3 class="d-inline mt-1 mb-3 text-warning">Report List</h3>
						</div>
						<div >
							<div id="gridReport" class="table-responsive" style="display: inline;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="reportSelect.do" id="frm">
			<input type="hidden" id="rpno" name="rpno">
		</form>
	</div>


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
			gridR.resetData(response);
		})
	})();
	
	$('#rsearch').on('click',function(){
		let input = $('#rptitle').val();
		console.log(input);
		$.ajax({
			url : 'reportSearch.do',
			type : 'get',
			dataType : 'json',
			data : 'rptitle='+input
		})
		.done(data=>{
			data.forEach((val,ind)=>{
				val.rpdate = new Date(val.rpdate).toISOString().substring(0, 10);
				if(val.iscleared=='TRUE'){
					val.iscleared='처리완료';
				}else{
					val.iscleared='처리 전';
				}
			})
			console.log(data);
			gridR.resetData(data);
		}) 
	});
	
	$('#rptitle').on('keypress',function(){
		if(event.keyCode === 13){
			$('#rsearch').click();
		}
	})
	
	const gridR = new tui.Grid({
	     el : document.getElementById('gridReport'),
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
	    	header: '제목',
	    	name: 'rptitle'
	     },{
	        header : '신고된 유저',
	        name : 'blackuser'
	     }, {
	        header : '신고된 게시글',
	        name : 'rptype'
	     }, {
	        header : '처리상태',
	        name : 'iscleared'
	     }
	     ]
	  });
	  
	
	$('#gridReport').on('click',(event)=>{
			let rpno = event.target.parentNode.parentNode.firstChild.textContent;
			let state = event.target.parentNode.parentNode.lastChild.textContent;
			console.log(event.target.parentNode.parentNode.nodeName)
			$('#rpno').val(rpno);
			$('#frm').submit();
		})
		
	tui.Grid.applyTheme('clean');
		
	</script>
</body>
</html>