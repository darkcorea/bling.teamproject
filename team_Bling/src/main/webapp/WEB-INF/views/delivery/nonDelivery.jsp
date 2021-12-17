<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비회원 주문 조회</title>

<!-- SweetAlert2(alert,modal창) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
<style>
	/* 크기 */
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	
	/* 텍스트 크기 */
	.text1{
		width:100%;
		height:40px;
		border-right:0px;
		border-top:0px;
		border-left:0px;
	}
	
	/* 버튼 크기 */
	.btn_1{
		width:100%;
		height:45px;
	}
	
	/* 큰 글자 크기 */
	.title{
		font-size:20px;
		font-weight:bold;
	}
	
	.red {
		color:red;
		display:none;
	}
	
	.red1 {
		color:red;
		font-weight:bold;
		display:none;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div style="width:490px;height:330px;margin:50px auto">
		<div>
		<span class="title">주문자 이름</span>&nbsp;&nbsp;<span class="red" id="red1">*입력해주세요</span><br>
		<input type="text" name="name" class="text1" id="name"><br><br>
		<span class="title">주문번호</span>&nbsp;&nbsp;<span class="red"  id="red2">*입력해주세요</span><br>
		<input type="text" name="orderid"  class="text1" id="orderid"><br>
		</div>
		<div style="height:50px;margin-top:7px;"><span class="red1" id="not_id"></span></div>
		<div>
		<button  class="btn_1 btn btn-outline-secondary" onclick="find()">조회하기</button><br><br><br>
		<b>비 회원인 경우, 주문번호로만 주문조회가 가능합니다.</b>
		</div>
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
	
</body>
<script>

	//  이름과 주문번호로 주문내역이 있는지 확인
	function find(){
		let name = $("#name").val().trim();
		let orderid = $("#orderid").val().trim();
		
		if(name == ""){
			$("#red1").show();
			$("#not_id").hide();
			$("#name").focus();
		}else if (orderid == ""){
			$("#red2").show();
			$("#not_id").hide();
			$("#orderid").focus();
		}else{
			
			$.ajax({
				url:"/team_Bling/Delivery/nonDel_check.do",
				type:"POST",
				data:{"name":name,"orderid":orderid},
				async: false,
				success:function(data){
					if(data == ""){
						$("#not_id").text("주문내역이 없습니다.");
						$("#not_id").show();
						$("#red1").hide();
						$("#red2").hide();
						$("#not_id").focus();
					}else{
						let frm = document.createElement("form");
						
						frm.name = "frm";
						frm.method = "post";
						frm. action = "/team_Bling/Delivery/non_main.do";
						
					    let input = document.createElement("input");
					    input.setAttribute("type","hidden");
					    input.setAttribute("name","orderid");
					    input.setAttribute("value",data);
						
					    frm.appendChild(input);
						document.body.appendChild(frm);
						frm.submit();
					}
				},
				error:function(){
					alert("비회원주문 조회 실패");
				}
			});
		}
	}
	
</script>
</html>