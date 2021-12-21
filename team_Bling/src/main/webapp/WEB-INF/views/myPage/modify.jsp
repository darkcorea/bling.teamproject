<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 확인</title>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<style>
			section{
				max-width:1008px;
				margin:  0px auto;
			}
			table{
				border-top:1px solid black;
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
						<h2>나의 정보 확인</h2>
						<b><c:out value="${data.uname }"/></b>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.
						<br/>
						<table class="table">
							<tr>
								<th class="table-secondary" style="text-align: center;">
									비밀번호
								</th>
								<td>
									<input type="password" id="pass">
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
			
			$.ajax({
				url:"/team_Bling/MyPage/confirmpwd.do",
				type:"post",
				data:{"pass":pass},
				dataType:"json",
				success:function(data){
					if(data==true){
						location.href="${cPath}/MyPage/modifyInformation.do";
					}else{
						alert("비밀번호가 틀렸습니다.");
					}
				},error:function(){
					alert("비밀번호 확인오류!");
				}
			});
		}
	</script>
</html>