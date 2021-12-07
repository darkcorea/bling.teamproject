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
	
	.img{
		width:70px;
		height:70px;
	}
	
	.font14{
		font-size:14px;
		color:gray;
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
					<img src="/resources/image/${list.main}" class="img-thumbnail img">
					</td>
					<td>
						<b><c:out value="${list.pname}"/></b><br>
						<c:set value="${list.oname}"  var="oname"/>
						<c:set var = "oname1" value = "${fn:split(oname, '+')[0]}" />
						<span class="font14"><c:out value="${oname1}"/> </span>
						<c:if test="${list.count != 1}">
						<span class="font14">등 <c:out value="${list.count}"/>개</span>
						</c:if>
					</td>
					<td><b><c:out value="${list.quantitySum}"/></b></td>
					<td><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.tot_price}" />원</b></td>
					<td>
						<!-- 배송 상태 -->
						<c:if test="${list.deli_stat == 'A'}">
						<b>배송준비중</b>
						</c:if>
						<c:if test="${list.deli_stat == 'B'}">
						<b>배송중</b>
						</c:if>
						<c:if test="${list.deli_stat == 'C'}">
						<b>배송완료</b>
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
							<button>취소완료</button>
						</c:if>
						<!-- 환불이 되면 -->
						<c:if test="${list.refund == 'Y'}">
							<button>환불완료</button>
						</c:if>
						<!-- 배송 준비중이면 -->
						<c:if test="${list.deli_stat == 'A'}">
							<button>취소</button>
						</c:if>
						<!-- 배송 중이면 -->
						<c:if test="${list.deli_stat == 'B'}">
							 <button>교환/반품하기</button>
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
							 	<button onclick="confirm_fn(${list.order_idx})">구매확정</button>
							 		<!-- 교환이 완료가 되었으면 -->
							 		<c:if test="${list.exchange == 'Y'}">
							 			<br><button>교환완료</button>
							 		</c:if>
							 		<!-- 교환에 아무것도 없으면 -->
							 		<c:if test="${list.exchange == null}">
							 			<br><button>교환/반품하기</button>
							 		</c:if>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.pidx != null}">
							 			<br><button>리뷰쓰기</button>
							 		</c:if>
							 	</c:if>
							 	
							 	<!-- 구매 확정 버튼을 눌렀다면 -->
							 	<c:if test="${list.confirm_yn == 'Y'}">
							 	<span>구매완료</span>
							 		<!-- 리뷰를 쓰지 않았다면 -->
							 		<c:if test="${list.pidx != null}">
							 			<br><button>리뷰쓰기</button>
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
	 				location.reload();
	 			},error:function(){
	 				alert("구매확정 버튼 에러!")
	 			}
	 		});
	     }
	}
	
	
	
	
</script>
</html>