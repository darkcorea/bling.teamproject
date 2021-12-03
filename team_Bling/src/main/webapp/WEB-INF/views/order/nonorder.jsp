<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  위의 3가지는 먼저 와야 합니다. -->
<title>주문/결제하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/js/jquery-3.6.0.min.js"></script>
 <script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

<!-- 주소 검색 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
<style>
/* 전반적인 크기에 관한 설정 */
	section, header {
		max-width:1008px;
		margin:  0px auto;
	}
	section {
    display: block;
	}
	h2{
	text-align: center;
	}
	.t1{
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:100%;
	}
	.gray{
		width:25%;
		background-color:#CB7878;
		padding-left:30px;
	}
	.line{
		border-bottom:1px solid #C4C4C4;
	}
	.fill{
		padding-left:20px;
	}
	.t {
		height:30px;
		border-radius: 5px;
		margin-left:20px;
		background-color:#6c757d;
		color:#fff;
	}
	#zip_code{
		width:100px;
		margin-bottom:3px;
	}
	.addr{
		width:400px;
		margin-bottom:3px;
	}
	.email{
		width:300px;
	}
	#addInfo{
		font-size:8pt;
		color:gray;
	}
	.white{
		color:#ffffff;
	}
	td{
		padding:5px;
	}
	.btn:focus {
    border-color: #ffffff;
	}
	#text{
	font-size:8pt;
	color:gray;
	margin-bottom:0px;
	}
	#content{
		margin-bottom:5px;
		margin-top:5px;
	}
	#checkall{
		font-size:14pt;
	}
	.red{color:#cd2828;}
	#btndiv{
		text-align: center;
	}
	.btns{
		width: 250px;
	}
	#join{
		text-decoration-line: none;
		margin-left:30px;
		color:#cd2828;
	}
	#join:hover{
	color:#000000;
	}
	#view{
		margin-left:10px;
		text-decoration-line: none;
		color:gray;
	}
	
	#view:hover{
		color:#000000;
	}
	#header1{
				background-color:#CB7878;
			}
	#inline{
		display: inline;
		margin-right:20px;
	}
	#info{
		display: inline;
	}
	#complete{
		height:700px;
		font-size: 22px;
		font-weight: bold;
		text-align:center;
		}
</style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	<section>
	<h2>비회원 주문/결제</h2>
	<br><br>
	<div class="container">
	<h5>구매자 정보</h5>
		<form name="frm">
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill"><input type="text" name="name" class="impor" id="name"><span class="check"></span></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">이메일</span></td>
					<td class="fill"><input type="email" name="email" class="email impor" id="email"><span class="check"></span>
					<span id="addInfo">주문번호를 이메일로 보내드립니다</span>
					</td>
				</tr>
				<tr>
					<td class="gray"><span class="white">휴대폰 번호</span></td>
					<td class="fill"><input type="text" name="phone" class="impor" id="phone"><span class="check"></span>
					<span id="addInfo">숫자만 입력하세요</span>
					</td>
				</tr>
			</table>
		<br><br>
	<h5 id="inline">받는 사람 정보</h5>
		<div id="info">
			<label><input type="radio" name="info" value="same">구매자 정보와 동일</label>
			<label><input type="radio" name="info" value="new" checked>새로운 배송지</label>
		</div>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill"><input type="text" name="recipient" id="recipient"></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">배송 주소</span></td>
					<td class="fill">
						<input type="text" name="zip_code" placeholder="우편번호" id="zip_code" readonly>
						<input type="button" class="t" value="주소검색" onclick="findmyaddr()"><br>
                        <input type="text" name="addr1" placeholder="기본주소" readonly class="addr" id="address1"><br>
                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요." class="addr" id="address2">
					</td>
				</tr>
				<tr>
					<td class="gray"><span class="white">휴대폰 번호</span></td>
					<td class="fill"><input type="text" name="rphone" id="rphone"></td>
				</tr>
			</table>
		<br><br>
	<h5>결제 정보</h5>
			<input type="hidden" name="tot_price" id="tot_price">
			<input type="hidden" name="productname" id="productname" value="${productname}">
			<input type="hidden" name="orderid" id="orderid">
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">총상품가격</span></td>
					<td class="fill"><div class="productprice"></div></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">배송비</span></td>
					<td class="fill"><div class="shipping"></div></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">적립금</span></td>
					<td class="fill"><span id="addInfo">비회원은 적립금이 없습니다</span><a href="/Join/normal.do" id="join">회원가입 바로가기</a></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">총결제금액</span></td>
					<td class="fill"><div class="total"></div></td>
				</tr>
				<tr>
					<td class="gray"><span class="white">결제방법</span></td>
					<td class="fill">
						<div class="change">
						<label><input type="radio" name="payment" value="카드" id="card" checked>신용/체크카드</label>
						<label><input type="radio" name="payment" value="계좌이체" id="transfer">실시간계좌이체</label>
						<label><input type="radio" name="payment" value="무통장" id="cwhiteit">무통장입금</label>
						
						<div id="content">
							<p id="text">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다</p>
							<input type='hidden' name='depositor' value='카드'>
							<input type='hidden' name='order_yn' value='Y'>
						</div>
						
						</div>
					</td>
				</tr>
			</table>
		<br><br>
		</form>
		<br><br>
		<div class="agree">
			<p id="checkall" class="line"><input type="checkbox" name="all">모든 약관 동의</p>
			<p>
				<input type="checkbox" name="c1"><span class="red">[필수]</span>쇼핑몰 이용약관 동의
				<span id="addInfo">
					<a id="view" href="" data-bs-toggle="modal" data-bs-target="#Show_Modal1">내용보기</a>
				</span>
			</p>
			<p class="line">
				<input type="checkbox" name="c1"><span class="red">[필수]</span>비회원 구매시 개인정보 처리방침 동의
				<span id="addInfo">
					<a id="view" href="" data-bs-toggle="modal" data-bs-target="#Show_Modal1">내용보기</a>
				</span>
			<br><br>
			</p>
			<br><br>
		</div>
		<div id="btndiv">
		<button type="button" class="btn btn-secondary btns" onclick="iamport()">결제하기</button> 
		</div>
		<div id="form2"></div>
		<br><br>
	</div>


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
	</section>
	<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer> 
	<script>

	 let Json = JSON.parse('${jsonData}');
		console.log(Json);
		for(let i =0 ; i<Json.length ; i++){
		    var oidx = Json[i].oidx;
		    var quantity = Json[i].quntity;
		    console.log("oidx>>>>>>>>>"+oidx);
		    console.log("수량>>>>>>>>"+quantity);
		}

function iamport(){
	var agree = $('input:checkbox[name="c1"]').is(":checked");
	var payment = $("input[name='payment']:checked").val();
	var productname = $("#productname").val();
	var tot_price = $("#tot_price").val();
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var zipcode = $("#zip_code").val();
	var addr = $("#address1").val();
	IMP.init('imp72441252');
	if(agree == false){
		alert("동의체크");
		 return;
	}
	else{ if(payment=="카드"){
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : productname, //결제창에서 보여질 이름
		    amount : tot_price, //실제 결제되는 가격
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : phone,
		    buyer_addr : addr,
		    buyer_postcode : zipcode,
		}, function(rsp) {
			console.log(rsp);
				// 결제검증
				$.ajax({
					type:"post",
					url:"/Order/"+rsp.imp_uid
				}).done(function(data){
						console.log(data);
				// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
				    if (rsp.paid_amount == data.response.amount) {
				    	
				    	$("#orderid").val(Math.random().toString(36).substr(2,11));
						var formData = $("form[name=frm]").serialize();
						var orderid = $("#orderid").val();
						var msg = '결제가 완료되었습니다.';
						
						 $.ajax({
								url:"/Order/orderinsert.do",
								type:"POST",
								data:formData,
								ContentType:"application/json",
								success:function(data){
								var str = "";
								let Json = JSON.parse('${jsonData}');
								var formData2 = "";
								for(let i =0; i<Json.length; i++){
									str += "<form name='fm"+i+"'>";
								    var oidx = Json[i].oidx;
								    var quantity = Json[i].quntity;
								    console.log("oidx는 ????"+oidx);
								    str += "<input type='hidden' name='nonidx' value='"+data+"'>";
									str += "<input type='hidden' name='oidx' value='"+oidx+"'>";
									str += "<input type='hidden' name='quantity' value='"+quantity+"'>";
									
									str += "</form>";
									$("#form2").html(str);
									
									
									formData2 = $("form[name=fm"+i+"]").serialize();
									console.log(formData2);
									 $.ajax({
											url:"/Order/orderdetailinsert.do",
											type:"POST",
											data:formData2,
											async: false,
											ContentType:"application/json",
											success:function(data){
											},
											error:function(){
												alert("실행오류");
											}
										});
									 
									}
								 $("section").html("<div id='complete'>주문이 완료되었습니다 <br>주문번호 : <span style='color:red;'>"+orderid+"</span></div>");
								},
								error:function(){
									alert("실행오류");
								}
							});
				    } else {
				    	 var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + rsp.error_msg;
				    }
				});
			});
		}else if(payment=="계좌이체"){
			IMP.request_pay({
			    pg : 'kcp',
			    pay_method : 'trans',
			    merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 생성한 고유 주문번호
			    name : productname, //결제창에서 보여질 이름
			    amount : tot_price, //실제 결제되는 가격
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : phone,
			    buyer_addr : addr,
			    buyer_postcode : zipcode,
			}, function(rsp) {
			    if ( !rsp.success ) {
			    	//결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우
			        var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			        alert(msg);
			    }
			});
			
		}
		else if(payment=="무통장"){
			$("#orderid").val(Math.random().toString(36).substr(2,11));
			var formData = $("form[name=frm]").serialize();
			var orderid = $("#orderid").val();
			 $.ajax({
					url:"/Order/orderinsert.do",
					type:"POST",
					data:formData,
					ContentType:"application/json",
					success:function(data){
					alert("주문이 완료되었습니다");
					var str = "";
					
					let Json = JSON.parse('${jsonData}');
					var formData2 = "";
					for(let i =0 ; i<Json.length ; i++){
						str += "<form name='fm"+i+"'>";
					    var oidx = Json[i].oidx;
					    var quantity = Json[i].quntity;
					    console.log("oidx는 ????"+oidx);
					    str += "<input type='hidden' name='nonidx' value='"+data+"'>";
						str += "<input type='hidden' name='oidx' value='"+oidx+"'>";
						str += "<input type='hidden' name='quantity' value='"+quantity+"'>";
						str += "</form>";
						$("#form2").html(str);
						formData2 = $("form[name=fm"+i+"]").serialize();
						console.log(formData2);
						 $.ajax({
								url:"/Order/orderdetailinsert.do",
								type:"POST",
								data:formData2,
								async: false,
								ContentType:"application/json",
								success:function(data){
								},
								error:function(){
									alert("실행오류");
								}
							});
						 
						}
					$("section").html("<div id='complete'>주문이 완료되었습니다 <br>주문번호 : <span style='color:red;'>"+orderid+"</span></div>");
					},
					error:function(){
						alert("실행오류");
					}
				});
		}
	}
}

$(document).ready(function(){
	
	
	var price = ${tot_price};
	$(".productprice").text(price.toLocaleString());
	const shipping = 2500;
	var total = price+shipping;
	
	if(price<100000){
		$(".shipping").text(shipping.toLocaleString());
		$(".total").text(total.toLocaleString());
		$("#tot_price").val(total);
	}
	else{
		$(".total").text(price.toLocaleString());
		$("#tot_price").val(price);
	}
	
	
	$(".change input:radio").change(function(){
		var value = $(this).val();
		var name = $("#name").val();
		if(value=="무통장"){
			str="<p>입금은행 : 이젠은행 032123-04-003344 (주)블링</p>";
			str+="입금자명 : <input type='text' name='depositor'>";
			str+="<input type='hidden' name='order_yn' value='N'>";
			$("#content").html(str);
			$("input[name='depositor']").val(name);
		}
		else if(value=="카드"){
			str="<p id='text'>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다</p>";
			str+="<input type='hidden' name='depositor'>";
			str+="<input type='hidden' name='order_yn' value='Y'>";
			$("#content").html(str);
			$("input[name='depositor']").val("카드");
		}
		else if(value=="계좌이체"){
			$("#content").html("예금주명 : <input type='text' name='depositor'><input type='hidden' name='order_yn' value='Y'>");
			$("input[name='depositor']").val(name);
		}
	});
	
	$("#info input:radio").change(function(){
		var value = $(this).val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		if(value=="same"){
			$("#recipient").val(name);
			$("#rphone").val(phone);
			
		}
		else if(value=="new"){
			$("#recipient").val("");
			$("#rphone").val("");
		}
		
	});
	
	$(".agree input[name='all']").change(function(){
		if($(this).is(":checked")){
			$(".agree input[name='c1']").prop("checked",true);
		}else{
			$(".agree input[name='c1']").prop("checked",false);
		}
	});
	$(".impor").blur(function(){
		var checkName = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
		var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
		var checkPhone = /^[0-9]{10,11}/g;
		$(this).siblings(".check").text("").hide();
		var value = $(this).val();
		if(value==""){
			$(this).siblings(".check").text("*필수").css("color","red").show();
		}else{
			var id = $(this).attr("id");
			
			if(id == "name"){
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
				if(!test){
					$(this).siblings(".check").text("*형식오류").css("color","red").show();
				}
			}
		}
	});
	
});	

//주소 찾기 api
function findmyaddr(){
	new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip_code').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address1").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address1").value = jibunAddr;
            }
        }
    }).open();
}
</script>
</body>
</html>