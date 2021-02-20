<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#ask{
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
<div id="ask"><h2>문의</h2></div>
<table class="table" style="width:50vw">
<thead>
<tr>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=A">모두보기</a></td>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=Y">답변완료</a></td>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=N">답변미완료</a></td>
</tr>
<tr>
	<th scope="col">번호</th>
	<th scope="col">질문 제목</th>
	<th scope="col">회원 이름</th>
	<th scope="col">강의 제목</th>
	<th scope="col">작성 일자</th>
	<th scope="col">댓글 작성 여부</th>
</tr>
</thead>
<tbody>
<c:if test="${empty list}">
	<tr>
		<td colspan="7" align="center">
			등록된 문의글이 없습니다.
		</td>
	</tr>
</c:if>
<c:forEach var="dto" items="${list}">
	<tr>
		<td scope="row">${dto.lqidx}</td>
		<td><a href="teacherAnswer.do?midx=${dto.midx}&lqidx=${dto.lqidx}">${dto.lqsubject}</a></td>
		<td>${dto.mname}</td>
		<td>${dto.ltitle}</td>
		<td>${dto.lqwritedate}</td>
		<td>${dto.lqreply}</td>
	</tr>
</c:forEach>
</tbody>
<tfoot>
	<tr>
		<td colspan="6" align="center">${str}</td>
	</tr>
</tfoot>
</table>
</body>
</html>