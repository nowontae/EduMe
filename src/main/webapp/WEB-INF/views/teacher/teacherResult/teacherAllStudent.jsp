<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="Chart.js"></script>
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
					<a role="tab" href="#" class="LiAtag">
						<div>
							<div>
								<div>총 수익</div>
								<div>0원</div>
								<div>0원 이번 달</div>
							</div>
						</div>
					</a>
				</li>
				<li role="presentation" class="ResultLi">
					<a role="tab" href="#" class="LiAtag">
						<div>
							<div>
								<div>총 등록</div>
								<div>0</div>
								<div>0 이번 달</div>
							</div>
						</div>
					</a>
				</li>
				<li role="presentation" class="ResultLiLast">
					<a role="tab" href="#" class="LiAtag">
						<div>
							<div>
								<div>강사 평점</div>
								<div>0.00</div>
								<div>0개의 평점</div>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div style="border: 1px solid black;">
			<canvas id="myChart"></canvas>
			<select name="기준">
				<option selected="selected">기준 날짜</option>
				<option value="6">6개월</option>
				<option value="12">1년</option>
				<option value="all">전체</option>
			</select>
		</div>
	</div>
</div>
	<script>
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "1~3월", "4~6월", "7~9월","10~12월" ],
				datasets : [ {
					label : '명',
					data : [ 30,80, 70, 50 ],
					backgroundColor:[
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)'
					],
					borderColor:[
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)'
					],
					borderWidth:2
				} ]
			},
			option:{
				maintainAspectRatio: false,
				scales:{
					yAxes:[{
						ticks:{
							beginAtZero:true
						}
					}]
				},
			}
		});
	</script>
</body>
</html>