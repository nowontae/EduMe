<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
function videoPause(v){
	
	var crTime = v.currentTime;
	alert(crTime);
	
}

function videoEnded(v){
	var crTime = v.currentTime;
	alert("끝"+crTime);
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<h1>${myClass.lcvideo}</h1>
<br /><br /><br /><br /><br /><br /><br /><br />
 <video id="lec" muted controls style="width:500px" onpause="videoPause(this)"   onended="videoEnded(this)">
      <source src="${myClass.lcvideo}">
      <strong>Your browser does not support the video tag.</strong>
 </video>
 
 
 <div id="curriculum">
 
 <div class="accordion" id="accordionExample">
 	<c:forEach var="curi" items="${curriculum }" varStatus="num">
 	<c:if test="${curi.lcsection != 1 && curi.lcpart == 0 }"></div></c:if>
    <c:if test="${curi.lcsection == 1 }"><c:set var="extendValue">true</c:set></c:if>
	<c:if test="${curi.lcsection != 1 }"><c:set var="extendValue">false</c:set></c:if>
    <c:if test="${curi.lcpart == 0 }">
    <div class="card">
      <div class="card-header" id="heading${curi.lcsection}">
        <h2 class="mb-0">
          <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${curi.lcsection }" aria-expanded="${extendValue}" aria-controls="collapse${curi.lcsection }">
            Head ${curi.lcsection}/${curi.lcpart}/${curi.lctitle }
          </button>
        </h2>
      </div>
  	</c:if>
  	<c:if test="${curi.lcpart != 0 }">
      <div id="collapse${curi.lcsection }" class="collapse" aria-labelledby="heading${curi.lcsection }" data-parent="#accordionExample">
        <div class="card-body">
         content  ${curi.lcsection}/${curi.lcpart}/${curi.lctitle }
        </div>
        <div class="progress">
  			<div class="progress-bar" role="progressbar" style="width : 30% " aria-valuenow="30" aria-valuemin="0" aria-valuemax="300"></div>
		</div>
      </div>
    </div>
    </c:if>
 </c:forEach>
 </div>
</div> <!-- end div="curricullum" -->
 
 
</body>
</html>