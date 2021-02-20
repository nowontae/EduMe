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
<div style=" background-color:#CDB79E; padding: 10px 17.56%;">
&nbsp;&nbsp;&nbsp;<a href="CategoryCheck.do">대분류</a> > <a href="javascript:history.back();">중분류</a> > <b>소분류</b></div>
<div class="all">



	<div style="width: 1000px; text-align: right;"><input type="button"  class="adminPage_button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>
	
	
	
	<h3 style=" width:600px; padding-bottom: 5px;" style=" width:600px; padding-bottom: 5px;" >카테고리 관리</h3>
	
	<div style="font-size: 21px">${cat_name1 } > ${cat_name2 } > </div>
	<table class="table">
	<thead>
		<tr>
			<th scope="col" style=" font-size: 18px;">카테고리명</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<c:if test="${empty list }">
	<br>
		<tr>
			<td colspan="2"  height="500px">등록된 카테고리(소분류)가 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td   scope="row">
			<input type="hidden" value="${dto.cat2_idx}">
	
	
			${dto.cat_name}</td>
			<td><input type="button" value="삭제" class="del_bt" onclick="location.href='Category3Delete.do?cat2_idx=${dto.cat2_idx}&cat_name1=${cat_name1 }&cat1_idx=${dto.cat1_idx}&cat3_idx=${dto.cat3_idx}&cat_name2=${cat_name2 }'"></td>
		</tr>
		
	</c:forEach>
	</table>
	
	<form action="Category3Add.do"> 
		<table class="table">
			<tr>
				<td scope="row">
					<input type="hidden" name="cat1_idx" value="${cat1_idx}">
					<input type="hidden" name="cat2_idx" value="${cat2_idx}">
						<input type="hidden" name="cat_name1" value="${cat_name1}">
						<input type="hidden" name="cat_name2" value="${cat_name2}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="cat_name" required="required" style=" border-radius:10px; outline:none; width:450px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="add_bt" value="소분류 추가">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>