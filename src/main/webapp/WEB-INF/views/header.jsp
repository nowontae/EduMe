<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script>
$(document).ready(function () {

$('.navbar .dropdown-item').hover(function (e) {
    var $el = $(this).children('.dropdown-toggle');
    var $parent = $el.offsetParent(".dropdown-menu");
    $(this).parent("li").toggleClass('open');

    if (!$parent.parent().hasClass('navbar-nav')) {
        if ($parent.hasClass('show')) {
            $parent.removeClass('show');
            $el.next().removeClass('show');
            $el.next().css({"top": -999, "left": -999});
        } else {
            $parent.parent().find('.show').removeClass('show');
            $parent.addClass('show');
            $el.next().addClass('show');
            $el.next().css({"top": $el[0].offsetTop, "left": $parent.outerWidth() - 4});
        }
        e.preventDefault();
        e.stopPropagation();
    }
});

$('.navbar .dropdown').on('hidden.bs.dropdown', function () {
    $(this).find('li.dropdown').removeClass('show open');
    $(this).find('ul.dropdown-menu').removeClass('show open');
});

});


    </script>
    <style>
.navbar .dropdown-toggle, .navbar .dropdown-menu a {
    cursor: pointer;
}

.navbar .dropdown-item.active, .navbar .dropdown-item:active {
    color: inherit;
    text-decoration: none;
    background-color: inherit;
}

.navbar .dropdown-item:focus, .navbar .dropdown-item:hover {
    color: #16181b;
    text-decoration: none;
    background-color: #f8f9fa;
}

@media (min-width: 767px) {
    .navbar .dropdown-toggle:not(.nav-link)::after {
        display: inline-block;
        width: 0;
        height: 0;
        margin-left: .5em;
        vertical-align: 0;
        border-bottom: .3em solid transparent;
        border-top: .3em solid transparent;
        border-left: .3em solid;
        
    }
.dropdown-toggle::after {
    display: inline-block;
    margin-left: .255em;
    vertical-align: .255em;
    content: none;
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
}

</style>

<div class="navbar navbar-expand-md navbar-dark bg-dark mb-4 " role="navigation" >


    <!--에듀 사이트 이름-->
    <div>
   	 <a class="navbar-brand" href="index.do">EduMe</a>
 	</div>
 	
 	
<div class="out" style="width:100%; position: relative" >
<div class="in" style="position: absolute; left:50%; margin: -25px -450px">
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-top: 12px;">카테고리 </a>  
                <ul class="dropdown-menu" aria-labelledby="dropdown1">
                	<li class="dropdown-item dropdown">
                        <a class="dropdown-toggle" id="dropdown1-0}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="location.href='lectureList.do'">전체 강의 목록</a>
                    </li>
                <c:forEach var="cat1" items="${sessionScope.cat1_list}" varStatus="index">
               		<li class="dropdown-item dropdown">
                        <a class="dropdown-toggle" id="dropdown1-${index.index}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="location.href='lectureList.do?cat1_idx=${cat1.cat1_idx}'">${cat1.cat_name}</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown1-${index.index}">
							<c:forEach var="cat2" items="${sessionScope.cat2_list}" varStatus="index2">
							<c:if test="${cat2.cat1_idx == cat1.cat1_idx }">
                            <li class="dropdown-item dropdown">
                                <a class="dropdown-toggle" id="dropdown1-${index.index}-${index2.index}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="location.href='lectureList.do?cat1_idx=${cat1.cat1_idx}&cat2_idx=${cat2.cat2_idx}'">${cat2.cat_name}</a>
                                <ul class="dropdown-menu" aria-labelledby="dropdown1-${index.index}-${index2.index}">
                                   	<c:forEach var="cat3" items="${sessionScope.cat3_list}">
									<c:if test="${cat3.cat2_idx == cat2.cat2_idx }">	
                                    <li class="dropdown-item"><a onclick="location.href='lectureList.do?cat1_idx=${cat1.cat1_idx}&cat2_idx=${cat2.cat2_idx}&cat3_idx=${cat3.cat3_idx}'">${cat3.cat_name}</a></li>
                                	</c:if>
                                	</c:forEach>
                                </ul>
                            </li>
                            </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
                </ul>
            </li>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <!--검색-->
        <form class="form-inline mt-2 mt-md-0" style="width:500px;">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" style=" border-radius: 50px; width:70%;" >
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

       
        <c:if test="${mgrade == 0}"> <!-- 로그인전 기본값이 뭐인지 확인하기 -->
         <li class="nav-item"  >
            <a class="nav-link disabled" href="#" style="padding-top: 12px;">로그인</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="#" style="padding-top: 12px;">회원가입</a>
        </li>
        </c:if>
          <c:if test="${mgrade == 1}"><!-- 관리자 -->

        <li class="nav-item">
            <a class="nav-link" href="admin.do" style="padding-top: 12px;">관리자</a>
        </li>
      	</c:if>
        <c:if test="${mgrade == 2}"><!-- 강사 -->
        <li class="nav-item">
            <a class="nav-link" href="teacherMain.do" style="padding-top: 12px;">강사</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="myLectureList.do" style="padding-top: 12px;">내학습</a>
        </li>
     	</c:if>
  		<c:if test="${mgrade == 3}"><!-- 학생 -->

        <li class="nav-item" >
            <a class="nav-link" href="myLectureList.do" style="padding-top: 12px;">내학습</a>
        </li>
        
        
      </c:if>
		<!-- 사람 아이콘 부분 -->
        <li class="nav-item dropdown"  >
	        <a class="nav-link dropdown-toggle" id="dropdown2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="img/site/user.png" alt="내정보이미지" width="32px" height="32px"></a>
	        <ul class="dropdown-menu" aria-labelledby="dropdown2" >
	            <li class="dropdown-item" href="#" style="border-bottom:1px solid gray;" ><a style="width:100px; text-align: center;">내 프로필 이미지</a></li>
	            
	            <li class="dropdown-item" href="#"><a href="myLectureList.do">내학습</a></li>
	            <li class="dropdown-item" href="#"><a href="MyCart.do">장바구니</a></li>
	            <li class="dropdown-item" href="#" style="border-bottom:1px solid gray;"><a href="wishList.do">찜한 강좌 목록</a></li>
	            <li class="dropdown-item" href="#" style="border-bottom:1px solid gray;"><a href="noticeMsg.do" >알림</a></li>
	            
	            <li class="dropdown-item" href="#"><a href="purchaseHistory.do">구매내역</a></li>
	            <li class="dropdown-item" href="#"><a href="#">환불내역</a></li>
	            <li class="dropdown-item" href="#"><a href="credit.do">크레딧</a></li>
	            <li class="dropdown-item" href="#"><a href="declaration.do?ridx=1">신고하기</a></li>
	            <li class="dropdown-item" href="#" style="border-bottom:1px solid gray;"><a href="commonQna.do">일반 문의사항</a></li>
	           
	            <li class="dropdown-item" href="#" ><a>로그아웃</a></li>
	        </ul>
   		 </li>
		
		
		
		
    </div>
   </div>
   </div>
    
   
</div>
</body>
</html>