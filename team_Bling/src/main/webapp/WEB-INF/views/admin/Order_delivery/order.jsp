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
		#th7,#th8{
			text-align: center;
			width: 80px;
		}
		#th9{
			text-align: center;
			width: 100px;
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
		.td7,.td8{
			text-align: center;
			width: 80px;
		}
		.td9{
			text-align: center;
			width: 100px;
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
				<th id="th8">결제상태</th>
				<th id="th9">배송상태</th>
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
				str += "	<td class='td4'><a id='prodLink' href='/Product/detail.do?pidx="+data[i].pidx+"'> 상품 : <span id='pname'>"+data[i].pname+"</span> <br> 옵션 : "+data[i].oname+" 등 <span id='orderCnt'>"+data[i].orderCompCnt+"건</span></a></td>";
				str += "	<td class='td td5'>"+data[i].quantity+"</td>";
				str += "	<td class='td td6'>"+data[i].tot_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</td>";
				str += "	<td class='td td7'>"+data[i].payment+"</td>";
				str += "	<td class='td td8'>"+data[i].order_yn+"</td>";
				str += "	<td class='td td9'>";
					if(data[i].delivery_yn == "N"){
						str += "<input id='deliN' value='미출고' readonly onclick='deli("+data[i].order_idx+",\""+data[i].delivery_yn+"\")'>";
					}
					else if(data[i].delivery_yn == "Y"){
						str += "<input id='deliY' value='출고중' readonly onclick='deli("+data[i].order_idx+",\""+data[i].delivery_yn+"\")'>";
					}
				str += "	</td>";
				str += "</tr>";
			}
			$("#ajaxTable").html(str);
			
		})
		.catch(() => {
			console.log('ajax 화면출력 에러');
		})
	}
	
	
		
	function deli(order_idx,delivery_yn){
		console.log("deli() 실행");
		console.log("order_idx : "+order_idx);
		console.log("delivery_yn : "+delivery_yn);
		
		Swal.fire({
			icon: 'question',
			text: '출고상태를  변경하시겠습니까?',
			showCancelButton: true
		}).then((result) => {
			if (result.isConfirmed) {
				let deliveryData = {
						method: "post",
						headers: {
							"Content-Type": "application/json",
						},
						body: JSON.stringify({order_idx:order_idx, delivery_yn:delivery_yn})
					}
				
				fetch('/Ad_order_delivery/deliveryYN.do', deliveryData)
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