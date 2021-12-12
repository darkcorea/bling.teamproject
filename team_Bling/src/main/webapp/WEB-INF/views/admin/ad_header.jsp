<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
	</style>
</head>
<body>

		<img alt="header" src="/resources/simage/header.png" width="1008px" height="65px">	
		<hr>
		<ul class="nav nav-pills">
		  <li class="nav-item">
		    <a class="nav-link" href="admin/Home/home">홈</a>
		  </li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">주문/배송</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_order_delivery/order.do?page=1">주문 리스트</a></li>
		      <li><a class="dropdown-item" href="#">배송 리스트</a></li>
		      <li><a class="dropdown-item" href="#">환불 접수</a></li>
		      <li><a class="dropdown-item" href="#">교환 접수</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle active" aria-current="page" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상품 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/Ad_regist//list.do?page=1&kind=A">상품 리스트</a></li>
		      <li><a class="dropdown-item" href="/Ad_regist/regist.do">상품 등록</a></li>
		      <li><a class="dropdown-item" href="#">품절 상품</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">회원 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="#">회원 리스트</a></li>
		      <li><a class="dropdown-item" href="#">회원 등급 설정</a></li>
		      <li><a class="dropdown-item" href="#">탈퇴회원 리스트</a></li>
		    </ul>
		     </li>
		     <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">게시판 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="#">문의 게시판</a></li>
		      <li><a class="dropdown-item" href="/Ad_board/board.do?page=1&type=T">공지사항 게시판</a></li>
		      <li><a class="dropdown-item" href="/Ad_board/event_regist.do">이벤트 게시판</a></li>
		      <li><a class="dropdown-item" href="#">리뷰 관리</a></li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">통계</a>
		  </li> 
		</ul>	 
		<hr>	

	
	<div id="logoutDiv">
	  	<a href="/Ad_login/logout.do" id="logoutA">로그아웃</a>
	</div>	
</body>
</html>