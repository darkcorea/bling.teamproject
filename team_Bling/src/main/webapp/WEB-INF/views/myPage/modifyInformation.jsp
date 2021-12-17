<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 정보 수정</title>
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
		<script>
		$(document).ready(function(){
			//회원가입시 생기는 유효성검사
			$(".impor").blur(function(){
				var checkPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
				var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
				var checkPhone = /^[0-9]{10,11}/g;
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
					}else if(id == "name"){
						var test = checkName.test(value);
						if(!test){
							$(this).siblings(".check").text("*형식오류").css("color","red").show();
						}
					}else if(id == "email"){
						var test = checkEmail.test(value);
						if(!test){
							$(this).siblings(".check").text("*형식오류").css("color","red").show();
						}
					}else if(id == "phone"){
						var test = checkPhone.test(value);
						console.log(test+"1");
						if(!test){
							$(this).siblings(".check").text("*형식오류").css("color","red").show();
						}
					}
				}
			});
			
			
			//가입하기 버튼 누를시
			$("form").submit(function(){
				var checkPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
				var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
				var checkPhone = /^[0-9]{10,11}/g;
				var check=true; //유효성검사
				var check3=true; //중복검사
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
						}else if(id == "name"){
							var test = checkName.test(value);
							if(!test){
								$(this).siblings(".check").text("*형식오류").css("color","red").show();
								check = false;
							}
						}else if(id == "email"){
							var test = checkEmail.test(value);
							if(!test){
								$(this).siblings(".check").text("*형식오류").css("color","red").show();
								check = false;
							}
						}else if(id == "phone"){
							var test = checkPhone.test(value);
							if(!test){
								$(this).siblings(".check").text("*형식오류").css("color","red").show();
								check = false;
							}
						}
					}
					
				}); 
				//유효성검사
				if(check==false){
					alert('필수란을 형식에 맞게 작성해주세요');
				}
				
				//아이디, 이메일 중복확인
				for(var b=1;b<3;b++){
					var yess = $("#"+"repeat"+b).val();
					if(yess=='N'){
						check3 = false;
						alert('이메일 중복확인을 해주세요');
					}
				}
				
				//필수동의란 && 유효성검사 && 중복확인
				var checkall;
				checkall = check&&check3;
				console.log(checkall);
				
				 //$("#joincomplete").modal();
				//회원가입완료
				if(checkall==true){
					alert('개인정보가 수정되었습니다');
				}
				 return checkall;
				});
		}); 
		</script>
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
					 		나의 정보 수정
					 	</div>
					 	<form name="frm" action="/team_Bling/MyPage/remodify.do" method="post" id="frm_write">
					 		
					 		<c:set var="ban" value="${data }"/>
					 		<div class="rows h" id="liner">
		                        <label for="id">아이디</label>
		                       	${ban.id }
		                    </div>
		                   <input type="hidden" value="${ban.midx }" name="midx"/>
		                    <div class="rows h" id="liner">
		                        <label for="password">비밀번호 변경<span class="red">*</span></label>
		                        <input type="password" class="impor imporz" name="pwd" id="password" placeholder="비밀번호를 입력하세요." value="${data.pwd }">
		                        <span class="check"></span>
		                        <div  id="checkpwd">(영문 대소문자/숫자/특수문자 모두 조합,8~16자)</div>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="passwordre">비밀번호 확인<span class="red">*</span></label>
		                        <input type="password" class="impor imporz" name="passwordre" id="passwordre" placeholder="비밀번호를 다시 입력하세요." value="${data.pwd }">
		                        <span class="check"></span>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="name">이름<span class="red">*</span></label>
		                        <input type="text" class="impor imporz" name="uname" id="name" value="${data.uname }">
		                        <span class="check"></span>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="email">이메일<span class="red">*</span></label>
		                        <input type="email" class="imporx impor" name="email" id="email" value="${ban.email }">
		                        <input type="hidden" value="${ban.email }" id="reemail">
		                        <input type="button" class="button email" value="중복확인" onclick="confirm()">
		                        <input type="hidden" value="N" id="repeat2">
		                        <span class="check"></span>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="phone1">연락처<span class="red">*</span></label>
		                        <input type="number" class="imporx impor" name="phone" value="${data.phone }" maxlength="11" id="phone" style="width:382px">
		                        <input type="button" class="phone" value="인증번호 받기" style="display:none;">
		                        <span class="check"></span>
		                    </div>
		                    
		                    <div class="rows h" id="liner">
		                        <label for="address">주소<span class="red">*</span></label>
		                        <input type="text" class="imporx impor" name="zip_code" id="address1" value="${data.zip_code }">
								<input type="button" class="button id" value="주소검색" onclick="findmyaddr()">
								<span class="check"></span><br>
		                        <input type="text" class="imporxy impor" name="addr1" id="address2" value="${data.addr1 }"><br>
		                        <input type="text" class="imporxy impor" name="addr2" id="address3" value="${data.addr2 }">
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
			
			function confirm(){
				var emaildata = document.getElementById('email').value;
				var reemail = document.getElementById('reemail').value;
				console.log(">>>>>>>>>>>>>>>>>>>>>>>iddata2222>"+reemail);
				console.log(">>>>>>>>>>>>>>>>>>>>>>>iddata2222>"+emaildata);
				if(emaildata == null){
					alert("이메일을 입력해주세요.");
				}else{
					$.ajax({
						url:"${cPath}/MyPage/confirmemail.do",
						type:"POST",
						data:{"emaildata":emaildata},
						ContentType:"application/json",
						success:function(data){
							console.log(data);
							if(data == "no"){
								if(emaildata != reemail){
									document.getElementById("email").value ='';
									alert("존재하는 이메일입니다.");
								}else {
									$("#repeat2").val('Y');
									alert("현재 고객님이 사용중인 이메일입니다.");
								}
							}else if(data == "yes"){
								$("#repeat2").val('Y');
								alert("사용할 수 있는 이메일입니다.");
							}
						},error:function(){
							alert("중복확인 에러!")
						}
					});
				}
			}
			
			//주소 찾기 api
			function findmyaddr(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	
			        	console.log(data);
			        	
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var roadAddr = data.roadAddress; // 도로명 주소 변수
			            var jibunAddr = data.jibunAddress; // 지번 주소 변수
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('address1').value = data.zonecode;
			            if(roadAddr !== ''){
			                document.getElementById("address2").value = roadAddr;
			            } 
			            else if(jibunAddr !== ''){
			                document.getElementById("address2").value = jibunAddr;
			            }
			        }
			    }).open();
			}
				
		</script>
</html>