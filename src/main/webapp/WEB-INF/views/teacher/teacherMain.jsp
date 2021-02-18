<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<a>사이트 로고</a>
	<a href="teacherMain.do">강좌</a>
	<a href="teacherTestVideo.do?midx=${sessionScope.midx}">테스트동영상</a>
	<a href="teacherNoticeMain.do">공지</a>
	<a href="teacherResult.do?midx=${sessionScope.midx}">성과</a>
	<a href="teacherReviewMain.do?midx=${sessionScope.midx}">후기</a>
	<a href="teacherAsk.do?midx=${sessionScope.midx}">문의</a>
</div>

<div>
	<h2>강좌</h2>
</div>
	
<div>
	강좌 검토 과정에 최대 6일이 소요될 수 있습니다. EduMe에 강좌를 생성해보세요!
</div>	
	
<div><input type="button" onclick="javascript:location.href='createLectureMain.do'" value="신규 강좌"></div>

<h4>등록된 강의</h4>
<table>
<thead>
	<tr>
		<th>강의 제목</th>
		<th>강의 부제목</th>
		<th>난이도</th>
		<th>썸네일경로</th>
		<th>개요</th>
		<th>강의목적</th>
		<th>기본 가격</th>
		<th>대상수강생</th>
		<th>필요사전지식</th>
		<th>카테고리 대</th>
		<th>카테고리 중</th>
		<th>카테고리 소</th>
		<th>등록날짜</th>
	</tr>
</thead>

<tbody>
<c:forEach var="dto" items="${list}">
	<tr>
		<td><a href="lectureContentSee.do?lidx=${dto.lidx}">${dto.ltitle}</a></td>
		<td>${dto.lsubtitle}</td>
		<td>${dto.llevel}</td>
		<td><img width="100" height="100" src="${dto.lthumnail}"></td>
		<td>${dto.lsummary}</td>
		<td>${dto.lpurpose}</td>
		<td>${dto.lorignprice}</td>
		<td>${dto.ltarget}</td>
		<td>${dto.lknowledge}</td>
		<td>${dto.cat1_idx}</td>
		<td>${dto.cat2_idx}</td>
		<td>${dto.cat3_idx}</td>
		<td>${dto.lwritedate}</td>
	</tr>
</c:forEach>
</table>

<h4>등록대기 강의</h4>
<table>
<thead>
	<tr>
		<th>강의 제목</th>
		<th>강의 부제목</th>
		<th>난이도</th>
		<th>썸네일경로</th>
		<th>개요</th>
		<th>강의목적</th>
		<th>기본 가격</th>
		<th>대상수강생</th>
		<th>필요사전지식</th>
		<th>카테고리 대</th>
		<th>카테고리 중</th>
		<th>카테고리 소</th>
		<th>등록날짜</th>
	</tr>
</thead>

<tbody>
<c:forEach var="dto1" items="${list1}">
	<tr>
		<td><a href="lectureContentSee.do?lidx=${dto1.lidx}">${dto1.ltitle}</a></td>
		<td>${dto1.lsubtitle}</td>
		<td>${dto1.llevel}</td>
		<td><img width="100" height="100" src="${dto1.lthumnail}"></td>
		<td>${dto1.lpurpose}</td>
		<td>${dto1.lorignprice}</td>
		<td>${dto1.ltarget}</td>
		<td>${dto1.lknowledge}</td>
		<td>${dto1.cat1_idx}</td>
		<td>${dto1.cat2_idx}</td>
		<td>${dto1.cat3_idx}</td>
		<td>${dto1.lwritedate}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>