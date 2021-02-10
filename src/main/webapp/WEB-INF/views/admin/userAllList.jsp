<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function changeSelect(e){
	var value=e.options[e.selectedIndex].value;
	if(value=="mgrade"){
		document.getElementById("selectInfo").innerText="강사는 2, 학생은 3을 입력하세요.";
	}else{
		document.getElementById("selectInfo").innerText="";
	}
	
	//if(value=="midx"){// 화살표가 뜸 ㅜㅜ
	//	document.getElementById("findKeys").setAttribute('type','number');
	//}else{
	//	document.getElementById("findKeys").setAttribute('type','text');
	//}
	
	if(value=="midx"){
		document.getElementById("findKeys").setAttribute('pattern','[0-9]+'); 
		document.getElementById("findKeys").setAttribute('placeholder','숫자만 입력해주세요.'); 
	}else{
		document.getElementById("findKeys").removeAttribute('pattern');
		document.getElementById("findKeys").removeAttribute('placeholder'); 
	}
}
</script>
</head>
<body>
<a href="admin_memberAllList.do">유저 전체 내역</a> | <a href="admin_blackList.do">블랙리스트</a>
<h3>유저 전체 내역</h3>
<div id="selectInfo"></div>
<!-- 검색 -->
<form name="userInfoList" action="admin_userInfoList.do">
	<select name="selects" onchange="changeSelect(this)">
		<option value="midx" selected="selected" >회원고유번호</option>
		<option value="mname">회원이름</option>
		<option value="mid">회원ID</option>
		<option value="mgrade">회원등급</option>
	</select>
	<input type="text" id="findKeys" name="findKeys" pattern="[0-9]+" placeholder="숫자만 입력해주세요." required="required">
	<input type="submit" value="검색">
</form>

<!-- 전체 유저 정보 -->
<table border="1" cellspacing="0">
	<thead>
		<tr>
			<th>회원 번호</th>
			<th>프로필사진경로</th>
			<th>회원이름</th>
			<th>ID</th>
			<th>e-mail</th>
			<th>전화번호</th>
			<th>등급</th>
			<th>블랙리스트 여부</th>
			<th>크레딧</th>
			<th>회원가입일</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="10" align="center">등록된 인원이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.midx }</td>
			<td><img src="${dto.mimg }" alt="유저 이미지"></td>
			<td>
				
				${dto.mname }</td>
			<td>${dto.mid }</td>
			<td>${dto.memail }</td>
			<td>${dto.mtel }</td>
			<td>
			<c:if test="${dto.mgrade eq 1 }">
			관리자
			</c:if>
			<c:if test="${dto.mgrade eq 2}">
			강사
			</c:if>
			<c:if test="${3 == dto.mgrade}">
			학생
			</c:if>
			</td>
			<td>
			<c:if test="${dto.mblack >= 3 }">
			블랙리스트
			</c:if>
			<c:if test="${dto.mblack < 3 }">
			일반
			</c:if>
			</td>
			<td style="text-align: right;">${dto.mcredit }원</td>
			<td>
			<fmt:formatDate  pattern="yyyy년 MM월 dd일" value="${dto.mjoindate }"/>
			</td>
		</tr>
	</c:forEach>
	</tbody>

	<tfoot>
	<td colspan="10">${pageStr}</td> 
	</tfoot>
</table>
<br>
<a href="admin.do">관리자 페이지</a>
</body>
</html>