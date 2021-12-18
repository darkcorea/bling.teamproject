<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--  위의 3가지는 먼저 와야 합니다. -->
	<title>Home</title>
<style>

	/* 전반적인 크기에 관한 설정 */
	section {
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
	#event{
		height: 256px;
		background-color: #C4C4C4;
	}
	#notice{
		height: 256px;
		overflow:hidden;
		text-overflow:ellipsis;
		border:1px solid #cb7878;
		border-radius:10px;
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
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor: pointer;
	}
</style>
</head>

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
			<img src="/team_Bling/resources/simage/SS21-Slide03.jpg" class="d-block w-100">
		</div>
		<div class="carousel-item">
			<img src="/team_Bling/resources/simage/SS21-Slide05.jpg" class="d-block w-100">
		</div>
		<div class="carousel-item">
			<img src="/team_Bling/resources/simage/SS21-Slide06.png" class="d-block w-100">
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
				<span><a id="subMenu1" href="/team_Bling/Event/main.do">Event</a></span>
				<div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<c:set var="event" value="${event}" />
							<div class="carousel-item active" >
								<a href="/team_Bling/Event/detail.do?eidx=${event[0].eidx}"><img src="/team_Bling/resources/event/${event[0].banner}" class="d-block w-100" style="height:256px;"></a>
							</div>
							<div class="carousel-item" >
								<a href="/team_Bling/Event/detail.do?eidx=${event[1].eidx}"><img src="/team_Bling/resources/event/${event[1].banner}" class="d-block w-100" style="height:256px;"></a>
							</div>
							<div class="carousel-item">
								<a href="/team_Bling/Event/detail.do?eidx=${event[2].eidx}"><img src="/team_Bling/resources/event/${event[2].banner}" class="d-block w-100" style="height:256px;"></a>
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
				<span><a id="subMenu1" href="/team_Bling/Notice/notice_main.do">Notice</a></span>
				<div id="notice">
					<c:forEach var="notice" items="${notice}">
						<a href="/team_Bling/Notice/detail.do?nidx=${notice.nidx}" class='link-dark' style='text-decoration:none'>
							<h6>&nbsp;&middot;&nbsp;${notice.subject} &#40; ${fn:substring(notice.rdate,0,10)} &#41;</h6> 
						</a><br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div><br><br><br><br>


<!-- 제품 미리보기 BEST-->
		<div class="container">
			<span><a id="subMenu1" href="/team_Bling/Product/best_new.do?kind=best">BEST</a></span><span><a id="subMenu2" href="/Product/best_new.do?kind=best">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${best}" var="best" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<span class="product-badge badge badge-secondary bg-danger" style="position: absolute;">best</span>
						<a href="/team_Bling/Product/detail.do?pidx=${best.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${best.main }">
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
										<i class="bi bi-suit-heart pointer emptyHeart${best.pidx}" onclick="heart(${best.pidx})"></i>
									</span>
								</div>
								<!-- 상품 이름 -->
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${best.pidx}" style="text-decoration:none">${best.pname}</a>
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
			<span><a id="subMenu1" href="/team_Bling/Product/best_new.do?kind=new">NEW</a></span><span><a id="subMenu2" href="/team_Bling/Product/best_new.do?kind=new">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${newProd}" var="newProd" begin="0" end="5">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<span class="product-badge badge badge-secondary bg-danger" style="position: absolute;">new</span>
						<a href="/team_Bling/Product/detail.do?pidx=${newProd.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${newProd.main }">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${newProd.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart pointer emptyHeart${newProd.pidx}" onclick="heart(${newProd.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${newProd.pidx}" style="text-decoration:none">${newProd.pname}</a>
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
			<span><a id="subMenu1" href="/team_Bling/Product/sroll.do?kind=R">반지</a></span>
			<span><a id="subMenu2" href="/team_Bling/Product/sroll.do?kind=R">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${ring}" var="ring" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/team_Bling/Product/detail.do?pidx=${ring.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${ring.main }">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${ring.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart pointer emptyHeart${ring.pidx}" onclick="heart(${ring.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${ring.pidx}" style="text-decoration:none">${ring.pname}</a>
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
		<img src="/team_Bling/resources/simage/middle banner.jpg" class="w-100">
	</div>
	<br><br><br>
	

	<section>
	<!-- 제품 종류 Necklace-->
		<div class="container">
			<span><a id="subMenu1" href="/team_Bling/Product/sroll.do?kind=N">목걸이</a></span>
			<span><a id="subMenu2" href="/team_Bling/Product/sroll.do?kind=N">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${neck}" var="neck" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/team_Bling/Product/detail.do?pidx=${neck.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${neck.main }" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${neck.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart pointer emptyHeart${neck.pidx}" onclick="heart(${neck.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${neck.pidx}" style="text-decoration:none">${neck.pname}</a>
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
			<span><a id="subMenu1" href="/team_Bling/Product/sroll.do?kind=E">귀걸이</a></span>
			<span><a id="subMenu2" href="/team_Bling/Product/sroll.do?kind=E">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${ear}" var="ear" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/team_Bling/Product/detail.do?pidx=${ear.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${ear.main }" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${ear.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart pointer emptyHeart${ear.pidx}" onclick="heart(${ear.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${ear.pidx}" style="text-decoration:none">${ear.pname}</a>
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
			<span><a id="subMenu1" href="/team_Bling/Product/sroll.do?kind=B">팔찌</a></span>
			<span><a id="subMenu2" href="/team_Bling/Product/sroll.do?kind=B">+더보기</a></span>
			<br>
			<div class="row" id="prodRow">
				<c:forEach items="${brac}" var="brac" begin="0" end="2">
				<div class="col-12 col-md-6 col-lg-4 col-xl-4" id="prodCol">
					<div id="img1">
						<a href="/team_Bling/Product/detail.do?pidx=${brac.pidx}" style="text-decoration:none">
							<img class="img-fluid" src="/team_Bling/resources/image/${brac.main}" alt="...">
						</a>
					</div>
					<div>
						<div style="padding:5px">
							<div id="reviewName">
								<div id="text_1">
									<span class="text-black-50">리뷰 </span><span id="review"><c:out value="${brac.reviewCount}"/></span>
									<!-- heart icon -->
									<span>
										<i class="bi bi-suit-heart pointer emptyHeart${brac.pidx}" onclick="heart(${brac.pidx})"></i>
									</span>
								</div>
								<div>
									<h3 class="text-base mb-0">
										<a class="text-dark prodName" href="/team_Bling/Product/detail.do?pidx=${brac.pidx}" style="text-decoration:none">${brac.pname}</a>
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
//관심 상품 표시 하기
 function like_do(){
     var uid = '${sessionScope.UserVO.id}';
     if (uid != ""){
 		$.ajax({
 			url:"/team_Bling/Basket/checklike1.do",
 			type:"POST",
 			async: false,
 			data:{},
 			ContentType:"application/json",
 			success:function(data){  
 			    for(let i =0; i<data.length; i++){
 					$(".emptyHeart"+data[i].pidx).attr("class","bi bi-suit-heart-fill pointer emptyHeart"+data[i].pidx);
 			    }	
 			},error:function(){
 				alert("관심상품존재찾기 에러!")
 			}
 		});
     }
 }
 like_do();	 
 
 
	//관심상품 추가
		function heart(pidx){
			
			var uid = '${sessionScope.UserVO.id}';
			var like = 0;
			if(uid==""){
				alert("로그인하셔야합니다.");
			}else{
				if($(".emptyHeart"+pidx).hasClass("bi bi-suit-heart-fill pointer")==true){
				    alert("관심 상품을 취소하셨습니다.");
					$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart pointer emptyHeart"+pidx);
					like = 0;
				}else{
					$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill pointer emptyHeart"+pidx);
					alert("관심 상품에 담았습니다");
					like = 1;
				}
				$.ajax({
					url:"/team_Bling/Basket/like.do",
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
