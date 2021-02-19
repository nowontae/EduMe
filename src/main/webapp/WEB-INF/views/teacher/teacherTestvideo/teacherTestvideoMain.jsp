<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#testMov{
	margin-bottom: 40px;
    margin-top: 35px;
}
#blankBottom {
    padding-bottom: 5px;
}
#coment{
	margin-top: 25px;
	
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div>
	<div id="testMov">
		<h2>테스트 동영상</h2>
		<div id="blankBottom">테스트 동영상을 만들어 보세요!</div>
		<div><input type="button" onclick="location.href='makeTestvideo.do?midx=${sessionScope.midx}'" value="테스트 동영상 만들기"></div>
	</div>
	<div>
		<h4>관리자 답변 대기</h4>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">등록 날짜</th>
					<th scope="col">답변 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty nList}">
					<tr scope="row" 	>
						<td colspan="3">
						대기 중인 글이 없습니다.
						</td>
					</tr>
				</c:if>
			<c:forEach var="narr" items="${nList}">
				<tr>
					<td scope="row">${narr.tvsubject}</td>
					<td>${narr.tvwritedate}</td>
					<td>${narr.tvcomment}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
	<div id="coment">
		<h4>관리자 답변 완료</h4>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">등록 날짜</th>
					<th scope="col">답변 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty allList}">
					<tr>
						<td scope="row" colspan="3">
						답변 완료한 글이 없습니다.
						</td>
					</tr>
				</c:if>
			<c:forEach var="aarr" items="${allList}">
				<tr>
					<td scope="row">${aarr.tvsubject}</td>
					<td>${aarr.tvwritedate}</td>
					<td>${aarr.tvcomment}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</div>
</body>
</html>