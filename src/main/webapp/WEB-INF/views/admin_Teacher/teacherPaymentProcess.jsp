<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<div><h2>강사 수익 정산 요청리스트</h2></div>
<div>
	<table>
		<thead>
			<tr>
				<th>요청 강사 번호</th>
				<th>요청 금액</th>
				<th>요청 날짜</th>
				<th>은행명</th>
				<th>계좌주</th>
				<th>계좌번호</th>
				<th>확인</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty arr}">
				<tr>
					<td colspan="6">새로운 수익 정산 요청이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${arr}">
				<tr>
					<td>${dto.midx}</td>
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