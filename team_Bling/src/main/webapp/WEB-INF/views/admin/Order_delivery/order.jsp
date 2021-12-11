<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문 리스트</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- SweetAlert2(alert,modal창) -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<style>
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
		.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
		.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		
		.content {position:relative;min-height:1000px;}
		
		#subTitle{
			font-size: 30px;
		}
		#prodLink{
			text-decoration: none;
			color: #000000;
		}
		.tableRow{
			border-bottom: 1px solid black;
		}
		#th1{
			text-align: center;
		}
		#th2{
			text-align: center;
			width: 120px;
		}
		#th3{
			text-align: center;
			width: 90px;
		}
		#th4{
			text-align: center;
			width: 270px;
		}
		#th5{
			text-align: center;
			width: 40px;
		}
		#th6{
			text-align: center;
			width: 110px;
		}
		#th7{
			text-align: center;
			width: 80px;
		}
		#th8{
			text-align: center;
			width: 150px;
		}
		.td{
			text-align: center;
		}
		.td1{
			text-align: center;
			width: 66px;
		}
		.td2{
			text-align: center;
			width: 120px;
		}
		.td3{
			width: 90px;
			padding-left: 15px;
		}
		.td4{
			width: 270px;
		}
		.td5{
			text-align: center;
			width: 40px;
		}
		.td6{
			text-align: center;
			width: 110px;
		}
		.td7{
			text-align: center;
			width: 80px;
		}
		.td8{
			text-align: center;
			width: 150px;
		}
		#deliN{
			width: 64px;
			cursor: pointer;
			text-align: center;
		}
		#deliY{
			width: 64px;
			cursor: pointer;
			text-align: center;
			border: none;
			border-radius: 5px;
			background-color: red;
			color: #ffffff;
		}
		#pname{
			font-weight: bold;
			color: #1a7ed5;
		}
		#orderCnt{
			color: red;
		}
		
		/* dropdown 메뉴 */
		.prodBtn{
			width: 140px;
		}
		.btn-warning{
			color: #ffffff;
		}
		.btn-warning:hover{
			color: #ffffff;
		}
		.btn-warning:focus-within{
			color: #ffffff;
		}
		.dropdown-menu{
			width: 120px;
			min-width: unset;
		}
		.prodStat{
			width: 10px;
			margin-left: 10px;
			display: inline;
		}
		/* dropdown 메뉴 */
	</style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	
	<!-- 옆 nav 바 -->
	<div class="d1">
		<div class="quickmenu">
			  <ul>
			 	<li><a href="#">문의게시판</a></li>
			    <li><a href="/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
			    <li><a href="#">이벤트</a></li>
			    <li><a href="#">리뷰관리</a></li> 
			  </ul>
		</div>
	</div>
	
	<!-- 본문 -->
	<div>
		<span id="subTitle">주문리스트</span>
		<br><br>
		<table>
			<tr>
				<th id="th1">주문번호</th>
				<th id="th2">주문일</th>
				<th id="th3">주문자</th>
				<th id="th4">주문상품</th>
				<th id="th5">수량</th>
				<th id="th6">주문금액</th>
				<th id="th7">결제방법</th>
				<th id="th8">주문상태</th>
			</tr>
		</table>
		<table id="ajaxTable">
			
		</table>	
		<br><br><br><br><br><br>
	</div>
	
</body>
<script>
	$(function(){
		orderList();
	});

	
	function orderList(){
		let str = "";
		
		const option = {
			method: "post",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(),
		}
		
		fetch("/Ad_order_delivery/orderList.do", option)
		.then((response) => {
			if(!response.ok){
				throw new Error('400 아니면 500 에러 발생');
			}
			
			return response.json();
		})
		.then((data) => {
			console.log('화면출력 성공');
			console.log(data[0].order_idx);
			for(let i=0; data.length > i; i++){
				str += "<tr class='tableRow'>";
				str += "	<td class='td td1'>"+data[i].order_idx+"</td>";
				str += "	<td class='td td2'>"+data[i].rdate+"</td>";
				str += "	<td class='td3'>"+data[i].uname+"</td>";
				if(data[i].orderCompCnt == 1){
					str += "	<td class='td4'><a id='prodLink' href='/Product/detail.do?pidx="+data[i].pidx+"'> 상품 : <span id='pname'>"+data[i].pname+"</span> <br> 옵션 : "+data[i].oname+"</a></td>";
				}
				else if(data[i].orderCompCnt != 1){
					str += "	<td class='td4'><a id='prodLink' href='/Product/detail.do?pidx="+data[i].pidx+"'> 상품 : <span id='pname'>"+data[i].pname+"</span> <br> 옵션 : "+data[i].oname+" 등 <span id='orderCnt'>"+data[i].orderCompCnt+"건</span></a></td>";
				}
				
				str += "	<td class='td td5'>"+data[i].quantity+"</td>";
				str += "	<td class='td td6'>"+data[i].tot_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</td>";
				str += "	<td class='td td7'>"+data[i].payment+"</td>";
				str += "	<td class='td td8'>";
					
				str += "<div class='btn-group dropend'>";
				
				
				if(data[i].deli_stat == "N"){
					str += "	<button type='button' class='btn btn-secondary dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		결제대기(N)";
				}else if(data[i].deli_stat == "Y"){
					str += "	<button type='button' class='btn btn-success dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		결제완료(Y)";
				}else if(data[i].deli_stat == "A"){
					str += "	<button type='button' class='btn btn-primary dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		상품준비중(A)";
				}else if(data[i].deli_stat == "B"){
					str += "	<button type='button' class='btn btn-warning dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		배송중(B)";
				}else if(data[i].deli_stat == "C"){
					str += "	<button type='button' class='btn btn-danger dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		배송완료(C)";
				}
			
				str += "	</button>";
				str += "	<ul class='dropdown-menu'>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatN"+data[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"N\","+data[i].order_idx+")'></li>";
				str += "			<label for='prodStatN"+data[i].order_idx+"'>결제대기</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatY"+data[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"Y\","+data[i].order_idx+")'></li>";
				str += "			<label for='prodStatY"+data[i].order_idx+"'>결제완료</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatA"+data[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"A\","+data[i].order_idx+")'></li>";
				str += "			<label for='prodStatA"+data[i].order_idx+"'>상품준비중</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatB"+data[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"B\","+data[i].order_idx+")'></li>";
				str += "			<label for='prodStatB"+data[i].order_idx+"'>배송중</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatC"+data[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"C\","+data[i].order_idx+")'></li>";
				str += "			<label for='prodStatC"+data[i].order_idx+"'>배송완료</label><br>";
				str += "	</ul>";
				str += "</div>";
						
						
				str += "	</td>";
				str += "</tr>";
			}
			$("#ajaxTable").html(str);
			
		})
		.catch(() => {
			console.log('ajax 화면출력 에러');
		})
	}
	
	
		
	function deli(kind,order_idx){
		console.log("deli() 실행");
		console.log("kind : "+kind);
		console.log("order_idx : "+order_idx);
		
		let kind2 = "";
		if(kind=="N"){
			kind2="결제대기(N)";
		}else if(kind=="Y"){
			kind2="결제완료(Y)";
		}else if(kind=="A"){
			kind2="상품준비중(A)";
		}else if(kind=="B"){
			kind2="배송중(B)";
		}else if(kind=="C"){
			kind2="배송완료(C)";
		}
		
		Swal.fire({
			icon: 'question',
			text: '주문번호 '+order_idx+'의 주문상태를 '+kind2+'로 변경하시겠습니까?',
			showCancelButton: true
		}).then((result) => {
			if (result.isConfirmed) {
				let prodData = {
						method: "post",
						headers: {
							"Content-Type": "application/json",
						},
						body: JSON.stringify({kind:kind, order_idx:order_idx})
					}
				
				fetch('/Ad_order_delivery/prodStat.do', prodData)
					.then((data) => {
						console.log(data);
						orderList();
					})
					.catch(() => {
						console.log('출고버튼 에러');
					})
			}
		});
	}
	
</script>
</html>