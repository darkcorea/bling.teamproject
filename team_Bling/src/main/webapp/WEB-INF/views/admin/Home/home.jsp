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
				
		</style>
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	
		<section>
			<div>
				주문관리
				<table>
					<tr>
						<td>
							입금대기
						</td>
						<td>
							결제완료
						</td>
						<td>
							상품준비중
						</td>
						<td>
							배송중
						</td>
					</tr>
					<tr>
						<td>
							배송완료
						</td>
						<td>
							구매확정
						</td>
						<td>
							환불접수
						</td>
						<td>
							교환접수
						</td>
					</tr>
				</table>
			</div>
		</section>
	</body>
</html>