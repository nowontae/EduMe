<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	 hr{
		width: 600px;
		
	 }
	 table, th, td {
        border-bottom: 1px solid #bcbcbc;
      
      }
      table {
        width: 600px;
        height: 80px;

      }
      th{
      	 text-align: left;
      }
      
      
      input[type="checkbox"] {
   		 display:none;
	  }
      input[type="checkbox"] + label span{
   		 display: inline-block;
  		 width: 24px;
   		 height: 24px;
   		 margin: -2px 10px 0 0;
   		 vertical-align: middle;
   		 background: url("img/checkbox.svg") left top no-repeat;
   		 cursor: pointer; 
   		 background-size: cover;
	  }
	  input[type="checkbox"]:checked + label span{
	    background:url("img/checkbox.svg")  -26px top no-repeat;
   		background-size: cover;
	  }
      
</style>
</head>
<body>
<h3>리뷰 신고</h3>
<hr align="left">
<!-- 이미지 경로 : img/호박.png -->

<table border="0" cellspacing="0">

	<tr>
		<th>신고자</th>
		<th>강의명</th>
		<th>제목</th>
		<th>신고 시간</th>
		<th>내용 확인 여부</th>
	</tr>
	<tr>
		<td><input type="checkbox" id="reporter"><label for="reporter"><span></span>신고자</label></td>
		<td>강의명</td>
		<td>제목</td>
		<td>신고 시간</td>
		<td>내용 확인 여부</td>
	</tr>
</table>
</body>
</html>