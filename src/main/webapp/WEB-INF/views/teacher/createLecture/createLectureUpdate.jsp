<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script type="text/javascript">

function cat2_list(cat1){
	if(cat1 == 0){
		var cat2 = document.getElementById("cat2_sel");	
		var cat3 = document.getElementById("cat3_sel");	
		
		$("#cat2_sel").removeAttr("selected")
		$("#cat3_sel").removeAttr("selected")
		$("#cat2_sel").val(0).attr("selected")
		$("#cat3_sel").val(0).attr("selected")
		
		cat2.setAttribute("disabled","disabled");
		cat3.setAttribute("disabled","disabled");
	} else {
	
		var cat2 = document.getElementById("cat2_sel");
		var cat3 = document.getElementById("cat3_sel");	
		
		$("#cat2_sel").removeAttr("selected")
		$("#cat3_sel").removeAttr("selected")
		$("#cat2_sel").val(0).attr("selected")
		$("#cat3_sel").val(0).attr("selected")
		
		cat2.removeAttribute("disabled");
		
		var cat = ".cat1_idx_"+cat1;
		$(".cat2_option").show();
		$(".cat2_option").not(cat).hide();
	}
}
function cat3_list(cat2){
	if(cat2 == 0){
		var cat3 = document.getElementById("cat3_sel");	
		
		$("#cat3_sel").removeAttr("selected")
		$("#cat3_sel").val(0).attr("selected")
		cat3.setAttribute("disabled","disabled");
	} else {
	
		var cat3 = document.getElementById("cat3_sel");
		$("#cat3_sel").removeAttr("selected")
		$("#cat3_sel").val(0).attr("selected")
		cat3.removeAttribute("disabled");
		
		var cat = ".cat2_idx_"+cat2;
		$(".cat3_option").show();
		$(".cat3_option").not(cat).hide();
	}	
}

function clickNextBtn(){
	
	
	var params = $("#createLectureSave").attr("action")+"&type=next";
	$("#createLectureSave").attr("action", params);
	console.log($("#createLectureSave").attr("action"));
	$("#createLectureSave").submit()
	
}



	
	
function thumUpload(lidx){
		
		 var form = $('#createLectureSaveImg')[0];
	     var formData = new FormData(form);
	     formData.append("lthumnail1", $("#thumnailUpload")[0].files[0]);

	     var request = $.ajax({
	         url: 'createLectureSaveImg.do?lidx='+lidx,
	                 processData: false,
	                 contentType: false,
	                 data: formData,
	                 type: 'POST',
	                 success: function(result){
	                     alert("업로드 성공!!");
	                     
	                 }
	         });

	     request.done(function(data){
	    	 
	    	 var thumnailImg = JSON.parse(data);
	    	 var path = "img/"+thumnailImg.lthumnail;
	    	 $("#thumImg").attr("src",path);
	     })
	}
	

$(document).ready(function () {
	

	$("#llevel").val('${dto.llevel}').prop("selected", true);
	
	$('#lorignprice').val('${dto.lorignprice}');
	
});

</script>
</head>
<body>
<%@include file="/WEB-INF/views/teacher/teacherHeader.jsp" %>

<input type="button" class="return btn btn-primary" value="<강좌로 돌아가기" onclick="location.href='teacherMain.do?midx=${midx}'">




<form id="createLectureSave" name="createLectureSave" action="createLectureSave.do?lidx=${lidx}" method="post" enctype="multipart/form-data">
<input type="hidden" name="midx" value="${midx}">
<div>
	<input type="submit" class="save  btn btn-primary" value="저장">
</div>

<div id="title">
<div>
	<h2>강의 주제</h2>
</div>

<div>
	<span>강좌 제목</span>
	<div><input type="text"  class="form-control"   name="ltitle" value="${dto.ltitle}" required="required"></div>
</div>

<div>
	<span>강좌 부제목</span>
	<div><input type="text"  class="form-control"  name="lsubtitle" value="${dto.lsubtitle}" required="required"></div>
</div>

<div>
	<span>난이도</span>
	<div>
		<span>
			<select  id="llevel"class="form-control"  name="llevel">
				<option hidden>===선택===</option>
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
		</span>
	</div>

</div>
</div>

<!-- ------------------------------- -->
<hr>
<!-- ------------------------------- -->

<div id="category">
<div>
	<h4>카테고리</h4>
</div>

<div class="cat1_list">
<span>공유하려는 지식에 가장 적합한 카테고리는 무엇입니까?</span>
	<div>
		<select   class="form-control"  name="cat1_idx" onchange="cat2_list(this.value)">
			<option id="cat1_fir" value="0"  onselect="blockCat2List()">대분류</option>
			<c:forEach var="cat1" items="${cat1_list}" varStatus="status">
			<c:if test="${dto.cat1_idx eq cat1.cat1_idx}">
			<option value="${cat1.cat1_idx}" selected="selected">${cat1.cat_name}</option>
			</c:if>
			<c:if test="${dto.cat1_idx ne cat1.cat1_idx}">
			<option value="${cat1.cat1_idx}">${cat1.cat_name}</option>
			</c:if>
			</c:forEach>
		</select>
	</div>	
</div>

<div class="cat2_list">
	<select   class="form-control"  name="cat2_idx" id="cat2_sel" disabled="disabled" onchange="cat3_list(this.value)">
		<option  value="0" onselect="blockCat3List()" >중분류</option>
		<div class="cat2_list_option">
		<c:forEach var="cat2" items="${cat2_list}" varStatus="status">
		<c:if test="${dto.cat2_idx eq cat2.cat2_idx}">
			<option value="${cat2.cat2_idx}" selected="selected" class="cat2_option cat1_idx_${cat2.cat1_idx} cat2_idx_${cat2.cat2_idx}" onselect="cat3_list(this)">${cat2.cat_name}</option>
		</c:if>
		<c:if test="${dto.cat2_idx ne cat2.cat2_idx}">
			<option value="${cat2.cat2_idx}" class="cat2_option cat1_idx_${cat2.cat1_idx} cat2_idx_${cat2.cat2_idx}" onselect="cat3_list(this)">${cat2.cat_name}</option>
		</c:if>
		</c:forEach>
		</div>
	</select>
</div>
	
<div class="cat3_list">
	<select  class="form-control"  name="cat3_idx" id="cat3_sel" disabled="disabled">
		<option value="0">소분류</option>
		<div class="cat3_list_option">
		<c:forEach var="cat3" items="${cat3_list}" varStatus="status">
		<c:if test="${dto.cat3_idx eq cat3.cat3_idx}">
			<option value="${cat3.cat3_idx}" selected="selected" class="cat3_option cat2_idx_${cat3.cat2_idx}" >${cat3.cat_name}</option>
		</c:if>
		<c:if test="${dto.cat3_idx ne cat3.cat3_idx}">
			<option value="${cat3.cat3_idx}" class="cat3_option cat2_idx_${cat3.cat2_idx}" >${cat3.cat_name}</option>
		</c:if>
		</c:forEach>
		</div>
	</select>
</div>
</div>

<!-- ------------------------------- -->
<hr>
<!-- ------------------------------- -->


<div id="studentInfo">
<div>
	<h4>수강생 세부사항</h4>
</div>

<div>
	<span>개요</span>
	<div><input class="form-control"  type="text" name="lsummary" value="${dto.lsummary}" required="required"></div>
</div>

<div>
		<span>강의 목적</span>
	<div><input  class="form-control" type="text" name="lpurpose" value="${dto.lpurpose}" ></div>
</div>
	
<div>
		<span>배경 지식</span>
	<div><input class="form-control"  type="text" name="lknowledge" value="${dto.lknowledge}" required="required"></div>
</div>

<div>
		<span>대상 수강생</span>
	<div><input  class="form-control" type="text" name="ltarget" value="${dto.ltarget}" required="required"></div>
</div>
</div>

<!-- ------------------------------- -->
<hr>
<!-- ------------------------------- -->



<div id="price">
<div>
	<h4>가격 책정</h4>
</div>

<div>
	
	<div>
		<select class="form-control"  id="lorignprice" name="lorignprice" value="${dto.lorignprice}">
			<option>선택</option>
			<option value="0">무료</option>
			<option value="19900">19,900 원</option>
			<option value="29900">29,900 원</option>
			<option value="39900">39,900 원</option>
			<option value="49900">49,900 원</option>
			<option value="59900">59,900 원</option>
			<option value="69900">69,900 원</option>
			<option value="79900">79,900 원</option>
			<option value="89900">89,900 원</option>
			<option value="99900">99,900 원</option>
			<option value="109900">109,900 원</option>
		</select>
	</div>
	
</div>
</div>
</form>

<!-- ------------------------------- -->
<hr>
<!-- ------------------------------- -->




<form id="createLectureSaveImg" name="createLectureSaveImg" action="createLectureSaveImg.do?lidx=${lidx}" method="post" enctype="multipart/form-data">
<div id="landingPage">
<div>
	<h4>강좌 랜딩 페이지</h4>
	<span>강좌 이미지</span>
	
	<figure class="figure">
  		<img id="thumImg" src="img/${ dto.lthumnail}" class="figure-img img-fluid rounded" alt="">
  		<figcaption class="figure-caption">여기에 강좌 이미지를 업로드하십시오. *중요:750x422 픽셀의 .jpg, .jpeg, .gif, 또는 .png. 이미지에 텍스트가 포함되지 않아야 함</figcaption>
	</figure>

<!-- 
		<div>
			<img  id="thumImg" alt="강좌 이미지" src="https://www.udemy.com/staticx/udemy/images/course/750x422/placeholder.png">
		</div>
	
		<div class="text">
			<span>여기에 강좌 이미지를 업로드하십시오. *중요:750x422 픽셀의 .jpg, .jpeg, .gif, 또는 .png. 이미지에 텍스트가 포함되지 않아야 함</span>
		</div>
 -->	
		<div>
			<span>
			<input   class="form-control-file"  type="file" id="thumnailUpload" name="lthumnail1" onchange="javascript:thumUpload(${lidx})"> 
			</span>
		</div>
	</div>
</div>
</form>


<!-- 다음 페이지 이동 버튼 -->
<div>
	<input type="button" value="다음" class="next btn btn-primary" onclick="clickNextBtn()">
</div>
	
<%@include file="/WEB-INF/views/teacher/teacherFooter.jsp" %>
</body>
</html>