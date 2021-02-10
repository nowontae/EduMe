<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" value="<강좌로 돌아가기" onclick="location.href='createLectureMain.do'">
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

<div id="sectionAll">
	<div>
		<span>섹션 1<input type="hidden">:</span>
		<span><input type="text" name="lcsection"></span>
	</div>
	
	<div id="partAll">
		<div>
			<span>강의 1(숫자증가):<input type="hidden" name="lcpart"></span>
			<span><input type="text" name="lctitle"></span>
		</div>
		<div>
			<span>동영상 업로드</span>
			<span><input type="file" name="uploadCurri"></span>
		</div>
	</div>
	
	<div>
		<input type="button" value="강의 추가" onclick="partAdd()">
	</div>
</div>

<div>
	<input type="button" value="이전" onclick="location.href='createLectureMain.do'">
</div>
</div>
</form>
	<input type="button" value="제출">
</body>
</html>