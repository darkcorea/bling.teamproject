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
<title>취소/반품/교환</title>
	<!-- SweetAlert2(alert,modal창) -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<style>
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
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
			height: 50.5px;
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
			width: 120px;
		}
		#th4{
			text-align: center;
			width: 110px;
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
		#th8{
			text-align: center;
			width: 150px;
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
			width: 120px;
		}
		.td4{
			text-align: center;
			width: 110px;
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
		.prodBtnN{
			width: 140px;
			cursor: default !important;
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
			width: 10px !important;
			margin-left: 10px;
			display: inline !important;
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

	
	<!-- 본문 -->
	<div>
		<span id="subTitle">취소/반품/교환</span>
		<br><br>
		<table>
			<tr>
				<th id="th1">주문번호</th>
				<th id="th2">배송번호</th>
				<th id="th3">주문자</th>
				<th id="th4">주문일</th>
				<th id="th5">배송일</th>
				<th id="th6">배송완료일</th>
				<th id="th7">주문상태</th>
				<th id="th8">취소/반품/교환
					<select id="deliStat" onchange="returnList(1,this.value)">
						<option value="all">전체선택</option>
						<option value="C">취소</option>
						<option value="CN"> -취소 진행중</option>
						<option value="CY"> -취소완료</option>
						<option value="R">반품</option>
						<option value="RN"> -반품 진행중</option>
						<option value="RY"> -반품완료</option>
						<option value="E">교환</option>
						<option value="EN"> -교환 진행중</option>
						<option value="EY"> -교환완료</option>
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
		returnList(1,"all");
     });
	
	function returnList(page,kind){
		console.log("returnList()-kind : "+kind);
		$.ajax({
			url: "${cPath}/Ad_order_delivery/returnList.do",
			type: "post",
			data: {"page":page,"kind":kind},
			success: function(data){
				console.log("return목록 불러오기 성공");
				
				let str = "";
				
				let rl = data.returnList;
				
				let pm = data.pm;
				let prev = parseInt(pm.startPage - 1) ;
			  	let next = parseInt(pm.endPage + 1) ;

			  	
			  	str += "<table>";
			  	
			  	if(rl.length == 0){
			  		str += "<tr><td colspan='7' id='noneList'><div id='noneDiv'>해당 조건의 주문이 존재하지 않습니다.</div></td></tr>";
			  	}
			  	else if(rl.length != 0){
				
					for(let i=0; rl.length > i; i++){
						str += "<tr class='tableRow'>";
						str += "	<td class='td td1'>"+rl[i].order_idx+"</td>";
						str += "	<td class='td td2'>"+rl[i].didx+"</td>";
						str += "	<td class='td3'>"+rl[i].uname+"</td>";							
						str += "	<td class='td4'>"+rl[i].rdate+"</td>";
						
						if(rl[i].send_day == null){
							str += "	<td class='td5'></td>";
						}else if(rl[i].send_day != null){
							str += "	<td class='td td5'>"+rl[i].send_day+"</td>";						
						}
						
						if(rl[i].deli_com == null){
							str += "	<td class='td6'></td>";
						}else if(rl[i].deli_com != null){
							str += "	<td class='td td6'>"+rl[i].deli_com+"</td>";						
						}
						
						if(rl[i].deli_stat == "N"){
							str += "	<td class='td td7'>결제대기(N)</td>";	
						}else if(rl[i].deli_stat == "Y"){
							str += "	<td class='td td7'>결제완료(Y)</td>";	
						}else if(rl[i].deli_stat == "A"){
							str += "	<td class='td td7'>상품중비중(A)</td>";	
						}else if(rl[i].deli_stat == "B"){
							str += "	<td class='td td7'>배송중(B)</td>";	
						}else if(rl[i].deli_stat == "C"){
							str += "	<td class='td td7'>배송완료(C)</td>";	
						}
						
						str += "	<td class='td td8'>";
						
						str += "<div class='btn-group dropend'>";
						
						if((rl[i].cancel=="N" || rl[i].cancel=="Y") && rl[i].refund==null && rl[i].exchange==null){
							if(rl[i].cancel=="N"){
								str += "	<button type='button' class='btn btn-danger dropdown-toggle prodBtn D' data-bs-toggle='dropdown' aria-expanded='false'>";
								str += "		취소 진행중";
							}else if(rl[i].cancel=="Y"){
								str += "	<button type='button' class='btn btn-danger prodBtnN'>";
								str += "		취소완료(N)";
							}
						}else if((rl[i].refund=="N" || rl[i].refund=="Y") && rl[i].cancel==null && rl[i].exchange==null){
							if(rl[i].refund=="N"){
								str += "	<button type='button' class='btn btn-secondary dropdown-toggle prodBtn D' data-bs-toggle='dropdown' aria-expanded='false'>";
								str += "		반품 진행중";
							}else if(rl[i].refund=="Y"){
								str += "	<button type='button' class='btn btn-secondary prodBtnN'>";
								str += "		반품완료(N)";
							}
						}else if((rl[i].exchange=="N" || rl[i].exchange=="Y") && rl[i].cancel==null && rl[i].refund==null){
							if(rl[i].exchange=="N"){
								str += "	<button type='button' class='btn btn-primary dropdown-toggle prodBtn D' data-bs-toggle='dropdown' aria-expanded='false'>";
								str += "		교환 진행중";
							}else if(rl[i].exchange=="Y"){
								str += "	<button type='button' class='btn btn-primary prodBtnN'>";
								str += "		교환완료(N)";
							}
						}else if((rl[i].cancel=="N" || rl[i].cancel=="Y") && (rl[i].refund=="N" || rl[i].refund=="Y") && (rl[i].exchange=="N" || rl[i].exchange=="Y")){
							str += "	<td class='td td8'></td>";
						}
						
						str += "	</button>";
						str += "	<ul class='dropdown-menu'>";
						if(rl[i].cancel=="N"){
							str += "		<li><input type='radio' name='prodStat' id='prodStatC"+rl[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"C\",\""+kind+"\","+rl[i].order_idx+","+page+")'></li>";
							str += "			<label for='prodStatC"+rl[i].order_idx+"'>취소완료</label><br>";
						}else if(rl[i].refund=="N"){
							str += "		<li><input type='radio' name='prodStat' id='prodStatR"+rl[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"R\",\""+kind+"\","+rl[i].order_idx+","+page+")'></li>";
							str += "			<label for='prodStatR"+rl[i].order_idx+"'>반품완료</label><br>";
						}else if(rl[i].exchange=="N"){
							str += "		<li><input type='radio' name='prodStat' id='prodStatE"+rl[i].order_idx+"' class='dropdown-item prodStat' onclick='deli(\"E\",\""+kind+"\","+rl[i].order_idx+","+page+")'></li>";
							str += "			<label for='prodStatE"+rl[i].order_idx+"'>교환완료</label><br>";
						}
						
						str += "	</ul>";
						str += "</div>";
								
								
						str += "	</td>";
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
			  	    str += "<a class='page-link' aria-label='Previous' onclick='returnList("+prev+",\""+kind+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
			  	}
			  	
			  	str += "	</li>";
			  	let startPage = parseInt(pm.startPage);
			  	let endPage = parseInt(pm.endPage);
			  	
			  	for (let k = pm.startPage; k<=pm.endPage; k++ ){
			  		 if(page == k){
			  			str += "<li class='page-item active'><a class='page-link pointer' onclick='returnList("+k+",\""+kind+"\")'>"+k+"</a></li>";    
			  		 }else{
			  			str += "<li class='page-item'><a class='page-link pointer' onclick='returnList("+k+",\""+kind+"\")'>"+k+"</a></li>";    
			  		 }
			  	 }
			  	 
			  	 str += "	<li class='page-item'>";
			  	
			  	 if(pm.next && pm.endPage > 0){
			  	     str += "<a class='page-link' aria-label='Next' onclick='returnList("+next+",\""+kind+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
			  	 }
			  	 
			  	 str += "	</li>";
			  	 str += "	</ul>";
			  	 str += "	</nav>";
				
				
				$("#ajaxTable").html(str);	
				
				disabled();
			},
			error: function(){
				console.log("returnList() 에러발생");
			}
		});
	}
	
	
	function deli(kind,statN,order_idx,page){
		console.log("deli() 실행");
		console.log("kind : "+kind);
		console.log("order_idx : "+order_idx);
		
		let stat = statN;
		console.log("stat : "+stat);
		console.log("page : "+page);
		
		
		let kind2 = "";
		if(kind=="C"){
			kind2="취소완료(C)";
		}else if(kind=="R"){
			kind2="반품완료(R)";
		}else if(kind=="E"){
			kind2="교환완료(E)";
		}
		
		Swal.fire({
			icon: 'question',
			text: '주문번호 '+order_idx+'의 주문상태를 '+kind2+'로 변경하시겠습니까?',
			showCancelButton: true
		}).then((result) => {
			if (result.isConfirmed) {
				statChange(kind,order_idx,page,stat);
			}
		});
	}
	
	/* 취소상태 변경 */
	function statChange(kind,order_idx,page,stat){
		console.log("statChange() 실행");
		$.ajax({
			url: "/team_Bling/Ad_order_delivery/returnStat.do",
			type: "post",
			data: {"kind":kind, "order_idx":order_idx},
			success: function(data){
				returnList(page,stat);
			},
			error: function(){
				console.log("취소상태 변경 에러");
			}
		});
	}	
	
</script>
</html>