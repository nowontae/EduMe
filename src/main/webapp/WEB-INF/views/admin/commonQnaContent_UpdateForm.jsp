<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<input type="hidden" id="midx" name="midx" value="${dto.midx }">
	<table>
		<tr>
			<td><textarea rows="10" cols="50" name="cqreplycontent"></textarea></td>
			<td><input type="submit" value="댓글달기"></td>
		</tr>
	</table>
</form>
<!-- 댓글 보기 -->

<table border="1" width="500">
<c:if test="${empty dt}">
	<tr>
		<td colspan="3" align="center">등록된 인원이 없습니다.</td>
	</tr>
</c:if>	
<c:forEach var="dt" items="${dt }">
	<tr>

		<td>${dt.mname }</td>
		<td><input type="text" value="${dt.cqreplycontent }"></td>
		<td><input type="button" value="수정하기" onclick="location.href='Qna_ReplyUpdate.do?cqreply_idx=${dt.cqreply_idx }&cqidxx=${dt.cqidx }&cqreplycontent=${dt.cqreplycontent} '"></td>
	</tr>
	<tr>
		<td colspan="4">${dt.cqreplywritedate }</td>
	</tr>
</c:forEach>
</table>

	<a href="admin_CommonQnAList.do">목록</a>


</body>
</html>