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
<%@include file="/WEB-INF/views/header.jsp" %>

<h1>구매 내역</h1>
<ul>
<c:forEach var="dto" items="${purchaseHistory }">
	<li>${dto.ltitle }, ${dto.pdate }, ${dto.pprice }</li>
</c:forEach>
</ul>
</body>
</html>