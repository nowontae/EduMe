<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* 다중파일 업로드
function show(){
	var liNode=document.createElement('tr');
		var liNode2=document.createElement('td');
		liNode2.innerHTML='첨부이미지:<input type="file" name="NoticeUpload">';
		//console.log(liNode2);
	liNode.innerHTML=liNode2.innerHTML;
	//console.log(liNode);
	var ulNode=document.getElementById('inputList');
	ulNode.appendChild(liNode);
}*/
</script>
</head>
<body>

<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>
<div class="my-5">
	<h2>공지</h2>
</div>
	<form name="teacherNoticeWrite" action="teacherNoticeSubmit.do" method="post" enctype="multipart/form-data">
		<table id="inputList" class="talbe">
			<tr>
				<td scope="row">강의번호 </td>
				<td><input class="form-control" type="text" name="lidx"></td>
			</tr>
			
			<tr>
				<td scope="row">제목</td>
				<td><input class="form-control"  type="text" name="nsubject"></td>
			</tr>
			
			<tr>
				<td scope="row">내용</td>
				<td><textarea class="form-control"  rows="6" cols="45" name="ncontent"></textarea></td>
			</tr>
			<tr>
				<td>첨부이미지</td><!-- 다중파일 업로드 <input type="button" value="파일추가" onclick="show()"> -->
				<td><input class="form-control-file" type="file" name="upload"></td>
			</tr>
		</table>
		
		<br><br>	
		<input type="submit" class="btn btn-primary" value="등록">
		<input type="reset" class="btn btn-primary" value="취소">
	</form>
<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>
