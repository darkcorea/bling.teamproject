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
<title>관심상품 페이지</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	
	/* nav 메뉴 css */
	#basicInfo{
		background-color: #CB7878;
		opacity: 0.5;
		margin: 30px 0px 30px 0px;
		padding: 20px 0px 0px 15px;
		color: #ffffff;
		font-size: 20px;
		width: 190px;
		height: 130px;
	}
	#navMenu{
		margin-bottom: 40px;
	}
	#navSub{
		color: #C1B2B2;
	}
	#menuHead{
		font-weight: bold;
		font-size: 20px;
	}
	.navA{
		text-decoration: none;
		color: #C1B2B2;
	}
	.navA:hover{
		color: #CB7878;
	}
	.pa_top{
		padding-top:7px;
	}
	/* nav 메뉴 css */
	
	
	/* 클래스 붙이면 텍스트 센터 */
	.text_center{
		text-align:center;
	}
	.title{
		font-size:1.5rem;
		font-weight:bolder;
	}
	
	.title1{
		color:#C4C4C4;
	}
	
	.title2{
		font-size:1.2rem;
		font-weight:bolder;
	}
	
	/* 선택삭제 버튼 */
	#all_select_btn{
		height:28px;
		padding:1px 3px ;
		
	}
	
	/* 모두선택 체크 박스 */
	.checkbox1{
	width: 20px;
	height: 20px;
	cursor: pointer;
	position: relative;
 	top: 4px;
	}
	
	/* 상품마다 체크 박스 */
	.checkbox2{
	width: 20px;
	height: 20px;
	cursor: pointer;
	margin-top:52px;
	}
	
	/* 사진 크기 조정 */
	.iamge{
		width:120px;
		height:120px;
	}
	
	/* 각 관심상품 삭제 버튼 */
	.btn_margin{
		margin-top:45px;
		font-size:20px;
	}
	
	/* 클래스 붙이면 빨간색*/
	.red {
		color:red;
	}
	
	/* 물건 이름 */
	.pname {
		text-decoration: none;
		color: black;
	}
	.pname:hover, .gray:hover {
		color: #CB7878;
	}
	
	.gray{
		color:#C4C4C4;
		text-decoration: none;
	}
	
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
<div class="container">
	<!-- 화면을 nav와 다른 것 두개로 나누기 위해서 필요 -->
	<div class="row">
	
		<!-- nav바   -->
		<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
			<h2><b>마이페이지</b></h2>
			<div id="basicInfo">
				<div><b>${sessionScope.UserVO.id}</b>님</div>
				<div>내 등급 : 
					<c:choose>
						<c:when test="${sessionScope.UserVO.grade == 'B'}">
							<b>Bronze</b>
						</c:when>
						<c:when test="${sessionScope.UserVO.grade == 'S'}">
							<b>Silver</b>
						</c:when>
						<c:otherwise>
							<b>Gold</b>
						</c:otherwise>
					</c:choose>
				</div>
				<div>내 적립금 : 
					<b>
						<fmt:formatNumber value="${sessionScope.UserVO.mileage}" pattern="#,###" />
					</b>
				</div>
			</div>
			<!-- 쇼핑정도, 나의 황동, 회원 정보 NAV -->
			<div id="navMenu">
				<div id="menuHead">쇼핑정보</div>
				<div id="navSub">
					<div class="pa_top"><a class="navA" href="">주문확인/배송조회</a></div>
					<div class="pa_top"><a class="navA" href="/Basket/like1.do?kind=A">관심상품</a></div>
					<div class="pa_top"><a class="navA" href="/Basket/cart.do">장바구니</a></div>
				</div>
			</div>
			<div id="navMenu">
				<div id="menuHead">나의 활동</div>
				<div id="navSub">
					<div class="pa_top"><a class="navA" href="/MyPageR/myReview.do">나의 리뷰</a></div>
					<div class="pa_top"><a class="navA" href="">나의 문의 내역</a></div>
				</div>
			</div>
			<div>
				<div id="menuHead">회원정보</div>
				<div id="navSub">
					<div class="pa_top"><a class="navA" href="">나의 정보/수정</a></div>
					<div class="pa_top"><a class="navA" href="">배송지 목록</a></div>
					<div class="pa_top"><a class="navA" href="">회원탈퇴</a></div>
				</div>
			</div>
		</div>
		
		<!-- nav옆에 있는 영역 -->
		<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
			<div><br><br><br>
				<span class="title">관심 상품 </span><span class="title1">최근 1년간의 관심상품 내역이 제공됩니다.</span>
			</div><br>
			<!-- 관심상품의 종류 선택 하는 곳 -->
			<hr style="border:none;background-color:black;height:3px;"></hr>
			<a href="/Basket/like1.do?kind=A" class="pname" id="kind_A"><span class="title2">전체</span></a>&ensp;&ensp;
			<a href="/Basket/like1.do?kind=R" class="pname" id="kind_R"><span class="title2">반지</span></a>&ensp;&ensp;
			<a href="/Basket/like1.do?kind=N" class="pname" id="kind_N"><span class="title2">목걸이</span></a>&ensp;&ensp;
			<a href="/Basket/like1.do?kind=E" class="pname" id="kind_E"><span class="title2">귀걸이</span></a>&ensp;&ensp;
			<a href="/Basket/like1.do?kind=B" class="pname" id="kind_B"><span class="title2">팔찌</span></a>
			<hr style="border:none;background-color:black;height:3px;"></hr>
			<div>
			<!-- 전체 선택및 삭제 -->
			<input type="checkbox" class="checkbox1" name="check_like" onclick="checkAll(this)" value="">&ensp;전체선택&ensp;
			<button class="btn btn-outline-primary" id="all_select_btn" onclick="check_del()">선택삭제</button>
			</div>
			<hr>
			<!-- 관심 물품을 표시 -->
			<div id="like_list">
				<table class="table text_center">
				<c:forEach items="${list}" var="list">
				<tr>
					<td style="width:50px;">
						<input type="checkbox" class="checkbox2" name="check_like" value="${list.interest_idx}">
					</td>
					<td style="width:150px;">
						<a href="/Product/detail.do?pidx=${list.pidx}">
						<img class="iamge img-thumbnail" src="/resources/image/${list.main}">
						</a>
					</td>
					<td>
						<a href="/Product/detail.do?pidx=${list.pidx}" class="pname">
						<b><c:out value="${list.pname}"/></b>
						</a><br>
					<span class="red"><fmt:formatNumber value="${list.saleprice}" pattern="#,###" />원</span>
					</td>
					<td style="width:100px;">
						<button type="button" class="btn-close btn_margin" aria-label="Close" onclick="like_Del(${list.interest_idx})"></button>
					</td>
				</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>

	/* 관심상품 페이지에 들어오면 들어온 페이지에 맞는 타이틀을 회색으로 */
	function kind_color(){
		let kind = "<c:out value='${kind}'/>";
		
		if(kind == "A"){
			$("#kind_A").attr("class","gray");
		}
		if(kind == "R"){
			$("#kind_R").attr("class","gray");		
		}
		if(kind == "E"){
			$("#kind_E").attr("class","gray");
		}
		if(kind == "N"){
			$("#kind_N").attr("class","gray");
		}
		if(kind == "B"){
			$("#kind_B").attr("class","gray");
		}
	}
	kind_color();

	/* 관심 상품 옆에 있는 X버튼을 눌렀을 떄 */
	function like_Del(interest_idx){
		
		$.ajax({
			url:"like_del.do",
			data:{"interest_idx":interest_idx},
			dataType:"json",
			type:"POST",
			success:function(data){
				location.reload();
			},
			erorr:function(){
				alert("관심상품 삭제 에러입니다");
			}
		});
	}
	
	/* 전체선책 체크박스를 눌렀을 때 모든 체크박스 전체 해제 또는 전체 선택 */
	function checkAll(checkAll){
		let checkboxs = document.getElementsByName("check_like");
		
		checkboxs.forEach((checkbox) => {
			checkbox.checked = checkAll.checked;
		});
	}
	
	/* 선택 삭제 버튼을 누르면 체크된 관심물품 삭제 */
	function check_del(){
		// 체크된 곳이 몇개 인지 체크
		let len = $(".checkbox2:checked").length;
		var list = [];
		// 체크된 곳이 2개이상이라면
		if(len > 1){
			$(".checkbox2:checked").each(function(e){
		        let value =  $(this).val();
		        list.push(value);
		    });
			
			// 리스트를 만들어서 담고 에이작스 통신
			$.ajax({
				url:"like_del_ch.do",
				data:{"list":list},
				dataType:"json",
				type:"POST",
				success:function(data){
					location.reload();
				},
				erorr:function(){
					alert("관심상품 삭제 에러입니다");
				}
			});
		// 체크된 곳이 1개 라면
		}else{
			let interest_idx = $(".checkbox2:checked").val();
			
			$.ajax({
				url:"like_del.do",
				data:{"interest_idx":interest_idx},
				dataType:"json",
				type:"POST",
				success:function(data){
					location.reload();
				},
				erorr:function(){
					alert("관심상품 삭제 에러입니다");
				}
			});
		}
	}
	
</script>
</html>