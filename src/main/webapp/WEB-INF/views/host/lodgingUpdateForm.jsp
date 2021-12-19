<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
$(function(){
	var rno = $('#rno').val();
	
	$.ajax({
		method : 'post',
		url : "updataFormAjax.do",
		data : {
			rno : rno
		}, 
		success : function(data){
			$.each(data, function(vo,  val){
				if(vo == 'rcategory' && val == '한옥'){
					$("#type1>option:eq(0)").prop("selected", true);
				}
				else if(vo == 'rcategory' && val == '호텔'){
					$("#type1>option:eq(1)").prop("selected", true);
				}
				else if(vo == 'rcategory' && val == '게스트하우스'){
					$("#type1>option:eq(2)").prop("selected", true);
				}
				
				else if(vo == 'rtype' && val == '개인실'){
					$("#type2>option:eq(0)").prop("selected", true);
				}
				else if(vo == 'rtype' && val == '다인실'){
					$("#type2>option:eq(1)").prop("selected", true);
				}
				
				else if(vo == 'rbed' && val == '1'){
					$("#type2>option:eq(0)").prop("selected", true);
				}
				else if(vo == 'rbed' && val == '2'){
					$("#type2>option:eq(1)").prop("selected", true);
				}
				
				else if(vo == 'rbath' && val == '1'){
					$("#type2>option:eq(0)").prop("selected", true);
				}
				else if(vo == 'rbath' && val == '2'){
					$("#type2>option:eq(1)").prop("selected", true);
				}
				
				
				
				else if(vo == 'am1' && val == 'Y'){
					$("input:checkbox[id='am1']").prop("checked", true);
				}
				else if(vo == 'am2' && val == 'Y'){
					$("input:checkbox[id='am2']").prop("checked", true);
				}
				else if(vo == 'am3' && val == 'Y'){
					$("input:checkbox[id='am3']").prop("checked", true);
				}
			})
		}
	})
	
})
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.nice-select{
	display : none !important;
}

#type1,#type2,#bed,#bath {
	display : block !important;
}

#lodgingInfoUpdateName {
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
	vertical-align: top;
	color: #fff;
	background: #231141;
}

table td {
	padding: 10px;
	vertical-align: top;
	border-bottom: solid #ccc;
}

form>input {
	border: 1px solid rgb(128, 128, 128);
	border-radius: 10px;
	background-color: white;
	color: rgb(128, 128, 128);
	padding: 8px;
	margin-top: 15px;
}

form>input:hover {
	background-color: rgb(128, 128, 128);
	color: white;
}
</style>
</head>
<body>

	<div align="center">
		<div id="lodgingInfoUpdateName">숙소 정보 수정</div>
		<div>
			<form id="frm" method="post" enctype="multipart/form-data">
				<div>
					<table>
						<tr>
							<th width="150">숙소번호</th>
							<td width="150" style="text-align: left">${thislodge.rno }</td>
							<th width="150">아이디</th>
							<td width="150" style="text-align: left">${thislodge.id }</td>
						</tr>
						<tr>
							<th style="padding: 20px">숙소유형</th>
							<td>
								<select name="type1" id="type1">
									<option id="house1" value="한옥">한옥</option>
									<option id="house2" value="호텔">호텔</option>
									<option id="house3" value="게스트하우스">게스트하우스</option>
								</select>
							</td>
							<th style="padding: 20px">숙소종류</th>
							<td>
								<select name="type2" id="type2">
									<option id="room1" value="개인실">개인실</option>
									<option id="room2" value="다인실">다인실</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>숙소이름</th>
							<td style="text-align: left">
								<input type="text" id="title" name="title" size="25" value="${thislodge.rname }">
							</td>
							<th>숙소인원</th>
							<td style="text-align: left">
								<input type="text" id="pnum" name="pnum" size="25" value="${thislodge.rguest }">
							</td>
						</tr>
						<tr>
							<th>체크인</th>
							<td style="text-align: left">
								<input type="text" id="checkin" name="checkin" size="25" value="${thislodge.rcheckin }">
							</td>
							<th>체크아웃</th>
							<td style="text-align: left">
								<input type="text" id="checkout" name="checkout" size="25" value="${thislodge.rcheckout }">
							</td>
						</tr>
						<tr>
							<th style="padding: 20px">침대</th>
							<td>
								<select name="bed" id="bed">
									<option value="1">single</option>
									<option value="2">double</option>
								</select>
							</td>
							<th style="padding: 20px">욕실</th>
							<td>
								<select name="bath" id="bath">
									<option value="1">1</option>
									<option value="2">2</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>숙소전화번호</th>
							<td colspan="3" style="text-align: left">
								<input type="text" id="tel" name="tel" size="95" value="${thislodge.rtel }" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}" maxlength="11">
							</td>
						</tr>
						<tr>
							<th>숙소주소</th>
							<td colspan="3" style="text-align: left">
								<input type="text" id="address" name="address" size="95" value="${thislodge.raddress }">
							</td>
						</tr>
						<tr>
							<th>숙소설명</th>
							<td colspan="3">
								<textarea rows="6" cols="100" id="subject" name="subject">${thislodge.rcontent }</textarea>
							</td>
						</tr>
						<tr>
							<th>1박요금</th>
							<td colspan="3" style="text-align: left">
								<input type="text" id="onedayfee" name="onedayfee" size="25" value="${thislodge.fee }">&nbsp원
							</td>
						</tr>
						<tr>
							<th>편의시설</th>
							<td colspan="3" style="text-align: left">
									<label><input type="checkbox" id="am1" name="am1" value="Y">&nbsp wifi</label>
									<label><input type="checkbox" id="am2" name="am2" value="Y">&nbsp 주방</label>
									<label><input type="checkbox" id="am3" name="am3" value="Y">&nbsp 편의점</label>
							</td>
						</tr>
						<!-- 
						<tr>
							<th>숙소사진</th>
							<td colspan="3" style="text-align: left">
								<input type="file" multiple="multiple" id="image" name="image">
							</td>
						</tr>
						 -->
					</table>
				</div>
				<br> 
				<div>
					<button type="button" id="btn1">저장</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" id="btn2" onclick="history.back()">수정취소</button>
					<input type="hidden" id="rno" name="rno" value="${thislodge.rno }">
					<input type="hidden" id="id" name="id" value="${thislodge.id }">
				</div>
			</form>
		</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		$("#btn1").click(function(){
			frm.action= "lodgingUpdate.do";
			frm.submit();
		});
	})
	
	$(function(){
		    $("#address").on("click", function(){ 
		        new daum.Postcode({
		            oncomplete: function(data) { 
		            	 var roadAddr = data.roadAddress; 
		                 var jibunAddr = data.jibunAddress; 
		                 if(roadAddr !== ''){
		                     $("#address").val(roadAddr);
		                 } 
		                 else if(jibunAddr !== ''){
		                     $("#address").val(jibunAddr);
		                 }
		            }
		        }).open();
		    });
		});




		$('#pnum').on('keyup', function() {
			if (/\D/.test(this.value)) {
				this.value = this.value.replace(/\D/g, '')
				alert('1 ~ 10명만 입력가능합니다.');
			}
			if (this.value > 10) {
				this.value = 10;
				alert('10명까지만 가능합니다.');
			}
		});

		$('#checkin').on('keyup', function() {
			if (/\D/.test(this.value)) {
				this.value = this.value.replace(/\D/g, '')
				alert('0~24만 입력가능합니다.');
			}
			if (this.value > 24) {
				this.value = 24;
				alert('24시까지만 입력가능합니다.');
			}
		});

		$('#checkout').on('keyup', function() {
			if (/\D/.test(this.value)) {
				this.value = this.value.replace(/\D/g, '')
				alert('0~24만 입력가능합니다.');
			}
			if (this.value > 24) {
				this.value = 24;
				alert('24시까지만 입력가능합니다.');
			}
		});

		$('#onedayfee').on('keyup', function() {
			if (/\D/.test(this.value)) {
				this.value = this.value.replace(/\D/g, '')
				alert('숫자만 입력가능합니다.');
			}
		});

		var patt = new RegExp("[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}");
		var res = patt.test($("#tel").val());
		
		$('#tel').on('keyup', function() {
			let inputValue = this.value; 
			this.value = inputValue.replace(/[^0-9]/gi, '');
		})
	</script>
</body>
</html>