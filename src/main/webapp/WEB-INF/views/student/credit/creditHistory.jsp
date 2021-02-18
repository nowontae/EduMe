<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<h1>크레딧</h1>

<c:forEach var="dto" items="${creditHistory }">
	크레딧 / ${dto.camount } /
	 <c:if test="${dto.ccode==1}">추가됨</c:if>
	 <c:if test="${dto.ccode==4}">사용됨</c:if> / <fmt:formatDate value="${dto.cpaydate }" pattern="yyyy년 MM월 dd일"/> 
</c:forEach>
</body>
</html>