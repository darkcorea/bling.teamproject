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
<title>배송 리스트</title>
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
			width: 70px;
		}
		#th2{
			text-align: center;
			width: 70px;
		}
		#th3{
			text-align: center;
			width: 150px;
		}
		#th4{
			text-align: center;
			width: 70px;
		}
		#th5{
			text-align: center;
			width: 110px;
		}
		#th6{
			text-align: center;
			width: 110px;
		}
		#th7{
			text-align: center;
			width: 120px;
		}
		.td{
			text-align: center;
			height: 35px;
		}
		.td1{
			text-align: center;
			width: 70px;
		}
		.td2{
			text-align: center;
			width: 70px;
		}
		.td3{
			text-align: center;
			width: 150px;
		}
		.td4{
			width: 70px;
		}
		.td5{
			text-align: center;
			width: 110px;
		}
		.td6{
			text-align: center;
			width: 110px;
		}
		.td7{
			text-align: center;
			width: 120px;
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
		#noneList{
			width: 1008px;
			text-align: center;
		}
		#noneDiv{
			position: relative;
			top: 20px;
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
		<span id="subTitle">배송리스트</span>
		<br><br>
		<table>
			<tr>
				<th id="th1">배송번호</th>
				<th id="th2">주문번호</th>
				<th id="th3">송장번호</th>
				<th id="th4">주문자</th>
				<th id="th5">배송일</th>
				<th id="th6">배송완료일</th>
				<th id="th7">배송상태
					<select id="deliStat" onchange="deliveryList(1,this.value)">
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
		deliveryList(1,"all");
     });
	
	function deliveryList(page,kind){
		$.ajax({
			url: "/Ad_order_delivery/deliveryList.do",
			type: "post",
			data: {"page":page,"kind":kind},
			success: function(data){
				console.log("배송목록 불러오기 성공");
				
				let str = "";
				
				let dl = data.deliveryList;
				
				let pm = data.pm;
				let prev = parseInt(pm.startPage - 1) ;
			  	let next = parseInt(pm.endPage + 1) ;

			  	
			  	str += "<table>";
			  	
			  	if(dl.length == 0){
			  		str += "<tr><td colspan='7' id='noneList'><div id='noneDiv'>해당 조건의 배송이 존재하지 않습니다.</div></td></tr>";
			  	}
			  	else if(dl.length != 0){
				
					for(let i=0; dl.length > i; i++){
						str += "<tr class='tableRow'>";
						str += "	<td class='td td1'>"+dl[i].didx+"</td>";
						str += "	<td class='td td2'>"+dl[i].order_idx+"</td>";
						
						if(dl[i].invoice_num == null){
							str += "	<td class='td3'></td>";
						}else if(dl[i].invoice_num != null){
							str += "	<td class='td3'>"+dl[i].invoice_num+"</td>";							
						}
						
						str += "	<td class='td4'>"+dl[i].uname+"</td>";
						
						if(dl[i].send_day == null){
							str += "	<td class='td5'></td>";
						}else if(dl[i].send_day != null){
							str += "	<td class='td td5'>"+dl[i].send_day+"</td>";						
						}
						
						if(dl[i].deli_com == null){
							str += "	<td class='td6'></td>";
						}else if(dl[i].deli_com != null){
							str += "	<td class='td td6'>"+dl[i].deli_com+"</td>";						
						}
						
						if(dl[i].deli_stat == "N"){
							str += "	<td class='td td7'>결제대기(N)</td>";	
						}else if(dl[i].deli_stat == "Y"){
							str += "	<td class='td td7'>결제완료(Y)</td>";	
						}else if(dl[i].deli_stat == "A"){
							str += "	<td class='td td7'>상품중비중(A)</td>";	
						}else if(dl[i].deli_stat == "B"){
							str += "	<td class='td td7'>배송중(B)</td>";	
						}else if(dl[i].deli_stat == "C"){
							str += "	<td class='td td7'>배송완료(C)</td>";	
						}
						
						str += "</tr>";
					}
			  	}
				str += "</table>";
				
				
				str += "<br><br><br>";
		  		
				
				// 페이징 할 수 있는 번호 나오는 곳 뿌려 주기
			  	str += "	<nav aria-label='Page navigation'>";
			  	str += "	<ul class='pagination justify-content-center'>";
			  	str += "	<li class='page-item'>";
			  	
			  	//console.log(prev);
			  	if(pm.prev == true){
			  	    str += "<a class='page-link' aria-label='Previous' onclick='deliveryList("+prev+",\""+kind+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
			  	}
			  	
			  	str += "	</li>";
			  	let startPage = parseInt(pm.startPage);
			  	let endPage = parseInt(pm.endPage);
			  	
			  	for (let k = pm.startPage; k<=pm.endPage; k++ ){
			  		 if(page == k){
			  			str += "<li class='page-item active'><a class='page-link pointer' onclick='deliveryList("+k+",\""+kind+"\")'>"+k+"</a></li>";    
			  		 }else{
			  			str += "<li class='page-item'><a class='page-link pointer' onclick='deliveryList("+k+",\""+kind+"\")'>"+k+"</a></li>";    
			  		 }
			  	 }
			  	 
			  	 str += "	<li class='page-item'>";
			  	
			  	 if(pm.next && pm.endPage > 0){
			  	     str += "<a class='page-link' aria-label='Next' onclick='deliveryList("+next+",\""+kind+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
			  	 }
			  	 
			  	 str += "	</li>";
			  	 str += "	</ul>";
			  	 str += "	</nav>";
				
				
				$("#ajaxTable").html(str);	
			},
			error: function(){
				console.log("deliveryList() 에러발생");
			}
		});
	}
	
	
	
	
		
	function deli(kind,statN,order_idx){
		console.log("deli() 실행");
		console.log("kind : "+kind);
		console.log("order_idx : "+order_idx);
		
		let stat = statN;
		console.log("stat : "+stat);
		
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
				.then((response) => {
					if(!response.ok){
						throw new Error('400 아니면 500 에러 발생');
					}
					
					return response;
				})
				/* 
					해당 fetch()의 response가 그냥 String이므로 	return response.json();가 아닌 그냥 response를 return함.
					return response;가 아래의 .then((data)=>{})의 data에 들어간다.
				*/
				.then((data) => {
					console.log("response=data : "+data);
					console.log("deli()-stat : "+stat);
					orderList("1",stat);
				})
				.catch(() => {
					console.log('출고버튼 에러');
				})
			}
		});
	}
	
	
	
	
	
	//리뷰가 존재할 때 경고창
	function caution1(){
		
		Swal.fire({
			icon: 'warning',
			text: '리뷰가 존재합니다!',
		});
	}
	
	//배송완료일로부터 7일 초과시 경고창
	function caution2(){
		
		Swal.fire({
			icon: 'warning',
			html: '구매확정된 상품입니다! <br> (배송완료일로부터 7일 초과)',
		});
	}
	
</script>
</html>