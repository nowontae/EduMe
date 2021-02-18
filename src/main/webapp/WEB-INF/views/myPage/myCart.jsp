<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<script>
function value_check(midx) {
	

	
    var check_count = document.getElementsByName("ck").length;
    for (var i=0; i<check_count; i++) {
        if (document.getElementsByName("ck")[i].checked == true) {
        	var lidx=document.getElementsByName("lidx")[i].value;
        	
        	
            //alert(document.getElementsByName("ck")[i].value);
            location.href="myCart_SelectDelete.do?midx="+midx+"&lidx="+lidx+"&ck="+check_count;
        }
    }
}
</script>
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
.del_bt {

    width:70px;
	height:30px;
    background-color: #1a6dca;
    border: none;
    color:#fff;
    text-align: center;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
	border: none;
    outline:none;
}
.selectDel_bt{
	width:85px;
	height:30px;
    background-color: #1a6dca;
    border: none;
    color:#fff;
    text-align: center;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
	border: none;
    outline:none;

}
.bt{
 	width:70px;
	height:30px;
    background-color: #1a6dca;
    border: none;
    color:#fff;
    text-align: center;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
	border: none;
    outline:none;

}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="all">
	<c:forEach var="dto" items="${list }" begin="0" end="0">
	<h3 style=" width:800px; height: 100px; padding-top: 18px;" >${dto.mname}님 장바구니</h3>
	</c:forEach>
	
	
	<form name="fm" action="purchase.do">
		
	<table >
	
	<c:if test="${empty list }">
		<tr>
			<td colspan="4" height=" 500px">
				추가된 항목이 없습니다.
			</td>
		</tr>
	
	</c:if>
	<c:forEach var="dto" items="${list }" varStatus="status">
		
			<tr>
				<td rowspan="2" width="40px">
				<input type="checkbox" name="ck" id="lectureName${status.index }" class="checkbox" value="${dto.lidx }+${status.index }">
				<input type="hidden" id="lidx_value${status.index }" name="lidx" value="${dto.lidx }">
				<input type="hidden" value="${dto.midx }">
				</td>
				<td rowspan="2" width="134px" height="76px" style="padding-top: 5px; padding-bottom: 5px;"><img src="${dto.lthumnail}" width="130px" height="74px" alt="강의사진"></td>
				<td rowspan="2" width="350px;">${dto.ltitle }</td>
				<td style="text-decoration:line-through;border-bottom: 0px; padding-top: 10px">
				<fmt:formatNumber value="${dto.lorignprice}" pattern="₩ #,###,###"/>
				</td>
				<td rowspan="2" ><input type="button" class="del_bt" value="제거" onclick="location.href='myCart_Delete.do?lidx=${dto.lidx }&midx=${sessionScope.midx}'"></td>
			</tr>
			<tr>
					<td style="padding-bottom: 10px;">
					<font style="color: red;"><b><fmt:formatNumber value="${dto.llastprice}" pattern="₩ #,###,###"/></b></font>

					</td>
			</tr>
	</c:forEach>		
		</table>
		<div style="padding-top: 3px;">
		<input type="button" class="selectDel_bt" value="선택 삭제" onclick="javascript:value_check(${sessionScope.midx})">
		<!-- location.href='myCart_SelectDelete.do?midx=${sessionScope.midx}&lidx=${dto.lidx } -->
		<input type="submit" class="bt" value="결제">
		</div>
	</form>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>