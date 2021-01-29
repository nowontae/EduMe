<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="lectureTitleSave" action="lecturePriceSave.do">
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
	<h2>가격 책정</h2>
</div>

<div>
	<div>
		<p>EduMe에서는EduMe 행사의 강좌에 대한 정가 테스트를 시작했습니다. 
		테스트 기간에는 마켓이나 수강생에 따라 정가가 다르게 표시될 수 있습니다.</p>
	</div>
	
	<div>
		<span>KRW</span>
		<span>
			<select>
				<option>선택</option>
				<option value="무료">무료</option>
				<option value="19,900">19,900</option>
				<option value="29,900">29,900</option>
				<option value="39,900">39,900</option>
				<option value="49,900">49,900</option>
				<option value="59,900">59,900</option>
				<option value="69,900">69,900</option>
				<option value="79,900">79,900</option>
				<option value="89,900">89,900</option>
				<option value="99,900">99,900</option>
				<option value="109,900">109,900</option>
			</select>
		</span>
		<span>강좌의 가격 계층을 선택하고 ‘저장’을 클릭하십시오. 강좌를 무료로 제공하려면 동영상 콘텐츠의 총 길이가 2시간을 초과해서는 안 됩니다.</span>
	</div>
</div>
	
<div>
	<input type="submit" value="저장">
</div>
</form>
</body>
</html>