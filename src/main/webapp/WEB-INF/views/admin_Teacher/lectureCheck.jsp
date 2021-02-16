<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>강의리스트 관리페이지</h2>
</div>
<table>
	<thead>
	<tr>
		<th>강의 번호</th>
		<th>강사 번호</th>
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
		<th>공개여부</th>
	</tr>
	</thead>	
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="16" align="center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.lidx}</td>
				<td>${dto.midx}</td>
				<td><a href="teacherNoticeContent.do?nidx=${dto.nidx}">${dto.ltitle}</a></td>
				<td>${dto.lsubtitle}</td>
				<td>${dto.llevel}</td>
				<td><img width="300" height="300" src="${dto.lthumnail}"></td>
				<td>${dto.lpurpose}</td>
				<td>${dto.lorignprice}</td>
				<td>${dto.ltarget}</td>
				<td>${dto.lknowledge}</td>
				<td>${dto.cat1_idx}</td>
				<td>${dto.cat2_idx}</td>
				<td>${dto.cat3_idx}</td>
				<td>${dto.lwritedate}</td>
				<td>${dto.lopen}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>