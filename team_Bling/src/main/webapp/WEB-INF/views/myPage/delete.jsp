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
				/* 모달창 CSS */
				.modal {
		        	text-align: center;
				}
				.modal-dialog {
			        display: inline-block;
			        text-align: left;
			        vertical-align: middle;
				}
				.modal-header{
					background-color: #CB7878;
				}
				.modal-title{
					color: #ffffff;
					font-size: 30px;
					position: relative;
					left: 150px;
				}
				#form{
					width:430px;
					height:350px;
					margin: 0 auto;
				}
				.red{
					color:red;
				}
				.modal-backdrop{
					background-color: #000000 !important;
					opacity: 0.3 !important;
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
		
		
		<!-- 탈퇴 사유 모달 -->
		<div class="modal fade" id="quitModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">탈퇴 사유</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <div id="form">
			      		<hr/>
				        	<h4>탈퇴 사유</h4>
				        <hr/>
				        <div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit1" value="상품 다양성,가격품질 불만" checked>
						  <label class="form-check-label" for="flexRadioDefault1">
						   상품 다양성 / 가격품질 불만
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit2" value="교환/환불/품질 불만" >
						  <label class="form-check-label" for="flexRadioDefault2">
						    교환/환불/품질 불만
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit3" value="배송 불만" >
						  <label class="form-check-label" for="flexRadioDefault3">
						   배송 불만
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit4" value="이용빈도 낮음" >
						  <label class="form-check-label" for="flexRadioDefault4">
						  이용빈도 낮음
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit5" value="A/S 불만" >
						  <label class="form-check-label" for="flexRadioDefault5">
						  A/S 불만
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="quit" id="quit6" value="기타사유" >
						  <label class="form-check-label" for="flexRadioDefault3">
						   기타 사유(적어주세요)
						  </label>
						  <br>
						  <textarea id="quit6why" style="width:400px;height:100px;"></textarea>
						</div>
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="quit()">탈퇴</button>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
	<script>
		function confirm(){
			var pass = document.getElementById("pass").value;
			$.ajax({
				url:"/MyPage/deletequit.do",
				type:"post",
				data:{"pass":pass},
				dataType:"json",
				success:function(data){
					if(data == 1){
						$('#quitModal').modal('show');
					}else{
						alert("비밀번호가 틀렸습니다.");
					}
				},error:function(){
					alert("비밀번호확인오류!");
				}
			});
				//alert("탈퇴되었습니다.");
		}
		function quit(){
			var quitval = $("input[name='quit']:checked").val()
			//1. 상품 다양성 / 가격품질 불만
			//2. 교환/환불/품질 불만
			//3. 배송 불만
			//4. 이용빈도 낮음
			//5. A/S 불만
			//6. 기타 사유(적어주세요)
			console.log(quitval);
			console.log(document.getElementById("quit6why").value);
			if(quitval=="기타사유"){
				quitval = document.getElementById("quit6why").value
			}
			$.ajax({
				url:"/MyPage/deletefin.do",
				type:"post",
				data:{"quitval":quitval},
				dataType:"json",
				success:function(data){
					alert("탈퇴되었습니다.")
					window.location.href = "/";
				},error:function(){
					alert("탈퇴사유오류!");
				}
			});
		}
	</script>
</html>