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
#chartSvg{
	width:600px; height:400px;
}
</style>
<script>
function firstChart(){
	  var M1camount=document.getElementById("M1camount").value;
	  var M2camount=document.getElementById("M2camount").value;
	  var M3camount=document.getElementById("M3camount").value;
	  var M4camount=document.getElementById("M4camount").value;
	  

	var maxM=Math.max(M1camount,M2camount,M3camount,M4camount)*1.5;  

	  const data = [
	      { value : M1camount, time : new Date("2021-02-16") },
	      { value : M2camount, time : new Date("2021-02-09") },
	      { value : M3camount, time : new Date("2021-02-02") },
	      { value : M4camount, time : new Date("2021-01-26") }
	    ];

	  
	    const xScale = d3.scaleTime()
	      .domain([new Date("2021-01-26"), new Date("2021-02-16")])
	      .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
	    
	    const yScale = d3.scaleLinear()
	      .domain([0, maxM])
	      .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

	    //SVG 안에 G 태그를 생성한다.
	    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,330)");
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
	    .style("fill", "black")
	    
	     //선을 생성하는 함수
	    const linearGenerator = d3.line()
	      .x(d=>xScale(d.time))
	      .y(d=>yScale(d.value))

	    d3.select("svg")
	      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
	      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
	      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
	      .attr("stroke-width", 2)            // - 굵기
	      .attr("stroke", "black")            // - 검정색
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
			/*
			var svgchart=document.getElementById('chartSvg');
			var chartDiv=document.getElementById('chartDiv');
			chartDiv.removeChild(svgchart);
			
			
			var chartSvg=document.createElement('svg');
			chartSvg.setAttribute('id','chartSvg');
			chartDiv.prepend(chartSvg);
			*/
			
			var allData=XHR.responseText;
			allData=eval('('+allData+')');
			
			
			
			var resultMax=Math.max.apply(null,allData.chart.data)*1.5;
			
			var resultD1=allData.chart.data[0];
			var resultD2=allData.chart.data[1];
			var resultD3=allData.chart.data[2];
			var resultD4=allData.chart.data[3];
			
			var chartlabelD1=allData.chart.labels[0];
			var chartlabelD2=allData.chart.labels[1];
			var chartlabelD3=allData.chart.labels[2];
			var chartlabelD4=allData.chart.labels[3];
			
			  const data = [
			      { value : resultD1, time : new Date(chartlabelD1) },
			      { value : resultD2, time : new Date(chartlabelD2) },
			      { value : resultD3, time : new Date(chartlabelD3) },
			      { value : resultD4, time : new Date(chartlabelD4) }
			    ];

			    const xScale = d3.scaleTime()
			      .domain([new Date(chartlabelD1), new Date(chartlabelD4)])
			      .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
			    
			    const yScale = d3.scaleLinear()
			      .domain([0, resultMax])
			      .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

			    //SVG 안에 G 태그를 생성한다.
			    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,330)");
			    const yAxisSVG = d3.select("svg").append("g");
			    
			    //축을 만드는 함수를 만든다.
			    const xAxis = d3.axisBottom(xScale).tickSize(10).ticks(10);
			    const yAxis = d3.axisRight(yScale).tickSize(10).ticks(10);
			    xAxis(xAxisSVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			    yAxis(yAxisSVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
			    
			    d3.selectAll("svg").data(data).exit().remove();
			    
			    d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
			    .data(data)                         // 2.찾은 요소에 데이터를 씌운다.
			    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우..
			    .append("circle")                   // 4.circle 을 추가한다.
			    .attr("r", 5)                       //  - 반지름 5픽셀
			    .attr("cx", d=>xScale(d.time))      //  - x 위치값 설정.
			    .attr("cy", d=>yScale(d.value))     //  - y 위치값 설정. 
			    .style("fill", "black")
			    
			     //선을 생성하는 함수
			    const linearGenerator = d3.line()
			      .x(d=>xScale(d.time))
			      .y(d=>yScale(d.value))

			    d3.select("svg")
			      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
			      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
			      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
			      .attr("stroke-width", 2)            // - 굵기
			      .attr("stroke", "black")            // - 검정색
			
		}
	}
}


function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			/*
			var svgchart=document.getElementById('chartSvg');
			var chartDiv=document.getElementById('chartDiv');
			chartDiv.removeChild(svgchart);
			*/
			
			
			
			var yData=XHR.responseText;
			yData=eval('('+yData+')');
			
			var resultYMax=Math.max.apply(null,yData.chart.data)*1.5;
			
			var resultY1=yData.chart.data[0];
			var resultY2=yData.chart.data[1];
			var resultY3=yData.chart.data[2];
			var resultY4=yData.chart.data[3];
			var resultY5=yData.chart.data[4];
			var resultY6=yData.chart.data[5];
			
			console.log(resultY1);
			console.log(resultY2);
			console.log(resultY3);
			console.log(resultY4);
			console.log(resultY5);
			console.log(resultY6);

			var chartlabelY1=yData.chart.labels[0];
			var chartlabelY2=yData.chart.labels[1];
			var chartlabelY3=yData.chart.labels[2];
			var chartlabelY4=yData.chart.labels[3];
			var chartlabelY5=yData.chart.labels[4];
			var chartlabelY6=yData.chart.labels[5];
			
			
			
			  const data = [
			      { value : resultY1, time : new Date(chartlabelY1) },
			      { value : resultY2, time : new Date(chartlabelY2) },
			      { value : resultY3, time : new Date(chartlabelY3) },
			      { value : resultY4, time : new Date(chartlabelY4) },
			      { value : resultY5, time : new Date(chartlabelY5) },
			      { value : resultY6, time : new Date(chartlabelY6) }
			    ];

			    const xScale = d3.scaleTime()
			      .domain([new Date(chartlabelY1), new Date(chartlabelY6)])
			      .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
			    
			    const yScale = d3.scaleLinear()
			      .domain([0, resultYMax])
			      .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

			    //SVG 안에 G 태그를 생성한다.
			    const xAxisSVG = d3.select("svg").append("g").attr("transform", "translate(0,330)");
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
			    .style("fill", "black")
			    
			     //선을 생성하는 함수
			    const linearGenerator = d3.line()
			      .x(d=>xScale(d.time))
			      .y(d=>yScale(d.value))

			    d3.select("svg")
			      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
			      .attr("d", linearGenerator(data))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
			      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
			      .attr("stroke-width", 2)            // - 굵기
			      .attr("stroke", "black")            // - 검정색
			    
			    
			    d3.selectAll("svg").data(data, function(d){return d;}).exit().remove();
			    
			    var chartSvg=document.createElement('svg');
				chartSvg.setAttribute('id','chartSvg');
				chartDiv.prepend(chartSvg);
			  
				
				  const datas = [
				      { value : resultY1, time : new Date(chartlabelY1) },
				      { value : resultY2, time : new Date(chartlabelY2) },
				      { value : resultY3, time : new Date(chartlabelY3) },
				      { value : resultY4, time : new Date(chartlabelY4) },
				      { value : resultY5, time : new Date(chartlabelY5) },
				      { value : resultY6, time : new Date(chartlabelY6) }
				    ];

				    const xScale2 = d3.scaleTime()
				      .domain([new Date(chartlabelY1), new Date(chartlabelY6)])
				      .range([20, 330]); // [0, 350] 을 넣어도 되지만.. 그러면 축이 너무 붙어있어서 20~330으로 설정.
				    
				    const yScale2 = d3.scaleLinear()
				      .domain([0, resultYMax])
				      .range([330, 20]); // SVG 좌표상에서 y값이 높을수록 아래로 향하기 때문에 뒤집어서 330~20으로 설정.

				    //SVG 안에 G 태그를 생성한다.
				    const xAxis2SVG = d3.select("svg").append("g").attr("transform", "translate(0,330)");
				    const yAxis2SVG = d3.select("svg").append("g");
				    
				    //축을 만드는 함수를 만든다.
				    const xAxis2 = d3.axisBottom(xScale2).tickSize(10).ticks(10);
				    const yAxis2 = d3.axisRight(yScale2).tickSize(10).ticks(10);
				    xAxis2(xAxis2SVG);  //x축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
				    yAxis2(yAxis2SVG);  //y축을 만드는 함수로 SVG > G 태그에 축을 생성한다.
				
				
			    
			    d3.select("svg").selectAll("circle")  // 1.SVG 태그 안에 있는 circle을 모두 찾는다.
			    .data(datas)                         // 2.찾은 요소에 데이터를 씌운다.
			    .enter()                            // 3.찾은 요소에 개수보다 데이터가 더 많을경우.. enter()
			    .append("circle")                   // 4.circle 을 추가한다.
			    .attr("r", 5)                       //  - 반지름 5픽셀
			    .attr("cx", d=>xScale2(d.time))      //  - x 위치값 설정.
			    .attr("cy", d=>yScale2(d.value))     //  - y 위치값 설정. 
			    .style("fill", "black")
			    
			     //선을 생성하는 함수
			    const linearGenerator2 = d3.line()
			      .x(d=>xScale2(d.time))
			      .y(d=>yScale2(d.value))

			    d3.select("svg")
			      .append("path")                     // SVG 태그 안에 path 속성을 추가한다.
			      .attr("d", linearGenerator2(datas))   // - 라인 생성기로 'd' 속성에 들어갈 좌표정보를 얻는다.
			      .attr("fill", "none")               // - 라인 안쪽 채우지 않음.
			      .attr("stroke-width", 2)            // - 굵기
			      .attr("stroke", "black")            // - 검정색
			
			
		}
	}
}
</script>
</head>
<body onload="firstChart()">
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
		<div style="border: 1px solid black;" id="chartDiv">
<svg id="chartSvg"></svg>


			<select name="searchMonth" id="sortSelectBox" onchange="categoryChange(this, ${sessionScope.midx })">
				<option value="1">최근 1개월</option>
				<option value="6">최근 6개월</option>
				<option value="12">최근 1년</option>
			</select>
			최근 1년까지의 데이터만 표시됩니다.
		</div>
	</div>
<input type="hidden" id="M1camount" value="${M1camount}">
<input type="hidden" id="M2camount" value="${M2camount}">
<input type="hidden" id="M3camount" value="${M3camount}">
<input type="hidden" id="M4camount" value="${M4camount}">
</div>
</body>
</html>