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
#myChart{
	width: 600px !important;
	height:400px !important;
}
body{
	width: 800px;
	height: 800px;
}
.lectureResultUl{
	list-style: none;
	padding-left: 0px;
}
.ResultLi{
	float: left;
}
#ResultLiLast{
	position: relative;
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
				<li role="presentation" class="ResultLi">
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
				<li role="presentation" class="ResultLiLast">
					<a role="tab" href="teacherGrade.do?midx=${sessionScope.midx}" class="LiAtag">
						<div>
							<div>
								<div>강사 평점</div>
								<div>0.00</div>
								<div>0개의 평점 (최근 한달)</div>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div style="border: 1px solid black;">
		<svg id="chartSvg"></svg>
			최근 1년까지의 데이터만 표시됩니다.
		</div>
	</div>
</div>
</body>

</html>