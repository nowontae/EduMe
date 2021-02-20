<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div>
	<h2>${ltitle} 후기</h2>
</div>

<table class="table" style="width:50vw">
	<thead>
	<tr scope="col">
		<th>회원ID</th>
		<th>내용</th>
		<th>별점</th>
		<th>작성일</th>
	</tr>
	</thead>	
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td scope="row" colspan="4" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td scope="row" >${dto.mid}</td>
				<td>${dto.rcomment}</td>
				<td>${dto.rscore}</td>
				<td><fmt:formatDate value="${dto.rwritedate}" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>	

<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>