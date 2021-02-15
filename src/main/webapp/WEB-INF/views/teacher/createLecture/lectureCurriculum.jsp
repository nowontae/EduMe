<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var count=0;
function sectionAdd(){
	count++;
	
	var lastDIV="";
	
	var sectionAllDiv=document.createElement("div");
	sectionAllDiv.style.border="2px solid";
	var sectionChildDiv=document.createElement("div");
	sectionAllDiv.appendChild(sectionChildDiv);
	
	var newsectionSpan=document.createElement("span");
	sectionChildDiv.appendChild(newsectionSpan);
	
	var newsectionHtml = "섹션"+count+":<input type='hidden' name='lcsection' value='"+count+"'>";
	
	newsectionHtml += "<input type='text' name='lctitle'>";
	
	newsectionSpan.innerHTML=newsectionHtml;
	
	
	var lcsectionSpan=document.createElement("span");
	sectionChildDiv.appendChild(lcsectionSpan);
	
	sectionAllDiv.setAttribute("id","sectionAll"+count);
	
	
	
	
	var partButtonDiv=document.createElement('div');
	sectionAllDiv.appendChild(partButtonDiv);
	partButtonDiv.innerHTML="<input type='button' value='강의 추가' onclick='partAdd("+count+")'>";
	
	sectionTotalDiv=document.getElementById("sectionTotal");
	sectionTotalDiv.appendChild(sectionAllDiv);

	//var abcd=document.createElement('div');
	//abcd.innerHTML="<input type='hidden' id='abc"+count+"' value='0'>";
	//sectionTotalDiv.appendChild(abcd);

	
}

function partAdd(count){

	//var abc=document.getElementById('abc'+count).value;
	//abc++;
	
	var num = document.querySelectorAll("#sectionAll" + count + ' .partdiv').length + 1;
	
	var partAllDiv=document.createElement("div");
	var partAllChildDiv1=document.createElement("div");
	var partAllChildDiv2=document.createElement("div");
	partAllDiv.appendChild(partAllChildDiv1);
	partAllDiv.appendChild(partAllChildDiv2);
	partAllDiv.className = 'partdiv';
	
	var newPartSpan1=document.createElement("span");
	partAllChildDiv1.appendChild(newPartSpan1);
	newPartSpan1.innerHTML="강의"+ num +":<input type='hidden' name='lcpart' value='" + num +"'>";
	
	var newPartSpan2=document.createElement("span");
	partAllChildDiv1.appendChild(newPartSpan2);
	newPartSpan2.innerHTML="<input type='text' name='lctitle"+count+"[]'>";

	var newPartSpan3=document.createElement("span");
	partAllChildDiv2.appendChild(newPartSpan3);
	newPartSpan3.innerHTML="동영상 업로드<input type='file' name='lcvideo'>";

	var sectionAll=document.getElementById("sectionAll"+count);
	sectionAll.appendChild(partAllDiv);

	
}
</script>
</head>
<body>
<input type="button" value="<강좌로 돌아가기" onclick="location.href='teacherMain.do'">
<form name="lectureCurriculum" action="lectureCurriculum.do?midx=${midx}">
<div>
	<input type="submit" value="저장">
</div>

<div id="curriculum">
<div>
	<h2>커리큘럼</h2>
</div>

<div>
	<div>섹션을 생성하여 강좌 만들기를 시작하세요.</div>
	<div>강좌를 무료로 제공하려면 동영상 콘텐츠의 총 길이가 2시간을 초과해서는 안 됩니다.</div>
</div>

<div>
	<input type="button" value="섹션 추가" onclick="sectionAdd()">
</div>

<div id="sectionTotal"></div>

<div>
	<input type="button" value="이전" onclick="location.href='createLectureMain.do'">
</div>
</div>
</form>
	<input type="button" value="제출">
</body>
</html>