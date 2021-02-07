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
<div>
	<h2>공지 본문</h2>
</div>

<table>
	<tr>
		<td>강의번호 ${dto.lidx}</td>
	</tr>
	
	<tr>
		<td>제목 ${dto.nsubject}</td>
	</tr>
	
	<tr>
		<td colspan="2"><img width="300" height="300" src="img/${dto.nimg}"></td>
	</tr>
	
	<tr>
		<td colspan="2"><textarea readonly rows="6" cols="45" name="ncontent"> ${dto.ncontent}</textarea></td>
	</tr>
</table>
</body>
</html>