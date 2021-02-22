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
<script type="text/javascript" src="resultChart.js?ver=1"></script>
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
<div id="bodyID">
<div>
	<div id="ResultTitle">
	<h2>성과</h2>
	</div>

	<div style="border: 1px solid black;">
		<div style="border: 1px solid black;" id="ulDiv">

      
     <div id="marginAll">
		<div id="line">
			<ul role="tablist" class="lectureResultUl">
				<li role="presentation" id="resultA">
					
						<div>
							<div>
								<div id="pont">총 수익</div>
								<div>${allResult}원</div>
								<div>${monthResult}원 (최근 한달)</div>
							</div>
						</div>
				</li>
				<li role="presentation" id="gradeA">
						<div>
							<div>
								<div id="pont">강사 평점</div>
								<div>${allGrade}점 (전체)</div>
								<div>${m1GradeCount}개 (최근 한달 평점 갯수)</div>
							</div>
						</div>
				</li>
			</ul>
		</div>
		<div id="chartDiv">
			<div>날짜범위: 
			<select name="searchMonth" id="sortSelectBox" onchange="categoryChange(this, ${sessionScope.midx})">
				<option value="1">최근 1개월</option>
				<option value="6">최근 6개월</option>
				<option value="12">최근 1년</option>
			</select>
		</div>
	</div>
<input type="hidden" id="M1camount" value="${M1camount}">
<input type="hidden" id="M2camount" value="${M2camount}">
<input type="hidden" id="M3camount" value="${M3camount}">
<input type="hidden" id="M4camount" value="${M4camount}">

<div id="svgArea" class="svgArea"><p></p></div>
</div>
</div>
</div>
</div>
</div>
<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>

</html>