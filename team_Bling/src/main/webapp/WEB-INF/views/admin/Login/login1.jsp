<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>login main</title>
  	<!-- Bootstrap core CSS -->
	<link href="/team_Bling/resources/css/bootstrap.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript -->
	<script src="/team_Bling/resources/js/jquery-3.6.0.min.js"></script>
	<script src="/team_Bling/resources/js/bootstrap.bundle.js"></script>
	<!-- Bootstrap icon -->	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  	<style>
  		section{
			max-width:1008px;
			margin:  0px auto;
		}
/*--------------- section-begin ---------------*/
		#loginBtn{
			background-color: #CB7878;
			border: none;
			width: 400px;
			height: 50px;
		}
		#loginBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			width: 400px;
			height: 50px;
		}
		#login_Id,#login_Pw{
			border-top: none;
			border-left: none;
			border-right: none;
			width: 400px;
		}
		#btnDiv{
			position: relative;
			top: 40px;
			text-align: center;
		}
		#formText{
			position: relative;
			left: 123px;
		}
		#inputId,#inputPw{
			position: relative;
			left: 123px;
		}
		#pwDiv{
			position: relative;
			top: 30px;
		}
		#searchSpan{
			margin: 0px 30px;
		}
		#searchA{
			text-decoration-line: none;
			color: #000000;	
		}
		#formDiv{
			height: 600px;
		}
		#caution{
			position: relative;
			left: 123px;
			top: 40px;
		}
		#cautionDiv{
			height: 50px;
		}
/*--------------- section-end ---------------*/
  	</style>
</head>
<body>

	<section>
		<div class="container"  style="margin-top:200px;">
			<div class="row">
				<div class="col-0 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				
				</div>
				<div class="col-12 col-sm-8 col-md-8 col-lg-8 col-xl-8" id="formDiv">
					<form name="form" action="/team_Bling/Ad_login/check1.do" method="post">
						<div>
							<div id="formText">
								<label for="login_Id">아이디 입력</label>
							</div>
							<div id="inputId">
								<input id="login_Id" name="id" type="text">
								<span class="check"></span>
							</div>
						</div>
						<div id="pwDiv">	
							<div id="formText">
								<label for="login_Pw">비밀번호 입력</label>
							</div>
							<div id="inputPw">
								<input id="login_Pw" name="pwd1" type="password">
								<span class="check"></span>
							</div>
						</div>
						<div id="cautionDiv">
							<c:if test="${msg == 'failure'}">
								<div id="caution" style="color: red;">아이디 또는 비밀번호가 잘못 입력 되었습니다.</div>
								<div id="caution" style="color: red;">아이디와 비밀번호를 정확히 입력해 주세요.</div>
							</c:if>
							<c:if test="${msg == 'logout'}">
								<div id="caution" style="color: red;">로그아웃 되었습니다.</div>
							</c:if>
						</div>
						<div id="btnDiv">
							<input class="btn btn-primary" id="loginBtn" type="submit" value="로그인">
						</div>
					</form>
				</div>
				<div class="col-0 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				</div>
			</div>
		</div>
		
	</section>
		
</body>
</html>