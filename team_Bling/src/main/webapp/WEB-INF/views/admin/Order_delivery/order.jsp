<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 리스트</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

	<style>
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
		.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
		.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		
		.content {position:relative;min-height:1000px;}
		
		#th1{
			text-align: center;
		}
	</style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	
	<!-- 옆 nav 바 -->
	<div class="d1">
		<div class="quickmenu">
			  <ul>
			 	<li><a href="#">문의게시판</a></li>
			    <li><a href="/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
			    <li><a href="#">이벤트</a></li>
			    <li><a href="#">리뷰관리</a></li> 
			  </ul>
		</div>
	</div>
	
	<!-- 본문 -->
	<div>
		<span>주문리스트</span>
		<table>
			<tr>
				<th id="th1">주문번호</th>
				<th id="th2"><span id="thSpan2">주문일</span></th>
				<th id="th3"><span id="thSpan3">주문자</span></th>
				<th id="th4"><span id="thSpan4">주문상품</span></th>
				<th id="th5"><span id="thSpan5">수량</span></th>
				<th id="th6"><span id="thSpan6">주문금액</span></th>
				<th id="th7"><span id="thSpan7">결제방법</span></th>
				<th id="th8"><span id="thSpan8">결제상태</span></th>
				<th id="th9"><span id="thSpan9">배송상태</span></th>
				<th id="th10"><span id="thSpan10">출고버튼</span></th>
			</tr>
			<c:forEach items="${orderList}" var="ol">
			<tr>
				<td>${ol.order_idx}</td>
				<td>${ol.rdate}</td>
				<td>${ol.uname}</td>
				<td>${ol.pname} /<br>${ol.oname}</td>
				<td>${ol.quantity}</td>
				<td><fmt:formatNumber value="${ol.tot_price}" pattern="#,###" />원</td>
				<td>${ol.payment}</td>
				<td>${ol.order_yn}</td>
				<td>${ol.delivery_yn}</td>
				<td></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	
</body>
</html>