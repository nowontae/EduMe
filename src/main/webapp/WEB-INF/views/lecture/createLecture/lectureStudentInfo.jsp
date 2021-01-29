<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureTitleSave" action="lectureStudentInfoSave.do">
<div>
	<input type="button" value="<강좌로 돌아가기" onclick="location.href='lectureMain.do'">
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
	<h2>수강생 세부사항</h2>
</div>

<div>
	<span>개요</span>
	<div><input type="text" value="예:나는야 개발의 신!"></div>
</div>

<div>
		<span>수강생이 강좌를 통해 무엇을 배우게 됩니까?</span>
	<div><input type="text" value="예:자바 기초"></div>
</div>
	
<div>
		<span>강좌 요구사항 또는 사전조건이 있습니까?</span>
	<div><input type="text" value="예:자바 용어를 읽을 수 있음"></div>
</div>

<div>
		<span>대상 수강생이 누구입니까?</span>
	<div><input type="text" value="예:웹 개발에 관심이 있는 초보 자바 개발자"></div>
</div>
	
<div>
	<input type="submit" value="저장">
</div>
</form>
</body>
</html>