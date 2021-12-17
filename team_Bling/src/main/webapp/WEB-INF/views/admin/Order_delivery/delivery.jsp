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
			 	<li><a href="/team_Bling/Ad_board/question.do">문의게시판</a></li>
			    <li><a href="/team_Bling/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
			    <li><a href="/team_Bling/Ad_board/event.do">이벤트</a></li>
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
			url: "/team_Bling/Ad_order_delivery/deliveryList.do",
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
				
				fetch('/team_Bling/Ad_order_delivery/prodStat.do', prodData)
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
	
	
</script>
</html>