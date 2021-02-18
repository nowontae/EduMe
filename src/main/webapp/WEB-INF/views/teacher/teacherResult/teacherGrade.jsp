<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="Chart.js"></script>
<script type="text/javascript" src="httpRequest.js"></script>
<style>
body{
	width: 1000px;
	height: 1000px;
}
.lectureResultUl{
	list-style: none;
	padding-left: 5px;
}
#resultA{
	float: left;
	width: 200px;
}
#gradeA{
	width: 200px;
}
#dumiA{
clear: both;
}
</style>
</head>
<body>
<div style="border: 1px solid black;">
	<div style="border: 1px solid black;">
	<h2>개요</h2>
	</div>
	<div style="border: 1px solid black;">
	<h3>성과에 대한 최고의 통찰력 얻기</h3>
	</div>
	<div style="border: 1px solid black;">
		<div style="border: 1px solid black;">
			<ul role="tablist" class="lectureResultUl">
				<li role="presentation" id="resultA">
					<a role="tab" href="teacherResult.do?midx=${sessionScope.midx}" class="LiAtag">
						<div>
							<div>
								<div>총 수익</div>
								<div>${allResult}원</div>
								<div>${monthResult}원 (최근 한달)</div>
							</div>
						</div>
					</a>
				</li>
				<li role="presentation" id="gradeA">
					<a role="tab" href="teacherGrade.do?midx=${sessionScope.midx}" class="LiAtag">
						<div>
							<div>
								<div>강사 평점</div>
								<div>${allGrade}점 (전체)</div>
								<div>${m1GradeCount}개 (최근 한달 평점 갯수)</div>
							</div>
						</div>
					</a>
				</li>
				<li role="presentation" id="dumiA"></li>
			</ul>
		</div>
		<div style="border: 1px solid black;">
		</div>
	</div>
</div>
</body>

</html>