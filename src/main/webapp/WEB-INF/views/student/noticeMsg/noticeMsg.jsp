<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.all{
	height: 900px;
	padding-left:100px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="all">

	<h1>공지사항 알림</h1>
	<h1>안읽은 알림 갯수 : </h1>
	
	<c:forEach var="dto" items="${noticeMsg}">
	11/
	<c:if test="${dto.nread eq 'N'}">
	<a href="class.do?lidx=${dto.lidx}&nidx=${dto.nidx}">n- ${dto.notmsg_content}</a>
	</c:if>
	<c:if test="${dto.nread eq 'Y'}">
	<a href="class.do?lidx=${dto.lidx}&nidx=${dto.nidx}">y- ${dto.notmsg_content}</a>
	</c:if>
	</c:forEach>
	
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>