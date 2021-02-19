<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<style>
body{
padding-left:100px;
}
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
	
	 table, th, td {
        border-bottom: 1px solid #bcbcbc;
      
      }
      table {
        width: 900px;

      }
      th{
      	 text-align: left;
      }
       .adminPage_button{
	width:110px;
	height:30px;
    background-color:#4F94CD;
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
.release_Add_button {

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

<div style="width: 1200px; text-align: right;"><input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>

<h3 style=" width:600px; padding-bottom: 5px; padding-top: 20px;" >문의사항</h3>


<div style="width: 900px;  height: 40px; display: table-cell; background-color:#CDC0B0;  vertical-align: middle;" >
&nbsp;&nbsp;&nbsp;<a href="admin_CommonQnAList.do">전체보기 &nbsp; |&nbsp; <a href="admin_CommonQnAListComplete.do">답변완료</a> &nbsp;   | &nbsp; <a href="admin_CommonQnAListNotComplete.do">답변 미완료</a> 
</div>


<table border="0" cellspacing="0" style="margin-top: 10px;">
<thead>
	<tr>
		<th width="250px" height="41">제목</th>
		<th width="150px">작성자</th>
		<th width="200px">질문시간</th>
		<th width="130px">관리자 답변 상태</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4" height="41"> 등록된  문의사항이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td height="41"><a href="commonQnaContent.do?cqidx=${dto.cqidx }&midx=${sessionScope.midx}"><font color="	#00008B"><b>${dto.cqsubject }</b></font></a></td>
			<td>${dto.mname }</td>
			<td>
			<fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.lqwritedate }"/>
			</td>
			<td>
			<c:if test="${dto.cqreply == 'N'.charAt(0) }"><b>${dto.cqreply }</b></c:if>
			<c:if test="${dto.cqreply == 'Y'.charAt(0) }">${dto.cqreply }</c:if>

			</td>
		</tr>

	</c:forEach>

</tbody>
	<tfoot>
		<tr>
			<td colspan="4" ></td>
		</tr>
	</tfoot>
</table>

	<div align="center" style="width:1000px; padding-top: 8px; ">
	${pageStr }
	</div>
</body>
</html>