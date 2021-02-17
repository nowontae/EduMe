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
body{
padding-left:100px;
}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
 .table1 th, .table1 td{
        border-bottom: 1px solid #bcbcbc;
      
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
	.del_bt{
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
	.add_bt{
	width:100px;
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


<div style="width: 1200px; background-color:#CDB79E; height: 40px; display: table-cell;   vertical-align: middle;">&nbsp;&nbsp;&nbsp;<b>대분류</b></div>
<div style="width: 1200px; text-align: right;"><input type="button"  class="adminPage_button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>

<h3 style=" width:600px; padding-bottom: 5px;" style=" width:600px; padding-bottom: 5px;" >카테고리 관리</h3>
<table class="table1" border="0" cellspacing="0" width="600">
<thead>
	<tr>
		<th height="41">카테고리명</th>
		<th width="100px"></th>
	</tr>
</thead>
<c:if test="${empty list }">
	<tr>
		<td colspan="2" align="center" height="41">등록된 카테고리(대분류)가 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${list }">
	<tr>
		<td height="41">
		<input type="hidden" value="${dto.cat1_idx}">

		<a href="Category2List.do?cat_name1=${dto.cat_name }&cat1_idx=${dto.cat1_idx}">${dto.cat_name}</a></td>
		<td ><input type="button" class="del_bt" value="삭제" onclick="location.href='Category1Delete.do?cat1_idx=${dto.cat1_idx}'"></td>
	</tr>
	
</c:forEach>
</table>

<form action="Category1Add.do"> 
	<table width="600">
		<tr>
			<td height="60px">
				<input type="hidden" value="${dto.cat1_idx}">
				<input type="text" name="cat_name" required="required" style=" border-radius:10px; outline:none; width:470px;">
				<input type="submit" class="add_bt" value="대분류 추가">
			</td>
		</tr>
	</table>
</form>

</body>
</html>