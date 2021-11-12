<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 문의 하기</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
section {
	width:800px;
	margin:0px auto;
	height:8000px;
	border:1px solid black;
}



</style>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/views/header.jsp"%><BR>
	<br>
</header>

<section>
	<h2>상품 문의하기</h2>
	<table>
		<tr>
			<td style="width:205px;">제목</td>
			<td></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><></td>
		</tr>
	</table>
	<button>이전</button>
	<button>저장</button>
</section>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>
</body>
</html>