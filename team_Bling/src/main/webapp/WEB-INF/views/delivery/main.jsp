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
	section{
		max-width:1008px;
		margin:  0px auto;
	}
			
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div>
	주문내역
	</div>
	<div>
		<span>주문내역조회</span>
		<span>취소/반품/교환내역</span>
	</div>
	<div id="reviewList">
		<div id="btnNdate">
			<button type="button" class="btn" id="dateBtn1" onclick="day_fn('A')">전체주문처리상태</button>
			<button type="button" class="btn" id="dateBtn2" onclick="day_fn('B')">오늘</button>
			<button type="button" class="btn" id="dateBtn2" onclick="day_fn('C')">1주일</button>
			<button type="button" class="btn" id="dateBtn2" onclick="day_fn('D')">1개월</button>
			<button type="button" class="btn" id="dateBtn1" onclick="day_fn('E')">3개월</button>
			<button type="button" class="btn" id="dateBtn1" onclick="day_fn('F')">6개월</button>
			
			<input type="date" id="date1" value="" >
			~
			<input type="date" id="date2" value="" >
			<button class="btn" id="dateBtn1" onclick="day_fn('G')">조회</button>
		</div>
	</div>
	<div>
	기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
	주문번호를 클릭하면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
	취소/교환/반품 신청은 배송완요일 기준 7일까지 가능합니다.
	</div>
	<div>
		주문목록
	</div>
	<div>
		<table class="table">
			<thead>
				<tr>
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
				<tr>
					<td>
					2021-12-11<br>
					[441468484]
					</td>
					<td>
					<img src="">
					</td>
					<td>
						아르칸오일 반지<br>
						로즈골드 18k +10000
					</td>
					<td>2</td>
					<td>23,000원</td>
					<td>배송완료</td>
					<td>구매완료</td>
					<td><button>구매확정</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>

	
	
</script>
</html>