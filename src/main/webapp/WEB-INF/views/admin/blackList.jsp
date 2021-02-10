<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var check
</script>
<style>

	 hr{
		width: 800px;
		
	 }
	 table, th, td {
        border-bottom: 1px solid #bcbcbc;
      
      }
      table {
        width: 800px;
        height: 80px;

      }
      th{
      	 text-align: left;
      }
      
      
      input[type="checkbox"] {
   		 display:none;
	  }
      input[type="checkbox"] + label span{
   		 display: inline-block;
  		 width: 24px;
   		 height: 24px;
   		 margin: -2px 10px 0 0;
   		 vertical-align: middle;
   		 background: url("img/checkbox.svg") left top no-repeat;
   		 cursor: pointer; 
   		 background-size: cover;
	  }
	  input[type="checkbox"]:checked + label span{
	    background:url("img/checkbox.svg")  -26px top no-repeat;
   		background-size: cover;
	  }
      
</style>
</head>
<body>
<a href="admin_memberAllList.do">유저 전체 내역</a> | <a href="admin_blackList.do">블랙리스트</a>
<h3>블랙리스트</h3>
<hr align="left">
<!-- 이미지 경로 : img/호박.png -->
<form action="UnblackSelectlist.do">
<table border="1" cellspacing="0" width="800">
	<tr>
		<th>이름</th>
		<th>ID</th>
		<th colspan="2">신고횟수</th>
	</tr>
	
<c:if test="${empty list }">
	<tr>
		<td colspan="4" align="center">등록된 인원이 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${list }">	
	<tr>
		<td><input type="checkbox" id="reporter" name="mname_cb" value="${dto.midx }"  class="checkSelect"><label for="reporter"><span></span>${dto.mname }</td>
		<td>ID${dto.mid }</td>
	
		<td>${dto.mblack }<input type="hidden" value="${dto.midx }"></td>
		<td><input type="button" value="해제" onclick="location.href='admin_Unblacklist.do?midx=${dto.midx}'"></td>
	</tr>
</c:forEach>
</table>

<input type="submit" value="블랙리스트해제">

</form>
<br>
<a href="admin.do">관리자 페이지</a>
</body>
</html>