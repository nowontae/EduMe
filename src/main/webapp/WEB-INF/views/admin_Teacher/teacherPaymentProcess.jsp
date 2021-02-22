<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="css/teacherMain.css?ver=2">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<style>
talbe {
 margin:0px auto;
}
td{
	padding: 5px;
	border: 1px solid;
	text-align: center;
}
</style>
<script>

</script>
</head>
<body>
<input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" >
<div calss="my-5"><h2>강사 수익 정산 요청리스트</h2></div>
<div>
	<table class="table" style="width:75vw" >
		<thead>
			<tr>
				<th scope="col">요청 강사 번호</th>
				<th scope="col">요청 금액</th>
				<th scope="col">요청 날짜</th>
				<th scope="col">은행명</th>
				<th scope="col">계좌주</th>
				<th scope="col">계좌번호</th>
				<th scope="col">확인</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty arr}">
				<tr>
					<td colspan="8">새로운 수익 정산 요청이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${arr}">
				<tr>
					<td scope="row">${dto.midx}</td>
					<td><fmt:formatNumber value="${dto.pay_amount}" pattern="#,###원"/></td>
					<td>${dto.pay_reqDate}</td>
					<td>${dto.tbank}</td>
					<td>${dto.tacctname}</td>
					<td>${dto.tacctnum}</td>
					<td>
					<form action="paymentOK.do" name="paymentOK.do">
					<input type="hidden" name="midx" value="${dto.midx}">
					<input type="hidden" name="ccode" value="3">
					<input type="hidden" name="camount" value="${dto.pay_amount}">
					<input type="hidden" name="ccoment" value="${dto.tacctname} 님에게 ${dto.pay_amount} 지급">
					<input type="hidden" name="pay_idx" value="${dto.pay_idx}">
					<input type="hidden" name="pay_amount" value="${dto.pay_amount}">
					<input type="submit" value="지급">
					</form>
					</td>
					<td><input type="button" value="삭제" disabled="disabled"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>