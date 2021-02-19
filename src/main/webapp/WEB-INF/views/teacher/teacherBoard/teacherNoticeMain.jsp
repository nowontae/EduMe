<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#notice{
	margin-bottom: 40px;
    margin-top: 35px;
}
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div id="notice">
	<h2>공지</h2>
</div>
<table class="table">
	<thead>
	<tr>
		<th>글번호</th>
		<th>강의 번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>첨부이미지</th>
		<th>작성시간</th>
	</tr>
	</thead>	
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.nidx}</td>
				<td>${dto.lidx}</td>
				<td><a href="teacherNoticeContent.do?nidx=${dto.nidx}">${dto.nsubject}</a></td>
				<td>${dto.ncontent}</td>
				<td><img width="100" height="100" src="${dto.nimg}"></td>
				<td>${dto.nwritedate}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" align="center">${pageStr}</td>
			<td><a href="teacherNoticeWrite.do">글쓰기</a></td>
		</tr>
	</tfoot>
</table>
<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>