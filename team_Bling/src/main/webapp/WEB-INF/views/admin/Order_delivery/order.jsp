<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		#thSpan{
			margin: 0px 20px;
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
				<th><span id="thSpan">주문번호</span></th>
				<th><span id="thSpan">주문일</span></th>
				<th><span id="thSpan">주문자</span></th>
				<th><span id="thSpan">주문상품</span></th>
				<th><span id="thSpan">수량</span></th>
				<th><span id="thSpan">주문금액</span></th>
				<th><span id="thSpan">결제방법</span></th>
				<th><span id="thSpan">결제상태</span></th>
				<th><span id="thSpan">배송상태</span></th>
				<th><span id="thSpan">출고버튼</span></th>
			</tr>
		</table>
	</div>
	
	
</body>
</html>