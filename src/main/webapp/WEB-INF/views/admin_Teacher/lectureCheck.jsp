<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="css/teacherMain.css?ver=2">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<style type="text/css">
table {
	margin:0px auto;
}
</style>
</head>
<body>

<input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" >

<div>
	<h2>강의리스트 관리</h2>
</div>


<div>
	<span>공개 여부</span>
	<span> / </span>
	<span><a href="lectureCheckY.do">공개 중</a></span>
	<span> / </span>
	<span><a href="lectureCheck.do">공개 불가</a></span>
</div>

<div class="my-5">
	<h4>등록된 강의</h4>
	<table class="table" style="width:50vw">
	<thead>
		<tr>
			<th scope="col">썸네일경로</th>
			<th scope="col">강의 제목</th>
			<th scope="col">기본 가격</th>
			<th scope="col">등록날짜</th>
		</tr>
	</thead>

	<tbody>
		<c:if test="${empty list }">
		<tr>
			<td colspan="4">등록된 게시물이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td scope="row"><img width="200" height="100" src="img/${dto.lthumnail}"></td>
			<td><a href="lectureContentSee.do?lidx=${dto.lidx}">${dto.ltitle}</a></td>
			<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.lorignprice}" /></td>
			<td><fmt:formatDate value="${dto.lwritedate}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
		</c:forEach>
		<tfoot>
		<tr>
			<td colspan="15" align="center">${pageStr}</td>
		</tr>
		</tfoot>
	</table>
</div>

</body>
</html>