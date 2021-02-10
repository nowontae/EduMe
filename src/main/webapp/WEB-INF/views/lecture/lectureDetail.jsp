<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function videoPause(v){
	
	var crTime = v.currentTime;
	alert(crTime);
	
}

function videoEnded(v){
	var crTime = v.currentTime;
	alert("끝"+crTime);
}
function addMyCartList(lidx){// 장바구니 담기
	var result=window.confirm("장바구니 페이지로 이동하시겠습니까? 😊");
	//alert(result); -> true, false  값으로 출력
	location.href="addMyCartList.do?lidx="+lidx+"&result="+result;
}
</script>
</head>
<body>
<div>개발 > 프로그래밍 언어 > c</div><br />

<div><h1>${lectureDetail.ltitle }</h1></div> <br />
<div>
	<h2>${lectureDetail.lsummary}</h2>
</div>
<br />
<div>★★★☆☆ (00개의 평점) 000명의 수강생</div><br />

<div>생성자 <a href="#">강사이름</a></div><br />

<div>12/2020에 마지막으로 업데이트 됨  / 언어 한국어</div><br />

<div>
	<a href="addWishList.do?lidx=${lectureDetail.lidx}">찜하기</a>
	<input type="button" value="장바구니" onclick="addMyCartList(${lectureDetail.lidx})">
		<a href="addMyCartList.do?lidx=${lectureDetail.lidx}">장바구니</a>
	
	<input type="button" value="공유"/>
	<input type="button" value="이 강좌 선물하기"/>
</div>

<br /><br /><br /><br /><br /><br /><br /><br />
 <video id="lec" muted controls style="width:500px" onpause="videoPause(this)" onended="videoEnded(this)">
      <source src="video/test1.mp4">
      <strong>Your browser does not support the video tag.</strong>
 </video>
 
 
 <div id="curriculum">
 <ul>
 <c:forEach var="curi" items="${curriculum }">
	
 		<li>${curi.lcsection }/${curi.lcpart }/${curi.lctitle }</li>
 </c:forEach>
 </ul>
 
 </div>
 
</body>
</html>