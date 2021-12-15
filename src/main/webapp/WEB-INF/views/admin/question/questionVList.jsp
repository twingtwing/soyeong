<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#cs-table-SC div.tui-grid-cell-content {
	text-align: center;
}
</style>
</head>
<body>
	<div class="content-body">

		<!-- customerSerivce.js에 있음 -->

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
					<li class="breadcrumb-item active"><a href="questionVList.do">The
							Sound of Customers</a></li>
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
								<h4 class="d-inline">Customer Service</h4>
								<p class="text-muted">고객과 관련된 서비스를 관리하는 페이지 입니다.</p>
								<p class="text-muted">The Voice of Customer page</p>
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
												id="searchSC"><i class="mdi mdi-magnify"></i></span>
										</div>
										<div class="mr-2">
											<select id="qCategory" name="qCategory" class="form-control">
												<option value="" selected="selected">전체</option>
												<option value="결제 및 환불">결제 및 환불</option>
												<option value="계정">계정</option>
												<option value="후기">후기</option>
												<option value="숙소 및 호스팅">숙소 및 호스팅</option>
												<option value="예약 및 여행">예약 및 여행</option>
												<option value="코로나19">코로나19</option>
											</select>
										</div>
										<input type="text" id="qTitle" name="qTitle"
											class="form-control" placeholder="Search Title..">
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
							<h4>The Sound of Customers</h4>
						</div>
						<div id="cs-table-SC" class="table-responsive"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>
	<script type="text/javascript">
		createSC(JSON.parse('${voices}'));
		
		function createSC(dataSC) {
			let div = document.getElementById('cs-table-SC');
			if (div.children.length != 0) {
				div.children[0].remove();
			}

			for (var i = 0; i < dataSC.length; i++) {
				if (dataSC[i].qFile != undefined) {
					dataSC[i].qFile = '<i class="fa fa-download mb-2"></i>';
				}
			}

			const gridSC = new tui.Grid({
				el : div,
				data : dataSC,
				scrollX : false,
				scrollY : false,
				minBodyHeight : 30,
				rowHeaders : [ {
					type : 'rowNum',
					align : 'center',
					valign : 'middle'
				} ],
				pageOptions : {
					useClient : true,
					perPage : 10
				},
				pagination : true,
				columns : [ {
					header : '말머리',
					name : 'qCategory',
					width : 'auto',
					minWidth : 150
				}, {
					header : '제목',
					name : 'qTitle',
				}, {
					header : '질문자',
					name : 'name',
					width : 'auto',
					minWidth : 100
				}, {
					header : '처리상태',
					name : 'qProcess',
					width : 'auto',
					minWidth : 100
				}, {
					header : '파일 포함여부',
					name : 'qFile',
					width : 'auto',
					minWidth : 150
				} ]
			});

			gridSC.on('click', function(event) {
				location.href = "questionVSelect.do?qNo="
						+ dataSC[event.rowKey].qNo;
			});

			tui.Grid.applyTheme('clean');

		}
		
		document.getElementById('searchSC').addEventListener('click',function(){
			let c = document.getElementById('qCategory').value;
			let t = document.getElementById('qTitle').value;
			console.log(c)
			let path = 'questionVSearch.do?qCategory='+c+'&qTitle='+t;
			fetch(path)
			.then(response => response.json())
			.then(data => {
				createSC(data);
			}); 
		})
		
	 	document.getElementById('qTitle').addEventListener('keypress',function(event){
			if(event.keyCode === 13){
				document.getElementById('searchSC').click();
			}
		}) 
		
		
	</script>
</body>
</html>