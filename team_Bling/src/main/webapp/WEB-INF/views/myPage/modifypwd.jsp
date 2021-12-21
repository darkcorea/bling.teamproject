<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>패스워드 수정</title>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<!-- 주소 검색 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style>
			section{
				max-width:1008px;
				margin:  0px auto;
			}
			.agree{
                width:550px;
                height: 45px;
                margin : auto;
            }
            .bi-check-circle{
                font-size :30px;
            }
            .bi-check-circle-fill{
                font-size :30px;
            }
            .d-grid{
                width:480px;
            }
			#frm_write{
				width:600px;
				margin:auto;
			}
			label{
				width:130px;
				font-size:18px;
				margin:3px 0px;
			}
			.imporz{
				height:40px;
				width:383px;
				margin:3px 0px;
			}
			.imporx{
				height:40px;
				width:260px;
				margin:3px 0px;
			}
			.imporxy{
				height:40px;
				width:382px;
				margin:3px 0px 3px 137px;
			}
			.button{
				height:40px;
				width:118px;
				margin:3px 0px;
			}
			.phone{
				height:40px;
			}
			#checkpwd{
				margin-left: 137px;;
				font-size: 13px;
			}
			#formbtn{
				margin-top:40px;
			}
			.red{
				color:red;
			}
			#liner{
			
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
						<div class="text-center fs-3 mb-3 mt-3">
					 		패스워드 수정
					 	</div>
					 	<form name="frm" action="/team_Bling/MyPage/remodifypwd.do" method="post" id="frm_write">
					 		
		                    <div class="rows h" id="liner">
		                        <label for="password">비밀번호 변경<span class="red">*</span></label>
		                        <input type="password" class="impor imporz" name="pwd" id="password" placeholder="비밀번호를 입력하세요."">
		                        <span class="check"></span>
		                        <div  id="checkpwd">(영문 대소문자/숫자/특수문자 모두 조합,8~16자)</div>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="passwordre">비밀번호 확인<span class="red">*</span></label>
		                        <input type="password" class="impor imporz" name="passwordre" id="passwordre" placeholder="비밀번호를 다시 입력하세요."">
		                        <span class="check"></span>
		                    </div>
		                    
		                    <div class="rows h d-grid gap-2 col-6 mx-auto" id="formbtn">
		                    	<input type="submit" class="btn btn-primary " value="수정하기">
								<button type="button" class="btn btn-secondary" id="btn2" onclick="location.href='/team_Bling/MyPage/main.do?page=1'">취소하기</button>
		                    </div>
					 	
					 	</form>
					</div>
				</div>
			</div>
		</section>
		<br>
		<br>
		<br>
		<footer>
				<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>
		
	</body>
	
	<script>
			
	$(document).ready(function(){
		//회원가입시 생기는 유효성검사
		$(".impor").blur(function(){
			var checkPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			$(this).siblings(".check").text("").hide();
			var value = $(this).val();
			if(value==""){
				$(this).siblings(".check").text("*필수").css("color","red").show();
			}else{
				var id = $(this).attr("id");
				if(id == "password"){
					var test = checkPwd.test(value);
					if(!test){
						$(this).siblings(".check").text("*형식오류").css("color","red").show();
					}
				}else if(id == "passwordre"){
					if(value != $("input[id=password]").val()){
						$(this).siblings(".check").text("*비밀번호 불일치").css("color","red").show();
					}
				}
			}
		});
		
		
		//가입하기 버튼 누를시
		$("form").submit(function(){
			var checkPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var check=true; //유효성검사
			var first;
			//유효성검사
			$(".impor").each(function(index){
				var value = $(this).val();
				$(this).siblings(".check").text("").hide();
				if(value==""){
					$(this).siblings(".check").text("*필수").css("color","red").show();
					check = false;
					if(first===undefined){
						first = index;
					}
				}else{
					var id = $(this).attr("id");
					if(id == "password"){
						var test = checkPwd.test(value);
						if(!test){
							$(this).siblings(".check").text("*형식오류").css("color","red").show();
							check = false;
						}
					}else if(id == "passwordre"){
						if(value != $("input[id=password]").val()){
							$(this).siblings(".check").text("*비밀번호 불일치").css("color","red").show();
						}
					}
				}
				
			}); 
			//유효성검사
			if(check==false){
				alert('필수란을 형식에 맞게 작성해주세요');
			}
			
			 //$("#joincomplete").modal();
			//회원가입완료
			if(check==true){
				alert('패스워드가 수정되었습니다');
			}
			 return checkall;
			});
		}); 

	</script>
</html>