<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>문의</h2>
<table>
<thead>
<tr>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=A">모두보기</a></td>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=Y">답변완료</a></td>
	<td colspan="2"><a href="teacherAsk.do?cp=1&midx=${midx}&boardtype=N">답변미완료</a></td>
</tr>
<tr>
	<th>문의 고유번호</th>
	<th>제목</th>
	<th>회원 고유번호</th>
	<th>강의 고유번호</th>
	<th>작성 일자</th>
	<th>댓글 작성 여부</th>
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
		<td>${dto.lqidx}</td>
		<td><a href="teacherAnswer.do?midx=${dto.midx}&lqidx=${dto.lqidx}">${dto.lqsubject}</a></td>
		<td>${dto.midx}</td>
		<td>${dto.lidx}</td>
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