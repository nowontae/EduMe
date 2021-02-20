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
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div>
	<h2>공지 본문</h2>
</div>

<table class="table" style="width:50%">
	<tr>
		<td scope="row"  >강의 이름 </td>
		<td >${dto.ltitle}</td>
	</tr>
	
	<tr>
		<td scope="row">공지 제목 </td>
		<td>${dto.nsubject}</td>
	</tr>
	
	<tr>
		<td scope="row">공지 사진 </td>
		<td><img width="300" height="300" src="${dto.nimg}"></td>
	</tr>
	
	<tr>
		<td scope="row">공지 내용</td>
		<td><textarea readonly rows="6" cols="45" name="ncontent"> ${dto.ncontent}</textarea></td>
	</tr>
</table>

<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>