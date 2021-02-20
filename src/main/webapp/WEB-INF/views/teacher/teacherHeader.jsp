<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="css/teacherMain.css?ver=2">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<div class="container-fluid">
	<div class="row">
        
	<!-- side bar -->
	<div class="col-2 sidebar1">
       	<div class="logo">
           	<img src="img/e.jpg" style="width:60px" class="img-responsive center-block rounded-circle" alt="Logo">
		</div>
           <br>
           <div class="left-navigation">
           	<ul class="list">
               	<h5><strong>EduMe</strong></h5>
				<li><a href="teacherMain.do?midx=${sessionScope.midx }">강좌</a></li>
				<li><a href="teacherTestVideo.do?midx=${sessionScope.midx}">테스트동영상</a></li>
				<li><a href="teacherNoticeMain.do">공지</a></li>
				<li><a href="teacherResult.do?midx=${sessionScope.midx}">성과</a></li>
				<li><a href="teacherReviewMain.do?midx=${sessionScope.midx}">후기</a></li>
				<li><a href="teacherAsk.do?midx=${sessionScope.midx}">문의</a></li>
				<li><a href="teacherPaymentRequest.do?midx=${sessionScope.midx}">지급 요청</a></li>
			</ul>
		</div>
	</div>
	
	<!-- main part -->
	<div class="col-10  main-content">
	<!--Main content code to be written here --> 
	
