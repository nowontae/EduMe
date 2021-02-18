<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>
.all{
	height: 900px;
	padding-left:100px;
}
table {
	width:800px;
    border: 0px solid  ;
    text-align: center;

}
th, td{
		border-bottom: 1px solid #000000;

}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="all">

<h3>크레딧 내역</h3>

<!-- ccode : 1 판매함(+), 2 환불됨(+), 3 지급됨(-), 4 사용함(-) -->


<table>
	<thead>
		<tr>
			<th width="80px"></th>
			<th>금액</th>
			<th>상태</th>
			<th>다음 날짜부터 유효함</th>
			<th>만료일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${creditHistory }">
		<tr>
			<td>크레딧</td>
			<td> ${dto.camount }</td>
			<td>
				 <c:if test="${dto.ccode==1}">판매됨</c:if>
				 <c:if test="${dto.ccode==2}">환불됨</c:if>
				 <c:if test="${dto.ccode==3}">지급됨</c:if>
				 <c:if test="${dto.ccode==4}">사용됨</c:if>
			</td>
			<td><fmt:formatDate value="${dto.cpaydate }" pattern="yyyy년 MM월 dd일"/></td>
			<td>만료없음</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>