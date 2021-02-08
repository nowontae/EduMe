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
<div>
	<h2>공지</h2>
</div>
	<form name="teacherNoticeWrite" action="teacherNoticeSubmit.do" method="post" enctype="multipart/form-data">
		<table id="inputList">
			<tr>
				<td>강의번호 <input type="text" name="lidx"></td>
			</tr>
			
			<tr>
				<td>제목<input type="text" name="nsubject"></td>
			</tr>
			
			<tr>
				<td><textarea rows="6" cols="45" name="ncontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" >
				 첨부이미지:<input type="file" name="upload" >
				<!-- 다중파일 업로드 <input type="button" value="파일추가" onclick="show()"> -->
				</td>
			</tr>
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>