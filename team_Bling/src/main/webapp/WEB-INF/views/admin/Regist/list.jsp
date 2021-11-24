<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="com.project.bling.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 상품 리스트</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<script>
$(document).ready(function () {
	
    var currentPosition = parseInt($(".quickmenu").css("top")); 
    
    $(window).scroll(function() {
    	var position = $(window).scrollTop(); 
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000); 
    });
});


</script>

<style>
	section, header {
		max-width:1008px;
		margin:  0px auto;
	}
	section {
    display: block;
	}
	
	.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
	.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
	.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
	.quickmenu ul li a:hover {color:#000;}
	.quickmenu ul li:last-child {border-bottom:0;}
	
	.line{border-bottom:1px solid gray;}
	th,td{text-align:center;}
	.d1 {margin-left:30px;
			margin-top:30px;
			margin-bottom:40px;
		}
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	<section>
	<div class="container d1">
		<div class="quickmenu">
			  <ul>
			 	<li><a href="#">홈</a></li>
			    <li><a href="/Ad_regist/list.do">리스트</a></li>
			    <li><a href="/Ad_regist/regist.do">상품 등록</a></li>
			    <li><a href="#">품절상품</a></li> 
			  </ul>
		</div>
		<h2>상품 리스트</h2>
		<br><br>
		<table style="width:800px">
			<tr class="line">
				<th width="100">상품번호</th>
				<th width="100">상품종류</th>
				<th width="300">상품이름</th>
				<th width="150">상품가격</th>
				<th>등록일</th>
			</tr>	
		<c:forEach items="${list}" var="list">
		<tr class="line">
			<td>${list.pidx}</td>
			<td>${list.kind}</td>
			<td>${list.pname}</td>
			<td>${list.price}</td>
			<td>${list.rdate}</td>
		</tr>
		</c:forEach>
		</table>
		
	</div>	
	</section>	
</body>
</html>