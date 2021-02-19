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
h3{
	width: 900px;
    height: 100px;
    padding-top: 18px;
    text-align: left;
}
table {
	width:900px;
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

<script>
var c=document.getElementById('c$').value;
alert('c');

</script>
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="all">


	
	<!-- ccode : 1 판매함(+), 2 환불됨(+), 3 지급됨(-), 4 사용함(-) -->
	
	
	<table>
	<c:set var="sum" value="0"/><!-- 총합계를 계산하기 위한  변수-->
		<tr>
			<td colspan="6">
				<h3>크레딧 내역</h3>
			</td>
		</tr>
		
		<tr>
			<th width="80px" ></th>
			<th>금액</th>
			<th>상태</th>
			<th>다음 날짜부터 유효함</th>
			<th>만료일</th>
			<th>총금액</th>
		</tr>
		<tbody>
		
		<c:if test="${empty creditHistory }">
		<tr>
			<td colspan="6" height="500px">
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${creditHistory }"  varStatus="status">
			<tr>
				<td >크레딧</td>
				<td> 
					
			
					 <c:if test="${dto.ccode==1}">
						<font style="color:blue;"><fmt:formatNumber value="${dto.camount }" pattern="+#,###,###원"/></font>
					 </c:if>
					 <c:if test="${dto.ccode==2}">
					 	<font style="color:blue;"><fmt:formatNumber value="${dto.camount }" pattern="+#,###,###원"/></font>
					 </c:if>
					 <c:if test="${dto.ccode==3}">
						<font style="color:red;"><fmt:formatNumber value="${dto.camount }" pattern="#,###,###원"/></font>
					 </c:if>
					 <c:if test="${dto.ccode==4}">
						<font style="color:red;"><fmt:formatNumber value="${dto.camount }" pattern="#,###,###원"/></font>
			
					</c:if>
						<c:set var="sum" value="${sum + dto.camount}"/>
				</td>
				<td>
					 <c:if test="${dto.ccode==1}">판매됨</c:if>
					 <c:if test="${dto.ccode==2}">환불됨</c:if>
					 <c:if test="${dto.ccode==3}">지급됨</c:if>
					 <c:if test="${dto.ccode==4}">사용됨</c:if>
				</td>
				<td><fmt:formatDate value="${dto.cpaydate }" pattern="yyyy년 MM월 dd일"/></td>
				<td style="color:red;">만료없음 ?? <!--  db없음 . 이렇게 써도 될지 확인!--></td>
				<td id="td">
					<fmt:formatNumber value="${sum }" pattern="#,###,###원"/>
					<c:out value=""/>
				</td>
			</tr>
			
		</c:forEach>
		<tr>
				<td colspan="5" align="right" style="padding-right: 39px; height:41px;"><b>크레딧 잔고</b></td>
				<td>
				<font style="color:#46c28e;"><b><fmt:formatNumber value="${sum }${status.last }" pattern="#,###,###원"/></b></font>
				</td>
			</tr>
		</tbody>
</table>
</div>
<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>