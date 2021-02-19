<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	width:800px;
    border: 0px solid  ;
    text-align: center;
	}
	th, td{
		border-bottom: 1px solid #000000;
	}
    h3{	   width:600px; 
           padding-bottom: 20px;
    }  
      
       
      input[type=checkbox] {
   		 display:none;
	  }
      input[type=checkbox] + label span{
   		 display: inline-block;
  		 width: 24px;
   		 height: 24px;
   		 margin: -2px 10px 0 0;
   		 vertical-align: middle;
   		 background: url("img/checkbox.svg") left top no-repeat;
   		 cursor: pointer; 
   		 background-size: cover;
	  }
	  input[type=checkbox]:checked + label span{
	    background:url("img/checkbox.svg")  -26px top no-repeat;
   		background-size: cover;
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
 .release_button {

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
 .release2_button {

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
<div style=" background-color:#CDB79E; padding: 10px 17.56%;">
	&nbsp;&nbsp;&nbsp;<a href="admin_memberAllList.do">전체  유저 정보</a>&nbsp;  |  &nbsp;<a href="admin_blackList.do"><b>블랙리스트 정보</b></a>
</div>

<div class="all">

	<div style="width: 1200px; text-align: right;"><input type="button"  class="adminPage_button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>
	
	<h3 >블랙리스트</h3>
	
	<!-- 이미지 경로 : img/호박.png -->
	<form action="UnblackSelectlist.do">
	<table border="0" cellspacing="0" width="600">
		<tr>
			<th width="120px">이름</th>
			<th width="150px">ID</th>
			<th  width="100px">신고횟수</th>
			<th  width="100px"> </th>
		</tr>
		
	<c:if test="${empty list }">
		<tr>
			<td colspan="4" align="center">등록된 인원이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list }" varStatus="status">	
		<tr>
			<td><input type="checkbox" id="reporter${status.index }" name="mname_cb" value="${dto.midx }"  class="checkSelect"><label for="reporter${status.index }" ><span></span></label>${dto.mname }</td>
			<td>ID${dto.mid }</td>
		
			<td>${dto.mblack }<input type="hidden" value="${dto.midx }"></td>
			<td><input type="button" class="release_button" value="해제" onclick="location.href='admin_Unblacklist.do?midx=${dto.midx}'"></td>
			
		</tr>
	</c:forEach>
	</table>
	
	<div style="padding-top: 5px;"><input type="submit" class="release2_button" value="블랙리스트 선택해제"></div>
</div>
</form>
</body>
</html>