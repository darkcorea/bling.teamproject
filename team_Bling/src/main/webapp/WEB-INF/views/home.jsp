<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--  위의 3가지는 먼저 와야 합니다. -->
	<title>Home</title>
 	<script src="/js/jquery-3.6.0.min.js"></script>
 	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>

	/* 전반적인 크기에 관한 설정 */
	section, header {
		max-width:1008px;
		margin:  0px auto;
	}
	
	/* 빈 하트 아이콘, 꽉찬 하트 아이콘  */
	.bi-suit-heart, .bi-suit-heart-fill {
		font-size:25px;
		color:red;
		float: right;
		padding: 0px 5px;
	}
	
	/* 이벤트민 공지사항 관련 */
	#event,#notice{
		height: 256px;
		background-color: #C4C4C4;
	}
	#eventDiv{
		padding-right: 100px;
	}
	
	/* 제품 리스트 관련 */
	#subMenu1,#subMenu2{
		text-decoration-line: none;
		color : #000000;
	}
	#subMenu1{
		font-size: 30px;
		margin-right: 10px;
	}
	.prodName{
			font-size: 20px;
	}
	#text_1{
			height: 29px;
	}
	#botCarouselBtn{
		background-color: #CB7878;
	}
</style>	
</head>

<body>
	<a href="/Admin/list.do">관리자 상품 리스트</a><br>
	<a href="/Admin/regist.do">관리자 상품 등록</a><br>
	<a href="/Review/list.do?page=1">페이징 완료</a><br>
  
<header>
	<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
</header>
	<!-- carousel -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" id="botCarouselBtn"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" id="botCarouselBtn"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" id="botCarouselBtn"></button>
		</div>
		<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="/resources/simage/SS21-Slide03.jpg" class="d-block w-100">
		</div>
		<div class="carousel-item">
			<img src="/resources/simage/SS21-Slide05.jpg" class="d-block w-100">
		</div>
		<div class="carousel-item">
			<img src="/resources/simage/SS21-Slide06.png" class="d-block w-100">
		</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
		</button>
	</div><br><br>

	<section>
	<!-- event & notice -->
	<div class="container">
		<div class="row">
			<div class="col-xl-8" id="eventDiv">
				<span><a id="subMenu1" href="">Event</a></span>
				<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/image/event_1.png" class="d-block w-100" style="height:256px;">
					</div>
					<div class="carousel-item">
						<img src="/resources/image/event_1.png" class="d-block w-100" style="height:256px;">
					</div>
					<div class="carousel-item">
						<img src="/resources/image/event_1.png" class="d-block w-100" style="height:256px;">
					</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col-xl-4">
				<span><a id="subMenu1" href="">Notice</a></span>
				<div id="notice">

				</div>
			</div>
		</div>
	</div><br><br><br><br>


<!-- 제품 미리보기 BEST-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/best.do">BEST</a></span><span><a id="subMenu2" href="/Product/best.do">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${best}" var="best" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<span class="product-badge badge badge-secondary bg-danger" style="position: absolute;">best</span>
						<a href="/Product/detail.do?pidx=${best.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${best.main }">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<!--  리뷰 갯수  -->
								<div id="text_1">
									<span class="text-black-50">리뷰 </span>
									<span class="text-black-50" id="review"><c:out value="${best.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${best.pidx}" onclick="heart(${best.pidx})"></i>
									</span>
								</div>
								<!-- 상품 이름 -->
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${best.pidx}" style="text-decoration:none">${best.pname}</a>
									</h3>
								</div>
								<!-- 가격 할인율이 0일 경우와 아닐 경우를 나눔 -->
								<div id="totprice">
								<c:choose>
									<c:when test="${best.discount != 0}">
									<span class="text-danger fs-5">${best.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${best.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${best.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${best.discount ==0 }">
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${best.price}" pattern="#,###" />원</span>
									</c:when>
								</c:choose>
								</div><br><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	<br>
	
	<!-- 제품 미리보기 NEW-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/new.do">NEW</a></span><span><a id="subMenu2" href="/Product/new.do">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${newProd}" var="newProd" begin="0" end="5">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<span class="product-badge badge badge-secondary bg-danger" style="position: absolute;">new</span>
						<a href="/Product/detail.do?pidx=${newProd.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${newProd.main }">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${newProd.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${newProd.pidx}" onclick="heart(${newProd.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${newProd.pidx}" style="text-decoration:none">${newProd.pname}</a>
									</h3>
								</div>
								<div id="totprice">
								<c:choose>
									<c:when test="${newProd.discount != 0}">
									<span class="text-danger fs-5">${newProd.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${newProd.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${newProd.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${newProd.discount == 0}">
									&nbsp;&nbsp;<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${newProd.price}" pattern="#,###" />원</span>
									</c:when>
									</c:choose>
								</div><br><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	
	<!-- 제품 종류 Ring-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/ring.do?orderBy=1">반지</a></span>
			<span><a id="subMenu2" href="/Product/ring.do?orderBy=1">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${ring}" var="ring" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/Product/detail.do?pidx=${ring.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${ring.main }">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${ring.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${ring.pidx}" onclick="heart(${ring.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${ring.pidx}" style="text-decoration:none">${ring.pname}</a>
									</h3>
								</div>
								<div id="totprice">
								<c:choose>
									<c:when test="${ring.discount != 0}">
									<span class="text-danger fs-5">${ring.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${ring.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${ring.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${ring.discount == 0}">
									&nbsp;&nbsp;<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${ring.price}" pattern="#,###" />원</span>
									</c:when>
								</c:choose>
								</div><br><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<br><br>	

	</section>
<!-- middle banner -->
	<div>
		<img src="/resources/simage/middle banner.jpg" class="w-100">
	</div>
	<br><br><br>
	

	<section>
	<!-- 제품 종류 Necklace-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/necklace.do?orderBy=1">목걸이</a></span>
			<span><a id="subMenu2" href="/Product/necklace.do?orderBy=1">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${neck}" var="neck" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/Product/detail.do?pidx=${neck.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${neck.main }" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${neck.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${neck.pidx}" onclick="heart(${neck.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${neck.pidx}" style="text-decoration:none">${neck.pname}</a>
									</h3>
								</div>
								<div id="totprice">
								<c:choose>
									<c:when test="${neck.discount != 0}">
									<span class="text-danger fs-5">${neck.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${neck.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${neck.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${neck.discount == 0}">
									&nbsp;&nbsp;<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${neck.price}" pattern="#,###" />원</span>
									</c:when>
								</c:choose>
								</div><br><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	
	<!-- 제품 종류 Earring-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/earring.do?orderBy=1">귀걸이</a></span>
			<span><a id="subMenu2" href="/Product/earring.do?orderBy=1">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${ear}" var="ear" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/Product/detail.do?pidx=${ear.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${ear.main }" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${ear.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${ear.pidx}" onclick="heart(${ear.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${ear.pidx}" style="text-decoration:none">${ear.pname}</a>
									</h3>
								</div>
								<div id="totprice">
								<c:choose>
									<c:when test="${ear.discount != 0}">
									<span class="text-danger fs-5">${ear.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${ear.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${ear.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${ear.discount == 0}">
									&nbsp;&nbsp;<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${ear.price}" pattern="#,###" />원</span>
									</c:when>
									</c:choose>
								</div><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		
	<!-- 제품 종류 Bracelet-->
		<div class="container">
			<span><a id="subMenu1" href="/Product/braclet.do?orderBy=1">팔찌</a></span>
			<span><a id="subMenu2" href="/Product/braclet.do?orderBy=1">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${brac}" var="brac" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/Product/detai.dol?pidx=${brac.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/resources/image/${brac.main}" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${brac.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart emptyHeart${brac.pidx}" onclick="heart(${brac.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/Product/detail.do?pidx=${brac.pidx}" style="text-decoration:none">${brac.pname}</a>
									</h3>
								</div>
								<div id="totprice">
								<c:choose>
									<c:when test="${brac.discount != 0}">
									<span class="text-danger fs-5">${brac.discount}%</span>
									<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${brac.saleprice}" pattern="#,###" />원</span>
									<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${brac.price}" pattern="#,###" />원</span>
									</c:when>
									<c:when test="${brac.discount == 0}">
									&nbsp;&nbsp;<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${brac.price}" pattern="#,###" />원</span>
									</c:when>
								</c:choose>	
								</div><br><br>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>	
	</section>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer> 
</body>
 <script>
    /* 하트를 눌렀을 때 채워 주고 비워주고 하는 기능, 관심상품 */
   	function heart(pidx){
        if($(".emptyHeart"+pidx).hasClass('bi bi-suit-heart')==true){
        	$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+pidx);
	           alert("관심 상품에 담았습니다.");
        }else{
        	alert("관심 상품을 취소하셨습니다.");
			$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart emptyHeart"+pidx);
        }
	}		
</script>

</html>
