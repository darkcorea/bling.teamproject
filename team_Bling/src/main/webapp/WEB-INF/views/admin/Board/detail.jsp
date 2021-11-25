<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
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
			#detailrdate{text-align:right;}
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
				    <li><a href="#">공지사항</a></li>
					<li><a href="#">고객센터</a></li>
				    <li><a href="#">이벤트</a></li>
				    <li><a href="#">리뷰관리</a></li> 
				  </ul>
			</div>
		</div>
		
	<!-- 내용 -->
		<div>
			<h2 class='text-center'>${detail.subject }</h2>
			<hr>
			<table class="table">
				<tr>
					<td class='text-left'>
						타입 : 
						<c:if test="${detail.type eq 'N'}"> 
							기본(N)
						</c:if>
						<c:if test="${detail.type eq 'S'}"> 
							중요공지사항(S)
						</c:if>
						<c:if test="${detail.type eq 'Q'}"> 
							고객센터(Q)
						</c:if>
					</td>
					<td id="detailrdate">${detail.rdate }</td>
				</tr>
				<tr>
					<td colspan="2">
						${detail.contents}
					</td>
				</tr>
				
				<c:if test="${detail.imgfile != null}">
				<tr>
					<td colspan="2">
						<a href="/Ad_board/fileDownLoad.do?fileName=${detail.imgfile}">
						파일 다운로드 : 
						<i class="bi bi-file-earmark-arrow-down"></i>
						${detail.imgfile}
						</a>
					</td>
				</tr>
				</c:if>
				
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-outline-primary" type="button" onclick="location.href='/Ad_board/bf_modify.do?nidx=${detail.nidx}'">수정하기</button>
			  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/Ad_board/board.do?page=1&type=T'">목록가기</button>
			</div>
		</div>
		<br>
	</body>
	
</html>