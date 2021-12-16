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
<title>주문내역 취소/반품/교환내역</title>
<!-- SweetAlert2(alert,modal창) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	
	.title4{
		text-decoration: none;
		color: #CB7878;	
	}	
	.title4:hover{
		color:#C4C4C4;
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

	/* 모달 버튼 크기*/
	#modal_button1{
		background-color: #CB7878;
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
		
	/*  페이징 번호들을 붙이기 위해서 */
	.page-item {
		padding: 0px;
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
		<div class="col"><a href="/team_Bling/Delivery/main.do" class="title3"><span>주문내역조회</span></a></div>
		<div class="col"><a href="/team_Bling/Delivery/main1.do" class="title2"><span>취소/반품/교환내역</span></a></div>
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
	기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 취소/교환/반품내역을 조회하실 수 있습니다.<br>
	주문번호를 클릭하면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
	</div><br><br>
	<c:if test="${fn:length(list) == 0 }">
	<div class="title text_center">
		취소/교환/반품 내역이 없습니다.
	</div><br><br>
	</c:if>
	<c:if test="${fn:length(list) != 0 }">
	<div class="title">
		취소/교환/반품 내역
	</div>
	<div>
		<table class="table text_center" style="margin-top:15px;">
			<thead>
				<tr id="tr">
					<th style="width:180px;">주문일자[주문번호]</th>
					<th style="width:180px;">취소/교환/반품일자</th>
					<th style="width:80px;">이미지</th>
					<th style="width:230px;">상품명(옵션)</th>
					<th style="width:55px;">수량</th>
					<th>상품구매금액</th>
					<th>취소/교환/반품</th>
					
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
					<!-- 취소/교환/반품일자 -->
					<td>
					<c:set value="${list.rdate1}" var="rdate1"/>
					<span><b>${fn:substring(rdate1,0,10)}</b></span>
					</td>
					<!-- 이미지 -->
					<td>
					<img src="{cPath}/resources/image/${list.main}" class="img-thumbnail img pointer" onclick="order_list(${list.order_idx})">
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
					<!-- 수량 -->
					<td><b><c:out value="${list.quantitySum}"/></b></td>
					<!-- 상품 구매 금액 -->
					<td><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.tot_price}" />원</b></td>
					<!-- 구매 취소 교환 반품    -->
					<td>
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
				<a class='page-link' aria-label='Previous' href="/team_Bling/Delivery/main1.do?page=${prev}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
					<span aria-hidden='true' class='pointer' >&laquo;</span>
				</a>
			</li>
			</c:if>
			
			<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
			<c:set var="page" value="${pm.scri.page}"/>
			<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
				<c:if test = "${pageNum == page}">
				<li class="page-item active">	
					<a class="page-link pointer" href="/team_Bling/Delivery/main1.do?page=${pageNum}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
						<c:out value="${pageNum}"/>
					</a>
				</li>
				</c:if>
				<c:if test = "${pageNum != page}">
				<li class="page-item">	
					<a class="page-link pointer" href="/team_Bling/Delivery/main1.do?page=${pageNum}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
						<c:out value="${pageNum}"/>
					</a>
				</li>
				</c:if>
			</c:forEach>
			
			<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
			<c:if test="${pm.next && pm.endPage > 0}">
			<li class='page-item'>
				<a class='page-link' aria-label='Next' href="/team_Bling/Delivery/main1.do?page=${pm.endPage + 1}&kind=${pm.scri.kind}&rdate1=${pm.scri.rdate1}&rdate2=${pm.scri.rdate2}">
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


</body>
<script>

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
					str += "<a href='/team_Bling/Product/detail.do?pidx="+data[0].pidx+"'>"
					str += " <img class='image_main' src='/team_Bling/resources/image/"+data[i].main+"'></a>";	
					str += "</td>";	
					str += "<td style='width:300px;'>";
					str += "<a href='/team_Bling/Product/detail.do?pidx="+data[0].pidx+"' class='title4'>"
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
	
	
	// 버튼을 클릭하면 원하는 날짜에 맞는 배송정보 가져오기
	function day_fn(kind){
	 
	    let rdate1 = $("#rdate1").val();	
	    let rdate2 = $("#rdate2").val();

	    let frm = document.createElement("form");
		
		frm.name = "frm";
		frm.method = "post";
		frm. action = "/team_Bling/Delivery/main1.do";
		
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