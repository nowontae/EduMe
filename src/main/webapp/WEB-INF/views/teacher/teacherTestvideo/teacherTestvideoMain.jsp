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
<div>
	<div>테스트 동영상
		<div>테스트 동영상을 만들어 보세요 <input type="button" onclick="location.href='makeTestvideo.do?midx=${sessionScope.midx}'" value="테스트 동영상 만들기"></div>
	</div>
	<div>관리자 답변 대기
		<div>
		<c:if test="${empty What}">
		
		</c:if>
		<c:forEach var="" items="">
		
		</c:forEach>

		</div>
	</div>
	<div>관리자 답변 완료
		<div>
		<c:forEach var="" items="">
		
		</c:forEach>
		</div>
	</div>
</div>
</body>
</html>