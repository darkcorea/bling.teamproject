<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>login main</title>
  	<script src="/js/jquery-3.6.0.min.js"></script>
 	<script src="/js/bootstrap.bundle.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">	
  	<!-- Bootsrap icon(cart, heart) -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/css/header.css">
</head>
<body>
		<!-- header -->
			<div class="mainNav container">
		        <div class="row" id="headerRow1">
		            <div class="col-8 col-md-6" id="headerCol1">
		            <!-- home icon -->
		                <a href="/"><i class="bi bi-house-fill"></i></a>
		                <a id="header_notice" href="/Notice/notice_main.do">NOTICE</a>
		                <a id="header_event" href="/Event/main.do">EVENT</a>
	                <!-- heart icon -->
						<a href="/Basket/like1.do?kind=A"><i class="bi bi-suit-heart-fill header_heart"></i></a>
		            </div>
		            <div class="col-1 col-md-4"></div>
		            <div class="col-3 col-md-2" id="headerCol2">
		                <a id="customerCenter" href="/Customer/main.do?page=1">고객센터</a>
		            </div>
		        </div>
		
				<div class="row" id="headerRow2"></div>
		
				<div class="row" id="headerRow3">
					<div class="col-md-4"></div>
					<div class="col-md-4" id="headerCol3">
						<a href="/"><img id="title_image" src="/resources/simage/logo.png" alt=""></a>
					</div>
					<div class="col-md-4" id="headerCol4">
						<c:choose>
							<c:when test="${sessionScope.UserVO.id == null}">
								<a href="/Join/normal.do" id="hearderMemberJoin">회원가입</a>
								<span>｜</span>
								<a href="${path}/Login/main.do" id="headerLogin">로그인</a>
							</c:when>
							<c:otherwise>
								<div>
									<a id="loginName" href="/MyPage/main.do?page=1">${sessionScope.UserVO.uname}</a> 님
								</div>
								<a href="/MyPage/main.do?page=1" id="hearderMemberJoin">마이페이지</a>
								<span>｜</span>
								<a id="headerLogin" data-bs-toggle="modal" data-bs-target="#logOut_motal" class="pointer">로그아웃</a>	
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div  class="row" id="headerRow4">
					<!-- cart icon -->
					<div id="topCart">
						<!-- 검색 -->
						<form name="searchFrm" id="searchinput" action="/Product/search.do" method="POST" >
						<input type="search" class="search" name="keyword">
						<input type="text" style="display:none;">
						</form>
						<a id="searchIcon" onclick="search_Fn()" class="pointer">
							<i class="bi bi-search" style="font-size:1.5rem"></i>
						</a>
						<a id="cartIcon" href="/Basket/cart.do">
							<i class="bi bi-cart2">
								<!-- 카트 위에 나오는 장바구니 숫자 -->
								<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart_count">
		  						</span>
	  						</i>
  						</a>
					</div>
				</div>
			</div>
			<br>
	
			<!-- top menu -->
			<div class="container" id="headerRow5">
				<div class="row">
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/best_new.do?kind=best">BEST</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/best_new.do?kind=new">NEW</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/sroll.do?kind=R">반지</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/sroll.do?kind=N">목걸이</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/sroll.do?kind=E">귀걸이</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-7 col-xl-7" id="menu_end">
						<span id="smenu"><a id="amenu" href="/Product/sroll.do?kind=B">팔찌</a></span>
					</div>
				</div>
			</div>
			<br>
		
  <div class="scrollNav container">
     <div class="row">
     	
		<div class="col-lg-1 col-md-1 col-sm-2 col-2 scmenu" >
			<!-- 집 모양 메인페이지로 이동  -->
		   <a href="/"><i class="bi bi-house-fill"></i></a>
		</div>
		<div class="col-lg-1 col-md-2 col-sm-2 col-2 scmenu">
			<a id="header_notice1" href="/Login/main.do">LOGIN</a>
		</div>
		<div class="col-lg-1 col-md-2 col-sm-2 col-2 scmenu">
			<a id="header_event1" href="/Join/normal.do">JOIN US</a>
		</div>
		<div class="col-lg-1 col-md-2 col-sm-2 col-2 scmenu">
			<a id="header_event1" href="/Basket/cart.do" >CART
	       <span class="badge bg-secondary rounded-pill" id="cart_count1"></span></a>
		</div>
		<div class="col-lg-2 col-md-4 col-sm-3 col-3 scmenu cust">
		   <a id="customerCenter1" href="/Customer/main.do?page=1">고객센터</a>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/best_new.do?kind=best">BEST</a></span>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/best_new.do?kind=new">NEW</a></span>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/sroll.do?kind=R">반지</a></span>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/sroll.do?kind=N">목걸이</a></span>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/sroll.do?kind=E">귀걸이</a></span>
		</div>
		<div class="col-lg-1 col-md-2  col-sm-2 col-2 scmenu">
			<span><a id="amenu" href="/Product/sroll.do?kind=B">팔찌</a></span>
		</div>
	</div>
  </div>

<div class="top">
	<a id="topBtn" href="#"><i class="bi bi-chevron-up" style="font-size:2rem;"></i></a>
	<div><a id="topBtn" href="#">TOP</a></div>
 </div>

<!-- 로그아웃 모달창 -->
<div class="modal" tabindex="-1" id="logOut_motal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title" style="color:white;">로그아웃</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text_center">
        <br>
        <p><b>로그아웃을 하시겠습니까?</b></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" id="logout_btn_no">아니요</button>
        <button type="button" class="btn btn-primary"  id="logout_btn" onclick="location.href='${path}/Login/logout.do'" >예</button>
      </div>
    </div>
  </div>
</div>
</body>

<script>

$(document).ready(function(){

    var navHeight = $(".mainNav").height(); 
    //navHeight 의 높이를 구하기

    $(".scrollNav").hide();
    //스크롤시 나타날 객체 미리 숨기기

    $(window).scroll(function(){  // 윈도우 스크롤 기능 작동
        var rollIt = $(this).scrollTop() >= navHeight; 
// 스크롤의 정도가 navHeight 의 값을 넘었을 때 == 윈도우 스크롤의 값이 navHeight 의 높이와 같거나 크다
/*
scrollTop 은 윈도우에서 스크롤의 위치가 가장 상위에 있다는 의미로 해석
스크롤의 위치가 화면 아래일수록 == scrollTop 의 값이 커짐
*/
    if(rollIt){ 
		//윈도우 스크롤 기능의 값이 navHeight 의 높이와 같거나 크면
            $(".scrollNav").show().css({"position":"fixed"});
        }
        else{
            $(".scrollNav").hide();
        }
    });
    
});



// 장바구니 갯수 표시
function cart_count_fn(){
	let midx = "<c:out value='${sessionScope.UserVO.midx}'/>";
	if(midx != null && midx != ""){
		$.ajax({
			url:"/Header_cart.do",
			type:"POST",
			data:{"midx":midx},
			success:function(data){
				console.log(data);
				if (data != 0){
				$("#cart_count").text(data);
				$("#cart_count").show();
				$("#cart_count1").text(data);
				$("#cart_count1").show();
				}else {
					$("#cart_count").hide();
					$("#cart_count1").hide();
				}
			},error:function(){
				alert("관심상품 갯수 에러")
			}
		});
	}	
}
cart_count_fn();


/* 검색어를 입력하고 검색 버튼을 눌렀을 떄 */
function search_Fn() {

	let keyword = $("input[name=keyword]").val();
	let rform = document.searchFrm;
	if( keyword == ""){
		alert("검색어를 입력해 주세요.");
		$("input[name=keyword]").focus();
		return ;
	}
	
	rform.submit();

}


</script>
</html>