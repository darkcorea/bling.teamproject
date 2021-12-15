<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 해더</title>
<style>
		.t {background-color:#cb7878;}
		.d1 {margin-left:200px;
			margin-top:50px;
			margin-bottom:50px;
			width:1008px;
			}
		li{list-style-type:none;
			display: inline;
	 		margin-left:20px;
	 		font-weight: bold;
			}
		ul{
	    margin-top: 8px;
	    margin-bottom: 8px;
		}
		hr{margin:1px;
			width:1008px;
			}
		body{
		  margin: 0 auto;
		  width: 1008px;
			}
		.nav-link {
			color:black;
		}
		.nav-pills .nav-link.active, .nav-pills .show > .nav-link {
	    color: #fff;
	    background-color: #cb7878;
		}
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
		
		#logoutDiv{
			margin: 10px 0px;
			float: right;
		}
		#logoutA{
			text-decoration: none;
			color: #000000;
		}
		.dropdown-menu{
			width:140px;
		}
	</style>
</head>
<body>

		<img alt="header" src="/resources/simage/header.png" width="1008px" height="65px">	
		<hr>
		<ul class="nav nav-pills">
		  <li class="nav-item">
		    <a class="nav-link" href="/Ad_Main/main.do"  id="admin_main">홈</a>
		  </li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"  id="admin_order">주문/배송</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_order_delivery/order.do">주문 리스트</a></li>
		      <li><a class="dropdown-item" href="/Ad_order_delivery/delivery.do">배송 리스트</a></li>
		      <li><a class="dropdown-item" href="#">환불 접수</a></li>
		      <li><a class="dropdown-item" href="#">교환 접수</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" aria-current="page" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_regist">상품 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_regist/list.do?page=1&kind=A">상품 리스트</a></li>
		      <li><a class="dropdown-item" href="/Ad_regist/regist.do">상품 등록</a></li>
		      <li><a class="dropdown-item" href="#">품절 상품</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_user">회원 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_user/userList.do">회원 리스트</a></li>
		      <li><a class="dropdown-item" href="#">회원 등급 설정</a></li>
		      <li><a class="dropdown-item" href="#">탈퇴회원 리스트</a></li>
		    </ul>
		     </li>
		     <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_board">게시판 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_board/question.do">문의 게시판</a></li>
		      <li><a class="dropdown-item" href="/Ad_board/board.do?page=1&type=T">공지사항 게시판</a></li>
		      <li><a class="dropdown-item" href="/Ad_board/event.do">이벤트 게시판</a></li>
		      <li><a class="dropdown-item" href="#">리뷰 관리</a></li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#"  id="admin_state">통계</a>
		  </li> 
		</ul>	 
		<hr>	

	
	<div id="logoutDiv">
	  	<a href="/Ad_login/logout.do" id="logoutA">로그아웃</a>
	</div>	
</body>
<script>
// 화면 옮길 때 마다 맞는 타이틀 표시
function amind_selected_Fn(){	
	let adminName = ($(location).attr('pathname')).split("_")[1].split("/")[0];
	
	if (adminName== "Main"){
		$(".nav-link").removeClass("active");
		$("#admin_main").addClass("active");
	}
	if (adminName== "order"){
		$(".nav-link").removeClass("active");
		$("#admin_order").addClass("active");	
	}
	if (adminName== "regist"){
		$(".nav-link").removeClass("active");
		$("#admin_regist").addClass("active");
	}
	if (adminName== "user"){
		$(".nav-link").removeClass("active");
		$("#admin_mauser").addClass("active");
	}
	if (adminName== "board"){
		$(".nav-link").removeClass("active");
		$("#admin_board").addClass("active");
	}
}
amind_selected_Fn();


</script>
</html>