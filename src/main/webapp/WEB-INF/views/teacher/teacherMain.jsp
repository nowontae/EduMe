<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div>
	<a>사이트 로고</a>
	<a href="teacherMain.do">강좌</a>
	<a href="teacherTestVideo.do?midx=${sessionScope.midx}">테스트동영상</a>
	<a href="teacherNoticeMain.do">공지</a>
	<a href="teacherResult.do?midx=${sessionScope.midx}">성과</a>
	<a href="teacherReviewMain.do?midx=${sessionScope.midx}">후기</a>
	<a href="teacherAsk.do?midx=${sessionScope.midx}">문의</a>
</div>

<form name="createLectureMain" action="createLectureMain.do">
<div>
	<h2>강좌</h2>
</div>
	
<div>	
	<span>검토를 위해 제출된 새로운 강좌의 양이 증가하여 품질 검토 과정에 최대 6일이 소요될 수 있습니다. 
	추가적인 지연을 방지하려면 강좌가 EduMe의 강좌 자료 가이드라인을 준수하는지 확인하십시오.</span>
</div>	
	
<div>
	<span>강좌를 생성하세요~</span>
	<input type="submit" value="강좌 만들기">
</div>
</form>

</body>
</html>