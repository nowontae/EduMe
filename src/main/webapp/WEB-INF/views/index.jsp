<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<h1>
메인 페이지
</h1>
<main role="main" class="container">
    <div class="jumbotron text-center">
        <h1>Bootstrap 4 NavBar</h1>
        <p class="lead text-info">NavBar with too many childs.</p>
        
    </div>
</main>
<a href="teacherMain.do">강사</a>
<hr>


<a href="#">로그인</a>
<a href="#">회원가입</a>
<br/>
<br/>

<a href="admin.do">관리자 페이지</a>
<hr>
<a href="lectureList.do">강의 리스트</a>



<hr>

<hr>
<a href="#">bbbbb</a>

<hr>
<a href="#">cccc</a>

<hr>
<a href="#">ddddd</a>
<div> 은진 추가</div>
<a href="MyCart.do">장바구니</a>
<br>
<a href="MyLectureList.do">내학습관리</a>

<div> 선아 추가</div>
<div> 은진 추가</div>

<hr>
<div> 원태 추가</div>
<ul>
	<li><a href="declaration.do?ridx=1">신고</a></li>
	<li><a href="commonQna.do">일반 문의사항</a></li>
	<li><a href="wishList.do">찜목록</a></li>
	<li><a href="noticeMsg.do">알림</a></li>
	<li><a href="purchaseHistory.do">구매내역</a></li>
	<li><a href="credit.do">크레딧</a></li>
	<li><a href="myLectureList.do">내 강의 리스트</a></li>
	<li><a href="lectureList.do">강의 리스트</a></li>
	<li><a href="lectureDetail.do">강의 상세</a></li>
	<li><a href="lectureMyClass.do">강의 듣기</a></li>
	<li></li>
</ul>

<%@include file="footer.jsp" %>
</body>
</html>