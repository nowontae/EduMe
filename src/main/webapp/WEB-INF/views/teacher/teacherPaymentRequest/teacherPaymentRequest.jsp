<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function keyEvent1(){
var allAmount=document.getElementById('remainingAmount').value;
var payReq=document.getElementById('paymentRequestMoney').value;

allAmount=parseInt(allAmount);
payReq=parseInt(payReq);

var reqButton=document.getElementById('reqButton');
if(allAmount<payReq){
	
	reqButton.setAttribute("disabled","disabled");
}else if(allAmount>=payReq){
	
	reqButton.removeAttribute("disabled");
}

}

</script>
</head>


<div>
	<h2>강사 수익 지급 요청</h2>
</div>

<div>
	<input type="hidden" id="remainingAmount" value="${teacherMoneyCopy}">
	<div>현재 요청 가능한 잔액:<input type="text" id="remaining" value="${teacherMoney}" readonly="readonly">&nbsp;&nbsp;*현 날짜 1달 전까지의 총잔액입니다.</div>
</div>
<div>
은행명: <input type="text" name="tbank" value="${dto.tbank}" readonly="readonly">
계좌주: <input type="text" name="tacctname" value="${dto.tacctname}" readonly="readonly">
계좌번호: <input type="text" name="tacctnum" value="${dto.tacctnum}" readonly="readonly">
<form action="paymentRequestSubmit.do" name="paymentRequest">
<div>
<input type="hidden" name="midx" value="${midx}">
요청할 금액:<input type="text" name="pay_amount" required="required" id="paymentRequestMoney" onkeyup="keyEvent1()">
<input type="submit" value="요청하기" id="reqButton" >
</div>
</form>
</div>
<div>
<div><h2>요청 대기</h2>&nbsp;1주일내 미지급 시 문의사항 게시판을 이용하세요</div>
	<table>
		<thead>
			<tr>
				<th>요청 금액</th>
				<th>요청 시간</th>
				<th>요청 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty arr}">
				<tr>
					<td colspan="3">요청 기록이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${arr}">
				<tr>
					<td><fmt:formatNumber value="${dto.pay_amount}" pattern="#,###"/></td>
					<td>${dto.pay_reqDate}</td>
					<td>대기중</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<h2>지급 완료</h2>
	<table>
		<thead>
			<tr>
				<th>요청 금액</th>
				<th>요청 완료 시간</th>
				<th>요청 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty arr2}">
				<tr>
					<td colspan="3">지급 완료 기록이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto2" items="${arr2}">
				<tr>
					<td><fmt:formatNumber value="${dto2.pay_amount}" pattern="#,###"/></td>
					<td>${dto2.pay_date}</td>
					<td>지급 완료</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>