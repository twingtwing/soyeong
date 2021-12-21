<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#cs-table-Q div.tui-grid-cell-content {
	text-align: center;
}
</style>
</head>
<body>
	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
					<li class="breadcrumb-item active"><a href="questionAList.do">Q
							&amp; A</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->
		<div class="container-fluid">
			<div class="row mb-3 ml-4 mr-4 d-flex justify-content-between">
				<div>
					<div class="row">
						<div class="card">
							<div class="card-body pl-5 pr-5">
								<h4 class="d-inline text-warning">Customer Service</h4>
								<p class="text-muted">고객과 관련된 서비스를 관리하는 페이지 입니다.</p>
								<p class="text-muted">Q &amp; A management page</p>
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
											<span
												class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
												id="searchQnA"><i class="mdi mdi-magnify"></i></span>
										</div>
										<div class="mr-2">
											<select id="fCategory" name="fCategory" class="form-control">
												<option value="" selected="selected">전체</option>
												<option value="결제 및 환불">결제 및 환불</option>
												<option value="계정">계정</option>
												<option value="후기">후기</option>
												<option value="숙소 및 호스팅">숙소 및 호스팅</option>
												<option value="예약 및 여행">예약 및 여행</option>
												<option value="코로나19">코로나19</option>
											</select>
										</div>
										<input type="text" id="fTitle" name="fTitle"
											class="form-control" placeholder="Search Q & A">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row m-2">
				<div class="card col-12">
					<div class="card-body">
						<div class="card-title pb-2 pt-1">
							<h3 class="text-warning ml-2">Q n A</h3>
						</div>
						<div id="cs-table-Q" class="table-responsive" style="display: inline;"></div>
						<div class="row d-flex justify-content-end">
							<a href="qeustionAInsert.do"
								class="btn btn-rounded btn-outline-dark mb-1 mr-3">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>

	<script type="text/javascript">
		createQnA(JSON.parse('${QnAs}'));
	
		function createQnA(dataQnA){
			let div = document.getElementById('cs-table-Q');
			if(div.children.length!=0){
				div.children[0].remove();
			}
			
		    const gridQnA = new tui.Grid({
		        el : div,
		        data : dataQnA,
		        scrollX : false,
		        scrollY : false,
		        minBodyHeight: 30,
		        rowHeaders: [{
					type : 'rowNum', align : 'center', valign : 'middle'
				}],
		        pageOptions: {
		            useClient : true,
		            perPage: 10
		        },
		        pagination : true,
		        columns : [
		          {
		            header : '말머리',
		            name : 'fCategory',
		            width : 'auto',
		            minWidth :150
		         }, {
		            header : '제목',
		            name : 'fTitle',
		            minWidth :400
		         }]
		    });

		     gridQnA.on('click',function(event){
		    	let no = dataQnA[event.rowKey].fNo;
				location.href = "questionASelect.do?fNo="+no;
		    }); 

		    tui.Grid.applyTheme('clean');
		}
		    
		  document.getElementById('searchQnA').addEventListener('click',function(){
			  event.stopPropagation();
				let c = document.getElementById('fCategory').value;
				let t = document.getElementById('fTitle').value;
				let path = 'questionASearch.do?fCategory='+c+'&fTitle='+t;
				fetch(path)
				.then(response => response.json())
				.then(data => {
					createQnA(data);
				}); 
			})
			
		 	document.getElementById('fTitle').addEventListener('keypress',function(event){
				if(event.keyCode === 13){
					document.getElementById('searchQnA').click();
				}
			}) 
		</script>
</body>
</html>