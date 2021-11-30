<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일반회원가입</title>
		<!-- Bootstrap icon CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <!-- Bootstrap CSS -->
  		<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	  	<!-- Bootstrap core JavaScript -->
  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
  		<script src="/resources/js/bootstrap.bundle.min.js"></script>
  		
  		<!-- 주소 검색 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
  		<script>
			$(document).ready(function(){
				//회원가입시 생기는 유효성검사
				$(".impor").blur(function(){
					var checkId = /^[a-z]{1}\w{5,15}$/g;
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
						if(id == "id"){ 
							var test = checkId.test(value);
							if(!test){
								$(this).siblings(".check").text("*형식오류").css("color","red").show();
							}
						}else if(id == "password"){
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
					var checkId = /^[a-z]{1}\w{5,15}$/g;
					var checkPwd = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
					var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
					var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
					var checkPhone = /^[0-9]{10,11}/g;
					var check=true; //유효성검사
					var check2=true; //필수동의란
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
							if(id == "id"){
								var test = checkId.test(value);
								if(!test){
									$(this).siblings(".check").text("*형식오류").css("color","red").show();
								}
							}else if(id == "password"){
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
					
					//필수동의
					for(var a=2;a<5;a++){
						var yes = $("#"+"yes"+a).val();
						if(yes=='N'){
							check2 = false;
							alert(a-1+')번의 필수 약관에 동의해주세요');
						}
					}
					
					//유효성검사
					if(check==false){
						alert('필수란을 형식에 맞게 작성해주세요');
					}
					
					//아이디, 이메일 중복확인
					for(var b=1;b<3;b++){
						var yess = $("#"+"repeat"+b).val();
						if(yess=='N'){
							check3 = false;
							alert('아이디, 이메일 중복확인을 해주세요');
						}
					}
					
					//필수동의란 && 유효성검사 && 중복확인
					var checkall;
					check1 = check&&check2;
					checkall = check1&&check3;
					console.log(checkall);
					
					 //$("#joincomplete").modal();
					//회원가입완료
					if(checkall==true){
						alert('회원가입되었습니다');
					}
					 return checkall;
 				});
			}); 
			
			
				
		</script>
  		<style>
  			$container-max-widths: (xl: 1008px, xxl: 1008px);
	  		
/* 회원가입 스타일 */
			
			 section{
				width:900px;
				height:1000px;
				background:white;
				margin:10vh auto;
				border-radius:5px;
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
			#checkid{
				font-size: 11px;
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
/* 모달 스타일 */
			#header1{
				background-color:#CB7878;
			}
		</style>
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
</header>
	<div class="container full">
		
<!-- 회원가입 -->
		
		<div class="container product">
			 <section>
			 	<div class="text-center fs-1 mb-3 mt-3">
			 		회원가입
			 	</div>
				<form name="frm" action="/Join/value.do" method="post" id="frm_write">
				
<!-- 동의란 -->
					<div class="d-grid gap-2 col-6 mx-auto "  onclick="check(1)" style="cursor:pointer;">
						<button class="btn btn-outline-primary mb-3 fs-5" type="button">전체동의 
							<i class="bi bi-check-circle" id="check1"></i>
						</button>
					</div>
					<div class="row agree border-bottom"  >
						<div class="col-8  text-start " > <span class=" fs-5">1) 이용약관 동의</span><span class="text-black-50">(필수)</span></div>
 						<div class="col-4  text-end">
<!-- 버튼1 모달 -->
 							<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#Show_Modal1">내용보기 </button>
							<i class="bi bi-check-circle" id="check2" onclick="check(2)" style="cursor:pointer;"></i>    
							<input type="hidden" value="N" id="yes2">
						</div>
					</div>
					<div class="row agree border-bottom mt-3" >
						<div class="col-8  text-start "><span class=" fs-5">2) 개인정보 수집 및 이용 동의 </span><span class="text-black-50">(필수)</span></div>
						<div class="col-4  text-end"> 
<!-- 버튼2 모달 -->
 							<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#Show_Modal2">내용보기 </button>
							<i class="bi bi-check-circle" id="check3" OnClick="check(3)" style="cursor:pointer;"></i>
							<input type="hidden" value="N" id="yes3">
						</div>
					</div>
					<div class="row agree mt-3" >
						<div class="col-9 text-start"><span class=" fs-5">3) 만 14세 이상 회원가입하기 </span><span class="text-black-50">(필수)</span>
							<br><font size="2" class="text-start text-black-50 ">(만 14세 미만은 회원가입 및 서비스 이용이 불가합니다.)</font>
						</div>
						<div class="col  text-end ">
							<i class="bi bi-check-circle" id="check4" OnClick="check(4)" style="cursor:pointer;"></i>
							<input type="hidden" value="N" id="yes4">
						</div>
					</div>
					<div class="row agree border-bottom border-top  mt-3">
						<div class="col-8  text-start"><span class=" fs-5">쇼핑정보 수신 동의 </span><span class="text-black-50">(선택)</span></div>
						<div class="col-4  text-end">
<!-- 버튼3 모달 -->
 							<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#Show_Modal3">내용보기 </button>
							<i class="bi bi-check-circle" id="check5" OnClick="check(5)" style="cursor:pointer;"></i>
							<input type="hidden" name="agree_shopping" value="N"  id="yes5">
						</div>
					</div>
					<div class="row agree border-bottom mt-3 mb-3">
						<div class="col text-start ">
							<span class=" fs-5">SMS 수신 동의</span>
							<span class="text-black-50">(선택)</span>
							<i class="bi bi-check-circle" id="check6" OnClick="check(6)" style="cursor:pointer;"></i>
							<input type="hidden" name="agree_sms" value="N"  id="yes6">
						</div>
						<div class="col text-end" >
							<span class=" fs-5">이메일 수신 동의 </span>
							<span class="text-black-50">(선택)</span>
							<i class="bi bi-check-circle" id="check7" OnClick="check(7)" style="cursor:pointer;"></i>
							<input type="hidden" name="agree_email" value="N"  id="yes7">
						</div>
					</div>
					
				
			<br><br><br>
 <!-- 회원가입시 적는 란들 -->               
                    <div class="rows h" id="liner">
                        <label for="id">아이디<span class="red">*</span></label>
                        <input type="text" class="id imporx impor" name="id" id="id" placeholder="아이디를 입력하세요.">
                        <input type="button" class="button id" value="중복확인" onclick="confirm(1)">
                        <input type="hidden" value="N" id="repeat1">
                        <span class="check"></span>
                        <div  id="checkid">(공백/특수문자가 포함되었거나, 숫자로 시작 또는 숫자로만 이루어진 아이디는 사용할 수 없습니다.)</div>
                        <div  id="checkid">(6자 이상 16자이내, 언더바(_)포함됩니다.)</div>
                    </div>
                   
                    <div class="rows h" id="liner">
                        <label for="password">비밀번호<span class="red">*</span></label>
                        <input type="password" class="impor imporz" name="pwd" id="password" placeholder="비밀번호를 입력하세요.">
                        <span class="check"></span>
                        <div  id="checkpwd">(영문 대소문자/숫자/특수문자 모두 조합,8~16자)</div>
                    </div>
                    
                    <div class="rows h" id="liner">
                        <label for="passwordre">비밀번호 확인<span class="red">*</span></label>
                        <input type="password" class="impor imporz" name="passwordre" id="passwordre" placeholder="비밀번호를 다시 입력하세요.">
                        <span class="check"></span>
                    </div>
                    
                    <div class="rows h" id="liner">
                        <label for="name">이름<span class="red">*</span></label>
                        <input type="text" class="impor imporz" name="uname" id="name" placeholder="이름을 입력하세요.">
                        <span class="check"></span>
                    </div>
                    
                    <div class="rows h" id="liner">
                        <label for="email">이메일<span class="red">*</span></label>
                        <input type="email" class="imporx impor" name="email" id="email" placeholder="이메일을 입력하세요">
                        <input type="button" class="button email" value="중복확인" onclick="confirm(2)">
                        <input type="hidden" value="N" id="repeat2">
                        <span class="check"></span>
                    </div>
                    
                    <div class="rows h" id="liner">
                        <label for="phone1">연락처<span class="red">*</span></label>
                        <input type="number" class="imporx impor" name="phone" placeholder="연락처를 입력하세요" maxlength="11" id="phone">
                        <input type="button" class="phone" value="인증번호 받기">
                        <span class="check"></span>
                    </div>
                    
                    <div class="rows h" id="liner">
                        <label for="address">주소<span class="red">*</span></label>
                        <input type="text" class="imporx impor" name="zip_code" id="address1" >
						<input type="button" class="button id" value="주소검색" onclick="findmyaddr()">
						<span class="check"></span><br>
                        <input type="text" class="imporxy impor" name="addr1" id="address2" ><br>
                        <input type="text" class="imporxy impor" name="addr2" id="address3" >
                    </div>

                    <div class="rows h d-grid gap-2 col-6 mx-auto" id="formbtn">
                    	<input type="submit" class="btn btn-primary " value="가입하기">
						<button type="button" class="btn btn-secondary" id="btn2">취소하기</button>
                    </div>
                    <br>
                    <br>
                    <br>
                    
                   
<!-- Modal -->

  <!-- 이용약관동의 내용보기  -->
						<div class="modal fade" id="Show_Modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header text-center" id="header1">
						        <h3 class="modal-title w-100 text-light" id="exampleModalLabel" >약관 동의</h3>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <%@ include file="/WEB-INF/views/join/agree1.jsp" %>
						      </div>
						      <div class="modal-footer mx-auto ">
						        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal" id="header1">확인</button>
						      </div>
						    </div>
						  </div>
						</div>
						
  <!-- 개인정보 수집 및 이용 동의 -->
  					
  					<div class="modal fade" id="Show_Modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header text-center" id="header1">
						        <h3 class="modal-title w-100 text-light" id="exampleModalLabel" >개인정보 수집 및 이용 동의</h3>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <%@ include file="/WEB-INF/views/join/agree1.jsp" %>
						      </div>
						      <div class="modal-footer mx-auto ">
						        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal" id="header1">확인</button>
						      </div>
						    </div>
						  </div>
					</div>
  <!-- 쇼핑정보 수신 동의 -->
 						<div class="modal fade" id="Show_Modal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header text-center" id="header1">
						        <h3 class="modal-title w-100 text-light" id="exampleModalLabel" >쇼핑정보 수신 동의</h3>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <%@ include file="/WEB-INF/views/join/agree1.jsp" %>
						      </div>
						      <div class="modal-footer mx-auto ">
						        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal" id="header1">확인</button>
						      </div>
						    </div>
						  </div>
						</div> 
  <!-- 회원가입완료 -->						
						<!-- <div class="modal fade" id="joincomplete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header text-center" id="header1">
						        <h3 class="modal-title w-100 text-light" id="exampleModalLabel" >회원 가입 완료</h3>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        	가입이 정상적으로 완료되었습니다.
						      </div>
						      <div class="modal-footer mx-auto ">
						        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal" id="header1">홈으로</button>
						        <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal" id="header1">확인</button>
						      </div>
						    </div>
						  </div>
						</div>  -->
                </form>
             </section>
		</div>
	</div>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer> 

	<script>
		//전체동의, 동의시 hidden 값과 체크아이콘 변화 -> 이것으로 필수동의 안하면 회원가입안되게함.
		function check(num){
			if(num==1){
				for(var a=1;a<8;a++){
					if($("#check"+a).hasClass('bi bi-check-circle')==true){
						$("#"+"check"+a).attr('class','bi bi-check-circle-fill');
						if(a!=1){
							$("#"+"yes"+a).val('Y');
							console.log(a+$('#'+"yes"+a).val());
						}
					}
				}
			}else{
				if($("#check"+num).hasClass('bi bi-check-circle-fill')==true){
					$("#"+"check"+num).attr('class','bi bi-check-circle');
					$("#"+"yes"+num).val('N');
					console.log(num+$('#'+"yes"+num).val());
				}else{
					$("#"+"check"+num).attr('class','bi bi-check-circle-fill');
					$("#"+"yes"+num).val('Y');
					console.log(num+$('#'+"yes"+num).val());
				}
			}
			
		}
		
		//아이디, 이메일 중복확인 -> 이것으로 확인 안하면 회원가입안되게함.
		
		function confirm(what){
			console.log(what);
			if(what==1){
				var iddata = $('#id').val();
				console.log(iddata);
				 $.ajax({
					url:"/Join/confirmid.do",
					type:"POST",
					data:{"iddata":iddata},
					ContentType:"application/json",
					success:function(data){
						console.log(data);
						if(data == "no"){
							document.getElementById("id").value ='';
							alert("존재하는 아이디입니다.");
						}else if(data == "yes"){
							$("#repeat1").val('Y');
							console.log(document.getElementById("repeat1").value);
							alert("사용할 수 있는 아이디입니다.");
						}
					},error:function(){
						alert("중복확인 에러!")
					}
				}); 
			}else if(what==2){
				var emaildata = $('#email').val();
				$.ajax({
					url:"/Join/confirmemail.do",
					type:"POST",
					data:{"emaildata":emaildata},
					ContentType:"application/json",
					success:function(data){
						if(data == "no"){
							document.getElementById("email").value ='';
							alert("존재하는 이메일입니다.");
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

</body>
</html>