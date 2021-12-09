<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문확인 배송조회</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	/* 크기 */
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title{
		font-size:25px;
		font-weight:900;
	}
	/* 클래스 붙이면 문자 가운데 */
	.text_center{
		text-align:center;
	}
	/* 조회문자 */
	.title2{
		text-decoration: none;
		color:black;
	}	
	.title2:hover{
		color:#CB7878;
	}
	/* 조회문자 */
	.title3{
		text-decoration: none;
		color:#C4C4C4;
	}	
	.title3:hover{
		color: #CB7878;
	}
	/* 달력 크기 조절 */
	.calender{
		height:38px;
		vertical-align:middle;
		width:180px;
	}
	/* 설명문구 */
	#contents{
		text-align:center;
		color:#C4C4C4;
	}
	/* thead 테이블 모양 */
	#tr {
	 border-top:3px solid #C4C4C4;
	 border-bottom:3px solid #C4C4C4;
	 height:50px;
	 vertical-align:middle;
	 font-size: 18px;
	 color:#514F4F;
	}
	
	/* 이미지 크기 */
	.img{
		width:70px;
		height:70px;
	}
	
	.font14{
		font-size:14px;
		color:gray;
	}
	
	/* 배송조회, 배송중  */
	.deli{
		text-decoration-line: none;
		color: #000000;
	}
	
	.deli:hover{
		text-decoration-line: none;
		color: #989191;
	}
	
	/* 버튼 크기 */
	#btn_25{
		height:25px;
		padding-top:0px;
		padding-bottom:0px;
		margin-bottom:2px;
	}
	
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor: pointer;
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
	/* 모달창에 나오는 상품 이미지 크기  */
	.image_main{
		width:80px;
		height:80px;
	}
	.title {
		font-size:25px;
		font-weight:700;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div class="title text_center">주문내역</div><br>
	<div class="title text_center row">
		<div class="col"><a href="/Delivery/main.do" class="title3"><span>주문내역조회</span></a></div>
		<div class="col"><a href="/Delivery/main.do" class="title2"><span>취소/반품/교환내역</span></a></div>
	</div>
	<hr>
	<div id="reviewList">
		<div id="btnNdate">
			<button type="button" class="btn btn-outline-secondary" id="dateBtn1" onclick="day_fn('A')">전체주문처리상태</button>
			&ensp;&ensp;
			<button type="button" class="btn btn-outline-secondary" id="dateBtn2" onclick="day_fn('B')">오늘</button>
			<button type="button" class="btn btn-outline-secondary" id="dateBtn2" onclick="day_fn('C')">1주일</button>
			<button type="button" class="btn btn-outline-secondary" id="dateBtn2" onclick="day_fn('D')">1개월</button>
			<button type="button" class="btn btn-outline-secondary" id="dateBtn1" onclick="day_fn('E')">3개월</button>
			<button type="button" class="btn btn-outline-secondary" id="dateBtn1" onclick="day_fn('F')">6개월</button>
			&ensp;
			<input type="date" id="date1" class="calender" value="">
			~
			<input type="date" id="date2" class="calender" value="">&ensp;
			<button class="btn btn-dark" id="dateBtn1" onclick="day_fn('G')">조회</button>
		</div>
	</div><br><br>
	<div id="contents">
	기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
	주문번호를 클릭하면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
	취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.
	</div><br>
	<div class="title">
		주문목록
	</div>
	<div>
		<table class="table text_center" style="margin-top:15px;">
			<thead>
				<tr id="tr">
					<th>주문일자[주문번호]</th>
					<th>이미지</th>
					<th>상품명(옵션)</th>
					<th>수량</th>
					<th>상품구매금액</th>
					<th>배송상태</th>
					<th>구매상태</th>
					<th>취소/교환/반품</th>
				</tr>
			</thead>
			<tbody>
				<c:set value="0" var="order_idx"/>
				<c:forEach items="${list}" var="list">
				<tr style="vertical-align:middle;">
					<td>
					<c:set value="${list.rdate}" var="rdate"/>
					<b>${fn:substring(rdate,0,10)}<br>[<c:out value="${list.order_idx}"/>]</b>
					</td>
					<td>
					<img src="/resources/image/${list.main}" class="img-thumbnail img pointer" onclick="order_list(${list.order_idx})">
					</td>
					<td>
						<b  onclick="order_list(${list.order_idx})" class="pointer"><c:out value="${list.pname}"/></b><br>
						<c:set value="${list.oname}"  var="oname"/>
						<c:set var = "oname1" value = "${fn:split(oname, '+')[0]}" />
						<span class="font14 pointer"  onclick="order_list(${list.order_idx})"><c:out value="${oname1}"/> </span>
						<c:if test="${list.count != 1}">
						<span class="font14">등 <c:out value="${list.count}"/>개</span>
						</c:if>
					</td>
					<td><b><c:out value="${list.quantitySum}"/></b></td>
					<td><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.tot_price}" />원</b></td>
					<td>
						<!-- 배송 상태 -->
						<c:if test="${list.deli_stat == 'N'}">
						<b>입금 전</b>
						</c:if>
						<c:if test="${list.deli_stat == 'Y'}">
						<b>입금 완료</b>
						</c:if>
						<c:if test="${list.deli_stat == 'A'}">
						<b>배송준비중</b>
						</c:if>
						<c:if test="${list.deli_stat == 'B'}">
						<b><a class="deli" href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list.invoice_num}" target="_blank">배송중</a></b>
						</c:if>
						<c:if test="${list.deli_stat == 'C'}">
						<b><a class="deli" href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list.invoice_num}" target="_blank">배송완료</a></b>
						</c:if>
					</td>
					<td>
						<!-- 구매 상태  -->
						<c:if test="${list.cancel == 'N'}">
						<b>취소중</b>
						</c:if>
						<c:if test="${list.cancel == 'Y'}">
						<b>취소완료</b>
						</c:if>
						<c:if test="${list.refund == 'N'}">
						<b>환불중</b>
						</c:if>
						<c:if test="${list.refund == 'Y'}">
						<b>환불완료</b>
						</c:if>
						<c:if test="${list.exchange == 'N'}">
						<b>교환중</b>
						</c:if>
						<c:if test="${list.exchange == 'Y'}">
						<b>교환완료</b>
						</c:if>
						<c:if test="${list.exchange == null && list.cancel == null && list.refund == null}">
						<b>구매완료</b>
						</c:if>
					</td>
					<td>
						<!-- 구매 취소 교환 반품 버튼   -->
						<!--취소가 되면  -->
						<c:if test="${list.cancel == 'Y'}">
							<button id="btn_25" class="btn btn-outline-secondary">취소완료</button>
						</c:if>
						<!-- 환불이 되면 -->
						<c:if test="${list.refund == 'Y'}">
							<button id="btn_25" class="btn btn-outline-secondary">환불완료</button>
						</c:if>
						<!-- 입금이 완료 전이면-->
						<c:if test="${list.deli_stat == 'N'}">
							<button id="btn_25" class="btn btn-outline-secondary">취소</button>
						</c:if>
						<!-- 입금을 완료 하면-->
						<c:if test="${list.deli_stat == 'Y'}">
							<button id="btn_25" class="btn btn-outline-secondary">취소</button>
						</c:if>
						<!-- 배송 준비중이면 -->
						<c:if test="${list.deli_stat == 'A'}">
							<button id="btn_25" class="btn btn-outline-secondary">취소</button>
						</c:if>
						<!-- 배송 중이면 -->
						<c:if test="${list.deli_stat == 'B'}">
							 <button id="btn_25" class="btn btn-outline-secondary">교환/반품하기</button>
						</c:if>
						 
						 <!-- 배송 완료가 되고-->
						 <c:if test="${list.deli_stat == 'C'}">
						 	 <!-- 배송 완료 후 7일이 넘으면 -->
						 	 <c:if test="${list.date_differ > 7}">
							 <span>완료</span>
							 </c:if>
							 
							 <!-- 배송완료 후 7일이 넘지 않았으면  -->
							 <c:if test="${list.date_differ <= 7}">
							 	<!-- 구매 확정 버튼을 누르지 않았다면 -->
							 	<c:if test="${list.confirm_yn == 'N'}">
							 	<button id="btn_25" class="btn btn-outline-secondary" onclick="confirm_fn(${list.order_idx})">구매확정</button>
							 		<!-- 교환이 완료가 되었으면 -->
							 		<c:if test="${list.exchange == 'Y'}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary">교환완료</button>
							 		</c:if>
							 		<!-- 교환에 아무것도 없으면 -->
							 		<c:if test="${list.exchange == null}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary">교환/반품하기</button>
							 		</c:if>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.pidx != null}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary">리뷰쓰기</button>
							 		</c:if>
							 	</c:if>
							 	
							 	<!-- 구매 확정 버튼을 눌렀다면 -->
							 	<c:if test="${list.confirm_yn == 'Y'}">
							 	<span>구매완료</span>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.pidx != null}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary">리뷰쓰기</button>
							 		</c:if>
							 	</c:if>
							 </c:if>
						 </c:if>	
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
	
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>

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
</body>
<script>
	// 구매 확정 버튼을 눌렀을 떄
	function confirm_fn(order_idx){

		if (!confirm("구매를 확정 하시겠습니까?")) {
	     } else {
	    	 $.ajax({
	 			url:"/Delivery/confirm_fn.do",
	 			type:"POST",
	 			data:{"order_idx":order_idx},
	 			success:function(data){
	 				if(data != 0){
	 					let milege = Number(data).toLocaleString();
	 					alert(milege+"원이 적립되었습니다.");	
	 				}
	 				location.reload();
	 			},error:function(){
	 				alert("구매확정 버튼 에러!")
	 			}
	 		});
	     }
	}
	
	// 구매한 오더의 이미지나 상품명(옵션을 눌렀을 떄)
	function order_list(order_idx){	
		$.ajax({
			url:"/Delivery/order_list.do",
			type:"POST",
			data:{"order_idx":order_idx},
			async: false,
			success:function(data){
				console.log(data);
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
					str += " <img class='image_main' src='/resources/image/"+data[i].main+"'>";	
					str += "</td>";	
					str += "<td style='width:300px;'>";	
					str += "<span style='color:#CB7878;'><b>"+data[i].pname+"</b></span><br>";	
					var oname = data[i].oname.split("+")[0]
					str += " <span>"+oname+"</span>(수량: <span>"+data[i].quantity+"</span>)";	
					str += "</td>";	
					str += "</tr>";	
					str += "</table>";	
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