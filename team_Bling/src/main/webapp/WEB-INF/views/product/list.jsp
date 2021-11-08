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
	/* 전반적인 크기에 관한 설정 */
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
	
	.font12 {
		font-size:14px;
	}
	
	.margin15 {
		margin-bottom:20px;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header><br>
<section>
	<!-- 제품 종류 -->
	<div class="text-center fs-1">
	<c:choose>
	<c:when test="${kind eq 'R'}">	반지	</c:when>
	<c:when test="${kind eq 'N'}">	목걸이  </c:when>
	<c:when test="${kind eq 'E'}">	귀걸이  </c:when>
	<c:when test="${kind eq 'B'}">	팔찌	</c:when>
	</c:choose>
	</div><br>
	

	<!-- 베스트 상품 3개-->
	<div class="container margin15">
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
 
	
 	<!-- 신상품, 판매산위순, 높은 가격순, 낮은 가격순 -->
	<div class="row margin15">
	<div class="col-8"></div>
	<div class="col-4" >
		<input type="hidden" value="${kind}" id="option_kind">
		<script type="text/javascript">
			var kind = document.getElementById("option_kind").value;
			var kind_write;
			function option_kind(kind){
				if(kind=='R'){
					kind_write='ring';
				}else if(kind=='E'){
					kind_write='earring';
				}else if(kind=='B'){
					kind_write='braclet';
				}else if(kind=='N'){
					kind_write='necklace';
				}
				document.write("<a href='/Product/"+kind_write+".do?orderBy=1' class='text-black-50 font12' style='text-decoration:none'>신상품순</a>&nbsp|&nbsp");
				document.write("<a href='/Product/"+kind_write+".do?orderBy=2' class='text-black-50 font12' style='text-decoration:none'>판매순위순</a>&nbsp|&nbsp");
				document.write("<a href='/Product/"+kind_write+".do?orderBy=3' class='text-black-50 font12' style='text-decoration:none'>높은가격순</a>&nbsp|&nbsp");
				document.write("<a href='/Product/"+kind_write+".do?orderBy=4' class='text-black-50 font12' style='text-decoration:none'>낮은가격순</a>");
			}
			option_kind(kind);
		</script>
		</div>
	</div>
		
	<!-- 제품들 뿌려 주는 곳 -->
	<div class="container">
		<div class="row" id="prodRow">
			<c:forEach items="${viewAll}" var="list">
			<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
				<div id="img1">
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
		var uid = '<%=(String)session.getAttribute("id")%>';
		var like = 0;
		if(uid=="null"){
			alert("로그인하셔야합니다.");
		}else{
			if($(".emptyHeart"+pidx).hasClass("bi bi-suit-heart-fill")==true){
			    alert("관심 상품을 취소하셨습니다.");
				$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart emptyHeart"+pidx);
				like = 0;
			}else{
				$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+pidx);
				alert("관심 상품에 담았습니다");
				like = 1;
			}
			console.log(like);
			console.log(pidx);
			$.ajax({
				url:"/Basket/like.do",
				type:"POST",
				data:{"yn":like,"pidx":pidx},
				ContentType:"application/json",
				success:function(data){
					console.log(data);
				},error:function(){
					alert("관심상품등록 에러!")
				}
			});
		}
	}

</script>
</html>


