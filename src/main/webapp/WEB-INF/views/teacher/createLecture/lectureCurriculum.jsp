<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureTitleSave" action="lectureCurriculumSave.do">
<div>
	<input type="button" value="<강좌로 돌아가기" onclick="location.href='teacherMain.do'">
</div>

<div>
	<strong>강좌 계획</strong>
	<ul>
		<li>
			<a href="createLectureForm.do">강의 주제</a>
		</li>
		
		<li >
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
	<h2>커리큘럼</h2>
</div>

<div>
	<div>섹션을 생성하여 강좌 만들기를 시작하세요.</div>
	<div>강좌를 무료로 제공하려면 동영상 콘텐츠의 총 길이가 2시간을 초과해서는 안 됩니다.</div>
</div>

<div>
	<input type="button" value="섹션 추가">
</div>

<div>
	<div>
		<span>섹션 1(숫자증가):</span>
		<span><input type="text" value="섹션 제목"></span>
	</div>
	
	<div>
		<div>
			<span>강의 1(숫자증가):</span>
			<span><input type="text" value="강의 제목"></span>
		</div>
		<div>
			<span>동영상 업로드</span>
			<span><input readonly type="text" value="선택된 파일 없음"></span>
			<span><input type="button" value="파일업로드"></span>
		</div>
	</div>
	
	<div>
		<input type="button" value="강의 추가">
	</div>
</div>
	
<div>
	<input type="submit" value="저장">
</div>
</form>
</body>
</html>