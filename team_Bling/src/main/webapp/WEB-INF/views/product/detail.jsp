<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 상세페이지</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
   /* 메인 페이지 설정   */
	section {
		width:1008px;
		/* height:20000px; */
		/* border:1px solid black; */
		margin:5px auto;
	}
	
	/* 폰트사이즈  */
	.font12 {
		font-size:12px;
	}
	
	/* 아이콘 크기 등 설정 */
	.size27 {
		height:27px;
		width:27px;
	}
	
	.size25 {
		height:25px;
		width:25px;
	}
	
	
	/* 상품 이미지, 옵션 , 가격, 결제, 장바구니 */
	.explan {
		height:680px;
	}
	
	/* 보여지는 이미지 틀*/
	.explan .image1 {
		width:490px;
		height:630px;
		margin:20px 6px;
		float: left;
	}
	
	/* 커다란 이미지 */
	.explan .image1 .image2 {
		width:490px;
		height:490px;
		margin-bottom: 15px ;
	}
	
	/* 작은 이미지들 1~4 */
	.explan .image1 .image3 {
		width:100px;
		height:100px;
		float: left;
		margin: 5px;
	}
	
	/* 이미지 옆에 이름, 옵션, 가격, 결제, 장바구니 버튼등의 큰들*/
	.explan .text1 {
		width:490px;
		height:630px;
		margin:20px 3px;
		float: left;	
	}
	
	/* 이름, 옵션 나오는 곳*/
	.explan .text1 .text2 {
		width:468px;
		height:480px;
		float: right;
	
	}
	
	/* 상품명 위에 있는 커다란 선 */
	.explan .myhr {
		background-color: black;
 		height: 3px;
 		margin:0px 0px 10px 0px;
	}
	
	/* 가격, 옵션 텍스트 */
	.select .select-text, .explan .text2 .price1{
		float: left;
	}
	
	/* 옵션 드롭 셀릭트 박스  */
	.select .form-select {
		width:70%;
	}
	
	/* 옵션을 선택하면 표시되는 곳 */
	.explan .text1 .text2 .select-result{
		width:100%;
		height:270px;
		overflow:auto;
	}
	
	/* 옵션에 선택시 나오는 박스 크기 */	
	.option_box{
		width:100%;
		height:45px;
		padding-top:3px;
		border-bottom:1px solid #BEB5B5;
	}
	
	/* 옵션 선택 박스 안에 있는 테이블 크기*/
	.option_tb1 {
		width:220px;
	}
	
	/* 옵션의 숫자를 조절 하는 단추 컨트롤러 */
	.option_tb2 {
		width:100px;
		text-align:light;
	}
	
	/* 선택한 옵션들에 대한 종합 가격 */
	.explan .text1 .text2 .select-price{
		text-align:right;
		height:30px;
		margin: 5px 70px 10px 0px;
		
	}

	/* 버튼들 위치 가운데 */
	.explan .text2 .btn-two {
		text-align:center;
	}
	
	/* 바로구매 버튼 */
	.explan .text2 .btn-two .btn-danger {
		background-color: #CB7878;
		border: 1px solid #CB7878;
		width: 160px;
	}
	
	
	/* 장바구니 버튼 */
	.explan .text2 .btn-two .btn-light {
		width: 160px;
	}
	
	/* 하트 아이콘  */
	.bi-suit-heart,  .bi-suit-heart-fill {
		font-size:25px;
		color:red;
	}
	
	/* explan밑에 있는 hr줄의 마진  */
	.explan-bottom {
		margin-bottom: 50px;
	}

	/* 상세정보 후기 상품문의 구매가이드  바*/
	.detail-nav {
		text-align:center;
		font-size:20px;
		margin: 20px auto;
		padding: 20px;
		border-bottom:1px solid #BEB5B5;
	}
	
	/* 상세정보, 후기, 상품문의, 구매가이드  */
	.detail-nav-1{
		margin:20px;
	}
    
    /* 예비 클래스 3개 */
    .detail-nav-2, .detail-nav-3, .detail-nav-4{

	}
    
    /* 상세정보, 후기, 상품문의, 구매가이드 각각 아래 발간색 줄 */
    #move_info, #move_review, #move_question, #move_giude {
   		border: #CB7878 solid;
    	border-width: 0 0 10px 0;
    }
    
	/* 상세정보 이미지 가운데로 */
	.detail-image, .detail-guide {
		text-align:center;	
	}
	
	/* 평점 평균, 개별 평점, 사진10개 */
	.detail-review-view {
		width:990px;
		height:250px;
		margin: 5px auto;
	/*	border:1px solid black; */	
		padding:20px;
	}
	
	/* 평점 평균 나오는곳 과 전체리뷰 수*/
	.detail-review-view .review-average{
		width:125px;
		height:125px;
		float: left;
		text-align:center;
		margin:50px 50px;
	}
	
	/* 평점평균 나오는 곳 */
	.detail-review-view .review-average .review-average1{
		width:125px;
		height:100px;
		background-color:black;
		color:white;
		font-size:65px;
	}
		
	/* 개별 평점 */
	.detail-review-view .review-score{
		float: left;
		width:200px;
		height:150px;
		margin-top:37px;	
	}
	
	/* 평점 안에 들어가 있는 prograce 바 */
	.review-score .file{
		height:16px;
		vertical-align:middle;
	}
	
	/* 이미지 10개 틀 */
	.detail-review-view .review-image{
		width:500px;
		height:200px;
		float: right;
		margin:0px;
	}
	
	/* 후기 개별 이미지들, 리뷰 이미지 2개 */
	.review-image1 {
		width:90px;
		height:90px;
		float: left;
		margin: 3px;
	}
	
	/* 리뷰 리스트 테이블 */
	#review_table{
		width:986;
		/* height:440px; */
		margin: 5px auto;
	/*	border:1px solid black; */
	}
	
	/* 각 리뷰들의 높이 */
	.review_tr {
		height:120px;
		font-size:15px;
	}
	
	/* 리뷰 안에 들어가는 별의 크기와 색깔 */
	.bi-star-fill {
		font-size:10px;
		color:#CB7878;
	}
	
	/*  페이징 번호들을 붙이기 위해서 */
	.page-item {
		padding:0px;
	}
	
	/* 상품문의  크기와 높이*/
	#detail-Inquiry{
		width:986;
		margin: 5px auto;
	}
	
	/* 클래스 추가하면 텍스트 센터*/
	.text_align {
		text-align:center;
	}
	
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor:pointer;
	}
	
</style>


</head>
<body>
상품상세 페이지입니다<br>
<!-- 상세페이지 main -->
상품 가격 : <c:out value="${detail.saleprice}"/> <br>
리뷰 갯수 : <c:out value="${fn:length(review)}"/> <br>
<header>
	<%@ include file="/WEB-INF/views/header.jsp" %><BR><br>
</header>

<section>
	<!-- 상세이미지 보여주는  -->
	<div class="w-100 explan"> 
		<div class="image1">
			<img src="/resources/image/${image.main}" class="img-thumbnail image2" id="image-main">
			<img src="/resources/image/${image.main}" class="img-thumbnail image3" id="main">
 			<c:if test="${image.detail1 ne null}">
			<img src="/resources/image/${image.detail1}" class="img-thumbnail image3" id="detail1">
			</c:if>
			<c:if test="${image.detail2 ne null}">
			<img src="/resources/image/${image.detail2}" class="img-thumbnail image3" id="detail2">
			</c:if>
			<c:if test="${image.detail3 ne null}">
			<img src="/resources/image/${image.detail3}" class="img-thumbnail image3" id="detail3">
			</c:if>
		</div>
		
		<!-- 상품가격과 옵션, 버튼 표시 -->
		<div class="text1">
			<div class="text2">
				<hr class="myhr">
				<span class="fw-bold fs-3 m-1"><c:out value="${detail.pname}"/></span><br>
				<hr>
				
				<!--  가격 표시 -->
				<div class="price">
					<div class="fw-bold fs-6 w-25 price1 m-1">가격</div>
					<div class="price2">
						<span class="fw-bold fs-5">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${detail.saleprice}"/>원
						</span>&ensp;
						<span class="text-muted text-decoration-line-through">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${detail.price}"/>원
						</span>&ensp;				
						<span class="text-danger"><c:out value="${detail.discount}"/>%</span>
					</div>				
				</div>
				<hr>
				
				<!-- 옵션 선택 select 박스 -->
				<div class="select">
					<div class="select-text fw-bold w-25 m-1">옵션</div>
					<div>
						<select class="form-select" aria-label="Default select example">
							<option value="first" selected disabled>[필수] 옵션을 선택하세요.</option>
							
							<!-- 재고가  1~9개라면 재고 표시 -->
							<c:forEach items="${options}" var="options">
								<option value="${options.oidx},${options.stock}">
									<c:out value="${options.oname}"/>
									<c:if test="${0 < options.stock and options.stock < 10}">
									<span class="font12">(재고:${options.stock})</span>
									</c:if>
								</option>
								
								<!-- 재고가 0개라면 disabled 하고 품절 추가 -->
								<c:if test="${options.stock == 0 }">
									<script  type="text/javascript">
									var oidx = '<c:out value="${options.oidx}"/>';
									var name = '<c:out value="${options.oname}"/>';
									//alert(oidx);
									$("select option[value='"+oidx+",0']").attr("disabled","disabled");
									$("select option[value='"+oidx+",0']").text(name+" 품절");
									</script>
								</c:if>
							
					   		</c:forEach>
						</select>
					</div>
				</div>
				
				<hr>
				<!-- 옵션 선택 표시 -->
				<div id="select-result" class="select-result">

				</div>
				
				<!-- 선택한 물품 가격 합계 표시 -->
				<div class="select-price">
					<span class="font12 fw-bold">TOTAL: </span>
					<span class="fw-bold fs-4" id="total_price_out">0</span>
					<input type="hidden" id="total_price_in" value="0">
					<span>원</span>
			<!-- 일단 지금은 안함 -->
			<!--	<span class="font12"> (선택갯수)</span>    -->
				</div>
				
				<!-- 바로구매, 장바구니 버튼 -->
				<div class="btn-two">
					<button type="button" class="btn btn-danger">바로구매</button> 
					<button type="button" class="btn btn-light">장바구니</button>
					&ensp;<i class="bi bi-suit-heart" id="heart" onclick="heart(${detail.pidx})"></i>	
				</div>			
			</div>
		</div>
	</div>
	
	<div>
		<hr class="explan-bottom">
	</div>
	
	<!-- 상품설명, 후기 등 네비게이션 -->
	<div class="detail-nav fw-bold">
		<span class="detail-nav-1"><a id="move_info">상세정보</a></span>
		<span class="detail-nav-1"><a href="#move_review" style="text-decoration: none;color: inherit;">후기(<span><c:out value="${fn:length(review)}"/></span>)</a></span>
		<span class="detail-nav-1"><a href="#move_question" style="text-decoration: none;color: inherit;">상문문의</a></span>
		<span class="detail-nav-1"><a href="#move_giude" style="text-decoration: none;color: inherit;">구매가이드</a></span>
	</div>
	<!-- 상품 상세 설명 이미지 -->
	<div class="detail-image">
		<img src="/resources/simage/<c:out value="${image.showing1}"/>">
		<c:if test="${image.showing2 ne null}">
		<img src="/resources/simage/<c:out value="${image.showing2}"/>">
		</c:if>
		<c:if test="${image.showing3 ne null}">
		<img src="/resources/simage/<c:out value="${image.showing3}"/>">
		</c:if>
		<c:if test="${image.showing4 ne null}">
		<img src="/resources/simage/<c:out value="${image.showing4}"/>">
		</c:if>
		<c:if test="${image.showing5 ne null}">
		<img src="/resources/simage/<c:out value="${image.showing5}"/>">
		</c:if>
	</div>
	
	<!-- 상품에 관한 리뷰 -->
	<div class="detail-nav fw-bold">
		<span class="detail-nav-1"><a href="#move_info" style="text-decoration: none;color: inherit;">상세정보</a></span>
		<span class="detail-nav-1"><a id="move_review">후기(<span><c:out value="${fn:length(review)}"/></span>)</a></span>
		<span class="detail-nav-1"><a href="#move_question" style="text-decoration: none;color: inherit;">상문문의</a></span>
		<span class="detail-nav-1"><a href="#move_giude" style="text-decoration: none;color: inherit;">구매가이드</a></span>
	</div>
	
	<!-- 상품문의 상단 정보들 표시 -->
	<div class="detail-reviwe" >
		<!-- 리뷰평점, 별점, 사진 10개 -->
		<div class="detail-review-view">
				<!-- 리뷰 평점 -->
				<div class="review-average">
					<div class="review-average1">
						<span id="review-average1">0</span>
					</div>
					<span class="font12"><c:out value="${fn:length(review)}"/></span><span class="font12">개의 리뷰 펑점</span>
				</div>
				<!-- 리뷰 별점 텍스트 -->
				<div class="review-score">
				<progress id="recount5" class="file" max="100" value="0"> 50% </progress>
				(<span class="review_sum5 font12">0</span>)<br>
				<progress id="recount4" class="file" max="100" value="0"> 50% </progress>
				(<span class="review_sum4 font12">0</span>)<br>
				<progress id="recount3" class="file" max="100" value="0"> 50% </progress>
				(<span class="review_sum3 font12">0</span>)<br>
				<progress id="recount2" class="file" max="100" value="0"> 50% </progress>
				(<span class="review_sum2 font12">0</span>)<br>
				<progress id="recount1" class="file" max="100" value="0"> 50% </progress>
				(<span class="review_sum1 font12">0</span>)
				</div>
				
				<!-- 사진 10개 -->
				<!-- 사진이 없을 경우에 뿌려주는 방법을 찾다가. jstl로는 불가능한 걸 알고 스크립트로 뿌려 줄려다가 -->
				<!-- 데이터베이스에서 null값을 아래로 내리는 방법을 찾아내서 매퍼를 수정함 -->
				<div class="review-image">
					<c:forEach items="${review}" var="review" end="9">
					<img class="review-image1 img-thumbnail" src="/resources/review_img/${review.image1}">
					</c:forEach>
				</div>
		</div>
		<!-- 리뷰, 최신순, 평점순 -->
		<div>
			&ensp;&ensp;&ensp;<span class="fw-bold fs-5">리뷰</span>
			&ensp;<span class="pointer" onclick="review_Fn(1,'R')">최신순</span>
			<span>|</span>
			<span class="pointer" onclick="review_Fn(1,'G')">평점순</span>
		</div >			
		<!--  리뷰 테이블 -->
		<div id="review_table">
			
		</div>
	</div>
	
	<!-- 상품에 관한 문의 -->
	<div class="detail-nav fw-bold">
		<span class="detail-nav-1"><a href="#move_info" style="text-decoration: none;color: inherit;">상세정보</a></span>
		<span class="detail-nav-1"><a href="#move_review" style="text-decoration: none;color: inherit;">후기(<span><c:out value="${fn:length(review)}"/></span>)</a></span>
		<span class="detail-nav-1"><a id="move_question">상문문의</a></span>
		<span class="detail-nav-1"><a href="#move_giude" style="text-decoration: none;color: inherit;">구매가이드</a></span>
	</div>
	<div id="detail-Inquiry">
		<table class="table">
			<thead>
				<tr class="text_align">
					<th style="width:6%;">번호</th>
					<th style="width:70%;">제목</th>
					<th style="width:12%;">작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text_align">번호</td>
					<td>제목</td>
					<td class="text_align">작성자</td>
					<td class="text_align">작성일</td>
				</tr>
				<tr>
					<td class="text_align">번호</td>
					<td>제목</td>
					<td class="text_align">작성자</td>
					<td class="text_align">작성일</td>
				</tr><tr>
					<td class="text_align">번호</td>
					<td>제목</td>
					<td class="text_align">작성자</td>
					<td class="text_align">작성일</td>
				</tr><tr>
					<td class="text_align">번호</td>
					<td>제목</td>
					<td class="text_align">작성자</td>
					<td class="text_align">작성일</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 상품구매에 대한 가이드 -->
	<div class="detail-nav fw-bold">
		<span class="detail-nav-1"><a href="#move_info" style="text-decoration: none;color: inherit;">상세정보</a></span>
		<span class="detail-nav-1"><a href="#move_review" style="text-decoration: none;color: inherit;">후기(<span><c:out value="${fn:length(review)}"/></span>)</a></span>
		<span class="detail-nav-1"><a href="#move_question" style="text-decoration: none;color: inherit;">상품문의</a></span>
		<span class="detail-nav-1"><a id="move_giude">구매가이드</a></span>
	</div>
	<div class="detail-guide">
		<img src="/resources/simage/제품구매가이드.jpg">
	</div>
	
</section>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer> 
</body>
<script type="text/javascript">

	/* DOM Tree 생성 완료 후*/
	$(function(){
		
		// 마우스 호버 할 시 이미지 변경 main
		$("#main").hover(function(){
			let main = '<c:out value="${image.main}"/>';
			$("#image-main").attr("src", "/resources/image/"+main);
		});
		
		// 마우스 호버 할 시 이미지 변경 detail1
		$("#detail1").hover(function(){
		    let detail1 = '<c:out value="${image.detail1}"/>';
			$("#image-main").attr("src", "/resources/image/"+detail1);
		});
		
		// 마우스 호버 할 시 이미지 변경 detail2
		$("#detail2").hover(function(){
		    let detail2 = '<c:out value="${image.detail2}"/>';
			$("#image-main").attr("src", "/resources/image/"+detail2);
		});
		
		// 마우스 호버 할 시 이미지 변경 detail3
		$("#detail3").hover(function(){
		    let detail3 = '<c:out value="${image.detail3}"/>';
			$("#image-main").attr("src", "/resources/image/"+detail3);
		});
		
		
		// 옵션 셀렉트 박스 선택 시
		$(".form-select").change(function(){
			
			// 선택된 셀렉트 박스의 text값과 value값 읽어오기
		    let opName = $(this).children('option:selected').text();
			
			// 선택된 옵션에서 odxi와 stock값 분리하기 
		    let opvalue = $(this).children('option:selected').val();
		    let oidx = opvalue.split(",")[0];
		    let stock = opvalue.split(",")[1];
		    
		    
			// 아이디가 존재하지 않으면  0을 리턴, 있다면 1부터, 선택한 옵션이 있다면 추가가 안됨
			let select_oidx = $("#"+"add_option"+oidx).length;
			
			// 옵션 이름에서 가격 뽑아내기
			let price1 = opName.split("+");
			let price2 = parseInt(price1[1].split("원")[0]); // 뽑아낸  옵션 가격
			
			// 토탈 가격 현재 값 뽑아내기, 물건값 추가
			let main_price = parseInt( <c:out value="${detail.saleprice}"/> );	// 메인가격
			let price_in = $("#total_price_in");
			let price_in1 = parseInt(price_in.val()); //숨겨진 가격 처음에는 0
			let price_out = $("#total_price_out"); // 종합가격 넣어주는 곳
			
			//메인가격 + 옵션 가격
			let produt_price = price2 + main_price;
			let addprice = produt_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); // 화면에 옵션 가격표시 ,추가
			
			// 전체가격에 가격 추가하기
			
			// 1. [필수] 옵션을 선택하세요. 는 넣지 않는다
			// 2. function에 변수 여러개 넣기, 자기 oidx에만 반응하게 하기
			// 3. 옵션번호가 같은 건 옵션박스에 추가하지 못하게 하기
			// 4. 옵션 이름에서 가격 뽑아내서 입력하기
			// 5. 옵션 번호에 따라서 가격 달라지게
			// 카운트 되는 숫자에 따라서 가격이 변동되게 이건 다른 곳에서 작업을 해야함. select 선택 후에 벌어지는 일이라서
			if (select_oidx > 0){
			    alert("이미 선택한 옵션입니다.");
			} else {
		    	let str = "";
			    str += "<div class='option_box' id='option_box" +oidx+ "'>";
			    str += "<table class='option_tb'>";
			    str += "<tr>";
			    str += "<td class='font12 option_tb1'>" +opName+ "</td>";
			    str += "<td class='option_tb2'>";
			    str += "<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='count(\"minus\"," +oidx+ "," +produt_price+ "," +stock+ ")' value='-'/>";
				str += "<span id='add_option" +oidx+ "'> 1 </span>"
				str += "<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='count(\"plus\"," +oidx+ "," +produt_price+ "," +stock+ ")' value='+'/>";
				str += "<td class='option_tb3'><span class='fw-bold' id='change_price" +oidx+ "'>" +addprice+ "</span><span> 원 </span>"
				str += "<input id='option_delete" +oidx+ "' onclick='option_delete(" +oidx+ "," +produt_price+ ")' type='button' class='btn btn-light p-0 size25 align-middle' value='X'/></td>";
			    str += "<input type='hidden' id ='price_value" +oidx+ "' value='" +price2+ "'>";
			    str += "<input type='hidden' id ='price_option" +oidx+ "' value='" +produt_price+ "'>";				
			    str += "</tr>";
			    str += "</table>";
			    str += "</div>";
				$(".select-result").append(str);
				
				let total_price = parseInt( price_in1 + main_price + price2);	// 종합가격 + 물건가격 + 옵션가격
				let total_price_out = total_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	// ,추가
				price_out.text(total_price_out); // 화면에 표시되는 종합가격
				price_in.val(total_price);	// 숨겨진 종합 가격
			}
		});
		
		
		 /* 리뷰 평균과 각 리뷰 갯수 뿌려주기 */
		function review(){
		   	<c:if test="${fn:length(review) != 0}">
		    <c:set var="sum" value="0" />
			<c:set var="sum5" value="0" />
			<c:set var="sum4" value="0" />
			<c:set var="sum3" value="0" />
			<c:set var="sum2" value="0" />
			<c:set var="sum1" value="0" />
			
			 // 리뷰 평점별 합계 구하기
		    <c:forEach items="${review}" var="review">
		    <c:set var="sum" value="${review.grade + sum}"/>
		    
		    <c:if test="${review.grade == 5}">
		    <c:set var="sum5" value="${review.grade + sum5}"/>
		    </c:if>
		    
			<c:if test="${review.grade == 4}">
			<c:set var="sum4" value="${review.grade + sum4}"/>
		    </c:if>
		    
			<c:if test="${review.grade == 3}">
			<c:set var="sum3" value="${review.grade + sum3}"/>
		    </c:if>
		    
			<c:if test="${review.grade == 2}">
			<c:set var="sum2" value="${review.grade + sum2}"/>
		    </c:if>
		    
			<c:if test="${review.grade == 1}">
			<c:set var="sum1" value="${review.grade + sum1}"/>
		    </c:if>
		    </c:forEach>
		    
		    // 리뷰 평점 합계 구하기
		    let sum = <c:out value="${sum}"/>;
		    let sum5 = <c:out value="${sum5}"/>;
		    let sum4 = <c:out value="${sum4}"/>;
		    let sum3 = <c:out value="${sum3}"/>;
		    let sum2 = <c:out value="${sum2}"/>;
		    let sum1 = <c:out value="${sum1}"/>;
		    //console.log(sum);
		    
		    // 리뷰 평점 소수점 2자리에서 반올림 하기
		    let length = <c:out value="${fn:length(review)}"/>;
		    let average = (sum / length).toFixed(1) ;
		    //console.log(average);
		    
		    // 리뷰 평점별 갯수 구하기
		    let average5 = (sum5 / 5);
		    let average4 = (sum4 / 4);
		    let average3 = (sum3 / 3);
		    let average2 = (sum2 / 2);
		    let average1 = (sum1 / 1);
		    
		    // 리뷰 점수별 퍼센트 구하기, 소수점 1자리에서 반올림 하기
		    let percent5 = Math.round((average5/length)*100);
		    let percent4 = Math.round((average4/length)*100);
		    let percent3 = Math.round((average3/length)*100);
		    let percent2 = Math.round((average2/length)*100);
		    let percent1 = Math.round((average1/length)*100);
	/* 	    console.log(percent5);
		    console.log(percent4);
		    console.log(percent3);
		    console.log(percent2);
		    console.log(percent1); */
		    
		    // 리뷰 평균과 리뷰 갯수 뿌려주기
		    $("#review-average1").text(average);
		    $(".review_sum5").text(average5);
		    $(".review_sum4").text(average4);
		    $(".review_sum3").text(average3);
		    $(".review_sum2").text(average2);
		    $(".review_sum1").text(average1);
		    
		    // 리뷰 등급별  퍼센테이지 뿌려주기
		    $("#recount5").val(percent5);
		    $("#recount4").val(percent4);
		    $("#recount3").val(percent3);
		    $("#recount2").val(percent2);
		    $("#recount1").val(percent1);
		    </c:if>
		  }
		  review();
		  
		// 리뷰 페이징 해주는 function 실행	 
		review_Fn(1,"R");
  		
		// 문의 페이징 해주는 function 실행
		question_Fn(1);
		
	});
	
	
	// 옵션을 선택할 시 들어 있는 + - 박스
	// oidx를 넣어서 id가 맞는 것에만 반응하게 하기, 가격도 조정하기
	function count(type, oidx, produt_price, stock){
		
		// + - 선택 결과가 표시되는 곳
	    let result = $("#add_option"+oidx);
		// + - 선택 후에 표시되는 숫자 값 가져오기
	    let number = parseInt(result.text());
			    
	    //console.log(produt_price);
	    
	    // 종합 가격
	    let price_in = $("#total_price_in"); //숨겨진 종합가격 넣어주는 곳
	    let price_in1 = parseInt(price_in.val()); //숨겨진 종합가격 가져오기
	    let price_out = $("#total_price_out"); // 종합가격 넣어주는 곳

	    //옵션 가격
	    let price_op_in = $("#price_option"+oidx); // 숨겨진 옵션가격 넣어주는 곳
	    let price_op = parseInt( price_op_in.val()); //숨겨진 옵션 가격 가져오기
	    let price_op_out = $("#change_price"+oidx); //옵션 가격 넣어주는 곳

	    
	    let total_price = 0; // 변수 선언
	    let option_price = 0; // 변수 선언
		
	    // 중복되는 코드 내부 function으로 대체
	    // + - 한 것에 따라서 가격을 넣어주는 function
	    function change_price(){
			// + - 누르는 것에 따라서 종합 가격 변동 
			let total_price_out = total_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	// ,추가
			price_out.text(total_price_out); // 화면에 표시되는 종합가격
			price_in.val(total_price);	// 숨겨진 종합 가격
		    
			// + - 누르는 것에 따라서 옵션 가격 변동
			let option_price_out = option_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	// ,추가
			price_op_out.text(option_price_out); // 화면에 표시되는 옵션 가격
			price_op_in.val(option_price);	// 숨겨진 옵션 가격
	    }
	    
	    if(type === 'plus' && number < stock){
			number = parseInt(number) + 1;
			
			// + - 누르는 것에 따라서 옵션 개수 변경
		    result.text(" " +number+ " ");
			
			total_price = parseInt( price_in1 + produt_price);	// 종합가격 + 옵션 선택 가격
			option_price = parseInt( price_op + produt_price);	// 옵션가격 + 옵션 선택 가격
			
			change_price();
			
	    }else if ( type === 'minus' && 1 < number) {
			number = parseInt(number) - 1;
			
			// + - 누르는 것에 따라서 옵션 개수 변경
		    result.text(" " +number+ " ");
			
			total_price = parseInt( price_in1 - produt_price);	// 종합가격  - 옵션 선택 가격
			option_price = parseInt( price_op - produt_price);	// 옵션가격  - 옵션 선택 가격
			
			change_price();
			
	    }
	  //  console.log(number);
	}
	
	
	// 선택 옵션에서 X자를 누르면 옵션 박스 사라지면서 토탈 가격도 내려감
	function option_delete(oidx,produt_price){
		// 옵션 증감에 적혀 있는 값
	    let number = parseInt($("#add_option"+oidx).text());
		// 감소해야할 금액의 총액
		let delete_price = produt_price * number;
		
		// 종합 가격
	    let price_in = $("#total_price_in"); //숨겨진 종합가격 넣어주는 곳
	    let price_in1 = parseInt(price_in.val()); //숨겨진 종합가격 가져오기
	    let price_out = $("#total_price_out"); // 종합가격 넣어주는 곳
	    
	 	// 옵션을 삭제 했을 때 표시되는 종합 가격
	 	total_price = parseInt( price_in1 - delete_price);
		let total_price_out = total_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	// ,추가
		price_out.text(total_price_out); // 화면에 표시되는 종합가격
		price_in.val(total_price);	// 숨겨진 종합 가격
		
		//옵션 박스 삭제하기
		$("#option_box"+oidx).remove();
	}
	
	
	
	/*   제이쿼리를 활용해서 리뷰 페이징 뿌려주기 */
	// 누르면 나오게 하기 위해서 아래로 뺴놨음.
	// 페이지가 로드 되면 function이 실행이 되도록 위에 넣어놨음
	  function review_Fn(page, type){
	    
	    // page는 페이징 번호이고, type R은 최신순, G는 등급순 
	      let pidx =  <c:out value="${detail.pidx}"/>;
	      if (page == null){page = 1};
	      if (type == null){type = "R"};
	      
	      $.ajax({
		  	url:"detail_review.do",
		    data:{"pidx":pidx, "page":page, "type":type},
		    dataType: 'json',
		  	type:"post",
		  	success:function(data){
		  	// console.log(data);
		  	// console.log(data.pm.endPage);
		  	// console.log(data.reviewProduct[0]);
		  	 
		  	 // 가져온 데이터를 리뷰 div에 뿌려 준다.
		  	 let reviews = data.reviewProduct;
		  	 let pm = data.pm;
		  	 let prev = parseInt(pm.startPage - 1) ;
		  	 let next = parseInt(pm.endPage + 1) ;
		  	 let str = "";
		  	 
		  	 // 리뷰 나오는 테이블 뿌려 주기
		  	 str += "<table class='table'>";
		  	 for (let i=0; i<reviews.length ; i++){
		  		let grade = reviews[i].grade;
		  	 	str += "<tr class='review_tr'>";
			  	str += "<td style='width:5%'></td>";
			  	str += "<td style='width:30%'>";
			  	
			  	// 평점 들에 대한 별 뿌려주기, 이거 줄일 수 있는 방법 있으면 줄여 주세요
			  	if ( grade == 1 ){	
			  		str +="<i class='bi bi-star-fill'></i>";
			  	}else if (grade == 2){
			  		str +="<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>";
			  	}else if (grade == 3){
			  		str +="<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>";
			  	}else if (grade == 4){
			  		str +="<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>";
			  	}else if (grade == 5){
			  		str +="<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>";
			  	}
			  	
			  	// 리뷰 내용과 아래 접기 열기 버튼 뿌려주기
			  	str += "<div id='review_box"+reviews[i].ridx+"' style='word-break:break-all;'>"+reviews[i].contents+"</div>";
			  	str += "<div id='review_btn"+reviews[i].ridx+"' onclick='btn_more("+reviews[i].ridx+")'></div>";
			  	str += "</td>";
			  	str += "<td style='width:10%'></td>";
			  	str += "<td style='width:30%'>"
				
			  	// 이미지 뿌려주기, !=null 이 안먹혀서 ==null 로 작업 함
			  	if(reviews[i].image1 == null || reviews[i].image1 == ""){
			  	  str += "";
			  	}else{
			  	  str += "<img class='review-image1 img-thumbnail' src='/resources/review_img/"+reviews[i].image1+"'>";   
			  	}
			  	if(reviews[i].image2 == null || reviews[i].image2 == ""){
				  	  str += "";
				}else{
				  	  str += "<img class='review-image1 img-thumbnail' src='/resources/review_img/"+reviews[i].image2+"'>";   
				}
			  	str += "</td>";
			  	let name = reviews[i].uname.slice(0,-2);
			  	let name1 = name+"**";
			  	str += "<td style='width:10%'>"+name1+"</td>";
		  	 	str += "</tr>";
		  	 }
		  	 str += "</table><br>";
		  	 
		  	 // 페이징 할 수 있는 번호 나오는 곳 뿌려 주기
		  	 str += "<nav aria-label='Page navigation'>";
		  	 str += "<ul class='pagination justify-content-center'>";
		  	 str += "<li class='page-item'>";
		  	 //console.log(prev);
		  	 if (pm.prev == true){
		  	     str += "<a class='page-link' aria-label='Previous' onclick='review_Fn("+prev+",\""+type+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
		  	 }
		  	 str += "</li>";
		  	 let startPage = parseInt(pm.startPage);
		  	 let endPage = parseInt(pm.endPage);
		  	 for (let k = startPage; k<=endPage; k++ ){
		  	 	str += "<li class='page-item'><a class='page-link pointer' onclick='review_Fn("+k+",\""+type+"\")'>"+k+"</a>";      
		  	 }
		  	 str += "<li class='page-item'>";
		  	 if(pm.next && pm.endPage > 0){
		  	     str += "<a class='page-link' aria-label='Next' onclick='review_Fn("+next+",\""+type+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
		  	 }
		  	 str += "</li>";
		  	 str += "</ul>";
		  	 str += "</nav>";
		  	
		  	// 리뷰 div에 모든 내용 뿌려주기
		  	$("#review_table").html(str);
		  	 
		  	
			// 리뷰가 길면 자르고 더보기 버튼을 추가하고 그렇지 않으면 그대로 둔다.
			// .offsetHeight >90  보여지는 부분이 90px를 넘어가면, 보여지는 높이 조절하기 어려움 clientHeight
			// .length >= 100  텍스트 길이가 100보다 크거나 같으면
			// .split('\n').length; 줄바꿈이 되었을 때 줄바꿈 안하면 소용이 없음
			// word-break: keep-all; 한글일 경우 띄어쓰기 기준으로 줄바꿈 해줌 스타일로 적용
		  	for (let m=0; m<reviews.length ; m++){
		  	let ridx = reviews[m].ridx;
		  	let re = $("#review_box"+ridx);
		  	let re_txt = $("#review_box"+ridx).text();
		    let re_height = document.getElementById("review_box"+ridx).clientHeight;
		 	//console.log(re_txt);
		    //console.log(re_height);
		    let re_html = $("#review_box"+ridx).html();
		    let re_txt_short = re_txt.substring(0,60)+"...";
		  	
		 	// 더보기 버튼 추가 void(0)는 이동을 하지 않고 그곳에서 만 움직이겠다는 뜻
		    let btn_more = $('<a href="javascript:void(0)" class="more" style="text-decoration:none;">더보기</a>');
		    $("#review_btn"+ridx).append(btn_more);
		    
		 	// 텍스트 길이가 길면 자르고 길이가 짧으면 더보기 버튼을 감춘다.
		   		if(re_height >= 70){
			  		re.html(re_txt_short);
		                
		    	}else {
		            btn_more.hide()
		    	}
		 	
		 	// 더보기 버튼 클릭할 때 작동하는 function 만들기
	   		btn_more.click(toggle_content);
		      
	            function toggle_content(){
	                if($(this).hasClass('short')){
	                    // 접기 상태
	                    $(this).text('더보기');
	                    re.html(re_txt_short); // 텍스트 자르기
	                    $(this).removeClass('short');
	                }else{
	                    // 더보기 상태
	                    $(this).text('접기');
	                    re.html(re_html); // 텍스트 크기 원상복귀
	                    $(this).addClass('short');
	                }
	          	}
	            
		  	}
		  	 
		  	},
		  	error:function(){
		  	    alert("리뷰 뿌려주기 에러입니다.");
		  	}
	      });
	 }

	
	
    /*   제이쿼리를 활용해서 문의 페이징 뿌려주기 */
  	// 누르면 나오게 하기 위해서 아래로 뺴놨음.
  	// 페이지가 로드 되면 function이 실행이 되도록 위에 넣어놨음
  	  function question_Fn(page){
  	    
  	      let pidx =  <c:out value="${detail.pidx}"/>;
  	      if (page == null){page = 1};
  	      
  	      $.ajax({
  		  	url:"detail_question.do",
  		    data:{"pidx":pidx, "page":page},
  		    dataType: 'json',
  		  	type:"post",
  		  	success:function(data){
  		  	 
  		  	 // 가져온 데이터를 문의 div에 뿌려 준다.
  		  	 let question = data.questionProduct;
  		  	 let pm = data.pm;
  		  	 let prev = parseInt(pm.startPage - 1) ;
  		  	 let next = parseInt(pm.endPage + 1) ;
  		  	 let str = "";
  		  	 
  		  	 // 문의 해더 작성
  		  	 str += "<table class='table'>";
  		  	 str += "<thead>";
  		  	 str += "<tr class='text_align'>";
  		  	 str += "<th style='width:6%;'>번호</th>";
  		  	 str += "<th style='width:70%;'>제목</th>";
  		  	 str += "<th style='width:12%;'>작성자</th>";
  		  	 str += "<th>작성일</th>";
  		  	 str += "</tr>";
  		  	 str += "</thead>";
  		  	 str += "<tbody>";
  		  	 for (let i=0; i<question.length ; i++){
  			  	
  		  		// 문의 내용 뿌려주기
  			  	str += "<tr>";
  			  	str += "<td class='text_align'>"+i+"</td>";
  			  	str += "<td>"+question[i].title+"</td>";
  			  	let name = question[i].uname.slice(0,-2);
			  	let name1 = name+"**";
  			  	str += "<td class='text_align'>"+name1+"</td>";
  			  	let date = question[i].rdate.slice(0,10);
  			  	str += "<td class='text_align'>"+date+"</td>";
  			  	str += "</tr>";

  		  	 }
  		  	 str += "</tbody>"
  		  	 str += "</table><br>";
  		  	 
  		  	 // 페이징 할 수 있는 번호 나오는 곳 뿌려 주기
  		  	 str += "<nav aria-label='Page navigation'>";
  		  	 str += "<ul class='pagination justify-content-center'>";
  		  	 str += "<li class='page-item'>";
  		  	 //console.log(prev);
  		  	 if (pm.prev == true){
  		  	     str += "<a class='page-link' aria-label='Previous' onclick='question_Fn("+prev+")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
  		  	 }
  		  	 str += "</li>";
  		  	 let startPage = parseInt(pm.startPage);
  		  	 let endPage = parseInt(pm.endPage);
  		  	 for (let k = startPage; k<=endPage; k++ ){
  		  	 	str += "<li class='page-item'><a class='page-link pointer' onclick='question_Fn("+k+")'>"+k+"</a>";      
  		  	 }
  		  	 str += "<li class='page-item'>";
  		  	 if(pm.next && pm.endPage > 0){
  		  	     str += "<a class='page-link' aria-label='Next' onclick='question_Fn("+next+")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
  		  	 }
  		  	 str += "</li>";
  		  	 str += "</ul>";
  		  	 str += "</nav>";
  		  	
  		  	// 리뷰 div에 모든 내용 뿌려주기
  		  	$("#detail-Inquiry").html(str);
  		  	 
  		  	},
  		  	error:function(){
  		  	    alert("문의 뿌려주기 에러입니다.");
  		  	}
  	      });
  	 }
	
	
	
	
	
	
	// 하트버튼 누르면 관심상품에 넣고 다시 누르면 빼고
	function heart(pidx){
		if($("#heart").hasClass('bi bi-suit-heart-fill')==true){
			$("#heart").attr('class','bi bi-suit-heart');
			alert("관심상품에서 제외되었습니다.");
			
		}else{
			$("#heart").attr('class','bi bi-suit-heart-fill');
			alert("관심상품에서 추가되었습니다.");
		}
		
	}
	

</script>
</html>