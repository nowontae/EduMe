<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureTitleSave" action="lectureCategorySave.do">
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
	<h2>카테고리</h2>
</div>

<div>
<span>공유하려는 지식에 가장 적합한 카테고리는 무엇입니까?</span>
	<div>
		<select>
			<option>대분류</option>
			<option value="개발">개발</option>
		</select>
	</div>	
</div>

<div>
	<select>
		<option>중분류</option>
		<option value="웹개발">웹개발</option>
	</select>
</div>
	
<div>
	<select>
		<option>소분류</option>
		<option value="모든 웹 개발">모든 웹 개발</option>
	</select>
</div>

<div>
	<input type="submit" value="저장">
</div>
</form>
</body>
</html>