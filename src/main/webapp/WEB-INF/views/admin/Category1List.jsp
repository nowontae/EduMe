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
<div>대분류</div>
<h3>카테고리 관리</h3>
<table border="1" cellspacing="1">

<c:if test="${empty list }">
	<tr>
		<td>등록된 카테고리(대분류)가 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${list }">
	<tr>
		<td>
		<input type="hidden" value="${dto.cat1_idx}">

		<a href="Category2List.do?cat_name1=${dto.cat_name }&cat1_idx=${dto.cat1_idx}">${dto.cat_name}</a></td>
		<td><input type="button" value="삭제" onclick="location.href='Category1Delete.do?cat1_idx=${dto.cat1_idx}'"></td>
	</tr>
	
</c:forEach>
</table>

<form action="Category1Add.do"> 
	<table>
		<tr>
			<td>
				<input type="hidden" value="${dto.cat1_idx}">
				<input type="text" name="cat_name" required="required">
				<input type="submit" value="대분류 추가">
			</td>
		</tr>
	</table>
</form>
<a href="admin.do">관리자 페이지</a>
</body>
</html>