<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var count=0;
function sectionAdd(){
count = $('.sec_num').length + 1; //현재 전체 섹션 수
	
	var lastDIV="";
	
	var sectionAllDiv=document.createElement("div");
	sectionAllDiv.style.border="2px solid";
	var sectionChildDiv=document.createElement("div");
	sectionAllDiv.appendChild(sectionChildDiv);
	
	var newsectionSpan=document.createElement("span");
	sectionChildDiv.appendChild(newsectionSpan);
	
	var newsectionHtml = "섹션<label class='sec_num'>"+count+"</label>:<input type='hidden' id='lcsection"+count+"' name='lcsection' value='"+count+"'>";
	
	newsectionHtml += "<input type='text' class='sec_title' name='lctitle"+count+"'>";
	
	newsectionSpan.innerHTML=newsectionHtml;
	
	var lcsectionSpan=document.createElement("span");
	sectionChildDiv.appendChild(lcsectionSpan);
	sectionAllDiv.setAttribute("class","sectionAll");
	sectionAllDiv.setAttribute("id","sectionAll"+count);

	var removeNode=document.createElement('button');
	removeNode.setAttribute('onclick','removeSection(this)');
	removeNode.innerHTML='삭제';
	
	sectionAllDiv.appendChild(removeNode);
	
	var partButtonDiv=document.createElement('div');
	sectionAllDiv.appendChild(partButtonDiv);
	partButtonDiv.innerHTML="<input type='button' value='강의 추가' onclick='partAdd(this, " + count + ")'>";
	
	sectionTotalDiv=document.getElementById("sectionTotal");
	sectionTotalDiv.appendChild(sectionAllDiv);

}

function removeSection(target){
	$(target).parent().remove(); //선택된 섹션 삭제
	
	$('.sec_num').each(function (index, item) { //전체 섹션에 다시 넘버링
		$(item).text(index + 1);
		$(item).next().val(index + 1);
		$(item).parent().parent().parent().find('.sec_title').each(function (index2, item2){
			$(item2).attr('name','lctitle'+(index+1));			
		});
		$(item).parent().parent().parent().find('.sec_video').each(function (index2, item2){
			$(item2).attr('name','lcvideo'+(index+1));			
		});
	});
	
	
}

function partAdd(obj, cnt){
	var num = $('.sectionAll').eq(cnt - 1).find('.partdiv').length + 1; //현재 섹션 내 강의 수
	var titleCount = $('.sectionAll').eq(cnt - 1).find('.sec_num').text();
	var partAllDiv=document.createElement("div");
	var partAllChildDiv1=document.createElement("div");
	var partAllChildDiv2=document.createElement("div");
	partAllDiv.appendChild(partAllChildDiv1);
	partAllDiv.appendChild(partAllChildDiv2);
	partAllDiv.className = 'partdiv';
	
	
	var partTitleNum = partAllDiv.parentNode
	var newPartSpan1=document.createElement("span");
	partAllChildDiv1.appendChild(newPartSpan1);
	newPartSpan1.innerHTML="강의<label class='part_num'>"+ num +"</label>:<input type='hidden' class='lcpart' name='lcpart' value='" + num +"'>";
	
	var newPartSpan2=document.createElement("span");
	partAllChildDiv1.appendChild(newPartSpan2);
	
	
	newPartSpan2.innerHTML="<input class='sec_title' type='text' name='lctitle"+titleCount+"'>";

	var newPartSpan3=document.createElement("span");
	partAllChildDiv2.appendChild(newPartSpan3);
	newPartSpan3.innerHTML="동영상 업로드<input type='file' name='lcvideo"+titleCount+"'>";

	var reNode=document.createElement('button');
	reNode.setAttribute('onclick','remove1(this, ' + cnt + ')');
	reNode.innerHTML='삭제';
	
	partAllChildDiv1.appendChild(reNode);
	
	$(obj).parent().after(partAllDiv); 
	$(obj).parent().parent().find('.part_num').each(function (index, item) { //강의가 추가될 때마다 다시 강의 넘버링
		$(item).text(index + 1);
		$(item).next().val(index + 1);
	});
}

function remove1(target, cnt){
	$(target).parent().parent().remove();
	$('.sectionAll').eq(cnt - 1).find('.partdiv').each(function (index, item) {
		$('.part_num', item).text(index + 1);
		$('.lcpart', item).val(index + 1);
	});
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<input type="button" class="btn btn-primary" value="<강좌로 돌아가기" onclick="location.href='createLectureUpdate.do?lidx=${lidx}'">
<form name="lectureCurriculum" action="lectureCurriculumSubmit.do?lidx=${lidx}" method="post" enctype="multipart/form-data">

<div id="curriculum">
<div>
	<h2>커리큘럼</h2>
</div>

<div>
	<div>섹션을 생성하여 강좌 만들기를 시작하세요.</div>
</div>

<div>
	<input type="button" class="btn btn-secondary" value="섹션 추가" onclick="sectionAdd()">
</div>

<div id="sectionTotal"></div>

<div>
	<input type="button" class="btn btn-primary" value="이전" onclick="location.href='createLectureMain.do'">
</div>
</div>
	<input type="submit" class="btn btn-primary" value="제출">
</form>


<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>