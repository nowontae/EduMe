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
<h3>테스트 동영상 관리</h3>
<table>
	<thead>	
		<tr>
			<th>제목</th>
			<th>등록일자</th>
			<th>관리자 답변 여부</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list}">
	<tr>
		<td>
		등록된 글이 없습니다.
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${list }" >
	<tr>
		<td><a href="TestVideoContent_Management.do?tvidx=${dto.tvidx }">${dto.tvsubject }</a></td>
	
		<td><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.tvwritedate }"/></td>
		<td>
			<c:choose>
				<c:when test="${dto.tvcomment=='N' or dto.tvcomment=='n' }">N</c:when>
				<c:when test="${dto.tvcomment!='N' or dto.tvcomment!='n' }">Y</c:when>
			</c:choose>
			
		</td>
	</tr>
	
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td>${pageStr}</td>
	</tr>
	</tfoot>
</table>
</body>
</html>