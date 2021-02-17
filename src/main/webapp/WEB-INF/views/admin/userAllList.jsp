<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
padding-left:100px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>
.pagination {<!--페이지 중앙정렬-->
    display: flex;
    padding-left: 0;
    list-style: none;
    flex-direction: row;
    justify-content: center;
    width: 1200px;

    
}
table {
    border: 0px solid  ;
    text-align: center;
}
th, td{
	border-bottom: 1px solid #000000;
}
a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
 .search_button {

    width:70px;
	height:30px;
    background-color: #1a6dca;
    border: none;
    color:#fff;
    text-align: center;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
	border: none;
    outline:none;
}
.adminPage_button{
	width:110px;
	height:30px;
    background-color:#4F94CD;
    border: none;
    color:#fff;
    text-align: center;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
	border-radius:10px;
	border: none;
    outline:none;

}

</style>

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

<div style="width: 1200px; background-color:#CDB79E; height: 40px; display: table-cell;   vertical-align: middle;" >
&nbsp;&nbsp;&nbsp;<a href="admin_memberAllList.do"><b>전체  유저 정보</b></a>&nbsp;  |  &nbsp;<a href="admin_blackList.do">블랙리스트 정보</a>
</div>
<div style="width: 1200px; text-align: right;"><input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>

<h3 style=" width:600px; padding-bottom: 3px;"  >전체  유저 정보</h3>



<div id="selectInfo"></div>
<!-- 검색 -->
<form name="userInfoList" action="admin_userInfoList.do">
	<select name="selects" onchange="changeSelect(this)">
		<option value="midx" selected="selected" >회원고유번호</option>
		<option value="mname">회원이름</option>
		<option value="mid">회원ID</option>
		<option value="mgrade">회원등급</option>
	</select>
	<input type="text" id="findKeys" name="findKeys" pattern="[0-9]+" placeholder="숫자만 입력해주세요." required="required" style=" border-radius:10px; outline:none; width:220px;">
	<input type="submit" class="search_button" value="검색">
</form>
<br>
	
<!-- 전체 유저 정보 -->
<table border="1" cellspacing="0" width="1200px" >
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
			<td colspan="10" align="center"  style='max-height:35px'>등록된 인원이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
	
		<tr>
			<td >${dto.midx }</td>
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
	<td colspan="10"></td> 
	</tfoot>
</table>
<div style="padding-top: 5px;">${pageStr}</div>

	


</body>
</html>