<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>login main</title>
  	
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
		#nonMemberBuy{
			color: black;
			background-color: #ffffff;
			border: 1px solid black;
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
			top: 60px;
			text-align: center;
		}
		#btnDiv2{
			position: relative;
			top: 80px;
			text-align: center;
		}
		#formText{
			position: relative;
			left: 123px;
			margin-top: 10px;
		}
		#inputId,#inputPw{
			position: relative;
			left: 123px;
		}
		#pwDiv{
			position: relative;
			top: 30px;
		}
		#searchDiv{
			position: relative;
			top: 150px;
			text-align: center;
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
			top: 60px;
		}
		#cautionDiv{
			height: 80px;
		}
		#rememberLogin{
			position: relative;
			left: 123px;
			top: 50px;			
		}
/*--------------- section-end ---------------*/
  	</style>
</head>
<body>
	
	<!-- header -->
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-0 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				
				</div>
				<div class="col-12 col-sm-8 col-md-8 col-lg-8 col-xl-8" id="formDiv">
					<form name="form" action="${cPath}/Login/check.do" method="post">
						<div>
							<div id="formText">
								<label for="login_Id">????????? ??????</label>
							</div>
							<div id="inputId">
								<input id="login_Id" name="id" type="text">
								<span class="check"></span>
							</div>
						</div>
						<div id="pwDiv">	
							<div id="formText">
								<label for="login_Pw">???????????? ??????</label>
							</div>
							<div id="inputPw">
								<input id="login_Pw" name="pwd" type="password">
								<span class="check"></span>
							</div>
						</div>
						<div id="rememberLogin">
							<label>
								<input type="checkbox" name="loginKeep" value="keep"> ????????? ??????
							</label>
						</div>
						<div id="cautionDiv">
						<c:if test="${login_out == 'failure'}">
							<div id="caution" style="color: red;">????????? ????????? ?????????????????????.</div>
							<div id="caution" style="color: red;">????????? ?????? ?????? ???????????? ????????? ??????????????????</div>
						</c:if>
						<c:if test="${login_out == null}">
							<c:if test="${msg == 'failure'}">
								<div id="caution" style="color: red;">????????? ?????? ??????????????? ?????? ?????? ???????????????.</div>
								<div id="caution" style="color: red;">???????????? ??????????????? ????????? ????????? ?????????.</div>
								<c:if test="${login_count != '' && login_count != null}">
									<div id="caution" style="color: red;">5????????? ????????? ????????? ???????????? ?????? ??? ????????????.(<c:out value="${login_count}"/>)</div>
								</c:if>
							</c:if>
							<c:if test="${msg == 'logout'}">
								<div id="caution" style="color: red;">???????????? ???????????????.</div>
							</c:if>
						</c:if>
						</div>
						
						<div id="btnDiv">
							<input class="btn btn-primary" id="loginBtn" type="submit" value="?????????">
						</div>
						<div id="btnDiv2">
							<input class="btn btn-primary" id="nonMemberBuy" type="button" 
							onclick="location.href='{cPath}/Order/nonorder.do'" value="??????????????? ????????????" style="display:none;">
						</div>
						<div id="searchDiv">
							<span id="searchSpan"><a href="/team_Bling/Login/idFind.do" id="searchA">????????? ??????</a></span>
							<span>???</span>
							<span id="searchSpan"><a href="/team_Bling/Login/pwdFind.do" id="searchA">???????????? ??????</a></span>
							<span>???</span>
							<span id="searchSpan"><a href="/team_Bling/Delivery/nonDelivery.do" id="searchA">????????? ????????????</a></span>
						</div>
					</form>
				</div>
				<div class="col-0 col-sm-2 col-md-2 col-lg-2 col-xl-2">
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
		
</body>
</html>