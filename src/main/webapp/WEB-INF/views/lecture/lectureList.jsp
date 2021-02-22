<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img.d-block.mx-auto {
    width: 1980px;
    height: 500px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/lectureListImg1.jpg" class="d-block  mx-auto " alt="..."   >
    </div>
    <div class="carousel-item">
      <img src="img/lectureListImg2.jpg" class="d-block  mx-auto" alt="..."   > 
    </div>
    <div class="carousel-item">
      <img src="img/lectureListImg3.jpg" class="d-block  mx-auto" alt="..."   >
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


	<div class="col-container"  style="width:1800px;">
		<div class="row">
			<c:forEach var="lecture" items="${lectureList}" varStatus="status">
				<c:if test="${status.index%4 == 0 }">
					<div class="col-2"></div>
				</c:if>
				<div class="col-2" style="  width:70%; margin-bottom: 10px;">
					<div class="card" style="width: 18rem;">
						<img src="img/${lecture.lthumnail }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${lecture.ltitle }</h5>
							<p class="card-text">${lecture.lsubtitle }</p>
							<a href="lectureDetail.do?lidx=${lecture.lidx}"
								class="btn btn-primary">상세페이지</a>
						</div>
					</div>
				</div>
				<c:if test="${status.index%4 == 3 }">
					<div class="col-2"></div>
				</c:if>
			</c:forEach>
		</div>
	</div>

</body>
</html>