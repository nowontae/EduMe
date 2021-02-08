<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>후기</h2>
</div>

<div>
	<select>
		<option>강의명</option>
		<option value="${dto.lidx}">${dto.ltitle}</option>
	</select>
</div>

<table>
	<thead>
	<tr>
		<th>리뷰 순서</th>
		<th>회원 번호</th>
		<th>강의 번호</th>
		<th>내용</th>
		<th>별점</th>
		<th>작성일</th>
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
				<td>${dto.ridx}</td>
				<td>${dto.midx}</td>
				<td>${dto.lidx}</td>
				<td>${dto.rcomment}</td>
				<td>${dto.rscore}</td>
				<td>${dto.rwritedate}</td>
			</tr>
		</c:forEach>
	</tbody>
	
</table>
</body>
</html>