<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			nofrm.action = "lodgingUpdateForm.do";
			nofrm.submit();
		});
		$("#btn2").click(function() {
			Swal.fire({
				text : "이 글을 삭제하시겠습니까?",
				showCancelButton: true,
				confirmButtonText : '삭제',
				cancelButtonText : '취소'
			}).then((result)=>{
			if (result.isConfirmed){
				Swal.fire(
						nofrm.action = "lodgingDelete.do",
						nofrm.submit()
				)
			}
			})
			
		});
	});
</script>
<style>
#lodgeInfoFormName {
	font-weight: bolder;
	padding: 40px;
	font-size: x-large;
}

table {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}

table th {
	text-align: center;
	padding: 10px;
	font-weight: bold;
	color: #fff;
	background: #231141;
}

table td {
	padding: 10px;
	border-bottom: solid #ccc;
	text-align:left;
	margin: 0px;
}

form input {
	border: 1px solid rgb(128, 128, 128);
	border-radius: 10px;
	background-color: white;
	color: rgb(128, 128, 128);
	padding: 8px;
	margin-top: 15px;
}
table img{
	width: 50rem;
}

form input:hover {
	background-color: rgb(128, 128, 128);
	color: white;
}
.btns{
	margin-bottom: 3rem;
	display: flex;
	justify-content: center;
}
.btns button{
	margin:0.5rem;
	padding: 0.5rem 1rem;
	border-radius: 1rem;
	cursor: pointer;
	border: 1px solid white;
	background-color: #F3C300;
	font-weight: bold;
}

#btn1, #btn2, #btn3,.state1, .state2{
	margin-bottom: 3rem;
	padding: 0.5rem 1rem;
	border-radius: 1rem;
	cursor: pointer;
	border: 1px solid white;
	background-color: #F3C300;
	font-weight: bold;
}

#btn3, #btn2{
	background-color: lightgray;
}
.state1, .state2{
	background-color: #77C5FD;
	color:white;
}

</style>
</head>
<body>
<div align="center">
		<div id="lodgeInfoFormName">숙소 정보</div>
				<div>
					<table>
						<tr>
							<th width="150">숙소번호</th>
							<td width="150">${thislodge.rno }</td>
							<th width="150">아이디</th>
							<td width="150">${thislodge.id}</td>
						</tr>
						<tr>
							<th>숙소유형</th>
							<td>${thislodge.rcategory}</td>
							<th>숙소종류</th>
							<td>${thislodge.rtype}</td>
						</tr>
						<tr>
							<th>숙소이름</th>
							<td>${thislodge.rname}</td>
							<th>숙소인원</th>
							<td>${thislodge.rguest}</td>
						</tr>
						<tr>
							<th>체크인</th>
							<td>${thislodge.rcheckin}</td>
							<th>체크아웃</th>
							<td>${thislodge.rcheckout}</td>
						</tr>
						<tr>
							<th>침대</th>
							<td>${thislodge.rbed}</td>
							<th>욕실</th>
							<td>${thislodge.rbath}</td>
						</tr>
						<tr>
							<th>숙소전화번호</th>
							<td colspan="3">${thislodge.rtel}</td>
						</tr>
						<tr>
							<th>숙소주소</th>
							<td colspan="3">${thislodge.raddress}</td>
						</tr>
						<tr>
							<th>숙소설명</th>
							<td colspan="3">${thislodge.rcontent}</td>
						</tr>
						<tr>
							<th>1박요금</th>
							<td colspan="3"><fmt:formatNumber>${thislodge.fee}</fmt:formatNumber>원</td>
						</tr>
						<tr>
							<th>편의시설</th>
							<td colspan="3">
								<c:if test="${thislodge.am1 == 'Y'}">
									wifi 
								</c:if>
								<c:if test="${thislodge.am2 == 'Y'}">
									주방 
								</c:if>
								<c:if test="${thislodge.am3 == 'Y'}">
									편의점 
								</c:if>
							</td>
						</tr>
						<tr>
							<th>숙소사진</th>
							<td colspan="3">
								<img alt="" src="${thislodge.rphoto}">
							</td>
						</tr>
					</table>
				</div>
				<br> 

				<div>
					<div>
						<input type="button" id="btn1" value="수정">
						<c:if test="${thislodge.ruse eq 'Y'}">
						<input type="button" value="현재 사용 전 / 상태변경" class="state1" style="background-color: darkred;">
						</c:if>
						<c:if test="${thislodge.ruse eq 'N'}">
						<input type="button" value="현재 사용중 / 상태변경" class="state2">
						</c:if>
						<input type="button" id="btn2" value="삭제">
						<input type="reset" onclick="location.href='hostManage.do'" value="돌아가기" id="btn3"> 
					</div>

				<div>
					<form id="nofrm" method="get">
						<input type="hidden" id="rno" name="rno" value="${thislodge.rno }">
					</form>
				</div>
		</div></div>
		<script type="text/javascript">
			$('.state1').on('click',()=>{
				let param = {rno:${thislodge.rno },ruse:'N'};
				console.log(param)
				updateState('updateState.do',param);
			})
			$('.state2').on('click',()=>{
				let param = {rno:${thislodge.rno },ruse:'Y'};
				console.log(param)
				updateState('updateState.do',param);
			})
			
			let updateState = function(action, param){
				$.ajax({
					url : action,
					method : 'post',
					data : param,
					dataType : 'text'
				})
				.done((response)=>{
					console.log(response);
					if(response=='ok'){
						window.alert('변경이 완료되었습니다.');
						location.href='hostManage.do?ruse=A';
					}else{
						window.alert('알 수 없는 에러가 발생하였습니다. 관리자에게 문의주세요.');
					}
				})
			}
		</script>
</body>
</html>