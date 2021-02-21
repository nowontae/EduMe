<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#blankBottom{
    padding-bottom: 5px;
}
#title{
	margin-bottom: 10px;
}
table td {
	vertical-align: middle !important;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>

	<div id="lecture" class="my-5">
		<h2>강좌</h2>
			<div id="blankBottom">강좌 검토 과정에 최대 6일이 소요될 수 있습니다. EduMe에 강좌를 생성해보세요!</div>
			<div><input class="btn btn-primary" type="button" onclick="javascript:location.href='createLectureMain.do'" value="신규 강좌"></div>
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
	</table>
	</div>
	
	
	
	<div class="my-5" style="width:50vw">
	<div id="title"><h4>등록대기 강의</h4></div>
	<table class="table">
	<thead>
		<tr>
			<th scope="col">썸네일경로</th>
			<th scope="col">강의 제목</th>
			<th scope="col">기본 가격</th>
			<th scope="col">등록날짜</th>
		</tr>
	</thead>

	<tbody>
		<c:if test="${empty list1 }">
		<tr>
			<td colspan="4">등록된 게시물이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list1}">
		<tr>
			<td scope="row"><img width="200" height="100" src="img/${dto.lthumnail}"></td>
			<td><a href="lectureContentSee.do?lidx=${dto.lidx}">${dto.ltitle}</a></td>
			<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.lorignprice}" /></td>
			<td><fmt:formatDate value="${dto.lwritedate}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>



	<div class="my-5" style="width:50vw">
	<div id="title" ><h4>작성 중인 강의</h4></div>
	<table class="table">
	<thead>
		<tr>
			<th scope="col">썸네일경로</th>
			<th scope="col">강의 제목</th>
			<th scope="col">기본 가격</th>
			<th scope="col">등록날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list2 }">
		<tr>
			<td colspan="13">등록된 게시물이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${list2}">
		<tr>
			<td scope="row"><img width="200" height="100" src="img/${dto.lthumnail}"></td>
			<td><a href="createLectureUpdate.do?lidx=${dto.lidx}">${dto.ltitle}</a></td>
			<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.lorignprice}" /></td>
			<td><fmt:formatDate value="${dto.lwritedate}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
	
<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>	
	
		
</body>
</html>