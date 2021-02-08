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
      
      
     
      
</style>
</head>
<body>
<h3>리뷰 신고</h3>

<a href="#">전체보기</a>  |  <a href="#">o</a>  |  <a href="#">x</a>
<hr align="left">
<!-- 이미지 경로 : img/호박.png -->


<form>
<table border="0" cellspacing="0">
<thead>
	<tr>
		<th>강의명</th>
		<th>신고한 사람</th>
		<th>신고 받은 사람</th>
		
		<th>신고사유<!-- (표에 맞게 글자수 보여주고 )--></th>
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
		<td><div style="overflow: hidden;text-overflow: ellipsis;width: 180;"><nobr>${dto.dreason }</nobr></div></td>
		<td>${dto.ddate }</td>
		<td>${dto.dstatus }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<input type="submit" value="등록">

<input type="button" value="보류">
<input type="button" value="취소">
<br>
등록시 3개 횟수 세고 3회가 되면 댓글, 리뷰 기능 이용못하게 막아야함.
</form>
<br>
<a href="admin.do">관리자 페이지</a>

</body>
</html>