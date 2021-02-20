<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#exVideo{
width: 300px;
height: 300px;
}

#testSampleVideo{
top: auto;
left: auto;
bottom: auto;
right: auto;
height: 100%;
background-color: black;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>


<form name="testVideoUpload" method="post" enctype="multipart/form-data" action="testVideoUpload.do">


<div><h2>테스트 동영상을 만들어보세요!</h2></div>
<div class="">
	<div id="exVideo">
		<video controls preload="auto" id="testSampleVideo">
			<source src="C:\finalTestVideo/test.mp4" type="video/mp4">
		</video>
	</div>
</div>



<div id="testVideoDiv2">
<div> 짧은 테스트 동영상을 만드세요! 전문가가 오디오, 동영상, 어조, 전달력에 대해 이틀 안에 무료 피드백을 제공해 드립니다.<br> 그냥 샘플이기 때문에 어느 주제든 원하는 대로 동영상을 만들어 보십시오!</div>
<ul>
	<li>간단한 작업을 가르치세요!</li>
	<li>무언가에 열정을 갖게 된 이유를 설명하세요!</li>
	<li>물건 또는 기능과 그 사용법을 설명하세요!</li>
</ul>

<div>
	<div>테스트 동영상 업로드</div>
	<input type="text" class="form-control" name="tvsubject" placeholder="제목을 입력해주세요" style="width: 250px;"><br>
	<input type="file" class="form-control-file" name="upload"><br>
	<div><b>참고</b>:모든 파일은 720p 이상, 4.0GB 이하여야 합니다.</div>
</div>
</div>



<div>
<input type="hidden"  value="${midx}" name="midx">
<input type="submit" class="btn btn-primary" value="제출">
<input type="reset"  class="btn btn-primary" value="다시 작성">
</div>
</form>



<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>