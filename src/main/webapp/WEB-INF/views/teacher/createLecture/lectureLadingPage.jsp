<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureLadingPage" action="lectureLadingPageSave.do">
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
	<h2>강좌 랜딩 페이지</h2>
</div>

<div>
<span>강좌 이미지</span>
	<div>
		<img alt="강좌 이미지" src="https://www.udemy.com/staticx/udemy/images/course/750x422/placeholder.png">
	</div>
	
	<div>
		<span>여기에 강좌 이미지를 업로드하십시오. *중요:750x422 픽셀의 .jpg, .jpeg, .gif, 또는 .png. 이미지에 텍스트가 포함되지 않아야 함</span>
	</div>
	
	<div>
		<span>
			<input readonly type="text" value="선택된 파일 없음">
		</span>
		<span>
			<input type="button" value="파일업로드">
		</span>
	</div>
</div>

<div>
<span>강의 동영상</span>
	<div>
		<img alt="강의 동영상" src="https://www.udemy.com/staticx/udemy/images/course/750x422/placeholder.png">
	</div>
	
	<div>
		<span>여기에 강의 동영상을 업로드하십시오. 잘 만든 홍보 동영상은 학생들의 강좌 등록 가능성을 5배나 더 높입니다.</span>
	</div>
	
	<div>
		<span>
			<input readonly type="text" value="선택된 파일 없음">
		</span>
		<span>
			<input type="button" value="파일업로드">
		</span>
	</div>
</div>	
	
<div>
	<input type="submit" value="저장">
</div>
</form>
</body>
</html>