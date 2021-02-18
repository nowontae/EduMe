<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
	
	<div class=row>
	<div class="col-2"></div>
	<h1>Wish List</h1>
	<br><br><br><br>
	</div>
	
	
	<div class="col-container"  style="width:1800px;">
		<div class="row">
			<c:forEach var="lecture" items="${list}" varStatus="status">
				<c:if test="${status.index%4 == 0 }">
					<div class="col-2"></div>
				</c:if>
				<div class="col-2" style="  width:70%; margin-bottom: 10px;">
					<div class="card" style="width: 18rem;">
						<img src="img/checkbox.svg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${lecture.ltitle }</h5>
							<p class="card-text">${lecture.lsubtitle }</p>
							<a href="lectureDetail.do?lidx=${lecture.lidx}"
								class="btn btn-primary">상세페이지</a>
						</div>
					</div>
				</div>
				<c:if test="${status.index%4 == 3 }">
					<div class="col-2"></div><br><br><br><br>
				</c:if>
			</c:forEach>
		</div>
	</div>
	

</body>
</html>