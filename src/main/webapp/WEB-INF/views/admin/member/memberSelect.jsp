<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-body">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admin.do">Main</a></li>
					<li class="breadcrumb-item"><a href="adminMemberList.do">User
							Management</a></li>
					<li class="breadcrumb-item active">User Detail</li>
				</ol>
			</div>
		</div>

		<div class="container-fluid">
			<div id="row">
				<div class="card">
					<div class="card-body pl-5 pr-5">
						<div class="row d-flex justify-content-between">
							<div class="col-6 d-flex align-items-end">
								<div class="row">
									<h3 class="d-inline mt-1 mb-2 text-warning">User Detail</h3>
								</div>
							</div>
							<div class="col-6 d-flex justify-content-end">
								'
								<div class="row">
									<select id="selectAuthor" name="selectAuthor"
										class="form-control" style="width: 95px; height: 40px;">
										<option value="USER">USER</option>
										<option value="HOST">HOST</option>
										<option value="ADMIN">ADMIN</option>
										<option value="BAN">BAN</option>
									</select>
									<button id="authorChange" type="button"
										class="btn btn-outline-dark" style="height: 40px;">으로
										권한 수정</button>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<table class="table text-center">
								<tr>
									<th class="p-4 align-middle">ID</th>
									<td class="align-middle" colspan="2">${member.id}</td>
								</tr>
								<tr>
									<th class="align-middle" rowspan="2">이름 / 상태</th>
									<th class="p-4 align-middle">이름</th>
									<td class="align-middle">${member.name }</td>
								</tr>
								<tr>
									<th class="p-4 align-middle">상태</th>
									<td class="align-middle">${member.status }</td>
								</tr>
								<tr>
									<th class="align-middle" rowspan="2">전화번호 / 성별</th>
									<th class="p-4 align-middle">전화번호</th>
									<td class="align-middle">${member.tel }</td>
								</tr>
								<tr>
									<th class="p-4 align-middle">성별</th>
									<td class="align-middle">${member.gender }</td>
								</tr>
								<tr>
									<th class="align-middle" rowspan="2">권한 / 가입날짜</th>
									<th class="p-4 align-middle">권한</th>
									<td id="tdAuthor" class="align-middle">${member.author}</td>
								</tr>
								<tr>
									<th class="p-4 align-middle">가입날짜</th>
									<td class="align-middle">${member.joinDate }</td>
								</tr>
								<c:if test="${not empty member.kakao or not empty member.naver}">
									<tr>
										<th class="p-4 align-middle">SNS 연동</th>
										<td class="align-middle" colspan="2">
											<div class="d-flex justify-content-around">
												<c:if test="${member.naver eq 'Y'}">
													<div class="row">
														<img alt="naver" src="resources/img/naverLogo.png" height="30">
														<h6 class="text-muted ml-2 mt-1">네이버 연동</h6>
													</div>
												</c:if>
												<c:if test="${member.kakao eq 'Y'}">
													<div class="row">
														<img alt="naver" src="resources/img/kakaoLogo.png" height="30">
														<h6 class="text-muted ml-2 mt-1">카카오 연동</h6>
													</div>
												</c:if>
											</div>
										</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.querySelector('#selectAuthor > option[value="${member.author}"]').setAttribute('selected','selected');	
	
		document.getElementById('authorChange').addEventListener('click',function(){
			let author = document.getElementById('selectAuthor').value;
			let myAuthor = document.getElementById('tdAuthor').innerHTML;
			if(author != myAuthor){
				fetch('memberAuthorUpdate.do',{
					method : 'post',
					headers :{"Content-type":"application/x-www-form-urlencoded"},
					body : "author="+author+'&id='+'${member.id}'
				})
				.then(
					response => response.text()	
				)
				.then(data =>{
					if(data.trim() === 'Y'){
						alert('권한 수정을 완료하였습니다.')
						document.getElementById('tdAuthor').innerHTML = author;
					}else if(data.trim() === 'N'){
						alert('권한 수정에 실패하였습니다.')
					}
				})
			}
		});
	</script>
</body>
</html>