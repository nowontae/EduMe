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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	test
	<div class="col-container">
	<div class="row">
	<c:forEach var="lecture" items="${myLectureList }">
	<c:if test="${status.index%4 == 0 }"><div class="col-2"></div></c:if>
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
	<c:if test="${status.index%4 == 0 }"><div class="col-2"></div></c:if>
	</c:forEach>
	</div>
	</div>

</body>
</html>