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

<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>

<div class="text-right my-3" style="width:50vw">
<form action="replyCheckY.do" name="replyCheckY">
<input type="hidden" value="${dto.lqidx}" name="lqidx">
<input type="hidden" value="${dto.midx}" name="midx">
<input type="submit" class="btn btn-primary" value="답변완료로 바꾸기">
</form>
</div>
<form action="teacherAnswerSubmit.do" name="lqreplyForm">
<table class="table" style="width: 50vw;">
	<thead>
		<tr>
			<td scope="row">문의접수 번호</th>
			<td>${dto.lqidx}</td>
			<td>회원번호</th>
			<td>${dto.midx}</td>
			<td>강의번호</th>
			<td>${dto.lidx}</td>
		</tr>
		<tr>
			<td scope="row">제목</th>
			<td colspan="3">${dto.lqsubject}</td>
			<td>작성일</th>
			<td>${dto.lqwritedate}</td>
		</tr>
		<tr>
			<td scope="row" >문의 내용</td>
			<td colspan="5" align="left" valign="top">
				<textarea rows="10" cols="100" readonly="readonly">${dto.lqcontent}</textarea>
			</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" class="border-top-0"></td>
			</tr>
		</c:if>
		<c:forEach var="arr" items="${list}">
			<tr>
				<td colspan="4">&nbsp;ㄴ${arr.lqReplyContent}</td>
				<td>작성시간</td>
				<td>${arr.lqReplyCritedate}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td></td>
			<td colspan="4"><textarea rows="3" cols="90" name="lqReplyContent"></textarea></td>
			<td><input type="submit" class="btn btn-primary" value="댓글 작성"></td>
		</tr>
	</tfoot>
</table>
<input type="hidden" value="${dto.lqidx}" name="lqidx">
<input type="hidden"  value="${dto.midx}" name="midx">
</form>

<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>