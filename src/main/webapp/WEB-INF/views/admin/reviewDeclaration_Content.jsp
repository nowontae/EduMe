<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	width:750px;
    
	}
	th, td{
		 border-bottom: 1px solid #bcbcbc;
	}
	th{
	width:150px;
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
	.list_button{
	width:170px;
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

<h3 style=" width:750px; padding-bottom: 5px; padding-top: 20px;" >리뷰 신고 글</h3>
<form name="Declaration_approved"  action="Declaration_approved.do">


<table  style="width:750px; height: 100px; border: 0; ">
	<tr>	
		<th height="41">처리 결과</th>
		<td>${dto.dstatus }
		<input type="hidden" name="midx" value="${dto.midx_to }">
		<input type="hidden" name="didx" value="${dto.didx }">
		</td>
	</tr>
	<tr>	
		<th height="41">수강하는 강의명</th>
		<td>${dto.ltitle }</td>
	</tr>
	<tr>	
		<th height="41">신고하는 사람</th>
		<td>${dto.m_from_name}</td>
	</tr>
	<tr>	
		<th height="41">신고받는 사람</th>
		<td>${dto.m_to_name }</td>
	</tr>
	<tr>	
		<th height="41" style="padding-top: 5px; padding-bottom: 5px;">신고하는 댓글</th>
		<td style="padding-top: 5px; padding-bottom: 5px;"><textarea rows="10" cols="75" readonly="readonly" style="border-radius: 10px;">${dto.rcomment}</textarea></td>
	</tr>
	<tr>	
		<th style="padding-top: 5px; padding-bottom: 5px;">신고 사유</th>
		<td style="padding-top: 5px; padding-bottom: 5px;"><textarea rows="10" cols="75"  readonly="readonly" style="border-radius: 10px;" >${dto.dreason }</textarea></td>
	</tr>
	<tr>	
		<th height="41">신고 시간</th>
		<td>${dto.ddate }</td>
	</tr>
	

	<c:if test="${dto.dstatus eq '0' }">
	<tr>
		<td colspan="2" align="center">

			<input type="submit" value="승인">
			<input type="button" value="미승인" onclick="location.href='Declaration_Notapproved.do?didx=${dto.didx}'">
		</td>
	</tr>
	</c:if>
	<c:if test="${dto.dstatus eq 'Y'}">
	</c:if>
	<c:if test="${dto.dstatus eq 'N'}">
	</c:if>
	
</table>
</form>
<div style="padding-top: 5px; width:750px;" align="center" >
<input type="button" value="목록" class="list_button" onclick = "location.href = 'admin_reviewDeclaration.do'"  >
</div>

</body>
</html>