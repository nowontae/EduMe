<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	.Add_button {

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
<div class="all">
	<div style="width: 1000px; text-align: right;"><input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>

	<h3 style=" width:750px; padding-bottom: 5px; padding-top: 20px;">테스트 동영상 관리</h3>
	
	
	<table class="table">
	
		<tr>
			<td scope="row"  >${dto.tvsubject }</td>
		</tr>
		<tr>
			<td  style="border-bottom: 1px solid #bcbcbc;"><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.tvwritedate }"/></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #bcbcbc; padding-top: 5px; padding-bottom: 5px;">
			<video id="lec" muted controls style="width:500px" onpause="videoPause(this)"   onended="videoEnded(this)">
	     	<source src="${dto.tvvideopath}">
	    	<strong>Your browser does not support the video tag.</strong>
	 		</video>
	 		</td>
		</tr>
	
	
	<c:choose>
			<c:when test="${dto.tvcomment == 'N' or dto.tvcomment =='n' }"></c:when>
		<c:when test="${dto.tvcomment!='N' or dto.tvcomment!='n' }">
		<tr>
			<th align="left" height="41">관리자 답변</th>
		</tr>
		<tr>
			<td height="150">${dto.tvcomment }</td>
		</tr>
		</c:when>
	</c:choose>
	</table>
	<br>
	<!-- 답변달기 -->
	<form action="TestVideoContent_tvcommentAdd.do">
	<c:choose>
		
		<c:when test="${dto.tvcomment == 'N' or dto.tvcomment =='n' }">
	<table>
		<tr>
			<th colspan="2" align="left">관리자 답변</th>
		</tr>
		
		<tr>
			<td align="left"     style="padding-left: 100px;">
				<input type="hidden" name="tvidx" value="${dto.tvidx }">
				<textarea rows="5" cols="80"  style="border-radius: 10px; resize: none; padding:10px;" name="tvcomment" ></textarea>
			</td>
		</tr>
		<tr>
			<td align="center"   style="border-bottom: 1px solid #bcbcbc;  padding-top: 5px; padding-bottom: 5px;">
			<input type="submit" class="Add_button" value="답변달기">
			</td>
		</tr>
	
	</table>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</form>
	
	
	
	<div style="padding-top: 5px; text-align:center;" >
	<input type="button" value="목록" class="list_button" onclick="history.back()">
	</div>

</div>
</body>
</html>