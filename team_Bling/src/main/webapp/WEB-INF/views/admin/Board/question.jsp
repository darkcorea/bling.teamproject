<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 문의 게시판</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
/* 옆에 nav바  */
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
		 	<li><a href="/Ad_board/question.do">문의게시판</a></li>
		    <li><a href="/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
		    <li><a href="#">이벤트</a></li>
		    <li><a href="#">리뷰관리</a></li> 
		  </ul>
	</div>
</div>


<!--여기서부터 본문-->
<div id="">
</div>

</body>

<script>

</script>
</html>