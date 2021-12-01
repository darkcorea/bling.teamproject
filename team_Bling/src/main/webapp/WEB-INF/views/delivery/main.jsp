<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문확인 배송조회</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section{
		max-width:1008px;
		margin:  0px auto;
	}
			
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
<div class="container">
	<!-- 화면을 nav와 다른 것 두개로 나누기 위해서 필요 -->
	<div class="row">
	
		<!-- nav바   -->
		<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
			<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
		</div>
		
		<!-- nav옆에 있는 영역 -->
		<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
			
		</div>
	</div>
</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>

	
	
</script>
</html>