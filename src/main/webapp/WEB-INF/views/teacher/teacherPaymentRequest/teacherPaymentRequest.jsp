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

if(payReq<10000){
	reqButton.setAttribute("disabled","disabled");
}

}

</script>
<style>
#payTitle{
	margin-bottom: 40px;
    margin-top: 35px;
}
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}
#textBottom{
	margin-bottom: 20px;
}
#requestWait{
	margin-top: 40px;
}
.blank{
	padding-right: 10px;
}
#infoTable th, td{
	text-align:left !important;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div id="payTitle">
	<h2>강사 수익 지급 요청</h2>
</div>
<form action="paymentRequestSubmit.do" name="paymentRequest">
<input type="hidden" value="${teacherMoneyCopy}" id="remainingAmount">
<table id="infoTable" class="table border-0" style="width:50vw">
	<tr>
		<th>현재 요청 가능한 잔액</th>
		<td><input type="text" id="remainingAmount" value="${teacherMoney}" readonly="readonly">&nbsp;&nbsp;
	*현 날짜 1달 전까지의 총잔액입니다.</td>
	</tr>
	<tr>
		<th>은행명</th>
		<td><input type="text" name="tbank" value="${dto.tbank}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>은행명</th>
		<td><input type="text" name="tacctname" value="${dto.tacctname}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>계좌번호</th>
		<td> <input type="text" name="tacctnum" value="${dto.tacctnum}" readonly="readonly"></td>
	</tr>
	<tr>
		<th>요청할 금액</th>
		<td><input type="text" name="pay_amount" required="required" id="paymentRequestMoney" onkeyup="keyEvent1()"> <input type="submit" class="btn btn-primary" value="요청하기" id="reqButton">&nbsp;&nbsp;&nbsp;*최소 신청금액은 10,000원 입니다.</td>
	</tr>
</table>
</form>

<div id="requestWait">
<h4>요청 대기</h4>
	<table class="table" style="width:50vw">
		<thead>
			<tr>
				<th scope="col">요청 금액</th>
				<th scope="col">요청 시간</th>
				<th scope="col">요청 상태</th>
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
					<td scope="row"><fmt:formatNumber value="${dto.pay_amount}" pattern="#,###"/></td>
					<td>${dto.pay_reqDate}</td>
					<td>대기중</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<h4>지급 완료</h4>
	<table class="table" style="width:50vw">
		<thead>
			<tr>
				<th scope="col">요청 금액</th>
				<th scope="col">요청 완료 시간</th>
				<th scope="col">요청 상태</th>
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
					<td scope="row"><fmt:formatNumber value="${dto2.pay_amount}" pattern="#,###"/></td>
					<td>${dto2.pay_date}</td>
					<td>지급 완료</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>