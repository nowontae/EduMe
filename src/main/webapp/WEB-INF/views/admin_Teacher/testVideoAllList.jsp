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
	
	table {
	width:650px;
    border: 0px solid  ;
    text-align: center;
	}
	th, td{
		border-bottom: 1px solid #000000;
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
</style>
</head>
<body>
<div style="width: 1200px; text-align: right;"><input type="button"  class="adminPage_button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>

<h3 style=" width:650px; padding-bottom: 5px;" style=" width:600px; padding-bottom: 5px;" >테스트 동영상 관리</h3>
<table>
	<thead>	
		<tr>
			<th width="300px" height="41">제목</th>
			<th width="200px">등록일자</th>
			<th width="150px">관리자 답변 상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list}">
	<tr>
		<td height="41">
		등록된 글이 없습니다.
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${list }" >
	<tr>
		<td height="41"><a href="TestVideoContent_Management.do?tvidx=${dto.tvidx }"><font color="	#00008B"><b>${dto.tvsubject }</b></font></a></td>
	
		<td><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.tvwritedate }"/></td>
		<td>
			<c:choose>
				<c:when test="${dto.tvcomment=='N' or dto.tvcomment=='n' }">N</c:when>
				<c:when test="${dto.tvcomment!='N' or dto.tvcomment!='n' }">Y</c:when>
			</c:choose>
			
		</td>
	</tr>
	
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="3"></td>
	</tr>
	</tfoot>
</table>
	<div align="center" style="width:600px; padding-top: 8px; ">
	${pageStr }
	</div>
</body>
</html>