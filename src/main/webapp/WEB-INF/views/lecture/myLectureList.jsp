<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class=row>
	<div class="col-2"></div>
	<h1>나의 강의 목록</h1>
	<br><br><br><br>
	</div>
	
	<div class="col-container">
	<div class="row">
	<c:forEach var="lecture" items="${myLectureList }" varStatus="status">
	<c:if test="${status.index%4 == 0 }"><div class="col-2"></div></c:if>
	<div class="col-2">
		<div class="card" style="width: 18rem;">
			<img src="img/${lecture.lthumnail}" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${lecture.ltitle }</h5>
				<p class="card-text">${lecture.lsubtitle }</p>
				<a href="lectureMyClass.do?lidx=${lecture.lidx}" class="btn btn-primary">상세페이지</a>
			</div>
		</div>
	</div>
	<c:if test="${status.index%4 == 3 }"><div class="col-2"></div></c:if>
	</c:forEach>
	</div>
	</div>

</body>
</html>