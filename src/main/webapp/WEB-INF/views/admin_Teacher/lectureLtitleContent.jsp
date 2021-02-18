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
	<h2>강의 정보</h2>
</div>
<form action="lectureOpen.do">
<table>
	<tr>
		<td>강의 번호 ${dto.lidx}</td>
		<td>강사 번호 ${dto.midx}</td>
		<td>강의 제목 ${dto.ltitle}</td>
	</tr>
	<tr>
		<td>강의 부제목 ${dto.lsubtitle}</td>
		<td>난이도 ${dto.llevel}</td>
		<td>썸네일경로 ${dto.lthumnail}</td>
		<td>개요 ${dto.lsummary}</td>
	</tr>
	<tr>	
		<td>강의 목적 ${dto.lpurpose}</td>
		<td>기본 가격 ${dto.lorignprice}</td>
		<td>대상수강생 ${dto.ltarget}</td>
	</tr>
	<tr>	
		<td>필요사전지식 ${dto.lknowledge}</td>
		<td>카테고리 대 ${dto.cat1_idx}</td>
		<td>카테고리 중 ${dto.cat2_idx}</td>
	</tr>
	<tr>	
		<td>카테고리 소 ${dto.cat3_idx}</td>
		<td>등록날짜 ${dto.lwritedate}</td>
		<td>공개여부${dto.lopen} </td>
	</tr>
	<tr>
		<td>강의 섹션 ${myClass.lcsection}</td>
		<td>강의 파트 ${myClass.lcpart}</td>
		<td>제목 ${myClass.lctitle}</td>
	</tr>
	<tr>
		<td><video src="video/${myClass.lcvideo}" controls width="300px"></video> </td>
		<td>샘플동영상 여부 ${myClass.lcsample}</td>
	</tr>
	
	<tr>
		<td><input type="hidden" value="${dto.lidx}" name="lidx">
		<input type="submit" value="강좌 등록"></td>
	</tr>
</table>
</form>
</body>
</html>