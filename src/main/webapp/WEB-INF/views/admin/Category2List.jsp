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
<div><a href="CategoryCheck.do">대분류</a> > 중분류</a></div>
<h3>카테고리 관리</h3>
<table border="1" cellspacing="1">
<div>${cat_name1} > </div>

<c:if test="${empty list }">
<br>
	<tr>
		<td>등록된 카테고리(중분류)가 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${list }">
	<tr>
		<td>
		<input type="hidden" value="${dto.cat2_idx}">


		<a href="Category3List.do?cat_name2=${dto.cat_name }&cat1_idx=${dto.cat1_idx}&cat2_idx=${dto.cat2_idx}&cat_name1=${cat_name1 }">${dto.cat_name}</a></td>
		<td><input type="button" value="삭제" onclick="location.href='Category2Delete.do?cat2_idx=${dto.cat2_idx}&cat_name=${dto.cat_name }&cat1_idx=${dto.cat1_idx}&cat_name1=${cat_name1 }'"></td>
	</tr>
	
</c:forEach>
</table>

<form action="Category2Add.do"> 
	<table>
		<tr>
			<td>
				<input type="hidden" name="cat1_idx" value="${cat1_idx}">
				<input type="hidden" name="cat_name1" value="${cat_name1}">
				
				<input type="text" name="cat_name" required="required">
				<input type="submit" value="중분류 추가">
			</td>
		</tr>
	</table>
</form>
<a href="admin.do">관리자 페이지</a>
</body>
</html>