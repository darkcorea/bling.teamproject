<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<!--차트-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
		<script src="https://d3js.org/d3.v3.min.js"></script> <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
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
			#menubtn{
				height: 60px;
				margin-right:0px !important;
			}
			#sta{
				background-color: #d3d3d3;
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
									<p class="text-black-50">구매미확정</p>
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
				
				<hr>
				<br>
				<div class="btn-group btn-group-sm d-md-flex justify-content-md-end" role="group" aria-label="Basic outlined example" id="groupbtn">
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn">
						<b>매출(7일)</b>
						<br>
						0원
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn">
						<b>주문(7일)</b>
						<br>
						0건
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn">
						<b>방문자(7일)</b>
						<br>
						0명
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn">
						<b>신규회원(7일)</b>
						<br>
						0명
					</button>
				</div>
				<br>
				<div class="row">
					<div class="col">
						<table class="table table-bordered align-middle">
							<thead>
								<tr class="table-secondary">
								  <th scope="col" id="td">날짜</th>
								  <th scope="col" id="td">매출금액</th>
								  <th scope="col" id="td">판매금액</th>
								  <th scope="col" id="td">환불금액</th>
								</tr>
							</thead>
							<tbody>
								
									<tr>
										<td id="td">
											12/02
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
									</tr>
									<tr>
										<td id="td">
											12/03
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
									</tr>
									<tr>
										<td id="td">
											...
										</td>
										<td id="dd">
											...
										</td>
										<td id="dd">
											...
										</td>
										<td id="dd">
											...
										</td>
									</tr>
									<tr>
										<td id="td">
											12/07
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
										<td id="dd">
											0
										</td>
									</tr>
								<tr class="table-light">
									<td id="td">
										12/08
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
								</tr>
								<tr id="sta">
									<td id="td">
										7일합계
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
								</tr>
								<tr id="sta">
									<td id="td">
										15일합계
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
								</tr>
								<tr id="sta">
									<td id="td">
										30일합계
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
									<td id="dd">
										0
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col">
						<div id="linechart">

						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
	<script>
			var chart = c3.generate({
				bindto: "#linechart",
				data: {
					columns: [
						['data1', 30, 200, 100, 400, 150, 250],
						['data2', 50, 20, 10, 40, 15, 25]
					]
				}
			});
		</script>
</html>