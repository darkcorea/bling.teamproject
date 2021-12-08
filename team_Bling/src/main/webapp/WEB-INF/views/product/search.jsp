<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>검색</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section {
		width:1008px;
		margin: 5px auto;
	}
	
	/* 검색 키워드 표시 하는곳 */
	#search_keyowrd{
		font-size:25px;
	}
	
	/* 클래스 넣으면 폰트 색 빨간색 */
	.red{
		color:red;
	}
	
	/* 검색 dIV 설정*/
	#search_chart{
		border:1px solid black;
		font-size:20px;
	}
	/* 검색 테이블 크기 섫정 */
	#search_table {
		width:80%;
		border-collapse: separate; 
		border-spacing: 0 20px;
		margin: 5px auto;
	}
	
	/* 검색버튼 설정 */
	#btn_search {
		background-color: #CB7878;
		border: 1px solid #CB7878;
		width:100px;
	}
	
	/* 카테고리 라디오 박스 크기  */
	.btn-outline-danger {
		width:80px;
	}
	
	/* 빈 하트 아이콘, 꽉찬 하트 아이콘  */
	.bi-suit-heart, .bi-suit-heart-fill {
		font-size:27px;
		color:red;
		float: right;
		padding:5px;
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
	<%@ include file="/WEB-INF/views/header.jsp"%><BR><br>
</header>

<section>
<!-- 검색 내용 표시 -->
<div id="search_keyowrd">
	<c:if test="${pm.scri.keyword != null}">
	<span class="red">'<c:out value="${pm.scri.keyword}"/>'</span>
	</c:if>
	
	<c:if test="${pm.scri.kind == 'R'}">
	<span class="red">'반지'</span>
	</c:if>
	<c:if test="${pm.scri.kind == 'E'}">
	<span class="red">'귀걸이'</span>
	</c:if>
	<c:if test="${pm.scri.kind == 'B'}">
	<span class="red">'팔찌'</span>
	</c:if>
	<c:if test="${pm.scri.kind == 'N'}">
	<span class="red">'목걸이'</span>
	</c:if>
	
	<c:if test="${pm.scri.price == 20000}">
	<span class="red">'2만원 이하'</span>
	</c:if>
	<c:if test="${pm.scri.price == 50000}">
	<span class="red">'5만원 이하'</span>
	</c:if>
	<c:if test="${pm.scri.price == 100000}">
	<span class="red">'10만원 이하'</span>
	</c:if>
	<c:if test="${pm.scri.price == 200000}">
	<span class="red">'20만원 이하'</span>
	</c:if>
	<c:if test="${pm.scri.price == 300000}">
	<span class="red">'30만원 이상'</span>
	</c:if>
	
	<c:if test="${pm.scri.start_price != '0'}">
	<span  class="red">'<fmt:formatNumber value="${pm.scri.start_price}" pattern="#,###" />원 이상'</span>
	</c:if>
	<c:if test="${pm.scri.last_price != '0'}">
	<span  class="red">'<fmt:formatNumber value="${pm.scri.last_price}" pattern="#,###" />원 이하'</span>
	</c:if>
	<span>검색결과 <c:out value="${fn:length(list)}"/>개</span>
</div><br>
<div id="search_chart">
	<table id="search_table">
		<tr>
			<td>카테고리</td>
			<td>
				<input type="radio" class="btn-check" name="kind" id="kind1" autocomplete="off" value="R">
				<label class="btn btn-outline-danger" for="kind1">반지</label>&ensp;
				<input type="radio" class="btn-check" name="kind" id="kind2" autocomplete="off" value="N">
				<label class="btn btn-outline-danger" for="kind2">목걸이</label>&ensp;
				<input type="radio" class="btn-check" name="kind" id="kind3" autocomplete="off" value="E">
				<label class="btn btn-outline-danger" for="kind3">귀걸이</label>&ensp;
				<input type="radio" class="btn-check" name="kind" id="kind4" autocomplete="off" value="B">
				<label class="btn btn-outline-danger" for="kind4">팔찌</label>
			</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>
				<input type="search" style="width:70%;" id="keyword">&ensp;
				<button type="button" class="btn btn-danger" id="btn_search" onclick="search_fn()">검색</button>
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				<input type="radio" class="btn-check" name="price" id="price1" autocomplete="off" value=20000>
				<label class="btn btn-outline-secondary" for="price1">2만원 이하</label>&ensp;
				<input type="radio" class="btn-check" name="price" id="price2" autocomplete="off" value=50000>
				<label class="btn btn-outline-secondary" for="price2">5만원 이하</label>&ensp;
				<input type="radio" class="btn-check" name="price" id="price3" autocomplete="off" value=100000>
				<label class="btn btn-outline-secondary" for="price3">10만원 이하</label>&ensp;
				<input type="radio" class="btn-check" name="price" id="price4" autocomplete="off" value=200000>
				<label class="btn btn-outline-secondary" for="price4">20만원 이하</label>&ensp;
				<input type="radio" class="btn-check" name="price" id="price5" autocomplete="off" value=300000>
				<label class="btn btn-outline-secondary" for="price5">30만원 이상</label>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>직접입력&ensp;
				<input type="number" id="start_price" min="0" maxlength="8" oninput="numberMaxLength(this);" > &ensp;-&ensp;
				<input type="number" id="last_price" min="0"  maxlength="8" oninput="numberMaxLength(this);" >
			 </td>
		</tr>
	
	</table>
</div><br><br>
<div id="search_result"  class="container">
	<c:set value="${fn:length(list)}" var="searchZero"/>
	<c:if test="${searchZero == 0}">
	<h3 style="text-align:center;">검색 결과가 없습니다.</h3>
	</c:if>
	<div class="row" id="prodRow">
	<c:forEach items="${list}" var="list">
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
</section><br><br><br>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>

</body>
<script>

// 입력하는 가격 제한 
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
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
			},error:function(){
				alert("관심상품등록 에러!")
			}
		});
	}
}

//관심 상품 표시 하기
function like_do(){
    var uid = '${sessionScope.UserVO.id}';
    if (uid != ""){
		$.ajax({
			url:"/Basket/checklike1.do",
			type:"POST",
			async: false,
			data:{},
			ContentType:"application/json",
			success:function(data){  
			    for(let i =0; i<data.length; i++){
					$(".emptyHeart"+data[i].pidx).attr("class","bi bi-suit-heart-fill emptyHeart"+data[i].pidx);
			    }	
			},error:function(){
				alert("관심상품존재찾기 에러!")
			}
		});
    }
}
like_do();

// 검색버튼을 눌렀을 때
function search_fn(){
	let kind = $('input[name=kind]:checked').val();
	let price = $('input[name=price]:checked').val();
	let keyword = $("#keyword").val();
	let start_price =  parseInt($("#start_price").val());
	let last_price =  parseInt($("#last_price").val());
	
	console.log(price);
	// 유효성 검사
	if(kind == null && price == null && keyword == "" && start_price == "" && last_price == ""){
		alert("검색을 할려면 최소한 한가지는 입력하셔야 합니다.");
	}else if(start_price < 0 || last_price < 0 ){
		alert("가격은 양수값을 입력해 주세요.");
	}else if(start_price != "" && last_price != "" && start_price > last_price){
			alert("오른쪽의 가격이 왼쪽보다 높아야 합니다.");
			// 처음에 알럿이 뜬 뒤에 가격을 고쳐도 가격이 리셋이 안됨. 오류 수정을 위해서
			$("#start_price").val("");
			$("#last_price").val("");
	// 유효성 검사 이후에 폼을 만들어서 post통신
	}else{
		
		let frm = document.createElement("form");
		
		frm.name = "frm";
		frm.method = "post";
		frm. action = "/Product/search.do";
		
		if (kind != null){
			let input1 = document.createElement("input");
			input1.setAttribute("type","hidden");
		    input1.setAttribute("name","kind");
		    input1.setAttribute("value",kind);
		    frm.appendChild(input1);
			
		}
		if (price != null && isNaN(start_price) && isNaN(last_price)){
			let input2 = document.createElement("input");
			input2.setAttribute("type","hidden");
		    input2.setAttribute("name","price");
		    input2.setAttribute("value",price);
		    frm.appendChild(input2);
			
		}
		if(keyword != ""){
			let input3 = document.createElement("input");
			input3.setAttribute("type","hidden");
		    input3.setAttribute("name","keyword");
		    input3.setAttribute("value",keyword);
		    frm.appendChild(input3);
			
		}
		if(start_price != "" && start_price != null && !isNaN(start_price)){
			let input4 = document.createElement("input");
			input4.setAttribute("type","hidden");
		    input4.setAttribute("name","start_price");
		    input4.setAttribute("value",start_price);
		    frm.appendChild(input4);
			
		}
		if(last_price != "" && last_price != null && !isNaN(last_price)){
			 let input5 = document.createElement("input");
			 input5.setAttribute("type","hidden");
			 input5.setAttribute("name","last_price");
			 input5.setAttribute("value",last_price);
			 frm.appendChild(input5);
		}
	    document.body.appendChild(frm);
		frm.submit();	
	}	
}

</script>
</html>