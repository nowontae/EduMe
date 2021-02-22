<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<style>
td:nth-child(1){
	width:200px;
}
</style>
</head>
<body>

<div>
	<input type="button" value="강좌 등록" onclick="location.href='lectureOpen.do?lidx=${dto.lidx}'">
</div>


<div class="row">



<div class="col-9">
<video src="video/${myClass.lcvideo}" controls width="1560px"></video> 
</div>

<!--  커리큘럼 영역 -->
<div id="curriculum" class="col-3"">
	
	<div class="accordion" id="accordionExample">
 	
 	<c:forEach var="curi" items="${curriculum }" varStatus="num">
 	<!-- 값 세팅 -->
    <c:if test="${curi.lcsection == 1 }"><c:set var="extendValue">true</c:set></c:if>
	<c:if test="${curi.lcsection != 1 }"><c:set var="extendValue">false</c:set></c:if>
    <!-- css랑 무관 -->
    
    <!-- 섹션 영역 -->
    <c:if test="${curi.lcpart == 0 }">
    <div class="card">
      <div class="card-header" id="heading${curi.lcsection}">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${curi.lcsection }" aria-expanded="${extendValue}" aria-controls="collapse${curi.lcsection }">
            Section${curi.lcsection} &nbsp;&nbsp;:&nbsp;&nbsp; ${curi.lctitle }
          </button>
        </h2>
      </div>
    </div>
  	</c:if>
  	
  	
  	<!-- 파트 영역 -->
  	<c:if test="${curi.lcpart != 0 }">
      <div id="collapse${curi.lcsection }" class="collapse" aria-labelledby="heading${curi.lcsection }" data-parent="#accordionExample">
        <div class="card-body">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="lectureContentSee.do?lidx=${curi.lidx}&section=${curi.lcsection}&part=${curi.lcpart}">Part${curi.lcpart } &nbsp;&nbsp;:&nbsp;&nbsp; ${curi.lctitle }</a>
        </div>
      </div>
    </c:if>
    </c:forEach>
 	</div>
</div> <!-- end div="curricullum" -->
</div>


<!--  테이블 시작 -->
<div class="col-9"> 



<table class="table ml-1" >
	<tr>
		<td >강의 번호</td><td>${dto.lidx}</td>
	</tr>
	<tr>
		<td >강사 번호</td><td> ${dto.midx}</td>
	</tr>
	<tr>
		<td >강의 제목</td><td> ${dto.ltitle}</td>
	</tr>
	<tr>
		<td >강의 부제목 </td><td>${dto.lsubtitle}</td>
	</tr>	
	<tr>
		<td >난이도</td><td> ${dto.llevel}</td>
	</tr>
	<tr>
		<td >썸네일</td><td><img src="img/${dto.lthumnail}"></td>
	</tr>
	<tr>
		<td >개요</td><td> ${dto.lsummary}</td>
	</tr>
	<tr>	
		<td >강의 목적 </td><td>${dto.lpurpose}</td>
	</tr>
	<tr>
		<td >기본 가격</td><td> ${dto.lorignprice}</td>
	</tr>
	<tr>
		<td >대상수강생 </td><td>${dto.ltarget}</td>
	</tr>
	<tr>	
		<td >필요사전지식</td><td> ${dto.lknowledge}</td>
	</tr>
	<tr>
		<td >카테고리 대 </td><td>${dto.cat1_idx}</td>
	</tr>
	<tr>
		<td >카테고리 중 </td><td>${dto.cat2_idx}</td>
	</tr>
	<tr>	
		<td >카테고리 소</td><td> ${dto.cat3_idx}</td>
	</tr>
	<tr>
		<td >등록날짜</td><td> ${dto.lwritedate}</td>
	</tr>
	<tr>
		<td >공개여부</td><td>${dto.lopen} </td>
	</tr>
	<tr>
		<td >강의 섹션</td><td> ${myClass.lcsection}</td>
	</tr>
	<tr>
		<td >강의 파트</td><td> ${myClass.lcpart}</td>
	</tr>
	<tr>
		<td >제목</td><td> ${myClass.lctitle}</td>
	</tr>
	<tr>
		<td >샘플동영상 여부 </td><td>${myClass.lcsample}</td>
	</tr>
</table>
</div>
<!--  테이블 끝.-->
</div>
</body>
</html>