<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<!--차트-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
		<script src="https://d3js.org/d3.v3.min.js"></script> <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
		<!-- Bootstrap core CSS -->
  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
  	<!-- Bootstrap core JavaScript -->
  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.js"></script>
	<!-- Bootstrap icon -->	
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<meta charset="UTF-8">
		<title>관리자 홈</title>
		<style>
			section {
				max-width:1008px;
				margin:  5px auto;
			}
			#td{
				text-align: center;
			}	
			#dd{
				text-align:right;
			}
			#line{
				border-top:2px solid black;
			}
			#menubtn{
				height: 60px;
				margin-right:0px !important;
			}
			#sta{
				background-color: #d3d3d3;
			}
		</style>
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	
		<section>
			<div class = "container">
				<div class="row">
					<div class="col-7">
						<h4>주문관리</h4>
						<br>
						<table class="table table-bordered align-middle" height="250px">
						<c:set value="${data }" var="data" />
							<tr>
								<td id="td">
									<p class="text-black-50">입금대기</p>
									<b><c:out value="${data.deli_stat_n}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">결제완료</p>
									<b><c:out value="${data.deli_stat_y}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">상품준비중</p>
									<b><c:out value="${data.deli_stat_a}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">배송중</p>
									<b><c:out value="${data.deli_stat_b}"/></b>
								</td>
							</tr>
							<tr>
								<td id="td">
									<p class="text-black-50">배송완료</p>
									<b><c:out value="${data.deli_stat_c}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">구매미확정</p>
									<b><c:out value="${data.confirm_yn}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">환불접수</p>
									<b><c:out value="${data.refund}"/></b>
								</td>
								<td id="td">
									<p class="text-black-50">교환접수</p>
									<b><c:out value="${data.exchange}"/></b>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-1"></div>
					<div class="col">
						<h4>미응답문의</h4>
						<br>
						<table class="table table-borderless" height="100px">
							<tr id="line">
								<td>
									상품문의
								</td>
								<td id="dd">
									<c:out value="${proq }" />건
								</td>
							</tr>
							<tr>
								<td>
									1:1문의
								</td>
								<td id="dd">
									<c:out value="${priq }"/>건
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<hr>
				<br>
				<div class="btn-group btn-group-sm d-md-flex justify-content-md-end" role="group" aria-label="Basic outlined example" id="groupbtn">
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(1);'>
						<b>매출(7일)</b>
						<br>
						<fmt:formatNumber value="${price[7].tot_price}"  pattern="#,###" />원
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(2);'>
						<b>주문(7일)</b>
						<br>
						0건
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(3);'>
						<b>방문자(7일)</b>
						<br>
						0명
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(4);'>
						<b>신규회원(7일)</b>
						<br>
						0명
					</button>
				</div>
				<br>
				<div class="row">
					<div class="col" id="price_table">
						
					</div>
					<div class="col">
						<div id="linechart">

						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
	<script>
	
		$(function(){
			price(1);
		});
		
		function price(type){
			$.ajax({
				url:"/Ad_Main/price.do",
				type:"POST",
				data:{"type":type},
				dataType:'json',
				success:function(data){
					
					var first,second,third,recent,dayfirst,daysecond,daythird;
					let type = data.type;
					
					let str = "";
					str+="<table class='table table-bordered align-middle'>";
					str+="	<thead>";
					str+="		<tr class='table-secondary'>";
					str+="		  <th scope='col' id='td'>날짜</th>";
					if(type == 1){
						str+="		  <th scope='col' id='td'>매출금액</th>";
						str+="		  <th scope='col' id='td'>판매금액</th>";
						str+="		  <th scope='col' id='td'>환불금액</th>";
					}else if(type == 2){
						str+="		  <th scope='col' id='td'>판매금액</th>";
						str+="		  <th scope='col' id='td'>구매건수</th>";
						str+="		  <th scope='col' id='td'>구매개수</th>";
					}else if(type == 3){
						str+="		  <th scope='col' id='td'>방문자수</th>";
						str+="		  <th scope='col' id='td'>페이지뷰</th>";
						str+="		  <th scope='col' id='td'>관심상품</th>";
					}else if(type == 4){
						str+="		  <th scope='col' id='td'>전체회원</th>";
						str+="		  <th scope='col' id='td'>신규회원</th>";
						str+="		  <th scope='col' id='td'>탈퇴회원</th>";
					}
					str+="		</tr>";
					str+="	</thead>";
					str+="	<tbody>";
					
					//최근 7일
					for(var a = 0; a < 7 ; a++){
						var now = new Date();
						var date = new Date(now.setDate(now.getDate()-a));
						var day = date.getDate();
						var month = date.getMonth();
						
						//1번째 버튼
						if(type == 1){
							recent = data.recent[a].tot_price; //판매금액 값(가공전)
							first = cal(Math.floor(recent*0.3)); //매출금액
							second = cal(recent); //판매금액
							third = cal(data.recentref[a].saleprice); //환불금액
						}
						//2번째 버튼
						else if(type == 2){
							recent = data.recent[a].tot_price; //판매금액 값(가공전)
							first = data.ordertot[a].ridx;
							second = cal(recent); //판매금액
							third = data.ordercount[a].depth;
						}
						//3번째 버튼
						else if(type == 3){
							
						}
						//4번째 버튼
						else if(type == 4){
							first = data.recentmem[a].midx;
							second = data.newmem[a].pidx;
							third = data.delmem[a].oidx;
						}
						
						str+="			<tr>";
						str+="				<td id='td'>";
						str+=				month+"/"+day;
						str+="				</td>";
						str+="				<td id='dd'>";
						str+=first;
						str+="				</td>";
						str+="				<td id='dd'>";
						str+=second;
						str+="				</td>";
						str+="				<td id='dd'>";
						str+=third;
						str+="				</td>";
						str+="			</tr>";
					}
					//7,15,30일
					for(var z = 7; z <10 ;z++){
						var days;
						if(type == 1){
							dayrecent = data.recent[z].tot_price //판매금액 값(가공전)
							dayfirst = cal(Math.floor(dayrecent*0.3)); //매출금액
							daysecond = cal(dayrecent); //판매금액
							daythird= cal(data.recentref[z].saleprice); //환불금액
						}else if(type == 2){
							dayrecent = data.recent[z].tot_price; //판매금액 값(가공전)
							dayfirst = data.ordertot[z].ridx;
							daysecond = cal(recent); //판매금액
							daythird = data.ordercount[z].depth;
						}else if(type == 3){
							
						}else if(type == 4){
							daysecond = data.newmem[z].pidx;
							daythird = data.delmem[z].oidx;
						}
						

						str+="			<tr id='sta'>";
						
						if(z == 7){days = 7;}
						else if(z == 8){days = 15;}
						else if(z == 9){days = 30;}
						
						//버튼 4 누를시 colspan
						if(type == 4){
							str+="				<td id='td' colspan='2'>";
							str+=days+"일합계";
							str+="				</td>";
						}else{
							str+="				<td id='td'>";
							str+=days+"일합계";;
							str+="				</td>";
							str+="				<td id='dd'>";
							str+=dayfirst;
							str+="				</td>";
						}
						str+="				<td id='dd'>";
						str+=daysecond;
						str+="				</td>";
						str+="				<td id='dd'>";
						str+=daythird;
						str+="				</td>";
						str+="			</tr>";
					}
					$("#price_table").html(str);
				
				}
			});
		}
		
		/* var one0 = document.getElementById("one0").value;
		var one1 = document.getElementById("one1").value;
		var one2 = document.getElementById("one2").value;
		var one3 = document.getElementById("one3").value;
		var one4 = document.getElementById("one4").value;
		var one5 = document.getElementById("one5").value;
		var one6 = document.getElementById("one6").value;
		var price0 =  document.getElementById("price0").value;
		var price1 =  document.getElementById("price1").value;
		var price2 =  document.getElementById("price2").value;
		var price3 =  document.getElementById("price3").value;
		var price4 =  document.getElementById("price4").value;
		var price5 =  document.getElementById("price5").value;
		var price6 =  document.getElementById("price6").value;
		var refund0 = document.getElementById("refund0").value;
		var refund1 = document.getElementById("refund1").value;
		var refund2 = document.getElementById("refund2").value;
		var refund3 = document.getElementById("refund3").value;
		var refund4 = document.getElementById("refund4").value;
		var refund5 = document.getElementById("refund5").value;
		var refund6 = document.getElementById("refund6").value; */
	
		var chart = c3.generate({
			bindto: "#linechart",
			data: {
				columns: [
					['매출', 0, 0, 0, 0, 0, 290502,1750400],
					['판매', 0, 0, 0, 0, 0, 968340,5834667],
					['환불', 0, 0, 0, 0, 0, 0,0]
				]
			}
		}); 
		
		function cal(num){
			let nums = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			return nums;
		}
		
		
		
	</script>
</html>