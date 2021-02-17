<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>테스트 동영상 관리</h3>
<a href="javascript:history.back();">뒤로</a>
<table>

	<tr>
		<td>${dto.tvsubject }</td>
	</tr>
	<tr>
		<td align="right"><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.tvwritedate }"/></td>
	</tr>
	<tr>
		<td>
		<video id="lec" muted controls style="width:500px" onpause="videoPause(this)"   onended="videoEnded(this)">
     	<source src="${dto.tvvideopath}">
    	<strong>Your browser does not support the video tag.</strong>
 		</video>
 		</td>
	</tr>


<c:choose>
		<c:when test="${dto.tvcomment == 'N' or dto.tvcomment =='n' }"></c:when>
	<c:when test="${dto.tvcomment!='N' or dto.tvcomment!='n' }">
	<tr>
		<th align="left">관리자 답변</th>
	</tr>
	<tr>
		<td>${dto.tvcomment }</td>
	</tr>
	</c:when>
</c:choose>
</table>
<br>

<form action="TestVideoContent_tvcommentAdd.do">
<c:choose>
	
	<c:when test="${dto.tvcomment == 'N' or dto.tvcomment =='n' }">
<table>
	<tr>
		<th colspan="2" align="left">관리자 답변</th>
	</tr>
	
	<tr>
		<td>
			<input type="hidden" name="tvidx" value="${dto.tvidx }">
			<textarea rows="10" cols="50" name="tvcomment"></textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="답변달기">
		</td>
	</tr>

</table>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
</form>
<a href="admin.do">관리자 페이지</a>
</body>
</html>