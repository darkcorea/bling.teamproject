<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 해더</title>
	<c:set var="cPath" value="${pageContext.request.contextPath}"/>

	<!-- Bootstrap core CSS -->
	<link href="/team_Bling/resources/css/bootstrap.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript -->
	<script src="/team_Bling/resources/js/jquery-3.6.0.min.js"></script>
	<script src="/team_Bling/resources/js/bootstrap.bundle.js"></script>
	<!-- Bootstrap icon -->	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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

		<img alt="header" src="/team_Bling/resources/simage/header.png" width="1008px" height="65px">	
		<hr>
		<ul class="nav nav-pills">
		  <li class="nav-item">
		    <a class="nav-link" href="/team_Bling/Ad_Main/main.do"  id="admin_main">홈</a>
		  </li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"  id="admin_order">주문/배송</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/team_Bling/Ad_order_delivery/order.do">주문 리스트</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_order_delivery/delivery.do">배송 리스트</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_order_delivery/return.do">취소/반품/교환</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" aria-current="page" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_regist">상품 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/team_Bling/Ad_regist/list.do?page=1&kind=A">상품 리스트</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_regist/regist.do">상품 등록</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_regist/stop.do?page=1&kind=A">판매중지 상품</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_regist/doregist.do">커스텀관리</a></li>
		    </ul>
		  </li>
		   <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_user">회원 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/team_Bling/Ad_user/userList.do?page=1&grade=A">회원 리스트</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_user/secession_list.do">탈퇴회원 리스트</a></li>
		    </ul>
		     </li>
		     <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" id="admin_board">게시판 관리</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/team_Bling/Ad_board/question.do?page=1&kind=H">문의 게시판</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_board/board.do?page=1&type=T">공지사항 게시판</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_board/event.do">이벤트 게시판</a></li>
		      <li><a class="dropdown-item" href="/team_Bling/Ad_board/review.do?page=1">리뷰 게시판</a></li>
		    </ul>
		  </li>
		</ul>	 
		<hr>	

	
	<div id="logoutDiv">
	  	<a href="/team_Bling/Ad_login/logout.do" id="logoutA">로그아웃</a>
	</div>	
</body>
<script>
// 화면 옮길 때 마다 맞는 타이틀 표시
function amind_selected_Fn(){	
	let adminName = window.location.pathname.split("/")[2].split("_")[1];
	
	console.log(adminName);
	
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