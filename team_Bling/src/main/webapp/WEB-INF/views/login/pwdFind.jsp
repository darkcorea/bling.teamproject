<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>

	function emailForm(){
		
		var str = "";
		
		str += "<label id='BtnSet'>";
		str += "	<input type='radio' name='find' value='email' checked onclick='emailForm()' id='RBtn'>이메일";
		str += "</label>";
		str += "<span id='phoneBtn'>";
		str += "	<label>";
		str += "		<input type='radio' name='find' value='phone' onclick='phoneForm()' id='RBtn'>휴대폰번호";
		str += "	</label>";
		str += "</span>";
		
		str += "<form name='frm'>";
		
		str += "	<div id='data'>";
		str += "		<span>아이디</span>";
		str += "		<span id='nameBox4'><input type='text' id='inputBox' name='id'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>이름</span>";
		str += "		<span id='nameBox1'><input type='text' id='inputBox' name='uname'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>이메일로 찾기</span>";
		str += "		<span id='nameBox2'><input type='text' id='inputBox' name='email'></span>";
		str += "	</div>";
		
		str += "</form>";
		
		str += "<div id='pwdFail'></div>";
		
		str += "<div id='btnDiv'>";
		str += "	<input class='btn btn-primary' type='submit' id='submitBtn' value='확인' onclick='pwdAjax()'>";
		str += "</div id='btnDiv'>";
		
		str += "<div id='searchDiv'>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/idFind.do' id='searchA'>아이디 찾기</a></span>";
		str += "	<span>｜</span>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/main.do' id='searchA'>로그인 하기</a></span>";
		str += "</div>";
		
		
		document.getElementById("formDiv").innerHTML = str;

	}
	
	function phoneForm(){
		
		var str = "";
		
		str += "<label id='BtnSet'>";
		str += "	<input type='radio' name='find' value='email' onclick='emailForm()' id='RBtn'>이메일";
		str += "</label>";
		str += "<span id='phoneBtn'>";
		str += "	<label>";
		str += "		<input type='radio' name='find' value='phone' checked onclick='phoneForm()' id='RBtn'>휴대폰번호";
		str += "	</label>";
		str += "</span>";
		
		str += "<form name='frm'>";
		
		str += "	<div id='data'>";
		str += "		<span>아이디</span>";
		str += "		<span id='nameBox4'><input type='text' id='inputBox' name='id'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>이름</span>";
		str += "		<span id='nameBox1'><input type='text' id='inputBox' name='uname'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>휴대폰 번호로 찾기</span>";
		str += "		<span id='nameBox3'><input type='text' id='inputBox' name='phone' placeholder='하이픈(-)은 빼고 입력하세요.'></span>";
		str += "	</div>";
		
		str += "</form>";
		
		str += "<div id='pwdFail'></div>";
		
		str += "<div id='btnDiv'>";
		str += "	<input class='btn btn-primary' type='submit' id='submitBtn' value='확인' onclick='pwdAjax()'>";
		str += "</div id='btnDiv'>";
		
		str += "<div id='searchDiv'>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/idFind.do' id='searchA'>아이디 찾기</a></span>";
		str += "	<span>｜</span>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/main.do' id='searchA'>로그인 하기</a></span>";
		str += "</div>";
		
		
		document.getElementById("formDiv").innerHTML = str;

	}

//아이디,이름,email/phone 일치시 바로 임시 비밀번호 발급 -> 비밀번호 변경하게 유도 -> 이메일 발송은 계정 정보를 입력해야함
	function pwdAjax(){
		var search = $("form[name=frm]").serialize();
		console.log(search);
		
		$.ajax({
			url : "{cPath}/Login/pwdSearch.do",
			type : "post",
			data : search,
			ContentType : "application/json",
			success : function(data){
				console.log(data);
				
				var str = ""; 
				str += "<div>회원님의 임시 비밀번호입니다.</div><br>";
				str += "<div id='resultDiv'>";
				str += "	임시 비밀번호 : <span id='tempPwd'>"+data+"</span>";
				str += "</div>";
				
				str += "<div id='searchDiv'>";
				str += "	<span id='searchSpan'><a href='/team_Bling/Login/main.do' id='searchA'>로그인 하기</a></span>";
				str += "</div>";
				
				document.getElementById("formDiv").innerHTML = str;
				
			},
			error : function(){
				//alert("비밀번호 찾기 에러");
				var str = ""; 
				str += "<div id='failText'>입력하신 정보와 일치하는 아이디가 존재하지 않습니다.</div><br>";
				
				document.getElementById("pwdFail").innerHTML = str;
			}
		});	
	}

</script>
	<style>
		#findTitle{
			text-align: center;
			font-size: 30px;
			margin: 0px 0px 20px 0px;
		}
		#BtnSet{
			margin: 0px 0px 20px 0px;
		}
		#RBtn{
			margin: 0px 5px;
		}
		#phoneBtn{
			margin: 0px 15px;
		}
		#searchSpan{
			margin: 0px 30px;
		}
		#searchA{
			text-decoration-line: none;
			color: #000000;	
		}
		#nameBox1{
			position: relative;
			left: 165px;
		}
		#nameBox2{
			position: relative;
			left: 95px;
		}
		#nameBox3{
			position: relative;
			left: 58px;
		}
		#nameBox4{
			position: relative;
			left: 149px;
		}
		#inputBox{
			width: 260px;
		}
		#data{
			height: 40px;
			display: flex;
    		align-items: center;
		}
		#searchDiv{
			position: relative;
			top: 70px;
			text-align: center;
			height: 200px;
		}
		#btnDiv{
			text-align: center;
		}
		#submitBtn{
			position: relative;
			top: 30px;
			text-align: center;
			background-color: #CB7878;
			border: none;
			width: 456px;
			height: 60px;
		}
		#submitBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			width: 456px;
			height: 60px;
		}
		#resultDiv{
			font-size: 30px;
		}
		#tempPwd{
			color: #CB7878;
		}
		#pwdFail{
			height: 10px;
		}
		#failText{
			color: red;
		}
	</style>
	
</head>
<body onload="emailForm()">
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-0 col-sm-0 col-md-0 col-lg-4 col-xl-4">
				
				</div>
				<div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
					<div id="BtnSet">
						<div id="findTitle">
							비밀번호 찾기
						</div>
						
					</div>
					<div id="formDiv">
						
							
					</div>
					
				</div>
				<div class="col-0 col-sm-0 col-md-0 col-lg-4 col-xl-4">
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