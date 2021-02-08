<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>장바구니</h3>
<hr>
<form>
	
	<table border="1" width="600">
		<tr>
			<td rowspan="3"><input type="checkbox" id="lectureName"></td>
			<td rowspan="3">이미지</td>
			<td>강의명</td>
			<td>원래금액</td>
		</tr>
		<tr>
			<td>강의소개</td>
			<td>최종금액</td>
		</tr>
	</table>
	<input type="button" value="제거">
	<input type="submit" value="결제">
</form>
</body>
</html>