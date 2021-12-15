<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>탈퇴</title>
		<!-- Bootstrap core CSS -->
	  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
	  	<!-- Bootstrap core JavaScript -->
	  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
			<script src="/resources/js/bootstrap.bundle.js"></script>
		<!-- Bootstrap icon -->	
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<!-- SweetAlert2(alert,modal창) -->
			<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			
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
				<div class="row">
					<!-- nav바   -->
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
					</div>
					
					<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9">
						<h2>탈퇴하기</h2>
						비밀번호를 입력하시면 회원탈퇴가 완료됩니다.
						<br/>
						<table class="table">
							<tr>
								<th class="table-secondary" style="text-align: center;">
									비밀번호
								</th>
								<td>
									<input type="password" id="pass">
									<input type="hidden" value="${data.pwd }" id="that">
								</td>
							</tr>
						</table>
						<button type="button" class="btn btn-outline-primary" onClick="confirm()">확인</button>
					</div>
				</div>
			</div>
		</section>
		
		<footer>
				<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>
	</body>
	<script>
		function confirm(){
			var pass = document.getElementById("pass").value;
			var real = document.getElementById("that").value;
			
			if(pass == real){
				alert("탈퇴되었습니다.");
				location.href="/MyPage/deletefin.do";
			}else{
				alert("비밀번호가 틀렸습니다.");
			}
		}
	</script>
</html>