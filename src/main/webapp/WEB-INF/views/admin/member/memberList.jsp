<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
table {
	overflow: inherit;
}
#member-table div.tui-grid-cell-content {
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
					<li class="breadcrumb-item active"><a href="adminMemberList.do">User Management</a></li>
				</ol>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row mb-3 ml-4 mr-4 d-flex justify-content-between">
				<div>
					<div class="row">
						<div class="card">
							<div class="card-body pl-5 pr-5">
								<h4 class="d-inline">User Management</h4>
								<p class="text-muted">회원들을 관리하는 페이지 입니다.</p>
								<p class="text-muted">User management page</p>
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
											<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="searchMBtn">
												<i class="mdi mdi-magnify"></i>
											</span>
										</div>
										<div class="mr-2">
											<select id="selectM" name="selectM" class="form-control">
												<option value="name" selected="selected">이름</option>
												<option value="id">아이디</option>
											</select>
										</div>
										<input type="text" id="inputM" name="inputM"
											class="form-control" placeholder="Enter...">
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
							<div class="dropdown-button mb-3 mt-2"
								style="text-align: left; display: inline-block;">
								<div class="btn-group" role="group">
									<button type="button"
										class="btn mb-1 btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">정렬</button>
									<div class="dropdown-menu">
										<!-- 어떤 오름차순? 내림차순? -->
										<a class="dropdown-item" href="#">오름차순</a> <a
											class="dropdown-item" href="#">내림차순</a>
									</div>
								</div>
							</div>
							<div class="active-member">
								<div id="member-table" class="table-responsive" style="display: inline;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		createM(JSON.parse('${members}'));

		//latestUse?? 물어보기
		function createM(dataM){
			let div = document.getElementById('member-table');
			if(div.children.length!=0){
				div.children[0].remove();
			}
			
		    const gridMember = new tui.Grid({
		        el : div,
		        data : dataM,
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
		            header : '아이디',
		            name : 'id'
		         },{
		            header : '이름',
			        name : 'name'
			     },{
				    header : '상태',
			        name : 'status'
				 },{
			        header : '권한',
			        name : 'author'
			     }]
		    });

		    gridMember.on('click',function(event){
				location.href = "memberSelect.do?id="+dataM[event.rowKey].id;
		    }); 

		    tui.Grid.applyTheme('clean');
		}
		
        $("table").on('click', 'button', function () {
           memberBan();
        });


        // 즉시 status 변경 가능하도록 >> update
        function memberBan(){
            $.ajax({
                url:'',
                data: {
                    status : 'ban'
                },
                dataType:'',
                method:'GET',
                success: function(data){
                    console.log('성공')
                }
            });
        }
    </script>

</body>

</html>