<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<style>
.all{
	height: 900px;
	display: table;
	margin: auto;
	padding-top: 55px;
}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}
table {
    text-align: center;
    margin-top: 20px;
}
    
th{
    text-align: center;
}
th, td{
    vertical-align: middle;
}
      

     .dreason{
     	display:inline-block; 
     	width:180px; 
     	white-space:nowrap; 
     	overflow:hidden; 
     	text-overflow:ellipsis;

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
<div class="all">
	<div style="width: 1200px; text-align: right;"><input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>
	
	<h3  style="height:50px;">리뷰 신고</h3>
	
	<div style="background-color:#CDC0B0;  vertical-align: middle; padding-top: 3px; font-size: 16px; height: 30px;" >
	&nbsp;&nbsp;&nbsp;<a href="admin_reviewDeclaration.do">전체보기</a> &nbsp; |&nbsp; <a href="reviewDeclaration_CheckedinformationList.do">확인 전인 것들 0</a> &nbsp;   | &nbsp; <a href="admin_reviewDeclaration_approvedList.do"><b>승인 내역 조회 Y</b></a> &nbsp; |&nbsp;  <a href="admin_reviewDeclaration_NotapprovedList.do">미승인 내역 조회 N</a>
	</div>
	
	
	<form>
	<table class="table">
	<thead>
		<tr>
			<th scope="col">강의명</th>
			<th scope="col">신고한 사람</th>
			<th scope="col">신고 받은 사람</th>
			
			<th scope="col">신고사유<!-- (표에 맞게 글자수 보여주고 )--></th>
			<th scope="col">신고한 시간</th>
			<th scope="col">상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="7"  height="500px" align="center">등록된 신고글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td  scope="row">${dto.ltitle }</td>
			<td>${dto.m_from_name}</td>
			<td>${dto.m_to_name }</td>
			<td><div class="dreason"><a href="reviewDeclaration_Content.do?didx=${dto.didx} "><font color="	#00008B"><b>${dto.dreason }</b></font></a></div></td>
			<td>${dto.ddate }</td>
			<td>${dto.dstatus }</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	
	</form>
</div>
</body>
</html>