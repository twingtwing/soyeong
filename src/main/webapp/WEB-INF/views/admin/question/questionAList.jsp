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
                        <li class="breadcrumb-item active"><a href="questionAList.do">Q &amp; A</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row mb-3 ml-2">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="d-inline">Customer Service</h4>
                            <p class="text-muted">고객과 관련된 서비스를 관리하는 페이지 입니다.</p>
                            <p class="text-muted">Q &amp; A management page</p>
                        </div>
                    </div>
                </div>

			<div class="row m-2">
				<div class="card col-12">
					<div class="card-body">
						<div class="card-title pb-2 pt-1">
							<h4>Q n A</h4>
						</div>
						<div id="cs-table-Q" class="table-responsive"></div>
						<div class="row d-flex justify-content-end">
							<a href="qeustionAInsert.do" class="btn btn-rounded btn-outline-dark mb-1 mr-3">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
            <!-- #/ container -->
        </div>
        	
		<script type="text/javascript">
		 	var dataQnA = JSON.parse('${QnAs}');
		   
		    const gridQnA = new tui.Grid({
		        el : document.getElementById('cs-table-Q'),
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
		</script>
</body>
</html>