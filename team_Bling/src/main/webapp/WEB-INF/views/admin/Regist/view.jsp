<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 상세 보기</title>
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
			    <li><a href="/Ad_regist/list.do">공지사항</a></li>
				<li><a href="#">고객센터</a></li>
			    <li><a href="#">이벤트</a></li>
			    <li><a href="#">리뷰관리</a></li> 
			  </ul>
		</div>
	</div>
	<h1>상세보기</h1>

	
</body>
</html>