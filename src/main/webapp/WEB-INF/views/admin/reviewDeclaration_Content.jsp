<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>리뷰 신고 글</h3>
<form name="Declaration_approved"  action="Declaration_approved.do">


<table border="1">
	<tr>	
		<th>처리 결과</th>
		<td>${dto.dstatus }
		<input type="hidden" name="midx" value="${dto.midx_to }">
		<input type="hidden" name="didx" value="${dto.didx }">
		</td>
	</tr>
	<tr>	
		<th>수강하는 강의명</th>
		<td>${dto.ltitle }</td>
	</tr>
	<tr>	
		<th>신고하는 사람</th>
		<td>${dto.m_from_name}</td>
	</tr>
	<tr>	
		<th>신고받는 사람</th>
		<td>${dto.m_to_name }</td>
	</tr>
	<tr>	
		<th>신고하는 댓글</th>
		<td><textarea rows="10" cols="50"  readonly="readonly" >${dto.rcomment}</textarea></td>
	</tr>
	<tr>	
		<th>신고하는 사유</th>
		<td><textarea rows="10" cols="50"  readonly="readonly" >${dto.dreason }</textarea></td>
	</tr>
	<tr>	
		<th>신고하는 시간</th>
		<td>${dto.ddate }</td>
	</tr>
	

	<c:if test="${dto.dstatus eq '0' }">
	<tr>
		<td colspan="2" align="center">

			<input type="submit" value="승인">
			<input type="button" value="미승인" onclick="location.href='Declaration_Notapproved.do?didx=${dto.didx}'">
		</td>
	</tr>
	</c:if>
	<c:if test="${dto.dstatus eq 'Y'}">
	</c:if>
	<c:if test="${dto.dstatus eq 'N'}">
	</c:if>
	
</table>
</form>
<a href="admin_reviewDeclaration.do">목록</a>
</body>
</html>