<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#admintable div.tui-grid-cell-content {
	text-align: center;
}
</style>
</head>
<body>

	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">홈</a></li>
					<li class="breadcrumb-item active"><a
						href="adminNoticeList.do">공지 관리</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<div class="row mb-3 ml-4 mr-4 d-flex justify-content-between">
				<div>
					<div class="row">
						<div class="card">
							<div class="card-body pl-5 pr-5 mt-2">
								<h4 class="d-inline text-warning font-weight-bold">공지사항 관리</h4>
								<p class="text-muted">공지사항을 관리하는 페이지 입니다.</p>
								<p class="text-muted">공지 관리 페이지</p>
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
												id="searchNotice"> <i class="mdi mdi-magnify"></i>
											</span>
										</div>
											<input type="text" id="btitle" name="btitle"
												class="form-control w-25" placeholder="제목 검색...">
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
							<div class="row ml-2 mb-2">
								<h3 class="d-inline mt-1 mb-2 text-warning">Notice List</h3>
							</div>
							<div class="active-member">
								<div id="admintable" class="table-responsive"
									style="display: inline;"></div>
							</div>
						<div class="row justify-content-end">
							<button type="button" class="btn btn-rounded btn-outline-dark mb-1 mr-3"
								onclick="location.href = 'adminNoticeForm.do' ">글쓰기</button>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>



	<script type="text/javascript">
    
 	// 검색
    createNotice(JSON.parse('${notices}'));

	function createNotice(dataNotice) {
		let div = document.getElementById('admintable');
		if(div.children.length!=0){
			div.children[0].remove();
	}

    const admingrid = new tui.Grid({
        el: div,
        data: dataNotice,
        scrollX: false,
        scrollY: false,
        minBodyHeight: 30,
        rowHeaders: [{type: 'rowNum', align : 'center', valign : 'middle'}],
        pageOptions: {
            useClient: true,
            perPage: 10
        },
        pagination: true,
        columns: [
        	{
                header: '제목',
                name: 'btitle'
            },
            {
                header: '작성일자',
                name: 'bdate',
                width : 'auto',
	            minWidth :150
	         }, 
            {
                header: '작성자',
                name: 'id',
                width : 'auto',
	            minWidth :150
	         }
        ]
    });

 	// 셀 클릭했을 때 글 상세 조회 페이지로 이동
    admingrid.on('click', function(event){
    	let no = dataNotice[event.rowKey].bno;
    	location.href = "adminNoticeRead.do?bno="+dataNotice[event.rowKey].bno;
    });

    // 표 테마
    tui.Grid.applyTheme('clean');
	}

	document.getElementById('searchNotice').addEventListener('click', function(){
		let t = document.getElementById('btitle').value;
		
		let path = 'adminNoticeSearch.do?btitle='+t;
		
		fetch(path)
		
		.then(response => response.json())
		.then(data => {
			createNotice(data);
		});
	})

	document.getElementById('btitle').addEventListener('keypress', function(event){
		if(event.keyCode === 13){
			document.getElementById('searchNotice').click();
		}
	})

    </script>


</body>
</html>