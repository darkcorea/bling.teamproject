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
<!-- SweetAlert2(alert,modal창) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		        display: inline-block;
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
		
		/* modal 2 */
		#rvPicDiv{
			width: 465px;
			height: 100px;
		}
		#rvPic1,#rvPic2{
			width: 100px;
			height: 100px;
			display: inline-block;
		}
		img{
			vertical-align: baseline !important;
		}
		.rvImg{
			width: 100%;
			height: 100%;
		}
		#prodData{
			width: 465px;
			height: 80px;
			display: inline-block;
		}
		#prodPic{
			width: 100px;
			height: 100px;
			display: inline-block;
		}
		#prodImg{
			width: 100%;
			height: 100%;
		}
		#prodDetail{
			width: 170px;
			height: 100px;
			display: inline-block;
		}
		#prodName{
			font-weight: bold;
		}
		#prodOption{
			color: #CB7878;
		}
		#prodQty{
			color: #CB7878;
		}
		#starRating{
			display: inline-block;
		}
		.bi-star{
			font-size: 20px;
		}
		.bi-star-fill{
			color: #FF3A00;
			font-size: 20px;
		}
	
	/* modal - star rating */
		.rating {
		    display: flex;
		    flex-direction: row-reverse;
		    justify-content: center
		}
		.rating>input {
		    display: none
		}
		.rating>label {
		    position: relative;
		    width: 1em;
		    font-size: 2vw;
		    color: #FF3A00;
		    cursor: pointer
		}
		.rating>label::before {
		    content: "\2605";
		    position: absolute;
		    opacity: 0
		}
		.rating>label:hover:before,
		.rating>label:hover~label:before {
		    opacity: 1 !important
		}
		.rating>input:checked~label:before {
		    opacity: 1
		}
		.rating:hover>input:checked~label:before {
		    opacity: 0.4
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
							 		<c:if test="${list.ridx == null}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary" data-bs-toggle='modal' data-bs-target='#staticBackdrop1' onclick='detailIdx(${list.detail_idx})'>리뷰쓰기</button>
							 		</c:if>
							 	</c:if>
							 	
							 	<!-- 구매 확정 버튼을 눌렀다면 -->
							 	<c:if test="${list.confirm_yn == 'Y'}">
							 	<span>구매완료</span>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.ridx == null}">
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

<!-- 리뷰 작성 Modal -->
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">리뷰 작성</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="modalReset()"></button>
		</div>
		
		<div class="modal-body">
			<div id="modalText1">상품은 만족하셨나요?</div>
			<form id="modalForm">				
				<!-- star_rating -->
				<div class="rating">
					<input type="radio" name="rating" value="5" id="5" class="star">
						<label for="5">☆</label> 
					<input type="radio" name="rating" value="4" id="4" class="star">
						<label for="4">☆</label> 
					<input type="radio" name="rating" value="3" id="3" class="star">
						<label for="3">☆</label> 
					<input type="radio" name="rating" value="2" id="2" class="star">
						<label for="2">☆</label> 
					<input type="radio" name="rating" value="1" id="1" class="star">
						<label for="1">☆</label>
				</div>
				<br>
				<textarea id="textArea1" placeholder="상품에 대한 후기를 남겨 주세요.&#13;&#10;사진은 2장까지 첨부 가능합니다."></textarea>
				<br>
			</form>
			<form id="pictureForm">
				<div id="uploadDiv">
				<!-- 파일을 업로드할 영역 -->
					<input type="file" id="uploadBtn" name="uploadBtn" multiple accept=".jpg, .jpeg, .png" onchange="uploadFile()">
					<label for="uploadBtn" class="fileBtn btn">
						<span id="fileBtnText">
							<i class="bi bi-camera"></i>사진 첨부하기
						</span>
					</label>
					<span id="fileName"></span>
				</div>
			</form>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal" onclick="modalReset()">닫기</button>
			<button type="button" class="btn btn-primary" id="saveBtn" data-bs-dismiss="modal" onclick="javascript:reviewWrite(); modalReset();">저장</button>
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
	
	// 리뷰 쓰기 전에 detail_idx값을 넘겨준다
	function detailIdx(detail_idx){
		
		$.ajax({
			url: "/MyPage/detailIdx.do",
			type: "post",
			data: "detail_idx="+detail_idx,
			ContentType: "json",
			success: function(data){
				
			},
			error: function(){
				alert("detai_idx 넘기기 에러");
			}
		});
	}
	
	// 모달 쓰기 
	function reviewWrite(){

		let starRating = document.querySelector("input[name='rating']:checked");
		let grade = "";
		let contents = "";
		
		if(starRating != null){
			grade = starRating.value;
			contents = contentsCheck();
		}
		else if(starRating == null){
			Swal.fire({
				icon: 'error',
				title: '별점을 선택해주세요!',
				text: '별점은 1점부터 5점까지 선택 가능합니다.',
			});
			modalReset();
		}
		
		
		$.ajax({
			url: "/MyPage/reviewWrite.do",
			type: "post",
			data: "contents="+contents+"&grade="+grade,
			ContentType: "json",
			success: function(data){
				console.log("리뷰작성 성공");
				console.log(grade);
				window.location.replace("/MyPage/main.do?page=1");
			},
			error: function(){
				console.log("!!!!!리뷰작성 에러!!!!!");
			}
		});
	}
	
	// 모달 새로 키면 내용 리셋
	function modalReset(){
		document.querySelector("form[id='modalForm']").reset();
		document.querySelector("form[id='pictureForm']").reset();
	}
	
	// 리뷰 창 새로 키면 사진 업로드 리셋 
	function pictureReset(){
		document.querySelector("form[id='pictureForm']").reset();
	}
	
	// 파일 업르도 
	function uploadFile(){
		let files = document.querySelector("input[name='uploadBtn']").files;
		
		let image1 = files[0];
		let image2 = files[1];

		let formData = new FormData();
		formData.append("image1", image1);
		formData.append("image2", image2);
		
		$.ajax({
			url: "/MyPage/upload.do",
			type: "post",
			data: formData,
            dataType: "text",
            processData: false,
            ContentType: false,
            success: function(data){
            	if(data == "true"){
            		console.log("파일 업로드 성공");
            	}
            	else if(data == "false"){
            		Swal.fire({
						icon: 'error',
						title: '지정된 이미지 파일이 아닙니다!',
						text: 'jpg, jpeg, png 파일만 선택 가능합니다.',
					});
            		pictureReset();
            	}
            }
		});
	}
	
	// 리뷰 내용 체크 
	function contentsCheck(){
		let textArea1 = document.querySelector("textarea").value;
		let contents = "";
		
		if(textArea1 != null){
			contents = textArea1;
			if(contents.length<10){
				contents = "";
				Swal.fire({
					icon: 'error',
					title: '내용을 입력해주세요!',
					text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
				});
			}
			else if(contents.length>500){
				contents = "";
				Swal.fire({
					icon: 'error',
					title: '내용을 입력해주세요!',
					text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
				});
			}
			else if(contents.length>=10 && contents.length<=500){
				
			}
		}
		else if(textArea1 == null){
			Swal.fire({
				icon: 'error',
				title: '내용을 입력해주세요!',
				text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
			});
			console.log("내용을 입력해주세요.");
			modalReset();
		}	
		return contents;
	}
	
	
</script>
</html>