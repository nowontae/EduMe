<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title{
	margin-bottom: 40px;
    margin-top: 35px;
}
#starAvg{
	padding-left: 80px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div id="title">
	<h2>후기</h2>
</div>

<table class="table">
	<thead>
	<tr>
		<th scope="col" id="starAvg">강의명</th>
		<th scope="col" id="starAvg">평균별점</th>
		<th scope="col">등록날짜</th>
	</tr>
	</thead>	
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td scope="row" colspan="3" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td scope="row" id="starAvg"><a href="teacherReviewContent.do?lidx=${dto.lidx}&ltitle=${dto.ltitle}">${dto.ltitle}</a></td>
				<td id="starAvg">${dto.avggrade}</td>
				<td>${dto.lwritedate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>