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
		<input type="hidden" value="${kind}" id="kinds">
	</div><br><br>

	<!-- 제품 뿌리는 곳 -->
	<div class="container">
		<div class="row" id="prodRow">
		
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
		var kind = document.getElementById("kinds").value;
		var orderBy;
		if(kind == "best"){
			orderBy = 5;
		}else if(kind =="new"){
			orderBy = 6;
		}
		
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
					
					
					var j = 1;
					if(page == 1){
						 $("#prodRow").html("");
					}
					var html="";
		            
		           	  if(startnum<=totalcnt ){
		           		  if(data.length > 0){
			           		for(i=0;i<data.length;i++){
			   	            	html += "<div class='col-12 col-md-6 col-lg-4 col-xl-4' id='prodCol'>";
			   	            	html += "<div id='img1'>";
			   	            	html += "<span class='product-badge badge badge-secondary bg-danger' style='position: absolute;width:40px;'>";
			   	            	if(returnData.kind == "best"){
			   	            		html += j+(9*(page-1));
			   	            		console.log(page);
			   	            	}else if(returnData.kind == "new"){
			   	            		html += "NEW";
			   	            	}
			   	            	html += "</span>";
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
			   	            	j++;
			           		}
			            		 $("#prodRow").append(html);
			            		 
		           		  }else{}
					} 
				},error:function(e){
		           if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           };
		       }
			});
		}
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




















