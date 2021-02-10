<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function AnswerComplete(){
	var params = document.getElementById('cqidx').value;
	
	sendRequest('AnswerComplete.do?cqidx='+params,params,AnswerCompleteResult,'POST');
}

function AnswerCompleteResult(){
	if(XHR.readyState==4){
		if(XHR.status=-200){
			var data=XHR.responseText;
			var indexNumber=data.indexOf('1');
			
			if(data.charAt(indexNumber) == '1') {
				// data == 1이면 성공
				// 버튼 숨기기
				document.getElementById('AnswerComplete').style.display='none;'
				// 그 자리에 답변완료 입력
				var contentDiv=document.getElementById('cqreply_div');
				contentDiv.innerText='답변완료';
				
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
</style>
</head>
<body>

<h3>문의하기 본문</h3>

<!-- 상단 버튼 부분 -->
<div id="cqreply_div">
<!-- char형을 long으로 비교하게 되어있어 charAt(0)을 적어 첫글자만 비교하게 한다. -->
<c:if test="${dto.cqreply == 'Y'.charAt(0) }">
<div>답변완료 </div>
<!-- 답변이 완료되어 더이상 할게 없음 : 결과만 보여줌-->
</c:if>

<c:if test="${dto.cqreply == 'N'.charAt(0) }">
<input type="button" id="AnswerComplete" onclick="AnswerComplete()" value="답변완료처리">
<!-- 답변완료 되지않아 처리 버튼까지 눌러줘야 완료 처리됨 -->
</c:if>
</div>

<!-- 문의하기 테이블 -->
<input type="hidden" id="cqidx" value="${dto.cqidx }">
<table>
	<tr>
		<td>작성자</td>
		<td>${dto.mname }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${dto. lqsubject}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="15" cols="50">${dto.lqcontent }</textarea></td>
	</tr>
</table>
<hr>

<!-- 댓글 부분 -->
<form name="Qna_ReplyAdd" action="Qna_ReplyAdd.do">

	<input type="hidden" id="cqidx" name="cqidx" value="${dto.cqidx }">
	<input type="hidden" id="midx" name="midx" value="${Session_midx }">
	<table>
		<tr>
			<td><textarea rows="10" cols="50" name="cqreplycontent" ></textarea></td>
			<td><input type="submit" value="댓글달기"></td>
		</tr>
	</table>
</form>

<!-- 댓글 보기 -->


<table border="1" width="700" id="commonQna_Reply_List">
<c:if test="${empty list}">
	<tr>
		<td colspan="4" align="center">등록된 답변글이 없습니다.</td>
	</tr>
</c:if>	


<c:forEach var="dt" items="${list }" varStatus="i">
	<tr>

		<td>${dt.mname }</td>
		<td name="cqreplycontent"><textarea id="cqreplycontent${i.index}" readonly="readonly" rows="10" cols="50" name="cqreplycontent">${dt.cqreplycontent }</textarea></td>
		<c:if test="${Session_midx eq dt.midx }">
			<td><input type="button" id="update_btn${i.index }" value="수정" onclick="javascript:updateForm(${dt.cqreply_idx },${dt.cqidx },${i.index},${sessionScope.midx } )"></td>
			<td><input type="button" value="삭제" onclick="location.href='Qna_ReplyDelete.do?cqreply_idx=${dt.cqreply_idx }&cqidxx=${dt.cqidx }&midx=${midx }'"></td>
		</c:if>
		<c:if test="${Session_midx ne dt.midx }">
			<td colspan="2"></td>
		</c:if>
	</tr>
	<tr>
		<td colspan="4">
		<fmt:formatDate  pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${dt.cqreplywritedate }"/>
		</td>
	</tr>
</c:forEach>
</table>

	<a href="admin_CommonQnAList.do">목록</a>


</body>
</html>