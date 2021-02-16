<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function () {
		$('#llevel').val('${dto.llevel}');
		$('#lorignprice').val('${dto.lorignprice}');
	});
</script>
</head>
<body>
<h1>${lidx}</h1>
	<input type="button" value="<강좌로 돌아가기" onclick="location.href='teacherMain.do'">
<form name="createLectureSave" action="createLectureSave.do?lidx=${lidx}" method="post" enctype="multipart/form-data">
<div>
	<input type="submit" value="저장">
</div>

<div id="title">
<div>
	<h2>강의 주제</h2>
</div>

<div>
	<span>강좌 제목</span>
	<div><input type="text" name="ltitle" value="${dto.ltitle}"></div>
</div>

<div>
	<span>강좌 부제목</span>
	<div><input type="text" name="lsubtitle" value="${dto.lsubtitle}"></div>
</div>

<div>
	<span>난이도</span>
	<div>
		<span>
			<select id="llevel" name="llevel">
				<option hidden>===선택===</option>
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
		</span>
	</div>

</div>
</div>

<div id="category">
<div>
	<h2>카테고리</h2>
</div>

<div>
<span>공유하려는 지식에 가장 적합한 카테고리는 무엇입니까?</span>
	<div>
		<select>
			<option>대분류</option>
			<option value="1">개발</option>
		</select>
	</div>	
</div>

<div>
	<select>
		<option>중분류</option>
		<option value="1">웹개발</option>
	</select>
</div>
	
<div>
	<select>
		<option>소분류</option>
		<option value="1">모든 웹 개발</option>
	</select>
</div>
</div>

<div id="studentInfo">
<div>
	<h2>수강생 세부사항</h2>
</div>

<div>
	<span>개요</span>
	<div><input type="text" name="lsummary" value="${dto.lsummary}"></div>
</div>

<div>
		<span>강의 목적</span>
	<div><input type="text" name="lpurpose" value="${dto.lpurpose}"></div>
</div>
	
<div>
		<span>배경 지식</span>
	<div><input type="text" name="lknowledge" value="${dto.lknowledge}"></div>
</div>

<div>
		<span>대상 수강생</span>
	<div><input type="text" name="ltarget" value="${dto.ltarget}"></div>
</div>
</div>

<div id="landingPage">
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
		<input type="file" id="fileUpload" name="lthumnail1">
		<div>선택한 이미지: ${dto.lthumnail}</div>  
	</div>
</div>
</div>

<div id="price">
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
			<select id="lorignprice" name="lorignprice">
				<option>선택</option>
				<option value="0">무료</option>
				<option value="19900">19,900</option>
				<option value="29900">29,900</option>
				<option value="39900">39,900</option>
				<option value="49900">49,900</option>
				<option value="59900">59,900</option>
				<option value="69900">69,900</option>
				<option value="79900">79,900</option>
				<option value="89900">89,900</option>
				<option value="99900">99,900</option>
				<option value="109900">109,900</option>
			</select>
		</span>
		<span>강좌의 가격 계층을 선택하고 ‘저장’을 클릭하십시오. 강좌를 무료로 제공하려면 동영상 콘텐츠의 총 길이가 2시간을 초과해서는 안 됩니다.</span>
	</div>
	
	<div>
		<input type="button" value="다음" onclick="location.href='lectureCurriculum.do?lidx=${dto.lidx}'">
	</div>
</div>
</div>
</form>
</body>
</html>