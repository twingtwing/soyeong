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

#memberSelectRow {
	text-align: right;
	display: block;
	height: 50px;
}
</style>
</head>

<body>
	<div class="content-body">
		<div class="container-fluid mt-3">
			<div class="row" id="memberSelectRow">

				<!-- select 이름이나 아이디 검색시 검색 가능하도록-->

				<input type="text" placeholder="ID 또는 이름입력">
				<button type="button" id="searchBtn"
					class="btn mb-1 btn-outline-dark">검색</button>

			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="dropdown-button"
								style="text-align: left; display: inline-block;">
								<div class="btn-group" role="group">
									<button type="button"
										class="btn mb-1 btn-primary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">정렬</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">오름차순</a> <a
											class="dropdown-item" href="#">내림차순</a>
									</div>
								</div>
							</div>
							<div class="active-member">
								<div class="table-responsive" style="display: inline;">
									<table class="table table-xs mb-0">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>최근이용</th>
												<th>상태</th>
												<th>권한</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>test1</td>
												<td>name</td>
												<td>최근이용</td>
												<td>상태</td>
												<td>권한</td>
											</tr>
											<tr>
												<td>test2</td>
												<td>name</td>
												<td>최근이용</td>
												<td>상태</td>
												<td>권한</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
        $("table").append($("<tbody>"));
        $("#btn").click(function () {
            for (data of datas) {
                $('#searchBtn').click(function () {
                    $("<tr>").append($("<td>").html(data.id))
                        .append($("<td>").html(data.name))
                        .append($("<td>").html(data.latestUse))
                        .append($("<td>").html(data.status))
                        .append($("<td>").html($("<button>").html("차단")))
                        .appendTo($("tbody"))
                })
            }
        });

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