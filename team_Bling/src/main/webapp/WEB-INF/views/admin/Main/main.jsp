<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- Bootstrap core CSS -->
  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
  	<!-- Bootstrap core JavaScript -->
  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.js"></script>
	<!-- Bootstrap icon -->	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<meta charset="UTF-8">
		<title>관리자 홈</title>
		<style>
			section {
				max-width:1008px;
				margin:  5px auto;
			}
			#td{
				text-align: center;
			}	
			#dd{
				text-align:right;
			}
			#line{
				border-top:2px solid black;
			}
		</style>
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	
		<section>
			<div class = "container">
				<div class="row">
					<div class="col-7">
						<h4>주문관리</h4>
						<br>
						<table class="table table-bordered align-middle" height="250px">
							<tr>
								<td id="td">
									<p class="text-black-50">입금대기</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">결제완료</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">상품준비중</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">배송중</p>
									<b>0</b>
								</td>
							</tr>
							<tr>
								<td id="td">
									<p class="text-black-50">배송완료</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">구매확정</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">환불접수</p>
									<b>0</b>
								</td>
								<td id="td">
									<p class="text-black-50">교환접수</p>
									<b>0</b>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-1"></div>
					<div class="col">
						<h4>문의답변</h4>
						<br>
						<table class="table table-borderless" height="100px">
							<tr id="line">
								<td >
									상품후기
								</td>
								<td id="dd">
									4건
								</td>
							</tr>
							<tr>
								<td>
									상품문의
								</td>
								<td id="dd">
									0/0건
								</td>
							</tr>
							<tr>
								<td>
									1:1문의
								</td>
								<td id="dd">
									0/0건
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				
			</div>
		</section>
	</body>
</html>