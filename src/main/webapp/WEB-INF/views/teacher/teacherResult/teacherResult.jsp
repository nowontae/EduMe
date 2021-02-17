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
<style>
#myChart{
	width: 600px !important;
	height:400px !important;
}
body{
	width: 1000px;
	height: 1000px;
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
<script>
function firstChart(){
	  var M1camount=document.getElementById("M1camount").value;
	  var M2camount=document.getElementById("M2camount").value;
	  var M3camount=document.getElementById("M3camount").value;
	  var M4camount=document.getElementById("M4camount").value;
	  

	var maxM=Math.max(M1camount,M2camount,M3camount,M4camount)*1.2;  
	      			
		  const data = [
		      { value : M1camount, time : new Date("2021-02-10") },
		      { value : M2camount, time : new Date("2021-02-03") },
		      { value : M3camount, time : new Date("2021-01-27") },
		      { value : M4camount, time : new Date("2021-01-20") }
		    ];
		  
		  
		  var canvas = d3.select("body").append("svg").attr("width", 800).attr("height", 600).attr("id","chartSvg")
		  

		    const xScale = d3.scaleTime()
		      .domain([new Date("2021-02-10"), new Date("2021-01-20")])
		      .range([20, 500]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
		    
		    const yScale = d3.scaleLinear()
		      .domain([0, maxM])
		      .range([500, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

		    //SVG 안에 G 태그를 생성한다.
		    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,500)");
		    const yAxisSVG = d3.select("svg").append("g");
		    
		    //축을 만드는 함수를 만든다.
		    const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);
		    const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);
		    xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
		    yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
		    
	
		    d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
		    .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
		    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
		    .append("circle")                   // 4.circle 을 추가한다.
		    .attr("r", 5)                       //  - 반지름 5픽셀
		    .attr("cx", d=>xScale(d.time))      //  - x 위치값 설정.
		    .attr("cy", d=>yScale(d.value))     //  - y 위치값 설정. 
		    .style("fill", "blue")
		    
		     //선을 생성하는 함수
		    const linearGenerator = d3.line()
		      .x(d=>xScale(d.time))
		      .y(d=>yScale(d.value))

		    d3.select("svg")
		      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
		      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
		      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
		      .attr("stroke-width", 2)            // - 굵기
		      .attr("stroke", "green")            // - 검정색
		
	}
	



function categoryChange(s, midx){
	var sort=0;
	if(s.value == 1){
		 sort=1;
		 var params = "sort="+sort+"&midx="+midx;
			sendRequest('teacherResultChart.do',params,showResult1,'POST');
	}else if(s.value == 6){
		 sort=6; 
		 var params = "sort="+sort+"&midx="+midx;
			sendRequest('teacherResultChart.do',params,showResult,'POST');
	}else if(s.value == 12)
	{
		sort=12;
		var params = "sort="+sort+"&midx="+midx;
		sendRequest('teacherResultChart.do',params,showResult,'POST');
	}

	
	
}


function showResult1(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var bodyNode=document.getElementById("bodyID");
			var svgNode=document.getElementById("chartSvg");
			bodyNode.removeChild(svgNode);
			
			var allData=XHR.responseText;
			
			var alldata=JSON.parse(allData);
			
			
			
			
			var resultMax=Math.max.apply(null,alldata.chart.data)*1.2;
			var resultD1=alldata.chart.data[0];
			var resultD2=alldata.chart.data[1];
			var resultD3=alldata.chart.data[2];
			var resultD4=alldata.chart.data[3];
			
			var chartlabelD1=alldata.chart.labels[0];
			var chartlabelD2=alldata.chart.labels[1];
			var chartlabelD3=alldata.chart.labels[2];
			var chartlabelD4=alldata.chart.labels[3];
			
			
			  const data = [
			      { value : resultD1, time : new Date(chartlabelD1) },
			      { value : resultD2, time : new Date(chartlabelD2) },
			      { value : resultD3, time : new Date(chartlabelD3) },
			      { value : resultD4, time : new Date(chartlabelD4) }
			    ];
			  
			  
			  var canvas = d3.select("body").append("svg").attr("width", 800).attr("height", 600).attr("id","chartSvg")
			  

			    const xScale = d3.scaleTime()
			      .domain([new Date(chartlabelD1), new Date(chartlabelD4)])
			      .range([20, 500]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
			    
			    const yScale = d3.scaleLinear()
			      .domain([0, resultMax])
			      .range([500, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

			    //SVG 안에 G 태그를 생성한다.
			    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,500)");
			    const yAxisSVG = d3.select("svg").append("g");
			    
			    //축을 만드는 함수를 만든다.
			    const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);
			    const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);
			    xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			    yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			    
		
			    d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
			    .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
			    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
			    .append("circle")                   // 4.circle 을 추가한다.
			    .attr("r", 5)                       //  - 반지름 5픽셀
			    .attr("cx", d=>xScale(d.time))      //  - x 위치값 설정.
			    .attr("cy", d=>yScale(d.value))     //  - y 위치값 설정. 
			    .style("fill", "blue")
			    
			     //선을 생성하는 함수
			    const linearGenerator = d3.line()
			      .x(d=>xScale(d.time))
			      .y(d=>yScale(d.value))

			    d3.select("svg")
			      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
			      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
			      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
			      .attr("stroke-width", 2)            // - 굵기
			      .attr("stroke", "green")            // - 검정색
			
		}
	}
}


function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var bodyNode=document.getElementById("bodyID");
			var svgNode=document.getElementById("chartSvg");
			bodyNode.removeChild(svgNode);
			
			
			var yData=XHR.responseText;
			
			var ydata=JSON.parse(yData);
			
			var resultYMax=Math.max.apply(null,ydata.chart.data)*1.2;

			var resultY1=ydata.chart.data[0];
			var resultY2=ydata.chart.data[1];
			var resultY3=ydata.chart.data[2];
			var resultY4=ydata.chart.data[3];
			var resultY5=ydata.chart.data[4];
			var resultY6=ydata.chart.data[5];

			var chartlabelY1=ydata.chart.labels[0];
			var chartlabelY2=ydata.chart.labels[1];
			var chartlabelY3=ydata.chart.labels[2];
			var chartlabelY4=ydata.chart.labels[3];
			var chartlabelY5=ydata.chart.labels[4];
			var chartlabelY6=ydata.chart.labels[5];
			

			  const data = [
			      { value : resultY1, time : new Date(chartlabelY1) },
			      { value : resultY2, time : new Date(chartlabelY2) },
			      { value : resultY3, time : new Date(chartlabelY3) },
			      { value : resultY4, time : new Date(chartlabelY4) },
			      { value : resultY5, time : new Date(chartlabelY5) },
			      { value : resultY6, time : new Date(chartlabelY6) }
			    ];
			  
			  var canvas = d3.select("body").append("svg").attr("width", 800).attr("height", 600).attr("id","chartSvg")
			  

			    const xScale = d3.scaleTime()
			      .domain([new Date(chartlabelY1), new Date(chartlabelY6)])
			      .range([20, 500]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
			    
			    const yScale = d3.scaleLinear()
			      .domain([0, resultYMax])
			      .range([500, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

			    //SVG 안에 G 태그를 생성한다.
			    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,500)");
			    const yAxisSVG = d3.select("svg").append("g");
			    
			    //축을 만드는 함수를 만든다.
			    const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);
			    const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);
			    xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			    yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			
			    
			    d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
			    .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
			    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우.. enter()
			    .append("circle")                   // 4.circle 을 추가한다.
			    .attr("r", 5)                       //  - 반지름 5픽셀
			    .attr("cx", d=>xScale(d.time))      //  - x 위치값 설정.
			    .attr("cy", d=>yScale(d.value))     //  - y 위치값 설정. 
			    .style("fill", "blue")
			    
			     //선을 생성하는 함수
			    const linearGenerator = d3.line()
			      .x(d=>xScale(d.time))
			      .y(d=>yScale(d.value))

			    d3.select("svg")
			      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
			      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
			      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
			      .attr("stroke-width", 2)            // - 굵기
			      .attr("stroke", "green")            // - 검정색
			
		}
	}
}

</script>
</head>
<body onload="firstChart()" id="bodyID">
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
					<a role="tab" href="teacherResult.do?midx=${sessionScope.midx}" class="LiAtag" id="resultA">
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
					<a role="tab" href="teacherGrade.do?midx=${sessionScope.midx}" class="LiAtag" id="gradeA">
						<div>
							<div>
								<div>강사 평점</div>
								<div>${allGrade}점 (전체)</div>
								<div>${m1GradeCount}개 (최근 한달 평점 갯수)</div>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div style="border: 1px solid black;" id="chartDiv">
			<select name="searchMonth" id="sortSelectBox" onchange="categoryChange(this, ${sessionScope.midx})">
				<option value="1">최근 1개월</option>
				<option value="6">최근 6개월</option>
				<option value="12">최근 1년</option>
			</select>
			최대 1년까지의 데이터만 표시됩니다.
		</div>
	</div>
<input type="hidden" id="M1camount" value="${M1camount}">
<input type="hidden" id="M2camount" value="${M2camount}">
<input type="hidden" id="M3camount" value="${M3camount}">
<input type="hidden" id="M4camount" value="${M4camount}">
</div>
</body>
</html>