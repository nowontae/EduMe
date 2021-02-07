<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureTitle" action="lectureTitleSave.do">
<div>
	<input type="button" value="<강좌로 돌아가기" onclick="location.href='teacherMain.do'">
	<input type="submit" value="저장">
</div>

<div>
	<strong>강좌 계획</strong>
	<ul>
		<li>
			<a href="createLectureForm.do">강의 주제</a>
		</li>
		
		<li>
			<a href="lectureCategory.do">카테고리</a>
		</li>
		
		<li>
			<a href="lectureStudentInfo.do">수강생 세부사항</a>
		</li>
	</ul>	
</div>

<div>
	<strong>강좌 게시</strong>
	<ul>
		<li>
			<a href="lectureLadingPage.do">강좌 랜딩 페이지</a>
		</li>
		
		<li>
			<a href="lectureCurriculum.do">커리큘럼</a>
		</li>
		
		<li>
			<a href="lecturePrice.do">가격 책정</a>
		</li>
	</ul>	
</div>

<div>
	<input type="button" value="검토를 위해 제출">
</div>


<div>
	<h2>강의 주제</h2>
</div>

<div>
	<span>강좌 제목을 작성해주세요.</span>
	<div><input type="text" value="강좌 제목"></div>
</div>

<div>
	<span>강좌 부제목을 작성해주세요.</span>
	<div><input type="text" value="강좌 부제목"></div>
</div>

<div>
	<span>난이도를 설정해주세요.</span>
	<div>☆☆☆☆☆</div>
</div>

</form>
</body>
</html>