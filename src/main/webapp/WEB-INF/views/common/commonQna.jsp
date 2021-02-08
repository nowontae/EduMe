<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>문의하기 {midx = ${sessionScope.midx }}</h1>

<div>문의사항을 알려주세요</div>

<form action="commonQna.do" method="post">
<input type="hidden" name="midx" value="${sessionScope.midx }">

제목 <input type="text" name="cqsubject">    
<br/>  


본문<br/>
<textarea name="cqcontent" rows="15" cols="50"></textarea>
<br>
<input type="submit" value="제출">
<input type="reset" value="취소">
</form>
</body>
</html>