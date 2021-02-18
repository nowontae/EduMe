<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	
}
h3{
	width:850px; 
	height: 100px; 
	padding-top: 18px;
	text-align:left;
}
table {
	width:850px;
    border: 0px solid  ;
    text-align: center;
    margin: 0 auto;

}
th, td{
		border-bottom: 1px solid #000000;
		
}
th{	
	font-size: 16px;
	height:46px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="all">
	
	
<table>
	<tr>
		<td colspan="3" ><h3>구매 내역</h3></td>
	</tr>
		<tr>
			<th width="350px">강좌</th>
			<th width="300px">결제일시</th>
			<th width="200px">결제 금액</th>
		</tr>
		<c:if test="${empty purchaseHistory }">
		<tr>
			<td colspan="3" height=" 500px">
				결제하신 내역이 없습니다.
			</td>
		</tr>
	
		</c:if>
		<c:forEach var="dto" items="${purchaseHistory }">
		<tr>
			<td style="height:41px;">${dto.ltitle }</td>
			<td><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.pdate }"/></td>
			<td><fmt:formatNumber value="${dto.pprice}" pattern="₩ #,###,###"/></td>
		</tr>
		
		</c:forEach>
</table>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>