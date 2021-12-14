<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
form > input {
	border: 1px solid rgb(128, 128, 128);
	border-radius: 10px;
	background-color: white;
	color: rgb(128, 128, 128);
	padding: 8px;
	margin-top: 15px;
	
}

form > input:hover {
	background-color: rgb(128, 128, 128);
	color: white;
}

</style>
</head>
<body>
<div align="center">
	<div id="hostFormName">숙소 등록</div>
	<div>
		<form id="frm" action="#" method="post"> 
		<div>
			<table>
				<tr>
					<th width="150">숙소번호</th>
					<td width="150">${rno }</td>
					<th width="150">아이디</th>
					<td width="150" style="text-align:left">${id }</td>
				</tr>
				<tr>
					<th style="padding:20px">숙소유형</th>
					<td>
						<select name="type1" id="type1">
							  <option value="1">빌딩</option>
							  <option value="2">아파트</option>
							  <option value="3">주택</option>
						</select>
					</td>
					<th style="padding:20px">숙소종류</th>
					<td>
						<select name="type2" id="type2">
							  <option value="1">개인실</option>
							  <option value="2">다인실</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>숙소이름</th>
					<td style="text-align:left">
						<input type="text" id="title" name="title" size="25">
					</td>
					<th>숙소인원</th>
					<td style="text-align:left">
						<input type="text" id="pnum" name="pnum" size="25">
					</td>
				</tr>
				<tr>
					<th style="padding:20px">침대</th>
					<td>
						<select name="bed" id="bed">
							  <option value="1">single</option>
							  <option value="2">double</option>
						</select>
					</td>
					<th style="padding:20px">욕실</th>
					<td>
						<select name="bath" id="bath">
							  <option value="1">1</option>
							  <option value="2">2</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>숙소주소</th>
					<td colspan="3" style="text-align:left">
					<input type="text" id="address" name="address" size="95">
					</td>
				</tr>
				<tr>
					<th>숙소설명</th>
					<td colspan="3">
						<textarea rows="6" cols="100" id="subject" name="subject"></textarea>
					</td>
				</tr>
				<tr>
					<th>1박요금</th>
					<td colspan="3" style="text-align:left">
					<input type="text" id="onedayfee" name="onedayfee" size="25">&nbsp원</td>
				</tr>
				<tr>
					<th>편의시설....</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<th>숙소사진</th>
					<td colspan="3" style="text-align:left">
						<input  type="file" id="image" name="image">
					</td>
				</tr>
			</table>
		</div><br>
			<input type="submit" value="저 장" > &nbsp;&nbsp;&nbsp;
			<input type="reset" onclick="history.back()" value="취 소">
		</form>
	</div>
</div>
</body>
</html>