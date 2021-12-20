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
<title>주문내역 배송조회</title>
<!-- SweetAlert2(alert,modal창) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--  스타일 분리 -->
<link rel="stylesheet" href="/team_Bling/css/deliveryMain.css">
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div class="title text_center">주문내역</div><br>
	<div class="title text_center row">
		<div class="col"><a href="/team_Bling/Delivery/main.do" class="title2"><span>주문내역조회</span></a></div>
		<div class="col"><a href="/team_Bling/Delivery/main1.do" class="title3"><span>취소/반품/교환내역</span></a></div>
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
			<input type="date" id="rdate1" class="calender" value="">
			~
			<input type="date" id="rdate2" class="calender" value="">&ensp;
			<button class="btn btn-dark" id="dateBtn1" onclick="day_fn('G')">조회</button>
		</div>
	</div><br><br>
	<div id="contents">
	기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
	주문번호를 클릭하면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
	취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.
	</div><br>
	<c:if test="${fn:length(list) == 0 }">
	<div class="title text_center">
		주문 목록이 없습니다.
	</div><br><br>
	</c:if>
	<c:if test="${fn:length(list) != 0 }">
	<div class="title">
		주문목록
	</div>
	<div>
		<table class="table text_center" style="margin-top:15px;">
			<thead>
				<tr id="tr">
					<th style="width:180px;">주문일자[주문번호]</th>
					<th style="width:80px;">이미지</th>
					<th style="width:230px;">상품명(옵션)</th>
					<th style="width:55px;">수량</th>
					<th style="width:132px;">상품구매금액</th>
					<th>배송상태</th>
					<th>구매상태</th>
					<th style="width:140px">취소/교환/반품</th>
				</tr>
			</thead>
			<tbody>
				<c:set value="0" var="order_idx"/>
				<c:forEach items="${list}" var="list">
				<tr style="vertical-align:middle;">
					<!-- 주문일자 -->
					<td>
					<c:set value="${list.rdate}" var="rdate"/>
					<span  onclick="order_list(${list.order_idx})" class="pointer deli"><b>${fn:substring(rdate,0,10)}<br>[<c:out value="${list.order_idx}"/>]</b></span>
					</td>
					<!-- 이미지 -->
					<td>
					<c:if test="${list.cuidx == 0 }">
						<img src="/team_Bling/resources/image/${list.main}" class="img-thumbnail img pointer" onclick="order_list(${list.order_idx})">
					</c:if>
					<c:if test="${list.cuidx != 0 }">
						<img src="/team_Bling/resources/usercustomizing/${list.main}" class="img-thumbnail img pointer" onclick="order_list(${list.order_idx})">
					</c:if>
					</td>
					<!-- 상품명 -->
					<td>
						<b  onclick="order_list(${list.order_idx})" class="pointer deli"><c:out value="${list.pname}"/></b><br>
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
						<c:if test="${list.cancel != 'Y' || list.refund == 'Y' || list.exchange == 'Y'}">
							<c:if test="${list.deli_stat == 'N'}">
							<b>입금 전</b>
							</c:if>
							<c:if test="${list.deli_stat == 'Y'}">
							<b>입금 완료</b>
							</c:if>
							<c:if test="${list.deli_stat == 'A'}">
							<b>배송 준비중</b>
							</c:if>
							<c:if test="${list.deli_stat == 'B'}">
							<b><a class="deli" href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list.invoice_num}" target="_blank">배송중</a></b>
							</c:if>
							<c:if test="${list.deli_stat == 'C'}">
							<b><a class="deli" href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list.invoice_num}" target="_blank">배송완료</a></b>
							</c:if>
						</c:if>
						<c:if test="${list.cancel == 'Y'}">
						<b>취소완료</b>
						</c:if>
						<c:if test="${list.refund == 'Y'}">
						<b>환불완료</b>
						</c:if>
						<c:if test="${list.exchange == 'Y'}">
						<b>교환완료</b>
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
							<span>취소완료</span>
						</c:if>
						<!-- 환불이 되면 -->
						<c:if test="${list.refund == 'Y'}">
							<span>환불완료</span>
						</c:if>
						<!-- 환불이 되면 -->
						<c:if test="${list.exchange == 'Y'}">
							<span>교환완료</span>
						</c:if>
						<!-- 입금이 완료 전이면-->
						<c:if test="${list.deli_stat == 'N' && list.cancel == null}">
							<button id="btn_25" class="btn btn-outline-secondary" onclick="Return_now(${list.order_idx})">취소</button>
						</c:if>
						<!-- 입금을 완료 하면-->
						<c:if test="${list.deli_stat == 'Y' && list.cancel == null}">
							<button id="btn_25" class="btn btn-outline-secondary" onclick="Return_now(${list.order_idx})">취소</button>
						</c:if>
						<!-- 배송 준비중이면 아무것도 안나타남  -->
						<!-- 배송 중이면 아무것도 안나타남-->
						 
						 <!-- 배송 완료가 되고-->
						 <c:if test="${list.deli_stat == 'C'}">
						 	 <!-- 배송 완료 후 7일이 넘으면 -->
						 	 <c:if test="${list.date_differ > 7}">
							 <span>완료</span>
							 </c:if>
							 
							 <!-- 배송완료 후 7일이 넘지 않았으면  -->
							 <c:if test="${list.date_differ <= 7}">
							 	<!-- 구매 확정 버튼을 누르지 않았다면 -->
							 	<c:if test="${list.confirm_yn == 'N' && list.refund == null && list.exchange == null && list.cancel == null}">
							 	<button id="btn_25" class="btn btn-outline-secondary" onclick="confirm_fn(${list.order_idx})">구매확정</button>
							 		<!-- 교환이 완료가 되었으면 -->
							 		<c:if test="${list.exchange == 'Y'}">
							 			<br><span>교환완료</span>
							 		</c:if>
							 		<c:if test="${list.refund == 'Y'}">
							 			<br><span>반품완료</span>
							 		</c:if>
							 		<!-- 교환 반품에 아무것도 없으면 -->
							 		<c:if test="${list.exchange == null && list.refund == null}">
							 			<br><button id="btn_25" class="btn btn-outline-secondary" onclick="Return(${list.order_idx},'D')">교환/반품</button>
							 		</c:if>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.ridx == null || list.ridx == 0 && list.exchange == null && list.refund == null}">
							 			<!-- 구매한 옵션의 갯수가 1개라면 리뷰 1개 -->
								 		<c:if test="${list.count == 1}">
								 			<br><button id="btn_25" class="btn btn-outline-secondary" data-bs-toggle='modal' data-bs-target='#staticBackdrop1' onclick='detailIdx(${list.detail_idx})'>리뷰쓰기</button>
								 		</c:if>
								 		<!-- 주문할 떄 옵션이 1개아 아니라 여러개 라면  리뷰 여러개 -->
								 		<c:if test="${list.count != 1}">
								 			<br><button id="btn_25" class="btn btn-outline-secondary" onclick="review_writed(${list.order_idx})">리뷰쓰기</button>
								 		</c:if>
								 	</c:if>
							 	</c:if>
							 	
							 	<!-- 구매 확정 버튼을 눌렀다면 -->
							 	<c:if test="${list.confirm_yn == 'Y'}">
							 	<span>구매완료</span>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.ridx == null || list.ridx == 0}">
							 			<!-- 구매한 옵션의 갯수가 1개라면 리뷰1개를 달 수 있다 -->
								 		<c:if test="${list.count == 1}">
								 			<br><button id="btn_25" class="btn btn-outline-secondary" data-bs-toggle='modal' data-bs-target='#staticBackdrop1' onclick='detailIdx(${list.detail_idx})'>리뷰쓰기</button>
								 		</c:if>
								 		<!-- 주문할 떄 옵션이 1개가 아니라 여러개 라면  리뷰 여러개를 달 수 있다.-->
								 		<c:if test="${list.count != 1}">
								 			<br><button id="btn_25" class="btn btn-outline-secondary" onclick="review_writed(${list.order_idx})" >리뷰쓰기</button>
								 		</c:if>
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
	<!-- 페이징 바 뿌려주기 -->
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center">
			<!-- 앞으로  가기 버튼 , 키워드 유지하면서 이동하기 -->
			<c:if test="${pm.prev == true}">
			<li class='page-item'>
			<c:set var="prev" value="${pm.startPage -1}"/>
				<a class='page-link' aria-label='Previous' href="/team_Bling/Delivery/main.do?page=${prev}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
					<span aria-hidden='true' class='pointer' >&laquo;</span>
				</a>
			</li>
			</c:if>
			
			<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
			<c:set var="page" value="${pm.scri.page}"/>
			<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
				<c:if test = "${pageNum == page}">
				<li class="page-item active">	
					<a class="page-link pointer" href="/team_Bling/Delivery/main.do?page=${pageNum}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
						<c:out value="${pageNum}"/>
					</a>
				</li>
				</c:if>
				<c:if test = "${pageNum != page}">
				<li class="page-item">	
					<a class="page-link pointer" href="/team_Bling/Delivery/main.do?page=${pageNum}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
						<c:out value="${pageNum}"/>
					</a>
				</li>
				</c:if>
			</c:forEach>
			
			<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class='page-item'>
				<a class='page-link' aria-label='Next' href="/team_Bling/Delivery/main.do?page=${pm.endPage + 1}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
					<span aria-hidden='true' class='pointer'>&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
	</c:if>

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
				<div id="textArea1_cnt">0/500</div>
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
<!-- 리뷰 여려개 달기 모달창  -->
<div class="modal fade" id="review_write" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title">리뷰를 달 수 있는 상품</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div id="review_write1" style="margin-left:135px;">
      	</div>
      </div>
      <div class="modal-footer" id="delivery_select2">
        <button type="button" class="btn btn-secondary" id="modal_button1" data-bs-dismiss="modal" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 구메교환 반품하기  -->
<div class="modal fade" id="Return" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교환/반품/취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     	 <table>
      		<tr style="height:60px;">
      			<td style="width:140px;" class="text_center"><b>교환/반품/취소</b></td>
      			<td>
      				<select style="width:140px;" name="type" id="re_selected">
	      				<option value="D">교환</option>
	      				<option value="E">반품</option>
	      				<option value="F">취소</option>
					</select>
					<span id="content_10" style="color:red;displayn:nonn;">10자이상을 입력해주세요</span>
      			</td>
      		</tr>
      		<tr>
      			<td class="text_center"><b>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유</b></td>
      			<td><textarea id="content" rows="10" cols="60" name="content" placeholder="최소 10자를 입력해 주세요"></textarea>
      			<div id="content_cnt">(0 / 500)</div>
      			<input type="hidden" id="re_order_idx" style="display:none;">
      			</td>
      		</tr>
      	</table>
      	<!-- 취소,교환,반품을 고르면 자세한 설명 나오는 곳 -->
      	<div id="re_select" class="text_center">
      	<hr>
      	<b>교환 / 반품 / 취소는 관리자 확인 후 진행됨을 알려드립니다. <br>
      	빠른 시일 내로 처리해 드리곘습니다.</b>
      	</div>
      </div>
      <div class="modal-footer" id="delivery_select2">
        <button type="button" class="btn btn-secondary" id="modal_button1" onclick="return_delivery1()">확인</button>&nbsp;
        <button type="button" class="btn btn-outline-secondary" id="modal_button2" data-bs-dismiss="modal" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
$(document).ready(function() {
    
    // 글자수 500자로 제한
    $('#content').on('keyup', function() {
        $('#content_cnt').html("(<b>"+$(this).val().length+"</b> / 500)");
 
        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('#content_cnt').html("(<b>500</b> / 500)");
        }
    });
    
	 // 글자수 500자로 제한
    $('#textArea1').on('keyup', function() {
        $('#textArea1_cnt').html("(<b>"+$(this).val().length+"</b> / 500)");

        if($(this).val().length > 500) {
            $(this).val($(this).val().substring(0, 500));
            $('#textArea1_cnt').html("(<b>500</b> / 500)");
        }
    });
 
 
});


	// 구매 확정 버튼을 눌렀을 떄
	function confirm_fn(order_idx){

		if (!confirm("구매를 확정 하시겠습니까?")) {
	     } else {
	    	 $.ajax({
	 			url:"/team_Bling/Delivery/confirm_fn.do",
	 			type:"POST",
	 			data:{"order_idx":order_idx},
	 			success:function(data){
	 				if(data != 0){
	 					// 가격단위 콤마 찍기
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
			url:"/team_Bling/Delivery/order_list.do",
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
					
					if(data[i].cuidx == 0){
						str += "<a href='/team_Bling/Product/detail.do?pidx="+data[i].pidx+"'>"
						str += " <img class='image_main' src='/team_Bling/resources/image/"+data[i].main+"'></a>";	
						str += "</td>";	
						str += "<td style='width:300px;'>";
						str += "<a href='/team_Bling/Product/detail.do?pidx="+data[i].pidx+"' class='title4'>";
						str += "<span><b>"+data[i].pname+"</b></span></a><br>";	
					}else if(data[i].cuidx != 0 || data[i].cuidx != null){
						str += "<a href='/team_Bling/Custom/list.do'>"
						str += " <img class='image_main' src='/team_Bling/resources/usercustomizing/"+data[i].main+"'></a>";
						str += "</td>";	
						str += "<td style='width:300px;'>";
						str += "<a href='/team_Bling/Custom/list.do' class='title4'>";
						str += "<span><b>"+data[i].pname+"</b></span></a><br>"
					}
					
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
	
	// 리뷰 쓰기 전에 detail_idx값을 넘겨준다
	function detailIdx(detail_idx){
	    $('#textArea1_cnt').html("(0 / 500)");
		$.ajax({
			url: "/team_Bling/MyPage/detailIdx.do",
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
	
	// 리뷰 쓰기 전에 detail_idx값을 넘겨준다. 모달창 닫기 오류 때문에
	function detailIdx1(detail_idx){
		
		$.ajax({
			url: "/team_Bling/MyPage/detailIdx.do",
			type: "post",
			data: "detail_idx="+detail_idx,
			ContentType: "json",
			success: function(data){
				
			},
			error: function(){
				alert("detai_idx 넘기기 에러");
			}
		});
		$("#review_write").modal("hide");
	    $('#textArea1_cnt').html("(0 / 500)");
		$("#staticBackdrop1").modal("show");
	}
	
	// 리뷰 쓰기 
	function reviewWrite(){

		let starRating = document.querySelector("input[name='rating']:checked");
		let grade = "";
		let contents = "";
		
		if(starRating != null){
			grade = starRating.value;
			contents = contentsCheck();
			if(contents == ""){
				return ;
			}
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
			url: "/team_Bling/MyPage/reviewWrite.do",
			type: "post",
			data: "contents="+contents+"&grade="+grade,
			ContentType: "json",
			success: function(data){
				$("#staticBackdrop1").modal("hide");
				alert("리뷰가 작성되었습니다.");
				location.reload();
				
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
	
	function uploadFile(){
		let files = document.querySelector("input[name='uploadBtn']").files;
		
		let image1 = files[0];
		let image2 = files[1];
		
		let formData = new FormData();
		formData.append("image1", image1);
		formData.append("image2", image2);
		
		$.ajax({
			url: "/team_Bling/MyPage/upload.do",
			type: "post",
			data: formData,
		    dataType: "text",
		    processData: false,
		    contentType: false,
		    success: function(data){
		    	if(data == "true"){
		    		console.log("파일 업로드 성공");
		    	}
		    	else if(data == "false"){
		    		console.log("지정된 이미지 파일이 아닙니다.");
		    		console.log("파일 업로드 실패");
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
		}
		else if(textArea1 == null){
			Swal.fire({
				icon: 'error',
				title: '내용을 입력해주세요!',
				text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
			});
			modalReset();
		}	
		return contents;
	}
	
	// 구매한 옵션이 여러개 라면
	function review_writed(order_idx){
		
		$.ajax({
			url: "/team_Bling/Delivery/order_list.do",
			type: "post",
			data: {"order_idx":order_idx},
            success: function(data){
            	
            	let str = "";
            	// 상품에 대한 정보 뿌려 주기
				for(let i=0; i<data.length; i++){	
					str += "<div style='margin-top:30px;'>";	
					str += "<table>";	
					str += "</tr>";
					str += "<td style='width:150px;'>";
					str += "<a href='/team_Bling/Product/detail.do?pidx="+data[i].pidx+"'>"
					str += "<img class='image_main' src='/team_Bling/resources/image/"+data[i].main+"'></a>";	
					str += "</td>";	
					str += "<td style='width:300px;'>";	
					str += "<a href='/team_Bling/Product/detail.do?pidx="+data[i].pidx+"' class='title4'>"
					str += "<span><b>"+data[i].pname+"</b></span></a><br>";	
					var oname = data[i].oname.split("+")[0]
					str += " <span>"+oname+"</span>(수량: <span>"+data[i].quantity+"</span>)";	
					str += "</td>";	
					if(data[i].ridx == null || data[i].ridx == 0){
						str += "<td>";
						str += "<button id='btn_25' class='btn btn-outline-secondary' onclick='detailIdx1("+data[i].detail_idx+")'>리뷰쓰기</button>";
						str += "<td>";
					}
					if(data[i].ridx != null && data[i].ridx != 0){
					    str += "<td>";
						str += "<span>리뷰작성완료</span>";
						str += "<td>";
					}
					str += "</tr>";
					str += "</table>";
					str += "</div>";
				}
            	
				$("#review_write1").html(str);
            	$("#review_write").modal("show");
            },
			error: function(){
				alert("리뷰 여러개 작성 오류");
			}
		});
	}
	
	// 배송 전에 상품 취소 버튼을 누르면
	function Return_now(order_idx){
	
	 if (confirm("주문한 상품을 취소하시겠습니까?") == true) {
            
		 $.ajax({
				url: "/team_Bling/Delivery/return_now.do",
				type: "post",
				data: {"order_idx":order_idx},
	            success: function(data){
					if (data !=0 ){
						// 가격단위 콤마 찍기
						let milege = Number(data).toLocaleString();
						alert("구매한상품을 취소 하셨습니다 /n 사용하신 마일리지 "+milege+"원이 적립되었습니다.");
						location.reload();
					}
					alert("구매한 상품을 취소하셨습니다");
					location.reload();
	            },
				error: function(){
					alert("주문 취소 오류");
				}
			});
        }

		
	}
	
	// 상품  교환, 반품, 취소  하기 버튼을 누르면
	function Return(order_idx,type){
		$("#content").val("");
		$("#content_cnt").html("(0 / 500)");
		$("#content_10").hide();
		
		//들어오는 타입이 F이면 취소, D이면 교환 셀렉트 선택
		if(type == 'F'){
		    $("#re_selected").val("F").prop("selected", true);
		}
		if(type == 'D'){
		    $("#re_selected").val("D").prop("selected", true);
		}
		// order_idx값 숨기고 모달창 열기 
		$("#re_order_idx").val(order_idx);
		$("#Return").modal("show");
	}
	
	// 교환/반품/취소 모달창에서 내용을 입력하고 확인을 눌렀을 떄
	function return_delivery1(){
	    
	   let order_idx = $("#re_order_idx").val();
	   let category = $("#re_selected").val();
	   let content = $("#content").val();
	   
	   // 글자수가 10글자보다 작으면 경고문자 나오고 강조하기
	   if (content.length < 10){
	       $("#content_10").show();
	       $("#content").focus();
	   }else {
	       
	       $.ajax({
			url: "/team_Bling/Delivery/return_delivery.do",
			type: "post",
			data: {"order_idx":order_idx, "category":category,"content":content},
			ContentType: "json",
			success: function(data){
			
				$("#Return").modal("hide");
				
				if(category == "D"){
				    alert("상품 교환이 접수되었습니다.");
				}
				if(category == "E"){
				    alert("상품 반품이 접수되었습니다.");
				}
				if(category == "F"){
				    alert("상품 취소가 접수되었습니다.");
				}
				location.reload();
			    
			},
			error: function(){
			    alert("상품 취소/교환/반품 오류");
			}
			});
	   }
	}
	
	// 버튼을 클릭하면 원하는 날짜에 맞는 배송정보 가져오기
	function day_fn(kind){
	 
	    let rdate1 = $("#rdate1").val();	
	    let rdate2 = $("#rdate2").val();

	    let frm = document.createElement("form");
		
		frm.name = "frm";
		frm.method = "post";
		frm. action = "/team_Bling/Delivery/main.do";
		
	    let input1 = document.createElement("input");
		    input1.setAttribute("type","hidden");
		    input1.setAttribute("name","kind");
		    input1.setAttribute("value",kind);
	    let input2 = document.createElement("input");
		    input2.setAttribute("type","hidden");
		    input2.setAttribute("name","rdate1");
		    input2.setAttribute("value",rdate1);
	    let input3 = document.createElement("input");
		    input3.setAttribute("type","hidden");
		    input3.setAttribute("name","rdate2");
		    input3.setAttribute("value",rdate2);
	    let input4 = document.createElement("input");
		    input4.setAttribute("type","hidden");
		    input4.setAttribute("name","page");
		    input4.setAttribute("value",1);
		
		if(rdate1 == "" && rdate2 != "" && kind == "G"){
			alert("날짜를 입력해 주세요");
	    }else if(rdate1 != "" && rdate2 == ""  && kind == "G"){
			alert("날짜를 입력해 주세요");
	    }else if( kind != "G"){
			frm.appendChild(input1);
		    frm.appendChild(input4);
		    document.body.appendChild(frm);
			frm.submit();
		
	    }else{
			frm.appendChild(input1);
		    frm.appendChild(input2);
		    frm.appendChild(input3);
		    frm.appendChild(input4);
			document.body.appendChild(frm);
			frm.submit();
	    }
	}
	
	// 달력에 값 입력하기
	function rdate(){
	    let rdate1 = "<c:out value='${pm.scri.rdate1}'/>";
	    let rdate2 = "<c:out value='${pm.scri.rdate2}'/>";

	    if(rdate1 != ""){
			$("#rdate1").val(rdate1);
			$("#rdate2").val(rdate2);
	    }
	}
	rdate();
	
</script>
</html>