<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#hostFormName {
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
		<div id="hostFormName">숙소 등록</div>
		<div>
			<form id="frm" action="lodgingResister.do" method="post"
				enctype="multipart/form-data">
				<div>
					<table>
						<tr>
							<th width="150">숙소번호</th>
							<td width="150" style="text-align: left">${lodNum }</td>
							<th width="150">아이디</th>
							<td width="150" style="text-align: left">${id }<input
								type="hidden" id="id" name="id" value="${id }">
							</td>
						</tr>
						<tr>
							<th style="padding: 20px">숙소유형</th>
							<td><select name="type1" id="type1">
									<option value="빌딩">빌딩</option>
									<option value="아파트">아파트</option>
									<option value="주택">주택</option>
							</select></td>
							<th style="padding: 20px">숙소종류</th>
							<td><select name="type2" id="type2">
									<option value="개인실">개인실</option>
									<option value="다인실">다인실</option>
							</select></td>
						</tr>
						<tr>
							<th>숙소이름</th>
							<td style="text-align: left"><input type="text" id="title"
								name="title" size="25" placeholder="보여질 숙소 이름을 입력해주세요">
							</td>
							<th>숙소인원</th>
							<td style="text-align: left"><input type="text" id="pnum"
								name="pnum" size="25"></td>
						</tr>
						<tr>
							<th>체크인</th>
							<td style="text-align: left"><input type="text" id="checkin"
								name="checkin" size="25" placeholder="체크인 시간을 입력해주세요"></td>
							<th>체크아웃</th>
							<td style="text-align: left"><input type="text"
								id="checkout" name="checkout" size="25"
								placeholder="체크아웃 시간을 입력해주세요"></td>
						</tr>
						<tr>
							<th style="padding: 20px">침대</th>
							<td><select name="bed" id="bed">
									<option value="1">single</option>
									<option value="2">double</option>
							</select></td>
							<th style="padding: 20px">욕실</th>
							<td><select name="bath" id="bath">
									<option value="1">1</option>
									<option value="2">2</option>
							</select></td>
						</tr>
						<tr>
							<th>숙소전화번호</th>
							<td colspan="3" style="text-align: left"><input type="text"
								id="tel" name="tel" size="95"
								placeholder="전화번호를 입력해주세요(ex:010-1111-1111)"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
							</td>
						</tr>
						<tr>
							<th>숙소주소</th>
							<td colspan="3" style="text-align: left"><input type="text"
								id="address" name="address" size="95"></td>
						</tr>
						<tr>
							<th>숙소설명</th>
							<td colspan="3"><textarea rows="6" cols="100" id="subject"
									name="subject"></textarea></td>
						</tr>
						<tr>
							<th>1박요금</th>
							<td colspan="3" style="text-align: left"><input type="text"
								id="onedayfee" name="onedayfee" size="25">&nbsp원</td>
						</tr>
						<tr>
							<th>편의시설</th>
							<td colspan="3" style="text-align: left"><label><input
									type="checkbox" id="am1" name="am1" value="Y">&nbsp
									wifi</label> <label><input type="checkbox" id="am2" name="am2"
									value="Y">&nbsp 주방</label> <label><input
									type="checkbox" id="am3" name="am3" value="Y">&nbsp 편의점</label>
							</td>
						</tr>
						<tr>
							<th>숙소사진</th>
							<td colspan="3" style="text-align: left"><input type="file" multiple="multiple"
								id="image" name="image" ></td>
						</tr>
					</table>
				</div>
				<br> <input type="submit" value="저 장">
				&nbsp;&nbsp;&nbsp; <input type="reset" onclick="history.back()"
					value="취 소">
					<input type="hidden" id="rno" name="rno" type="${lodNum }">
			</form>
		</div>
	</div>
<script>
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

	var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
	var res = patt.test($("#tel").val());

	if (!patt.test($("#tel").val())) {
		alert("전화번호를 정확히 입력하여 주십시오.");
		return false;
	}
</script>
</body>
</html>