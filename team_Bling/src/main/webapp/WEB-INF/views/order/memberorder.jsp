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
	.line1{
		border-bottom:1px solid #C4C4C4;
		width:150px;
		text-align: center;
	}
	.fill{
		padding-left:20px;
	}
	.t {
		height:30px;
		width:100px;
		border-radius: 5px;
		margin-left:20px;
		background-color: #6c757d;
		border-color: #6c757d;
		border: 1px solid transparent;
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
	.addInfo{
		font-size:9pt;
		color:#cd2828;
		text-decoration-line: none;
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
	.point{
		margin-right:45px;
	}
	#view:hover{
		color:#000000;
	}
	#header1{
		background-color:#CB7878;
		text-align: center;
			}
	#inline{
		width: 15%;
		float: left;
		margin-right:20px;
	}
	.infos{
		float: left;
		 width: 30%;
	}
	#complete{
		height:700px;
		font-size: 22px;
		font-weight: bold;
		text-align:center;
		}
	#addrlist{
		float: left;
		text-align: right;
		 width: 50%;
	}
	#addrbtn{
		height:30px;
		width:80px;
		border-radius: 5px;
		background-color: #6c757d;
		border-color: #6c757d;
		border: 1px solid transparent;
		color:#fff;
	}
	.total,#s1{
		margin-right:20px;
	}
	#mypage{
		text-decoration-line: none;
	}
	#mypage:hover{
		color:#000000;
	}
	.total{
		font-weight: bold ;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	<section>
	<h2>주문/결제</h2>
	<br><br>
	<div class="container">
	<h5>구매자 정보</h5>
		<form name="frm">
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill name">${sessionScope.UserVO.uname}</td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">이메일</span></td>
					<td class="fill email"></td>
				</tr>
				<tr>
					<td class="gray"><span class="white">휴대폰 번호</span></td>
					<td class="fill phone"></td>
				</tr>
			</table>
			<input type="hidden" name="midx" value="${sessionScope.UserVO.midx}" id="midx">
		<br><br>
	<h5 id="inline">받는 사람 정보</h5>
		<div class="infos">
			<label><input type="radio" name="info" value="same">구매자 정보와 동일</label>
			<label><input type="radio" name="info" value="new" checked>새로운 배송지</label>
		</div>
		<div id="addrlist">
		<input type="button" value="주소록" onclick="addrlist()" id="addrbtn"></div>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill"><input type="text" name="recipient" id="recipient"></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">배송 주소</span></td>
					<td class="fill">
						<input type="text" name="zip_code" placeholder="우편번호" id="zip_code" >
						<input type="button" class="t" value="주소검색" onclick="findmyaddr()"><br>
                        <input type="text" name="addr1" placeholder="기본주소"  class="addr" id="address1"><br>
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
			<input type="hidden" name="tot_price1" id="tot_price1">
			<input type="hidden" name="productname" id="productname" value="${productname}">
			<input type="hidden" name="mileage" id="mileage">
			<input type="hidden" name="addmileage" id="addmile">
			<input type="hidden" name="mileage1" id="mileage1">
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
					<td class="fill"><span class="point"></span><a href="" class="addInfo" data-bs-toggle="modal" data-bs-target="#exampleModal">등급별 적립금 혜택 보기</a></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">총결제금액</span></td>
					<td class="fill">
						<span class="total"></span>
						<span id="s1"><input type="text" name="payed_mileage" id="payed_mileage" placeholder="사용할 적립금 입력" class="mile"></span>
						<span><input type="checkbox" id="checkBoxId">적립금 전액 사용</span>
						<span class="addInfo" id="point1"></span>
					</td>
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
			<div id="delivery"></div>
		<br><br>
		</form>
		<br><br>
		<div class="agree">
			<p id="checkall" class="line"><input type="checkbox" name="all">모든 약관 동의</p>
			<p>
				<input type="checkbox" name="c1"><span class="red">[필수]</span>쇼핑몰 이용약관 동의
				<span class="addInfo">
					<a id="view" href="" data-bs-toggle="modal" data-bs-target="#Show_Modal1">내용보기</a>
				</span>
			</p>
			<p class="line">
				<input type="checkbox" name="c1"><span class="red">[필수]</span>개인정보 처리방침 동의
				<span class="addInfo">
					<a id="view" href="" data-bs-toggle="modal" data-bs-target="#Show_Modal1">내용보기</a>
				</span>
			<br><br>
			</p>
			<br><br>
		</div>
		<div id="btndiv">
		<input type="button" class="btn btn-secondary btns" value="결제하기" onclick="iamport(); mileage();">
		</div>
		<div id="form2"></div>
		<br><br>
	</div>
</section>
<!--benefits Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header"  id="header1">
        <h5 class="modal-title w-100 text-light" id="exampleModalLabel">등급별 적립금 혜택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    	<p>골   드 : 결제금액의 2% 적립</p>
    	<p>실   버 : 결제금액의 1% 적립</p>
    	<p>브론즈 : 적립 없음</p>
      </div>
      <div class="modal-footer mx-auto">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="header1">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 주소록 모달창 -->
<div class="modal fade" id="addr_select" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header"  id="header1">
        <h5 class="modal-title">배송 주소 선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	
      	<div  id="addr_select1">
      
      	</div>
      </div>
      <div class="modal-footer" id="addr_select2">
        <button type="button" class="btn btn-secondary"  id="header1" data-bs-dismiss="modal" onclick="modal_select()">확인</button>&ensp;&ensp;
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modal_button2">닫기</button>
      </div>
    </div>
  </div>
</div>
	<!--약관 Modal -->
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

	
	<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer> 
	
	<script>

	 let Json = JSON.parse('${jsonData}');
		console.log(Json);
		for(let i =0 ; i<Json.length ; i++){
		    var oidx = Json[i].oidx;
		    var quantity = Json[i].quntity;
		    var stock = Json[i].stock;
		    console.log("oidx>>>>>>>>>"+oidx);
		    console.log("수량>>>>>>>>"+quantity);
		    console.log("재고>>>>>>>>"+stock);
		}
	
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
		
	function addrlist(){
		let midx= "${sessionScope.UserVO.midx}";
		console.log(midx);
		$.ajax({
			url:"/Order/addr_select.do",
			data:{"midx":midx},
			dataType:"json",
			type:"get",
			success:function(data){
				//alert(data);
				if(data.length == 0) {
					alert("등록한 주소가 없습니다");	
				}else{
					let str = "";
					str += "<h3>주소록</h3><br><br>";
					str += "<table class='t1'>";
					str += "	<tr class='line1'>";
					str += "	<th>배송지이름</th>";
					str += "	<th>우편번호</th>";
					str += "	<th>주소</th>";
					str += "	<th>상세주소</th>";
					str += "	<th>받는 사람</th>";
					str += "	<th>휴대폰 번호</th>";
					str += "	</tr>";
					for (let i =0; i<data.length; i++){
						str += "	<tr class='line1'>";
						str += "	<td><input type='radio' name='addr'>"+data[i].addr_name+"</td>";
						str += "	<td>"+data[i].zip_code+"</td>";
						str += "	<td>"+data[i].addr1+"</td>";
						str += "	<td>"+data[i].addr2+"</td>";
						str += "	<td>"+data[i].name+"</td>";
						str += "	<td>"+data[i].rphone+"</td>";
						str += "	</tr>";
						}
					str += "</table>";
					
					$("#addr_select1").html(str);
					$("#addr_select").modal("show");
					}
								
			},
			error:function(){
				alert("에러입니다");
			}
		});
		
	}

function modal_select(){
	var zip_code = $("input[name='addr']:checked").parent().siblings(':eq(0)').text();
	var addr1 = $("input[name='addr']:checked").parent().siblings(':eq(1)').text();
	var addr2 = $("input[name='addr']:checked").parent().siblings(':eq(2)').text();
	var recipient = $("input[name='addr']:checked").parent().siblings(':eq(3)').text();
	var rphone = $("input[name='addr']:checked").parent().siblings(':eq(4)').text();
	$("#recipient").val(recipient);
	$("#rphone").val(rphone);
	$("#address1").val(addr1);
	$("#address2").val(addr2);
	$("#zip_code").val(zip_code);
}
	
function mileage(){
	var mile = $("#mileage").val();
	var addmile = $("#addmile").val();
	mile = parseInt(mile);
	addmile = parseInt(addmile);
	$("#mileage").val(mile+addmile);
	var formData = $("form[name=frm]").serialize();
	console.log(formData);
	$.ajax({
		url:"/Order/mileageupdate.do",
		type:"POST",
		data:formData,
		ContentType:"application/json",
		success:function(data){
		},
		error:function(){
			alert("실행오류");
		}
	});
}	
function iamport(){
	var agree = $('input:checkbox[name="c1"]').is(":checked");
	var payment = $("input[name='payment']:checked").val();
	var productname = $("#productname").val();
	var tot_price = $("#tot_price").val();
	var productname = $("#productname").val();
	var zipcode = $("#zip_code").val();
	var addr = $("#address1").val();
	var rphone = $("#rphone").val();
	var recipient = $("#recipient").val();
	IMP.init('imp72441252');
	if(agree == false){
		alert("약관 동의에 체크해주세요");
		 return;
	}else if(recipient==""){
		alert("받는 분 이름을 입력하세요");
	}else if(zipcode==""){
		alert("주소검색을 하세요");
	}else if(rphone==""){
		alert("받는 분 휴대폰번호를 입력하세요");
	}else if( $("#payed_mileage").val() == "" ){
		$("#payed_mileage").val(0);
	}
	else{ if(payment=="카드"){
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : productname, //결제창에서 보여질 이름
		    amount : tot_price, //실제 결제되는 가격
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
						var formData = $("form[name=frm]").serialize();
						var msg = '결제가 완료되었습니다.';
						 $.ajax({
								url:"/Order/memberorderinsert.do",
								type:"POST",
								data:formData,
								ContentType:"application/json",
								success:function(data){
								var str = "";
								let Json = JSON.parse('${jsonData}');
								var formData2 = "";
								var formData3 = "";
								for(let i =0; i<Json.length; i++){
									str += "<form name='fm"+i+"'>";
								    var oidx = Json[i].oidx;
								    var quantity = Json[i].quntity;
								    var stock1 = Json[i].stock;
								    var stock = stock1-1;
								    str += "<input type='hidden' name='order_idx' value='"+data+"'>";
									str += "<input type='hidden' name='oidx' value='"+oidx+"'>";
									str += "<input type='hidden' name='quantity' value='"+quantity+"'>";
									str += "</form>";
									$("#form2").html(str);
									$("#delivery").html("<input type='hidden' name='order_idx' value='"+data+"'>");
									formData2 = $("form[name=fm"+i+"]").serialize();
									formData3 =  $("form[name=frm]").serialize();
									console.log(formData3);
									 $.ajax({
											url:"/Order/morderdetailinsert.do",
											type:"POST",
											data:formData2,
											async: false,
											ContentType:"application/json",
											success:function(data){
												$.ajax({
													url:"/Basket/order_after_del.do",
													type:"POST",
													data:formData2,
													async: false,
													ContentType:"application/json",
													success:function(data){
														 $.ajax({
																url:"/Order/stock_update.do",
																type:"POST",
																data:{"oidx":oidx, "stock":stock},
																dataType:"json",
																async: false,
																success:function(data){
																},
																error:function(){
																	alert("실행오류");
																}
															});
													},
													error:function(){
														alert("실행오류");
													}
												});
											},
											error:function(){
												alert("실행오류");
											}
										});
									}
								$.ajax({
									url:"/Order/delivery_insert.do",
									type:"POST",
									data:formData3,
									ContentType:"application/json",
									async: false,
									success:function(data){
										
									},
									error:function(){
										alert("실행오류");
									}
								});
								$("section").html("<div id='complete'>주문이 완료되었습니다<br><a id='mypage' href='/MyPage/main.do?page=1'>주문내역 가기</a></div>");
								},
								error:function(){
									alert("실행오류");
								}
							});
				    } else {
				    	 var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + rsp.error_msg;
				    }
		   			alert(msg);
				});
			});
		}else if(payment=="계좌이체"){
			IMP.request_pay({
			    pg : 'kcp',
			    pay_method : 'trans',
			    merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 생성한 고유 주문번호
			    name : productname, //결제창에서 보여질 이름
			    amount : tot_price, //실제 결제되는 가격
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
			var formData = $("form[name=frm]").serialize();
			var productname = $("#productname").val();
			 $.ajax({
					url:"/Order/memberorderinsert.do",
					type:"POST",
					data:formData,
					ContentType:"application/json",
					success:function(data){
					alert("주문이 완료되었습니다");
					var str = "";
					let Json = JSON.parse('${jsonData}');
					var formData2 = "";
					var formData3 = "";
					for(let i =0 ; i<Json.length ; i++){
						str += "<form name='fm"+i+"'>";
					    var oidx = Json[i].oidx;
					    var quantity = Json[i].quntity;
					    var stock1 = Json[i].stock;
					    var stock = stock1-1;
					    str += "<input type='hidden' name='order_idx' value='"+data+"'>";
						str += "<input type='hidden' name='oidx' value='"+oidx+"'>";
						str += "<input type='hidden' name='quantity' value='"+quantity+"'>";
						str += "</form>";
						$("#form2").html(str);
						$("#delivery").html("<input type='hidden' name='order_idx' value='"+data+"'>");
						formData2 = $("form[name=fm"+i+"]").serialize();
						formData3 =  $("form[name=frm]").serialize();
						console.log(formData3);
						 $.ajax({
								url:"/Order/morderdetailinsert.do",
								type:"POST",
								data:formData2,
								async: false,
								ContentType:"application/json",
								success:function(data){
									$.ajax({
										url:"/Basket/order_after_del.do",
										type:"POST",
										data:formData2,
										async: false,
										ContentType:"application/json",
										success:function(data){
											 $.ajax({
													url:"/Order/stock_update.do",
													type:"POST",
													data:{"oidx":oidx, "stock":stock},
													dataType:"json",
													async: false,
													success:function(data){
													},
													error:function(){
														alert("실행오류");
													}
												});
										},
										error:function(){
											alert("실행오류");
										}
									});
								},
								error:function(){
									alert("실행오류");
								}
							});
						}
					$.ajax({
						url:"/Order/delivery_insert.do",
						type:"POST",
						data:formData3,
						ContentType:"application/json",
						async: false,
						success:function(data){
						},
						error:function(){
							alert("실행오류");
						}
					});
					$("section").html("<div id='complete'>주문이 완료되었습니다<br><a id='mypage' href='/MyPage/main.do?page=1'>주문내역 가기</a></div>");
					},
					error:function(){
						alert("실행오류");
					}
				});
		}
	}
}

$(document).ready(function(){
	
	var midx = "${sessionScope.UserVO.midx}";
	var grade = 0;
	var price = ${tot_price};
	$.ajax({
		url:"/Order/select_midx.do",
		type:"post",
		data:{"midx":midx},
		dataType:"json",
		success:function(data){
			grade = data.grade;
			console.log("data : "+grade);
			var point = data.mileage;
			var point1 = point.toLocaleString();
			var str = "(내 적립금 : ";
			str += point1;
			str += "원)";
			
			$(".email").html(data.email);
			$(".phone").html(data.phone);
			$("#point1").html(str);
			$("#mileage").val(data.mileage);
			$("#mileage1").val(data.mileage);
			var G = parseInt(price*0.02);
			var S = parseInt(price*0.01);
			console.log("grade : "+grade);
			console.log(G);
			if(grade=="G"){
				$(".point").html(G.toLocaleString()+"원");
				$("#addmile").val(G);
			}else if(grade=="S"){
				$(".point").html(S.toLocaleString()+"원");
				$("#addmile").val(S);
			}else{
				$(".point").html(0);
				$("#addmile").val(0);
			}
			
		},
		error:function(){
			alert("실행오류");
		}
	});
	
	$(".productprice").text(price.toLocaleString()+"원");
	
	const shipping = 2500;
	var total = price+shipping;
	
	if(price<100000){
		$(".shipping").text(shipping.toLocaleString()+"원");
		$(".total").text(total.toLocaleString()+"원");
		$("#tot_price").val(total);
		$("#tot_price1").val(total);
	}
	else{
		$(".total").text(price.toLocaleString()+"원");
		$("#tot_price").val(price);
		$("#tot_price1").val(price);
	}
	
	
	
	 $("input[name='payed_mileage']").blur(function(){
		 var value = $(this).val();
		 var mile = $("#mileage").val();
		 var total = $("#tot_price").val();
		 var totalprice = parseInt(total);
		 var result = mile-value;
		 var result1 = totalprice-value;
		 
		 console.log(value);
		 console.log(mile);
		 console.log(totalprice);
		 if(value > mile){
			 alert("내 적립금보다 큽니다");
			$(".mile").val("");
		 }else if(value > totalprice){
			 alert("총 결제 금액보다 큽니다");
				$(".mile").val("");
		 }
		 else{
		 $("#mileage").val(result);
		 $("#tot_price").val(result1);
		 $(".total").text(result1.toLocaleString()+"원");
		 }
	 });
	 
	$(".change input:radio").change(function(){
		var value = $(this).val();
		var name = $(".name").text();
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
	
	$(".infos input:radio").change(function(){
		var value = $(this).val();
		var name = $(".name").text();
		var phone = $(".phone").text();
		let addr1 = "${sessionScope.UserVO.addr1}";
		let addr2 = "${sessionScope.UserVO.addr2}";
		let zipcode = "${sessionScope.UserVO.zip_code}";
		if(value=="same"){
			$("#recipient").val(name);
			$("#rphone").val(phone);
			$("#address1").val(addr1);
			$("#address2").val(addr2);
			$("#zip_code").val(zipcode);
		}
		else if(value=="new"){
			$("#recipient").val("");
			$("#rphone").val("");
			$("#address1").val("");
			$("#address2").val("");
			$("#zip_code").val("");
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
$(document).on('change', '#checkBoxId',function(event){
	var mile1 = $("#mileage1").val();
 	var mile = $("#mileage").val();
 	var totalprice = $("#tot_price").val();
 	var totalprice1 = $("#tot_price1").val();
 	var tot = parseInt(totalprice1);
 	var result = mile-mile;
 	var result2 = totalprice-mile;
    if($("#checkBoxId").is(":checked")){
    	if(mile1 < totalprice1){
    		alert("총결제금액보다 내 적립금이 큽니다");
    	}
    	else{
       $(".mile").val(mile);
       $("#mileage").val(result);
       $("#tot_price").val(result2);
       $(".total").text(result2.toLocaleString()+"원");
    	}
    }else{
    	
    	 $(".mile").val("");
    	 $("#mileage").val(mile1);
    	 $("#tot_price").val(totalprice1);
    	 $(".total").text(tot.toLocaleString()+"원");
    }
});

</script>
</body>
</html>