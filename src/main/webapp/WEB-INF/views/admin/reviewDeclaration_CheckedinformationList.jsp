<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	 hr{
		width: 1000px;
		
	 }
	 table, th, td {
        border-bottom: 1px solid #bcbcbc;
      
      }
      table {
        width: 1000px;
        height: 80px;

      }
      th{
      	 text-align: left;
      }
       .dreason{
     	display:inline-block; 
     	width:180px; 
     	white-space:nowrap; 
     	overflow:hidden; 
     	text-overflow:ellipsis;


     }
      
     
      
</style>
</head>
<body>
<h3>리뷰 신고</h3>

<a href="admin_reviewDeclaration.do">전체보기</a>  | <a href="reviewDeclaration_CheckedinformationList.do">확인 전인 것들</a>    |  <a href="admin_reviewDeclaration_approvedList.do">승인 내역 조회</a>  |  <a href="admin_reviewDeclaration_NotapprovedList.do">미승인 내역 조회</a>
<hr align="left">
<!-- 이미지 경로 : img/호박.png -->


<form>
<table border="0" cellspacing="0">
<thead>
	<tr>
		<th>강의명</th>
		<th>신고한 사람</th>
		<th>신고 받은 사람</th>
		
		<th  width=" 180">신고사유<!-- (표에 맞게 글자수 보여주고 )--></th>
		<th>신고 시간</th>
		<th>상태/확인전, Y(경고준것) , N(경고  안준것) </th>
	</tr>
</thead>
<tbody>
<c:if test="${empty list }">
	<tr>
		<td colspan="7" >등록된 신고 글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.ltitle }</td>
		<td>${dto.m_from_name}</td>
		<td>${dto.m_to_name }</td>
				<td><div class="dreason"><a href="reviewDeclaration_Content.do?didx=${dto.didx} ">${dto.dreason }</a></div></td>
		<td>${dto.ddate }</td>
		<td>${dto.dstatus }</td>
	</tr>
</c:forEach>
</tbody>
</table>


</form>
<br>
<a href="admin.do">관리자 페이지</a>

</body>
</html>