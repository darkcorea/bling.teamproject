<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송지목록</title>
			<!-- Bootstrap core CSS -->
		  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
		  	<!-- Bootstrap core JavaScript -->
		  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
				<script src="/resources/js/bootstrap.bundle.js"></script>
			<!-- SweetAlert2(alert,modal창) -->
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				
		<style>
			section{
				max-width:1008px;
				margin:  0px auto;
			}
		/* nav 메뉴 css */
			#basicInfo{
				background-color: #CB7878;
				opacity: 0.5;
				margin: 30px 0px 30px 0px;
				padding: 20px 0px 0px 15px;
				color: #ffffff;
				font-size: 20px;
				width: 190px;
				height: 130px;
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
			#dateBtn1{
				background-color: #CB7878;
				border: none;
				color: #ffffff;
				padding: 6px 3px;
			}
			#dateBtn1:hover{
				color: #CB7878;
				background-color: #ffffff;
				border: 1px solid #CB7878;
				padding: 6px 3px;
			}
		</style>
	</head>
	<body onload="reviewList()">
	<!-- header -->
		<header>
			<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
		</header>
	
		
		<section>
			<article>
				<div class="container">
					<div class="row">
					
						<!-- nav바   -->
						<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
							<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
						</div>
						
						<!-- 본문 -->
						<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
							<h2>배송지 목록</h2>
							<button type="button" class="btn" id="dateBtn1" onclick="day_fn('A')" style="float: right;">배송지 등록</button>
							
							
						</div>
					</div>
				</div>
			</article>
		</section>
		
		<br>
		<br>
		<br>
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>		
	</body>
</html>