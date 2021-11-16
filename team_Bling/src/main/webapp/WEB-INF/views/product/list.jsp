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
		
		<!-- best상품 3개 뿌려 주는 곳 -->
		<div class="container">
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
					<script>
						$(document).ready(function(){
							var pidx = ${best.pidx};
							$.ajax({
								url:"/Basket/checklike.do",
								type:"POST",
								data:{"pidx":pidx},
								ContentType:"application/json",
								success:function(data){
									if(data == "" || data == 0){
									}else{
										$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+pidx);
									}
								},error:function(){
									alert("관심상품존재찾기 에러!")
		 						}
							});
						});
					</script> 
				</c:forEach>
			</div>
		</div>
		
		<!-- 신상품, 판매산위순, 높은 가격순, 낮은 가격순 -->
		<div class="row margin15">
			<input type="hidden" value="${kind}" id="option_kind">
			<input type="hidden" value="${orderBy}" id="option_orderBy">
			<input type="hidden" value="${page}" id="page">
			<script type="text/javascript">
				var kind = document.getElementById("option_kind").value;
				console.log(">>>>kind의 값 >>>>"+kind);
				
				document.write("<div class='btn-group btn-group-sm d-md-flex justify-content-md-end' role='group' aria-label='Basic example'>");
					document.write("<button type='button' class='btn btn-light me-md-2' onclick='option_num(1);'>신상품순</button>");
					document.write("<button type='button' class='btn btn-light me-md-2' onclick='option_num(2);'>판매순위순</button>");
					document.write("<button type='button' class='btn btn-light me-md-2' onclick='option_num(3);'>높은가격순</button>");
					document.write("<button type='button' class='btn btn-light me-md-2' onclick='option_num(4);'>낮은가격순</button>");
				document.write("</div>");
			</script>
		</div>
		
		<div class="container">
			<div class="row" id="prodRow2">
				
			</div>
		</div>
	</section>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>		
</body>

<script>
	function like(pidx){
		$.ajax({
			url:"/Basket/checklike.do",
			type:"POST",
			data:{"pidx":pidx},
			ContentType:"application/json",
			success:function(data){
				if(data == ""){
				}else{
					$(".emptyHeart"+pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+pidx);
				}
			},error:function(){
				alert("관심상품존재찾기 에러!")
				}
		});
	}
		
	var page = 1;
	var kind = document.getElementById("option_kind").value;
	var orderBy = document.getElementById("option_orderBy").value;
	
	$(function(){
		getList(page, orderBy, kind);
		page++;
	});
	
	$(window).scroll(function(){
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			getList(page, orderBy, kind);
			page++;
		}
	});
	
	function getList(page,orderBy,kind){
		$.ajax({
			type:'POST',
			dataType:'json',
			data:{"page":page,"orderBy":orderBy,"kind":kind},
			async: false,
			url:"/Product/product_scroll.do",
			success:function(returnData){
				var data = returnData.scroll;
				var startnum = returnData.startnum;
				var totalcnt = returnData.totalCnt;
				
				
				if(page == 1){
					 $("#prodRow2").html("");
				}
				var html="";
	            
	           	  if(startnum<=totalcnt ){
	           		  if(data.length > 0){
		           		for(i=0;i<data.length;i++){
		   	            	html += "<div class='col-12 col-md-6 col-lg-4 col-xl-4' id='prodCol'>";
		   	            	html += "<div id='img1'>";
		   	            	html += "<a href='/Product/detail.do?pidx="+data[i].pidx+"' style='text-decoration:none'>";
		   	            	html += "<img class='img-fluid' src='/resources/image/"+data[i].main+"'>";
		   	            	html += "</a>";
		   	            	html += "</div>";
		   	            	html += "<div>";
		   	            	html += "<div style='padding:5px'>";
		   	            	html += "<div id='reviewName'>";
		   	            	html += "<div id='text_1'>";
		   	            	html += "<span class='text-black-50'>리뷰 </span>";
		   	            	html += "<span class='text-black-50' id='review'>"+data[i].reviewCount+"</span>";
		   	            	html += "<span>";
		   	            	html += "<i class='bi bi-suit-heart emptyHeart"+data[i].pidx+"' onclick='heart("+data[i].pidx+")'></i>";
		   	            	html += "</span>";
		   	            	html += "</div>";
		   	            	html += "<div>";
		   	            	html += "<h3 class='text-base mb-0'>";
		   	            	html += "<a class='text-dark prodName' href='/Product/detail.do?pidx="+data[i].pidx+"' style='text-decoration:none'>"+data[i].pname+"</a>";
		   	            	html += "</h3>";
		   	            	html += "</div>";
		   	            	html += "<div id='totprice'>";
		   	            	if(data[i].discount != 0){
		   	            		html += "<span class='text-danger fs-5'>"+data[i].discount+"%</span>";
		       	            	html += "<span class='text-gray-500 fw-bold fs-3'>"+data[i].saleprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</span>";
		       	            	html += "<span class='text-decoration-line-through' id='saleprice'>"+data[i].price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</span>";
		   	            	}else{
		   	            		html += "<span class='text-gray-500 fw-bold fs-3'>"+data[i].price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원</span>";
		   	            	}
		   	            	html += "</div><br><br>";
		   	            	html += "</div>";
		   	            	html += "</div>";
		   	            	html += "</div>";
		   	            	html += "</div>";
		   	            	
		   	            	//하트 관련 에이작스
		   	            	like(data[i].pidx);
		   	            	
		           		}
		            		 $("#prodRow2").append(html);
		            		 
	           		  }else{}
				} 
			},error:function(e){
	           if(e.status==300){
	               alert("데이터를 가져오는데 실패하였습니다.");
	           };
	       }
		});
	}
		
	
	
	function option_num(a){
		$("#prodRow2").html("");
		
		page = 1;
		orderBy = a;
		kind = document.getElementById("option_kind").value;
		
		document.getElementById("option_orderBy").value=a;
	}
 
//스크롤페이징
	//관심상품 추가
	function heart(pidx){
		
		var uid = '${sessionScope.UserVO.id}';
		var like = 0;
		if(uid==""){
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


