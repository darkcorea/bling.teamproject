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
	<title>product list</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	
	section, header {
		max-width:1008px;
		margin:  0px auto;
	}
	
	/* 빈 하트 아이콘, 꽉찬 하트 아이콘  */
	.bi-suit-heart, .bi-suit-heart-fill {
		font-size:27px;
		color:red;
		float: right;
		padding:5px;
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
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<!-- 제품 종류 -->
	<div class="text-center fs-1">
		<c:choose>
		<c:when test="${kind eq 'best'}">
		BEST
		</c:when>
		<c:when test="${kind eq 'new'}">
		NEW
		</c:when>
		</c:choose>
	</div><br><br>

	<!-- 제품 뿌리는 곳 -->
	<div class="container">
		<div class="row" id="prodRow">
		
			<!-- 베스트는 100깨까지, new는 9개만 보여주기  -->
	     	<c:choose>
			<c:when test="${kind eq 'best'}">
			<c:set var="endvalue" value="99"/>
			</c:when>
			<c:when test="${kind eq 'new'}">
			<c:set var="endvalue" value="8"/>
			</c:when>
			</c:choose>
			<c:set var="num" value="1" />
			
			<!-- 리스트 반목문  -->
        	<c:forEach items="${list}" var="list" begin="0" end="${endvalue}">
			<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
				<div id="img1">
					<span class="product-badge badge badge-secondary bg-danger" style="position: absolute;width:40px;">
					
					<!-- 제품 사진 안에 있는 베스트는 숫자로 표시 new는 new로 표시 -->
	              	<c:choose>
					<c:when test="${kind eq 'best'}">
					<c:out value="${num}"/>
					</c:when>
					<c:when test="${kind eq 'new'}">
					NEW
					</c:when>
					</c:choose>
					<c:set var="num" value="${num+1}"/>
					</span>
					
					<!-- 제품 사진 -->
					<a href="/Product/detail.do?pidx=${list.pidx}" style="text-decoration:none">
						<img class="img-fluid" src="/resources/image/${list.main }">
					</a>
				</div>
				<div>
					<div style="padding:5px">
						<div id="reviewName">
						
							<!--  리뷰 갯수  -->
							<div id="text_1">
								<span class="text-black-50">리뷰 </span>
								<span class="text-black-50" id="review"><c:out value="${list.reviewCount}"/></span>
								<!-- heart icon -->
								<span>
									<i class="bi bi-suit-heart emptyHeart${list.pidx}" onclick="heart(${list.pidx})"></i>
								</span>
							</div>
							
							<!-- 상품 이름 -->
							<div>
								<h3 class="text-base mb-0">
									<a class="text-dark prodName" href="/Product/detail.do?pidx=${list.pidx}" style="text-decoration:none">${list.pname}</a>
								</h3>
							</div>
							
							<!-- 가격 할인율이 0일 경우와 아닐 경우를 나눔 -->
							<div id="totprice">
							<c:choose>
								<c:when test="${list.discount != 0}">
								<span class="text-danger fs-5">${list.discount}%</span>
								<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${list.saleprice}" pattern="#,###" />원</span>
								<span class="text-decoration-line-through" id="saleprice"><fmt:formatNumber value="${list.price}" pattern="#,###" />원</span>
								</c:when>
								<c:when test="${list.discount ==0 }">
								<span class="text-gray-500 fw-bold fs-3"><fmt:formatNumber value="${list.price}" pattern="#,###" />원</span>
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
	function heart(pidx){
		if($(".emptyHeart"+pidx).hasClass("bi bi-suit-heart-fill")==true){
		    alert("관심 상품을 취소하셨습니다.");
			$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart emptyHeart"+pidx);
		}else{
			$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+pidx);
			alert("관심 상품에 담았습니다");
		}
	}

</script>
</html>




















