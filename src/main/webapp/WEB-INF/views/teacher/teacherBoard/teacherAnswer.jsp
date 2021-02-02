<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="#" name="lqreplyForm">
<table>
	<tbody>
		<tr>
			<td>lqidx</td>
			<td>${dto.lqidx}</td>
			<td>midx</td>
			<td>${dto.midx}</td>
			<td>lidx</td>
			<td>${dto.lidx}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.lqsubject}</td>
			<td colspan="2">${dto.lqwritedate}</td>
		</tr>
		<tr>
			<td colspan="4" align="left" valign="top">
				<textarea rows="10" cols="70">${dto.lqcontent}</textarea>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5"><input type="text" name="lqreplycontent"></td>
			<td><input type="submit" value="댓글 작성"></td>	
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>