<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript" src="resultChart.js?"></script>
<style>
#ResultTitle{
	margin-bottom: 40px;
    margin-top: 35px;
}
.lectureResultUl{
	list-style: none;
	padding-left: 5px;
}
#resultA{
	margin-top:5px;
	float: left;
	width: 200px;
	margin-left: 25%;
}
#gradeA{
	margin-top:5px;
	float: left;
	width: 200px;
    margin-left: 15%;
}
#dumiA{
clear: both;
}
#line{
	vertical-align: bottom;
    border-top: 2px solid #dee2e6;
    border-bottom: 2px solid #dee2e6;
}
.svgArea{
	margin-left: 30%;
	margin-top: 20px;
}
#marginAll{
	margin-left: 15%;
    margin-right: 15%;
}
#chartDiv {
    float: right;
    margin-top:5px;
}
#pont{
	font-weight: bold;
	padding-bottom: 5px;
}
</style>
</head>
<body onload="firstChart()" >
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>

<!--  전체 본문 영역 -->
<div id="bodyID">

	<!-- 성과 제목 -->
	<div id="ResultTitle">
		<h2>성과</h2>
	</div>  

	<table class="table" style="width:50vw !important; margin:0 auto">
	   	<tr>
	   		<th scope="col">총수익</th>
			<th scope="col">강사 평점</th>
		</tr>
		<tr>
			<td>${allResult}원</td>
			<td>${allGrade}점 (전체)</td>
		</tr>
		<tr>
			<td>${monthResult}원 (최근 한달)</td>
			<td>${m1GradeCount}개 (최근 한달 평점 갯수)</td>
		</tr>
		<tr>
			<td colspan="2" class="text-right">
				<span>날짜 범위</span>
				<select name="searchMonth" id="sortSelectBox" onchange="categoryChange(this, ${sessionScope.midx})">
					<option value="1">최근 1개월</option>
					<option value="6">최근 6개월</option>
					<option value="12">최근 1년</option>
				</select>
			</td>
	</table>
	
	<div id="hiddenData">
		<input type="hidden" id="M1camount" value="${M1camount}">
		<input type="hidden" id="M2camount" value="${M2camount}">
		<input type="hidden" id="M3camount" value="${M3camount}">
		<input type="hidden" id="M4camount" value="${M4camount}">
	</div>

	<div id="svgArea" class="svgArea"><p></p></div>

 </div> <!-- BodyID -->

<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>

</html>