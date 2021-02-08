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
<h1>유저 전체 내역</h1>
<table border="1" cellspacing="0">
	<thead>
		<tr>
			<th>회원 고유번호</th>
			<th>프로필사진경로</th>
			<th>회원이름</th>
			<th>ID</th>
			<th>e-mail</th>
			<th>전화번호</th>
			<th>등급</th>
			<th>회원가입일</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4" align="center">등록된 사원이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.midx }</td>
			<td>${dto.mimg }</td>
			<td>${dto.mname }</td>
			<td>${dto.mid }</td>
			<td>${dto.memail }</td>
			<td>${dto.mtel }</td>
			<c:if test="${dto.mgrade== '1' }">
			<td>관리자</td>
			</c:if>
			<c:if test="${dto.mgrade == '2'}">
			<td>강사</td>
			</c:if>
			<c:if test="${dto.mgrade == 'Y'}">
			<td>학생</td>
			</c:if>
			<td>
			<fmt:formatDate  pattern="yyyy년 MM월 dd일" value="${dto.mjoindate }"/>
			
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>