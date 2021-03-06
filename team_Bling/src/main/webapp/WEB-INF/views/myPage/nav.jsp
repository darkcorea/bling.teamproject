<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	
	
	<style>
	/* nav 메뉴 css */
		#basicInfo{
			background-color: #CB7878;
			opacity: 0.5;
			margin: 30px 0px 30px 0px;
			padding: 20px 0px 0px 15px;
			color: #ffffff;
			font-size: 20px;
			width: 190px;
			height: 150px;
		}
		#navMenu{
			margin-bottom: 40px;
		}
		#navSub{
			color: #C1B2B2;
		}
		#menuHead{
			font-weight: bold;
			font-size: 20px;
		}
		.navA{
			text-decoration: none;
			color: #C1B2B2;
		}
		.navA:hover{
			color: #CB7878;
		}
		.pa_top{
			padding-top:7px;
		}
		#myPageTitle{
			text-decoration: none;
			color: #000000;
		}
	/* nav 메뉴 css */
	</style>
	
</head>
<body>
	<!-- nav바   -->
	<h2><b><a id="myPageTitle" href="${cPath}/MyPage/main.do?page=1">마이페이지</a></b></h2>
	<div id="basicInfo">
		<div><b>${sessionScope.UserVO.id}</b>님</div>
		<div>내 등급 : 
			<c:choose>
				<c:when test="${sessionScope.UserVO.grade == 'B'}">
					<b>Bronze</b>
				</c:when>
				<c:when test="${sessionScope.UserVO.grade == 'S'}">
					<b>Silver</b>
				</c:when>
				<c:otherwise>
					<b>Gold</b>
				</c:otherwise>
			</c:choose>
		</div>
		<div>내 적립금 : 
			<b>
				<fmt:formatNumber value="${sessionScope.UserVO.mileage}" pattern="#,###" />원
			</b>
		</div>
	</div>
	<!-- 쇼핑정도, 나의 황동, 회원 정보 NAV -->
	<div id="navMenu">
		<div id="menuHead">쇼핑정보</div>
		<div id="navSub">
			<div class="pa_top"><a class="navA" href="${cPath}/Delivery/main.do?page=1&kind=E">주문확인/배송조회</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/Basket/like1.do?kind=A">관심상품</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/Basket/cart.do">장바구니</a></div>
		</div>
	</div>
	<div id="navMenu">
		<div id="menuHead">나의 활동</div>
		<div id="navSub">
			<div class="pa_top"><a class="navA" href="${cPath}/Review/myReview.do">나의 리뷰</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/Customer/my_qestion.do?page=1">나의 문의 내역</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/Custom/list.do">커스터마이징</a></div>
		</div>
	</div>
	<div>
		<div id="menuHead">회원정보</div>
		<div id="navSub">

			<div class="pa_top"><a class="navA" href="${cPath}/MyPage/modify.do">나의 정보/수정</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/Addr/main.do?page=1">배송지 목록</a></div>
			<div class="pa_top"><a class="navA" href="${cPath}/MyPage/deletemain.do">회원탈퇴</a></div>
		</div>
	</div>
</body>
</html>