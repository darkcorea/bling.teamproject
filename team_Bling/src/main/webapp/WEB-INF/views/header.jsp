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
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">
</script>
	<link rel="stylesheet" href="/css/bootstrap.css">	
  	<!-- Bootsrap icon(cart, heart) -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  	
  	<style>
  		section, header{
			max-width:1008px;
			margin:  0px auto;
		}
/*--------------- header-begin ---------------*/
		/* header home icon */
		.bi-house-fill{
			font-size:18px;
			color:#000000;
		}
		/* header heart icon */
		.header_heart{
			font-size:18px;
			color:red;
			float: none;
		}
		#header_notice,#header_event,#customerCenter{
			text-decoration-line: none;
			color: #989191;
		}
		#header_notice:hover,#header_event:hover,#customerCenter:hover{
			text-decoration-line: none;
			color: #000000;
		}
		#searchIcon,#cartIcon{
			text-decoration: none;
			color: #000000;
		}
		#headerCol1{
			word-spacing: 26px;
		}
		#headerCol2{
			text-align: right;
		}
		#headerRow1{
			height:64px;
		}
		#title_image{
			width:209px;
		}
		#headerCol3{
			text-align: center;
		}
		#headerCol4{
			text-align: right;
			padding: 10px;
		}
		#headercol5{text-align: right;
			padding: 10px;}
		#hearderMemberJoin,#headerLogin{
			text-decoration-line: none;
			color : #000000;
		}
		
		#hearderMemberJoin:hover,#headerLogin:hover{
			color:#989191;
		}
		#topSearch{
			float: right;
			margin-right: 20px;
			margin-top: 15px;
		}
		#topCart{
			font-size:25px;
			float: right;
			margin-right: 20px;
			margin-top: 10px;
			position: relative;
			top: 3px;
		}
		#menu{
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			padding-right: 0px;
			height: 45px;
			text-aling: center;
		}
		#menu_end{
			border-top: 1px solid black;
			border-bottom: 1px solid black;
			padding-right: 0px;
			height: 45px;
			text-aling: center;
		}
		#smenu{
			position: relative;
			top: 10px;
		}
		#amenu{
			text-decoration-line: none;
			color : #000000;
			
		}
		#amenu:hover{
			color:#989191;
		}
		.badge{
			font-size:8pt;
		}	
		.bi-cart2{
			color:#000000;
		}
		.top{
         position: fixed;
         bottom: 50px;
         right: 50px;
         text-align: center;
	      }
	      #topBtn{
	         text-decoration-line: none;
	         color: #000000;   
	      }
	    .scrollNav{
		    width:100%; height:50px; 
		    position:absolute; 
		    left:300; top:0; 
		    background-color:#ffffff;
		    background-color: rgba( 255, 255, 255, 0.5 );
		    text-align:center; 
		    line-height:50px; 
		    color:#fff; 
		    font-weight:600;
		    z-index:1000;
		}
	    #menu1{
	    height: 45px;
		text-aling: center;
	    }
		.login{
			word-spacing: 5px;
		}
		.join{
			word-spacing: 0px;
		}
		.cart{
			word-spacing: -3px;
		}
		#loginName{
			color: #CB7878;
			font-weight: bold;
			text-decoration: none;
		}
/*--------------- header-end ---------------*/
  	</style>
</head>
<body>
	<section>
		<!-- header -->
		<header class="mainNav">
			<div class="container">
		        <div class="row">
		            <div class="col-8 col-md-6" id="headerCol1">
		            <!-- home icon -->
		                <a href="/"><i class="bi bi-house-fill"></i></a>
		                <a id="header_notice" href="">NOTICE</a>
		                <a id="header_event" href="">EVENT</a>
	                <!-- heart icon -->
						<a href=""><i class="bi bi-suit-heart-fill header_heart"></i></a>
		            </div>
		            <div class="col-1 col-md-4"></div>
		            <div class="col-3 col-md-2" id="headerCol2">
		                <a id="customerCenter" href="">고객센터</a>
		            </div>
		        </div>
		
				<div class="row" id="headerRow1"></div>
		
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4" id="headerCol3">
						<a href="/"><img id="title_image" src="/resources/simage/logo.png" alt=""></a>
					</div>
					<div class="col-md-4" id="headerCol4">
						<c:choose>
							<c:when test="${sessionScope.id == null}">
								<a href="/Join/normal.do" id="hearderMemberJoin">회원가입</a>
								<span>｜</span>
								<a href="${path}/Login/main.do" id="headerLogin">로그인</a>
							</c:when>
							<c:otherwise>
								<div>
									<a id="loginName" href="/MyPage/main.do">${sessionScope.uname}</a> 님이 로그인중입니다.
								</div>
								<a href="/Join/main.do" id="hearderMemberJoin">회원가입</a>
								<span>｜</span>
								<a href="${path}/Login/logout.do" id="headerLogin">로그아웃</a>	
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div  class="row" id="headercol5">
					<!-- cart icon -->
					<div id="topCart">
						<span id="searchinput">
						</span>
						<a id="searchIcon" href="javascript:void(0);">
							<i class="bi bi-search" style="font-size:1.5rem" onclick="search()"></i>
						</a>
						<a id="cartIcon" href="/Basket/cart.do">
							<i class="bi bi-cart2">
								<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
		   							10<span class="visually-hidden">unread messages</span>
		  						</span>
	  						</i>
  						</a>
					</div>
				</div>
			</div>
			<br>
	
			<!-- top menu -->
			<div class="container">
				<div class="row">
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/best.do">BEST</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/new.do">NEW</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/ring.do?orderBy=1">반지</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/necklace.do?orderBy=1">목걸이</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu">
						<span id="smenu"><a id="amenu" href="/Product/earring.do?orderBy=1">귀걸이</a></span>
					</div>
					<div class="col-4 col-md-2 col-lg-7 col-xl-7" id="menu_end">
						<span id="smenu"><a id="amenu" href="/Product/braclet.do?orderBy=1">팔찌</a></span>
					</div>
				</div>
			</div>
			<br>
		</header>
  <div class="scrollNav container">
     <div class="row">
		<div class="col-4 col-md-2 col-lg-1 col-xl-4 login" >
		   <a href="main.do"><i class="bi bi-house-fill"></i></a>
		   <a id="header_notice" href="">LOGIN</a>
		   <a id="header_event" href="" class="join">JOIN US</a>
	       <a id="header_event" href="" class="cart">CART
	       <span class="badge bg-secondary rounded-pill">4</span></a>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/best.do">BEST</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/new.do">NEW</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/ring.do?orderBy=1">반지</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/necklace.do?orderBy=1">목걸이</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/earring.do?orderBy=1">귀걸이</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="menu1">
			<span><a id="amenu" href="/Product/braclet.do?orderBy=1">팔찌</a></span>
		</div>
		<div class="col-4 col-md-2 col-lg-1 col-xl-1" id="headerCol2">
		   <a id="customerCenter" href="">고객센터</a>
		</div>
	</div>
  </div>

		<div class="top">
         <a id="topBtn" href="#"><i class="bi bi-chevron-up" style="font-size:2rem;"></i></a>
         <div><a id="topBtn" href="#">TOP</a></div>
      </div>
	</section>
<script>
function search(){
	$("#searchinput").html("<input type='search' name='search' size='12'>");
}
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
</script>
</body>
</html>