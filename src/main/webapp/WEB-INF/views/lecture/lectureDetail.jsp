<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="httpRequest.js"></script>
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
	var result=window.confirm("장바구니에 담겼습니다 \n장바구니 페이지로 이동하시겠습니까? 😊");
	//alert(result); -> true, false  값으로 출력
	location.href="addMyCartList.do?lidx="+lidx+"&result="+result;
}

function alertMsg(msg) {
	window.alert(msg);
}

function checkMyLecture(lidx){
	 var params = "lidx="+lidx;
 	 sendRequest('checkMyLecture.do',params,checkMyLectureResult,'POST');
}

function checkMyLectureResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			if(data.result == 1){
				document.getElementById("btn-wish").remove();
				document.getElementById("btn-cart").remove();
			}
		}
	}
}
</script>
<style>
input:focus {
    outline: none;
}
textarea:focus {
    outline: none;
}
</style>
</head>
<body onload="checkMyLecture(${lectureDetail.lidx})">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="category">

<c:if test="${!empty msg }">
<script> alertMsg('${msg}') </script>
</c:if>


<h1>${lectureDetail.lidx} </h1>
<c:forEach var="cat1" items="${sessionScope.cat1_list}">
<c:if test="${cat1.cat1_idx == lectureDetail.cat1_idx}">
<a href="lectureList.do?cat1_idx=${cat1.cat1_idx}">${cat1.cat_name}</a> > 
</c:if>
</c:forEach>
<c:forEach var="cat2" items="${sessionScope.cat2_list}">
<c:if test="${cat2.cat2_idx == lectureDetail.cat2_idx}">
<a href="lectureList.do?cat1_idx=${cat1.cat1_idx}&cat2_idx=${cat2_idx }">${cat2.cat_name}</a> > 
</c:if>
</c:forEach>
<c:forEach var="cat3" items="${sessionScope.cat3_list}">
<c:if test="${cat3.cat3_idx == lectureDetail.cat3_idx}">
<a href="lectureList.do?cat1_idx=${cat1.cat1_idx}&cat2_idx=${cat2_idx }&cat3_idx=${cat3_idx}">${cat3.cat_name}</a>
</c:if>
</c:forEach>
</div>

<div><h1>${lectureDetail.ltitle }</h1></div> <br />
<div>
	<h2>${lectureDetail.lsummary}</h2>
</div>
<br />
<div>★★★☆☆ (00개의 평점) 000명의 수강생</div><br />

<div>생성자 <a href="#">강사이름</a></div><br />

<div>12/2020에 마지막으로 업데이트 됨  / 언어 한국어</div><br />

<div>
	<input type="button" id="btn-wish" value="찜하기" onclick="location.href='addWishList.do?lidx=${lectureDetail.lidx}'">
	<input type="button" id="btn-cart" value="장바구니" onclick="addMyCartList(${lectureDetail.lidx})">
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
 
 <form action="">
 <table border="0" cellspacing="1">
 <thead>
 <tr>
 	<th colspan="3" align="left" height="30px" style="font-size: 22px">후기</th>
 </tr>
 </thead>
 <tbody>
 <c:if test="${empty list }">
 <tr>
 	<td>등록된 댓글이 없습니다.</td>
 </tr>
 </c:if>
 <c:forEach var="dto" items="${list }">
 	<tr>
 		<td rowspan="4" style="vertical-align: top; border-bottom:1px solid gray"><img src="${dto.mimg }" alt="회원이미지" ></td>
 		<td colspan="2">${dto.mid }</td>
 		
 	</tr>
 	<tr>
 		<td>
 			<c:if test="${dto.rscore == 1}">
 			⭐
 			</c:if>
 			<c:if test="${dto.rscore == 2}">
 			⭐⭐
 			</c:if>
 			<c:if test="${dto.rscore == 3}">
 			⭐⭐⭐
 			</c:if>
 			<c:if test="${dto.rscore == 4}">
 			⭐⭐⭐⭐
 			</c:if>
 			<c:if test="${dto.rscore == 5}">
 			⭐⭐⭐⭐⭐
 			</c:if>
 		</td>
 		<td rowspan="2" style="vertical-align: middle;">
 		<input type="hidden" name="ridx${i.index}" value="${dto.ridx}">

 		<a href="declaration.do?ridx=${dto.ridx }" style="color: #0f7c90;" >신고하기</a></td>
 	</tr>
 	<tr>
 		<td><textarea rows="3" cols="35" style="border: none; resize: none; color: darkslategray;">${dto.rcomment }</textarea></td>
 	</tr>
 	<tr>
 		<td colspan="2" style="border-bottom:1px solid gray; color: gray;"><fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dto.rwritedate }"/></td>
 	</tr>
 </c:forEach>
 	</tbody>
 </table>
</form> 
</body>
</html>