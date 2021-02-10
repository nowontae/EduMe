<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function value_check(midx) {
	

	
    var check_count = document.getElementsByName("ck").length;

    for (var i=0; i<check_count; i++) {
        if (document.getElementsByName("ck")[i].checked == true) {
        	var lidx=document.getElementsByName("lidx")[i].value;
        	alert(lidx+"D");
        	
        	
            //alert(document.getElementsByName("ck")[i].value);
            location.href="myCart_SelectDelete.do?midx="+midx+"&lidx="+lidx+"&ck="+check_count;
        }
    }
}
</script>
</head>
<body>

<c:forEach var="dto" items="${list }" begin="0" end="0">
<h3>${dto.mname}님 장바구니</h3> 
</c:forEach>
<hr>

<div>전체선택</div>
<form name="fm" action="myCart_SelectDelete.do">
	
	<table border="1" width="600">
	
<c:if test="${empty list }">
	<tr>
		<td colspan="4">
			추가된 항목이 없습니다.
		</td>
	</tr>

</c:if>
<c:forEach var="dto" items="${list }">
	
		<tr>
			<td>회원 강의 번호${dto.lidx }//회원고유번호${dto.midx }//
			<input type="checkbox" name="ck" id="lectureName" class="checkbox" value="${dto.lidx }">
			<input type="hidden" id="lidx_value" name="lidx" value="${dto.lidx }">
			<input type="hidden" value="${dto.midx }">
			</td>
			<td><img src="${dto.lthumnail}"></td>
			<td>${dto.ltitle }</td>
			<td>${dto.lorignprice}</td>
			<td><input type="button" value="제거" onclick="location.href='myCart_Delete.do?lidx=${dto.lidx }&midx=${sessionScope.midx}'"></td>
		</tr>
</c:forEach>		
	</table>
	<input type="button" value="선택 삭제" onclick="javascript:value_check(${sessionScope.midx})">
	<!-- location.href='myCart_SelectDelete.do?midx=${sessionScope.midx}&lidx=${dto.lidx } -->
	<input type="submit" value="결제">

</form>
</body>
</html>