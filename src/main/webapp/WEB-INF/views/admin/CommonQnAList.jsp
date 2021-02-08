<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>문의사항</h3>
<a href="admin_CommonQnAList.do">전체</a> | <a href="admin_CommonQnAListComplete.do">답변완료</a> |<a href="admin_CommonQnAListNotComplete.do"> 답변 미완료</a>
<hr>
<table border="1">
<thead>
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>질문시간</th>
		<th>댓글작성여부</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4"> 등록된  문의사항이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td><a href="commonQnaContent.do?cqidx=${dto.cqidx }">${dto.lqsubject }</a></td>
			<td>${dto.mname }</td>
			<td>
			<fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.lqwritedate }"/>
			</td>
			<td>${dto.cqreply }</td>
			
		</tr>

	</c:forEach>

</tbody>
	<tfoot>
		<tr>
			<td colspan="4">${pageStr }</td>
		</tr>
	</tfoot>
</table>
<a href="admin.do">관리자 페이지</a>
</body>
</html>