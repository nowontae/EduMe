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
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th>등록 날짜</th>
					<th>답변 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty nList}">
					<tr>
						<td colspan="3">
						대기 중인 글이 없습니다.
						</td>
					</tr>
				</c:if>
			<c:forEach var="narr" items="${nList}">
				<tr>
					<td>${narr.tvsubject}</td>
					<td>${narr.tvwritedate}</td>
					<td>${narr.tvcomment}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
	<div>관리자 답변 완료
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th>등록 날짜</th>
					<th>답변 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty allList}">
					<tr>
						<td colspan="3">
						답변 완료한 글이 없습니다.
						</td>
					</tr>
				</c:if>
			<c:forEach var="aarr" items="${allList}">
				<tr>
					<td>${aarr.tvsubject}</td>
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