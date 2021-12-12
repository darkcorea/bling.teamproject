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
		select{
			width: 20px;
		}
		option:active{
			position: relative;
			right: 50px;
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
		/* 마우스 커서 */
		.pointer{
			cursor: pointer;
		}
		/* 마우스 커서 */
		
		
/* ---------------modal--------------- */
		.title4{
		text-decoration: none;
		color: #CB7878;	
		}	
		.title4:hover{
			color:#C4C4C4;
		}
		/* 클래스 붙이면 백그라운드 색상이 블링 색으로 */
		.bling_color {
			background-color: #CB7878;
		}
		/* 모달 버튼 가운데로 오기*/
		#delivery_select2 {
			justify-content: center;
		}		
		/* 모달 버튼 */
		#modal_button1{
		background-color: #CB7878;
		}
			
		/* 모달 버튼 크기*/
		#modal_button1{
			width:120px;
		}
			
		/* 모달 버튼 크기*/
		#modal_button2{
			width:120px;
		}
		/* 모달창에 나오는 상품 이미지 크기  */
		.image_main{
			width:80px;
			height:80px;
		}
		.title {
			font-size:25px;
			font-weight:700;
		}
	
	/* modal */
		.modal {
	        text-align: center;
		}
		/* 모달창 배경색 */
		.modal-backdrop {
			background-color: #000000 !important;
			opacity: 0.3 !important;
		}
		.modal-dialog {
	        text-align: left;
	        vertical-align: middle;
		}
		.modal-header{
			background-color: #CB7878;
		}
		.modal-title{
			color: #ffffff;
			font-size: 30px;
			position: relative;
			left: 175px;
		}
		#modalText1{
			text-align: center;
			font-weight: bold;
			font-size: 20px;
		}
		#textArea1,#textArea2{
			width: 465px;
			height: 200px;
			resize: none;
			background-color: #C4C4C4;
			opacity: 0.5;
		}
		#textArea::placeholder{
			color: #000000;
		}
		#closeBtn{
			width: 80px;
			color: #000000;
			background-color: #ffffff;
			border: 2px solid #C4C4C4;
			position: relative;
			right: 150px;
		}
		#saveBtn{
			width: 80px;
			color: #ffffff;
			background-color: #CB7878;
			border: 2px solid #CB7878;
			position: relative;
			right: 150px;
		}
		#saveBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 2px solid #CB7878;
		}
		#delBtn{
			width: 80px;
			color: #ffffff;
			background-color: #CB7878;
			border: 2px solid #CB7878;
			position: relative;
			right: 150px;
		}
		#delBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 2px solid #CB7878;
		}
		#uploadDiv{
			width: 465px;
			height: 40px;
			background-color: #CB7878;
		}
		#uploadBtn{
			display: none;
		}
		.fileBtn{
			width: 465px;
			height: 40px;
		}
		#fileBtnText{
			font-size: 18px;
			color: #ffffff;
		}
		.bi-camera::before{
			margin: 0px 10px 0px 0px;
			font-size: 23px;
		}
/* ---------------modal--------------- */
	</style>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	
	<!-- 상품선택을 하면 나오는 모달창 -->
	<div class="modal fade" id="delivery_select" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
	    <div class="modal-content">
	      <div class="modal-header bling_color">
	        <h5 class="modal-title">구매한 상품 내역</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<!-- 구매한 상품 내역 나오게 하기 -->
	      	<div id="delivery_select1" style="margin-left:135px;">
		      	<div style="margin-top:30px;">
		      	<span class="title">결제금액 : </span><span class="title">300,000 원</span>
		      	</div>
	      	</div>
	      </div>
	      <div class="modal-footer" id="delivery_select2">
	        <button type="button" class="btn btn-secondary" id="modal_button1" data-bs-dismiss="modal" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	
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
				<th id="th8">주문상태
					<select id="deliStat" onchange="orderList(1,this.value)">
						<option value="all">전체선택</option>
						<option value="N">결제대기(N)</option>
						<option value="Y">결제완료(Y)</option>
						<option value="A">상품준비중(A)</option>
						<option value="B">배송중(B)</option>
						<option value="C">배송완료(C)</option>
					</select>
				</th>
			</tr>
		</table>
		<div id="ajaxTable">
			
		</div>	
		<br><br><br><br><br><br>
	</div>
	
</body>
<script>
	var page = 1;
	if(page == null) {page=1};

	$(function(){
		orderList(1,"all");
     });
	
	function orderList(pageN,kind){
		let str = "";
		let page = ""+pageN+"";
		
		const option = {
			method: "post",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({page:page,kind:kind}),
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
			
			let ol = data.orderList;
			console.log("index0 order_idx : "+ol[0].order_idx);
			
			let pm = data.pm;
			let prev = parseInt(pm.startPage - 1) ;
		  	let next = parseInt(pm.endPage + 1) ;
			
		  	
			str += "<table>";
			for(let i=0; ol.length > i; i++){
				str += "<tr class='tableRow'>";
				str += "	<td class='td td1'>"+ol[i].order_idx+"</td>";
				str += "	<td class='td td2'>"+ol[i].rdate+"</td>";
				str += "	<td class='td3'>"+ol[i].uname+"</td>";
				if(ol[i].orderCompCnt == 1){
					str += "	<td class='td4'><a id='prodLink' class='pointer' onclick='order_list("+ol[i].order_idx+")'> 상품 : <span id='pname'>"+ol[i].pname+"</span> <br> 옵션 : "+ol[i].oname+"</a></td>";
				}
				else if(ol[i].orderCompCnt != 1){
					str += "	<td class='td4'><a id='prodLink' class='pointer' onclick='order_list("+ol[i].order_idx+")'> 상품 : <span id='pname'>"+ol[i].pname+"</span> <br> 옵션 : "+ol[i].oname+" 등 <span id='orderCnt'>"+ol[i].orderCompCnt+"건</span></a></td>";
				}
				
				str += "	<td class='td td5'>"+ol[i].quantity+"</td>";
				str += "	<td class='td td6'>"+ol[i].tot_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</td>";
				str += "	<td class='td td7'>"+ol[i].payment+"</td>";
				str += "	<td class='td td8'>";
					
				str += "<div class='btn-group dropend'>";
				
				
				if(ol[i].deli_stat == "N"){
					str += "	<button type='button' class='btn btn-secondary dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		결제대기(N)";
				}else if(ol[i].deli_stat == "Y"){
					str += "	<button type='button' class='btn btn-success dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		결제완료(Y)";
				}else if(ol[i].deli_stat == "A"){
					str += "	<button type='button' class='btn btn-primary dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		상품준비중(A)";
				}else if(ol[i].deli_stat == "B"){
					str += "	<button type='button' class='btn btn-warning dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		배송중(B)";
				}else if(ol[i].deli_stat == "C"){
					str += "	<button type='button' class='btn btn-danger dropdown-toggle prodBtn' data-bs-toggle='dropdown' aria-expanded='false'>";
					str += "		배송완료(C)";
				}
			
				str += "	</button>";
				str += "	<ul class='dropdown-menu'>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatN"+ol[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"N\","+ol[i].order_idx+")'></li>";
				str += "			<label for='prodStatN"+ol[i].order_idx+"'>결제대기</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatY"+ol[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"Y\","+ol[i].order_idx+")'></li>";
				str += "			<label for='prodStatY"+ol[i].order_idx+"'>결제완료</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatA"+ol[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"A\","+ol[i].order_idx+")'></li>";
				str += "			<label for='prodStatA"+ol[i].order_idx+"'>상품준비중</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatB"+ol[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"B\","+ol[i].order_idx+")'></li>";
				str += "			<label for='prodStatB"+ol[i].order_idx+"'>배송중</label><br>";
				str += "		<li><input type='radio' name='prodStat' id='prodStatC"+ol[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"C\","+ol[i].order_idx+")'></li>";
				str += "			<label for='prodStatC"+ol[i].order_idx+"'>배송완료</label><br>";
				str += "	</ul>";
				str += "</div>";
						
						
				str += "	</td>";
				str += "</tr>";
			}
			str += "</table>";
			
			
			str += "<br><br><br>";
	  		
			
			// 페이징 할 수 있는 번호 나오는 곳 뿌려 주기
		  	str += "	<nav aria-label='Page navigation'>";
		  	str += "	<ul class='pagination justify-content-center'>";
		  	str += "	<li class='page-item'>";
		  	
		  	//console.log(prev);
		  	if(pm.prev == true){
		  	    str += "<a class='page-link' aria-label='Previous' onclick='orderList("+prev+")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
		  	}
		  	
		  	str += "	</li>";
		  	let startPage = parseInt(pm.startPage);
		  	let endPage = parseInt(pm.endPage);
		  	
		  	for (let k = pm.startPage; k<=pm.endPage; k++ ){
		  		 if(page == k){
		  			str += "<li class='page-item active'><a class='page-link pointer' onclick='orderList("+k+")'>"+k+"</a></li>";    
		  		 }else{
		  			str += "<li class='page-item'><a class='page-link pointer' onclick='orderList("+k+")'>"+k+"</a></li>";    
		  		 }
		  	 }
		  	 
		  	 str += "	<li class='page-item'>";
		  	
		  	 if(pm.next && pm.endPage > 0){
		  	     str += "<a class='page-link' aria-label='Next' onclick='orderList("+next+")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
		  	 }
		  	 
		  	 str += "	</li>";
		  	 str += "	</ul>";
		  	 str += "	</nav>";
			
			
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
	
	
	// 구매한 오더의 이미지나 상품명(옵션을 눌렀을 떄)
	function order_list(order_idx){	
		$.ajax({
			url:"/Delivery/order_list.do",
			type:"POST",
			data:{"order_idx":order_idx},
			async: false,
			success:function(data){
				let str = "";
				let phone1 = "";
				let phone2 = "";
				let phone3 = "";
				
				// 받는 사람 뿌려 주기
				str += "<div>";
				str += "<p><span class='title'>배송정보</span></p>";
				str += " <table>";
				str += " <tr>";
				str += " <td style='width:80px;''><b>받는사람</b></td>";
				str += "<td>"+data[0].recipient+"</td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td><b>연 락 처</b></td>";
				if(data[0].rphone.length == 11){
					phone1 = data[0].rphone.substring(0,3);
					phone2 = data[0].rphone.substring(3,7);
					phone3 = data[0].rphone.substring(7);
				}
				if(data[0].rphone.length == 10){
					phone1 = data[0].rphone.substring(0,3);
					phone2 = data[0].rphone.substring(3,6);
					phone3 = data[0].rphone.substring(6);
				}
				str += "<td>"+phone1+"-"+phone2+"-"+phone3+"</td>";
				str += "</tr>";
				str += "<tr>";
				str += " <td><b>받는주소</b></td>";
				str += "<td>("+data[0].zip_code+")"+data[0].addr1+data[0].addr2+"</td>";
				str += "</tr>";
				str += "</table>";
				str += "</div>";
				// 상품에 대한 정보 뿌려 주기
				for(let i=0; i<data.length; i++){	
					str += "<div style='margin-top:30px;'>";	
					str += "<table>";	
					str += "</tr>";	
					str += " <td style='width:150px;'>";
					str += "<a href='/Product/detail.do?pidx="+data[0].pidx+"'>"
					str += " <img class='image_main' src='/resources/image/"+data[i].main+"'></a>";	
					str += "</td>";	
					str += "<td style='width:300px;'>";
					str += "<a href='/Product/detail.do?pidx="+data[0].pidx+"' class='title4'>"
					str += "<span><b>"+data[i].pname+"</b></span></a><br>";	
					var oname = data[i].oname.split("+")[0]
					str += " <span>"+oname+"</span>(수량: <span>"+data[i].quantity+"</span>)";	
					str += "</td>";	
					str += "</tr>";	
					str += "</table>";
					str += "</div>";
				}
				str += "<div style='margin-top:30px;'>";
				let price = data[0].tot_price.toLocaleString();
				str += "<span class='title'>결제금액 : </span><span class='title'>"+price+"원</span>";
				str += "</div>";

				$("#delivery_select1").html(str);
				$("#delivery_select").modal("show");
			},
			error:function(){
				alert("구매 상품 불러오기 실행 오류");
			}
		});
	}
	
</script>
</html>