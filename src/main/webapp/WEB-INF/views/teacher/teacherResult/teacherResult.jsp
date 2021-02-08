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
				<li role="presentation" class="ResultLi">
					<a role="tab" href="teacherAllStudent.do?midx=${sessionScope.midx}" class="LiAtag">
						<div>
							<div>
								<div>총 등록</div>
								<div>0</div>
								<div>0 (최근 한달)</div>
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
			<canvas id="myChart"></canvas>
			<select name="searchMonth" id="sortSelectBox" onchange="categoryChange(this)">
				<option value="1">최근 1개월</option>
				<option value="6">최근 6개월</option>
				<option value="12">최근 1년</option>
			</select>
			최근 1년까지의 데이터만 표시됩니다.
		</div>
	</div>
</div>
<input type="hidden" id="M1camount" value="${M1camount}">
<input type="hidden" id="M2camount" value="${M2camount}">
<input type="hidden" id="M3camount" value="${M3camount}">
<input type="hidden" id="M4camount" value="${M4camount}">
</body>
<script>
var M1camount=document.getElementById("M1camount").value;
var M2camount=document.getElementById("M2camount").value;
var M3camount=document.getElementById("M3camount").value;
var M4camount=document.getElementById("M4camount").value;

var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
	type : 'bar',
	data : {
		labels : [ "1주전", "1~2주전", "2~3주전","3~4주전" ],
		datasets : [ {
			label : '단위: 원',
			data : [M1camount,M2camount,M3camount,M4camount],
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
		responsive: false,
		scales:{
			yAxes:[{
				ticks:{
					beginAtZero:true
				}
			}]
		},
	}
});

function categoryChange(s){
	//var target=document.getElementById("sortSelectBox");
	//var sort=target.options[target.selectedIndex].value;
	var sort=0;
	if(s.value == 1){
		 sort=1;	 
	}else if(s.value == 6){
		 sort=6; 
	}else if(s.value == 12){sort=12;}
	
	console.log(sort);
	
	
	sendRequest('teacherResultChart.do',sort,showResult,'POST');
	
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			//var resultData="";
			var result1=data.chart.data[0];
			var result2=data.chart.data[1];
			var result3=data.chart.data[2];
			var result4=data.chart.data[3];
			var result5=data.chart.data[4];
			var result6=data.chart.data[5];
			
			console.log(result1);
			
			var chartlabel1=data.chart.labels[0];
			var chartlabel2=data.chart.labels[1];
			var chartlabel3=data.chart.labels[2];
			var chartlabel4=data.chart.labels[3];
			var chartlabel5=data.chart.labels[4];
			var chartlabel6=data.chart.labels[5];
			
			console.log(chartlabel1);
			
			//for(var i=0; data.chart.data.length; i++){
			//		resultData+=data.chart.data[i]+",";
			//}
			//resultData.slice(0,-1);
			//var resultLabels="";
			//for(var i=0; data.chart.labels.length; i++){
			//	resultLabels+=data.chart.labels[i]+",";
			//}
			//resultLabels.slice(0,-1);
			var ctx = document.getElementById("myChart");
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ chartlabel1,chartlabel2,chartlabel3,chartlabel4,chartlabel5,chartlabel6 ],
					datasets : [ {
						label : '단위: 원',
						data : [ result1,result2,result3,result4,result5,result6 ],
						backgroundColor:[
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'	
						],
						borderColor:[
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
						],
						borderWidth:2
					} ]
				},
				option:{
					maintainAspectRatio: false,
					responsive: false,
					scales:{
						yAxes:[{
							ticks:{
								beginAtZero:true
							}
						}]
					},
				}
			});
			
		}
	}
}
</script>
</html>