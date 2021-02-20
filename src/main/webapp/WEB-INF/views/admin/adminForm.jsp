<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}

h1{
	padding-bottom: 10px;
}

.allAdmin{
	
	width: 500px;
	height: 200px;
	padding-top: 20px;
	padding-left: 20px;
	border: 4px solid #bcbcbc;
	background-color: white;
}
h3{
	padding-bottom: 10px;
}

.button {
    width:100px;
    background-color: #1a6dca;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
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
				<h1>관리자 페이지</h1>
					<div class="allAdmin" >
						<h3>사용자 관리</h3> 
					
						<a href="admin_memberAllList.do">전체사용자</a>  |    
						<a href="admin_blackList.do">블랙리스트</a>
						<br>
						<a href="admin_reviewDeclaration.do">리뷰 신고 글목록</a>
						<br>
						<a href="admin_CommonQnAList.do">문의하기</a>
					</div>
				<br>
			
					<div class="allAdmin">
						<h3>강사 관리</h3>
					
						<a href="lectureCheck.do">강의리스트 관리</a>
						<br>
						<a href="TestVideoManagement.do">테스트 동영상 관리</a>
						<br>
						<a href="adminPayment.do">강사 수익 요청 관리</a>
						<br>
					</div>
					<br>
					<div class="allAdmin">
						<h3>사이트 관리</h3>
						
						<a href="CategoryCheck.do">카테고리 관리</a>
						<br>
					
					</div>
					<!-- 원태님 부분 
					<a>알림</a>
					<br>
					
					<a>결제하기</a>
					<br>
					<a>구매내역</a>
					<br>
					<br>-->
				
				<br>
					<div align="center">
						<input type="button" value="메인페이지" class="button" onclick = "location.href = 'index.do'"  >
					</div>
		</div>
</body>