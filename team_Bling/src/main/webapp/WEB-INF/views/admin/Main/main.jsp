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
									<a href="/team_Bling/Ad_board/question_product.do?page=1&kind=Z"><c:out value="${proq }" /></a>건
								</td>
							</tr>
							<tr>
								<td>
									1:1문의
								</td>
								<td id="dd">
									<a href="/team_Bling/Ad_board/question.do?page=1&kind=G"><c:out value="${priq }"/></a>건
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<hr>
				<br>
				<div class="btn-group btn-group-sm d-md-flex justify-content-md-end" role="group" aria-label="Basic outlined example" id="groupbtn">
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(1);typealt(1);'>
						<b>판매매출(7일)</b>
						<br>
						<fmt:formatNumber value="${price[7].tot_price}"  pattern="#,###" />원
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(2);typealt(2);'>
						<b>주문(7일)</b>
						<br>
						${order[7].ridx}건
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(3);typealt(3);'>
						<b>방문자(7일)</b>
						<br>
						${visit[7].visit}명
					</button>
					<button type="button" class="btn btn-outline-secondary me-md-2" id="menubtn" onclick='price(4);typealt(4);'>
						<b>신규회원(7일)</b>
						<br>
						${newmem[7].pidx}명
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
		var arr1=[];
		var arr2=[];
		var arr3=[];
		var dayarr=[];
		var totalarr = [];
	
		$(function(){
			price(1);
			typealt(1);
		});
		
		function price(type){
			$.ajax({
				url:"/team_Bling/Ad_Main/price.do",
				type:"POST",
				data:{"type":type},
				dataType:'json',
				async: false,
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
					for(var a = 6; a >= 0 ; a--){
						var now = new Date();
						var date = new Date(now.setDate(now.getDate()-a));
						var day = date.getDate();
						var month = date.getMonth()+1;
						
						//1번째 버튼
						if(type == 1){
							recent = data.recent[a].tot_price; //판매금액 값(가공전)
							first = cal(Math.floor(recent*0.3)); //매출금액
							ffirst = Math.floor(recent*0.3);
							second = cal(recent); //판매금액
							ssecond = recent;
							third = cal(data.recentref[a].saleprice); //환불금액
							tthird = data.recentref[a].saleprice;
						}
						//2번째 버튼
						else if(type == 2){
							recent = data.recent[a].tot_price; //판매금액 값(가공전)
							first = cal(recent);//판매금액
							ffirst = recent;
							second = data.ordertot[a].ridx; 
							ssecond = (data.ordertot[a].ridx)*100000;
							third = data.ordercount[a].depth;
							tthird = (data.ordercount[a].depth)*100000;
						}
						//3번째 버튼
						else if(type == 3){
							first = data.visit[a].visit;
							ffirst = data.visit[a].visit;
							second = data.pageview[a].pageview;
							ssecond = data.pageview[a].pageview;
							third = data.attention[a].attention;
							tthird = data.attention[a].attention;
						}
						//4번째 버튼
						else if(type == 4){
							first = data.recentmem[a].midx;
							ffirst = data.recentmem[a].midx;
							second = data.newmem[a].pidx;
							ssecond = data.newmem[a].pidx;
							third = data.delmem[a].oidx;
							tthird = data.delmem[a].oidx;
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
						
						//값 배열로 넣음. 차트
						if(type == 1){arr1[0] = '매출';arr2[0] = '판매';arr3[0] = '환불';}
						else if(type == 2){arr1[0] = '판매금액';arr2[0] = '구매건수(*10만)';arr3[0] = '구매개수(*10만)';}
						else if(type == 3){arr1[0] = '방문자수';arr2[0] = '페이지뷰';arr3[0] = '관심등록';}
						else if(type == 4){arr1[0] = '전체회원';arr2[0] = '신규회원';arr3[0] = '탈퇴회원';}
						
						arr1[a+1] = ffirst;
						arr2[a+1] = ssecond;
						arr3[a+1] = tthird;
						dayarr[a] = month+"/"+day;
						
					}
					//4개 값 한배열로 넣음.
					totalarr = arr1.concat(arr2,arr3,dayarr);
					console.log(totalarr);
					
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
							dayfirst = cal(dayrecent);//판매금액
							daysecond = data.ordertot[z].ridx; 
							daythird = data.ordercount[z].depth;
						}else if(type == 3){
							dayfirst = data.visit[z].visit;
							daysecond = data.pageview[z].pageview;
							daythird = data.attention[z].attention;
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
							str+=days+"일합계";
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
			return totalarr;
		}
		
		//차트
		function typealt(type){
			totalarr = price(type);
			var chart = c3.generate({
				bindto: "#linechart",
				data: {
					columns: [
						[totalarr[0],totalarr[7],totalarr[6],totalarr[5],totalarr[4],totalarr[3],totalarr[2],totalarr[1]],
						[totalarr[8], totalarr[15], totalarr[14], totalarr[13], totalarr[12],totalarr[11],totalarr[10],totalarr[9]],
						[totalarr[16], totalarr[23], totalarr[22], totalarr[21],totalarr[20],totalarr[19],totalarr[18],totalarr[17]]
					]
				},
				axis:{
					x:{
						type:'category',
						categories:[totalarr[30],totalarr[29],totalarr[28],totalarr[27],totalarr[26],totalarr[25],totalarr[24]]
					}
				}
			}); 
		}
		
		//소수점 없애고 콤마찍기
		function cal(num){
			let nums = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			return nums;
		}
		
		
		
	</script>
</html>