<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>신고하기 ${cnt}</h1>
<br/>

<div>
이 기능은 해당 글에 대하여 EduMe 직원이 해당 글이 약관 또는 커뮤니티 지침을 위반했는지 여부를 검토하게 됩니다.
위반시에는 블랙리스트로 등록되어 댓글 작성이 불가능 하게 됩니다.
기술적인 지원이 필요할때는 <a href="#">문의하기</a>를 이용해 주세요
</div>

<form action="/declaration.do" method="post">
<textarea name="content" rows="10" cols="50"></textarea>
<br>
<div>
<input type="submit" value="제출">
<input type="reset" value="취소">
</div>

</form>
 


</body>
</html>