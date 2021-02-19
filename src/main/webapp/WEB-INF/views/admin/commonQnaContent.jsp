<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<style>
.all{
	height: 900px;
	display: table;
	margin: auto;
	padding-top: 55px;
}
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}
	
table {
    text-align: center;
    margin-top: 20px;
}
    
th{
    text-align: center;
}
th, td{
    vertical-align: middle;
}
input,textarea:focus {
        outline: none;
}

</style>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function AnswerComplete(midx){
	var params = '&cqidx='+document.getElementById('cqidx').value+'&midx='+midx;
	
	sendRequest('AnswerComplete.do',params,AnswerCompleteResult,'POST');
}

function AnswerCompleteResult(){
	if(XHR.readyState==4){
		if(XHR.status=-200){
			var data=XHR.responseText;
			console.log(data);
			
			var jsonData = JSON.parse(data);
			//console.log(jsonData);
			
			//var indexNumber=data.indexOf('1');
			
			if(jsonData.result==1) {
				// data == 1이면 성공
				// 버튼 숨기기
				//alert('why/?');
				document.getElementById('AnswerComplete').style.display='none;'
				// 그 자리에 답변완료 입력
				var contentDiv=document.getElementById('cqreply_div');
				contentDiv.innerHTML='<input type="button" class="bt_answer" disabled="disabled" value= "답변완료">';
				
			}
		
		}
	}
}
</script>
<script>
function updateForm(cqreply_idx, cqidx, index, midx){// 수정버튼 클릭시 실행  readonly에서 수정 가능하게끔
		
		var contentIndex = "cqreplycontent"+index;
		var buttonIndex="update_btn"+index;
		
		document.getElementById(contentIndex).removeAttribute("readonly");
		document.getElementById(buttonIndex).setAttribute('onclick','javascript:updateSubmit('+cqreply_idx+','+cqidx+','+index+','+midx+')');	
		document.getElementById(buttonIndex).setAttribute('value','수정하기');
		
}

function updateSubmit(cqreply_idx, cqidx,index, midx) { // 수정버튼을 다시 눌렀을때 수정된 내용이 업데이트
	var contentIndex = "cqreplycontent"+index;
	var cqreplycontent=document.getElementById(contentIndex).value;
	cqreplycontent=encodeURIComponent(cqreplycontent);//특수문자 전달을 위한 인코딩 주소창에 특수문자가 들어가면 에러가 나서, 특수문자를 => %12 %23 등 에러가 안나는 문자로 바꾸기
    location.href="Qna_ReplyUpdate.do?cqreply_idx="+cqreply_idx+"&cqidxx="+cqidx+"&cqreplycontent="+cqreplycontent+"&midx="+midx;
}
</script>
<style>
input,textarea:focus {
        outline: none;
}

 .list_button{
	width:170px;
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
.release_Add_button {

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
.bt_answer{
	width:170px;
	height:30px;
    background-color: #144884;;
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
</head>
<body>
<div class="all">
	<div style="width: 800px; text-align: right;"><input type="button" value="관리자페이지" class="adminPage_button" onclick = "location.href = 'admin.do'" ></div>
	<h3 style=" width:750px; padding-bottom: 5px; padding-top: 20px;" >문의하기 본문</h3>
	
	<!-- 상단 버튼 부분 -->
	<div id="cqreply_div">
	<!-- char형을 long으로 비교하게 되어있어 charAt(0)을 적어 첫글자만 비교하게 한다. -->
	<c:if test="${dto.cqreply == 'Y'.charAt(0) }">
	<div><input type="button" class="bt_answer" disabled="disabled" value= "답변완료"> </div>
	<!-- 답변이 완료되어 더이상 할게 없음 : 결과만 보여줌-->
	</c:if>
	
	<c:if test="${dto.cqreply == 'N'.charAt(0) }">
	<input type="button" id="AnswerComplete" class="list_button" onclick="AnswerComplete(${dto.midx})" value="답변완료처리">
	<!-- 답변완료 되지않아 처리 버튼까지 눌러줘야 완료 처리됨 -->
	</c:if>
	</div>
	
	<!-- 문의하기 테이블 -->
	<input type="hidden" id="cqidx" value="${dto.cqidx }">
	<table class="table">
		<tr>
			<td height="41" width="150px;">작성자</td>
			<td>${dto.mname }</td>
		</tr>
		<tr>
			<td height="41">제목</td>
			<td>${dto. lqsubject}</td>
		</tr>
		<tr>
			<td height="55" height="177px" >내용</td>
			<td style="padding-top: 7px; padding-bottom: 5px;"><textarea rows="5" cols="70"  style="border-radius: 10px; resize: none; padding:10px;">${dto.lqcontent }</textarea></td>
		</tr>
	</table>
	
	
	<!-- 댓글 달기 부분 -->
	<form name="Qna_ReplyAdd" action="Qna_ReplyAdd.do">
	
		<input type="hidden" id="cqidx" name="cqidx" value="${dto.cqidx }">
		<input type="hidden" id="midx" name="midx" value="${Session_midx }">
		<table class="table">
			<tr>
				<td style="padding-top: 7px; padding-bottom: 7px;"><textarea rows="5" cols="75" name="cqreplycontent" required="required"  style="border-radius: 10px; resize: none; padding:10px;"></textarea></td>
				<td width="150px;" ><input type="submit" class="release_Add_button"value="답변달기"></td>
			</tr>
		</table>
	</form>
	<br>
	<!-- 댓글 보기 -->
	
	
	<table class="" id="commonQna_Reply_List">
	<c:if test="${empty list}">
		<tr>
			<td colspan="4" align="center">등록된 답변글이 없습니다.</td>
		</tr>
	</c:if>	
	
	
	<c:forEach var="dt" items="${list }" varStatus="i">
		<tr>
	
			<td width="150px;" height="174px;" style="border-bottom: 0px; padding-top: 5px; padding-bottom: 5px;">${dt.mname }</td>
			<td name="cqreplycontent" style="border-bottom: 0px; padding-top: 5px; padding-bottom: 5px;"><textarea id="cqreplycontent${i.index}" readonly="readonly"  rows="6" cols="70" name="cqreplycontent" style="border-radius: 10px; resize: none; padding:10px;">${dt.cqreplycontent }</textarea></td>
			<c:if test="${Session_midx eq dt.midx }">
				<td style="border-bottom: 0px; "><input type="button" id="update_btn${i.index }" value="수정" class="release_Add_button" onclick="javascript:updateForm(${dt.cqreply_idx },${dt.cqidx },${i.index},${sessionScope.midx } )"></td>
				<td style="border-bottom: 0px;"><input type="button" value="삭제" class="release_Add_button" onclick="location.href='Qna_ReplyDelete.do?cqreply_idx=${dt.cqreply_idx }&cqidxx=${dt.cqidx }&midx=${midx }'"></td>
			</c:if>
			<c:if test="${Session_midx ne dt.midx }">
				<td colspan="2" style="border-bottom: 0px;"></td>
			</c:if>
		</tr>
		<tr>
			<td></td>
			<td colspan="3" height="35px" >
			<fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dt.cqreplywritedate }"/>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	
	<div style="padding-top: 5px; width:750px;" align="center" >
	<input type="button" value="목록" class="list_button" onclick = "location.href = 'admin_CommonQnAList.do'"  >
	</div>
</div>
</body>
</html>