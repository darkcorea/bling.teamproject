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
		str += "		<span>이름</span>";
		str += "		<span id='nameBox1'><input type='text' id='inputBox' name='uname'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>이메일로 찾기</span>";
		str += "		<span id='nameBox2'><input type='text' id='inputBox' name='email'></span>";
		str += "	</div>";
		
		str += "</form>";
		
		str += "<div id='idFail'></div>";
		
		str += "<div id='btnDiv'>";
		str += "	<input class='btn btn-primary' type='submit' id='submitBtn' value='확인' onclick='idAjax()'>";
		str += "</div id='btnDiv'>";
		
		str += "<div id='searchDiv'>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/pwdFind.do' id='searchA'>비밀번호 찾기</a></span>";
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
		str += "		<span>이름</span>";
		str += "		<span id='nameBox1'><input type='text' id='inputBox' name='uname'></span>";
		str += "	</div>";
		
		str += "	<div id='data'>";
		str += "		<span>휴대폰 번호로 찾기</span>";
		str += "		<span id='nameBox3'><input type='text' id='inputBox' name='phone' ";
		str += "		placeholder='하이픈(-)은 빼고 입력하세요.'></span>";
		str += "	</div>";
		
		str += "</form>";
		
		str += "<div id='idFail'></div>";
		
		str += "<div id='btnDiv'>";
		str += "	<input class='btn btn-primary' type='submit' id='submitBtn' value='확인' onclick='idAjax()'>";
		str += "</div id='btnDiv'>";
		
		str += "<div id='searchDiv'>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/pwdFind.do' id='searchA'>비밀번호 찾기</a></span>";
		str += "	<span>｜</span>";
		str += "	<span id='searchSpan'><a href='/team_Bling/Login/main.do' id='searchA'>로그인 하기</a></span>";
		str += "</div>";
		
		
		document.getElementById("formDiv").innerHTML = str;

	}

function idAjax(){
	var search = $("form[name=frm]").serialize();
	console.log(search);
	
	$.ajax({
		url: "{cPath}/Login/idSearch.do",
		type: "POST",
		data: search,
		ContentType: "application/json; charset=utf-8",	//contentType : 보내는 데이터의 타입
		//dataType:"json; charset=utf-8",	//dataType : 서버에서 어떤 타입을 받을 것인지를 의미
		success:function(data){
			console.log(data);
			
			if(data == "") {
				var str = ""; 
				str += "<div id='failText'>입력하신 정보와 일치하는 아이디가 존재하지 않습니다.</div><br>";
				
				document.getElementById("idFail").innerHTML = str;
			}else{
				var str = ""; 
				str += "<div>회원님의 정보와 일치하는 아이디입니다.</div><br>";
				str += "<div id='resultDiv'>";
				str += "	아이디 : <span id='findId'>"+data+"</span>";
				str += "</div>";
				
				str += "<div id='searchDiv'>";
				str += "	<span id='searchSpan'><a href='/team_Bling/Login/pwdFind.do' id='searchA'>비밀번호 찾기</a></span>";
				str += "	<span>｜</span>";
				str += "	<span id='searchSpan'><a href='/team_Bling/Login/main.do' id='searchA'>로그인 하기</a></span>";
				str += "</div>";
				
				document.getElementById("formDiv").innerHTML = str;
			}
		},
		error:function(){
			alert("아이디 찾기 에러");
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
			top: 110px;
			text-align: center;
			height: 200px;
		}
		#btnDiv{
			text-align: center;
		}
		#submitBtn{
			position: relative;
			top: 70px;
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
		#findId{
			color: #CB7878;
		}
		#idFail{
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
							아이디 찾기
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