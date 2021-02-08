<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</head>
<body>
<<<<<<< HEAD
<div>
	<div>
		<h1>000(검색하거나 선택한 값) 강좌</h1>
	</div>
	
	<div>
		<h2>추천 강좌</h2>
		<div>
			<div><a href="https://www.udemy.com/course/softcampus-javascript/"><img alt="추천강좌 이미지" src="https://img-a.udemycdn.com/course/240x135/1447322_3aad_4.jpg?picrrl_YdZ1Ydba980SJmQX6GBAYLJFLc8PV3IBKdY3-C09mk7cXB1ysINnhLyqwtkOvSFnDmorXfxfvqySfPlL9QD9Gd7Rux07l7plKsYn0ZoeH-q4-VYtp7YLQMIaW"></a></div>
			<div>
				<div>강좌 제목~(예시:JAVA 뿌시기!)</div>
				<p>부제목~</p>
				<div>업데이트 시간,영상 총시간,해당 영상 총 강의 개수</div>
				<div><span>별점(강좌평점) (별점 선택한 총 수강생 수)</span></div>
				<div>가격</div>
			</div>
		</div>
	</div>
	
	<div>
		<div>
			<h2>모든 000(검색하거나 선택한 값) 강좌</h2>
		</div>
		<div><img alt="느낌표 아이콘" src="#">모든 강좌는 30일 내 환불이 보장됩니다.</div>
		<div>
			<span>필터</span>
			<span>
				<select>
					<option disabled="disabled">선택</option>
					<option value="ingi">인기순</option>
					<option value="latest">최신순</option>
					<option value="gradeAvg">평점순</option>
				</select>
			</span>
		</div>
		<div>
			<div><a href="https://www.udemy.com/course/softcampus-javascript/"><img alt="추천강좌 이미지" src="https://img-a.udemycdn.com/course/240x135/1447322_3aad_4.jpg?picrrl_YdZ1Ydba980SJmQX6GBAYLJFLc8PV3IBKdY3-C09mk7cXB1ysINnhLyqwtkOvSFnDmorXfxfvqySfPlL9QD9Gd7Rux07l7plKsYn0ZoeH-q4-VYtp7YLQMIaW"></a></div>
			<div>
				<div>강좌 제목~(예시:JAVA 뿌시기!)</div>
				<p>부제목~</p>
				<div>업데이트 시간,영상 총시간,해당 영상 총 강의 개수</div>
				<div><span>별점(강좌평점) (별점 선택한 총 수강생 수)</span></div>
				<div>가격</div>
			</div>
		</div>
		
		<div>페이징</div>
	</div>
</div>
=======
	test
	<div class="col-container">
	<div class="row">
	<c:forEach var="lecture" items="${lectureList }">
	<div class="col-2">
		<div class="card" style="width: 18rem;">
			<img src="img/checkbox.svg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${lecture.ltitle }</h5>
				<p class="card-text">${lecture.lsubtitle }</p>
				<a href="lectureDetail.do?lidx=${lecture.lidx}" class="btn btn-primary">상세페이지</a>
			</div>
		</div>
	</div>
	</c:forEach>
	</div>
	</div>

>>>>>>> wontae/decalration
</body>
</html>