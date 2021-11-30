<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<!-- Bootstrap core CSS -->
  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
  	<!-- Bootstrap core JavaScript -->
  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.js"></script>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	<script>
		function reviewList(){
			var str = "";
			
			
			if(${reviewList == null}){
				str += "<div id='noneReview'>기간내 등록된 리뷰가 없습니다.</div>";
			} else{
				str += "<c:forEach items='${reviewList}' var='list' begin='0' end='2'>";
				str += "	<div id='reviewDiv'>";
								/* <div> inline-block 적용하기 */
				str += "		<div id='prodImgDiv'>";
				str += "			<img id='rvImg' src='/resources/image/${list.main}' alt='제품 대표 사진'>";
				str += "		</div>";
				str += "		<div id='prodData'>";
				str += "			${list.pname}";
				str += "			${list.oname}";
				str += "			${list.quantity}";
				str += "		</div>";
				
				str += "		<div id='reviewData'>";
									/* star_rating */
				str += "			<div class='rating'>";
				str += "				<input type='radio' name='rating' value='5' id='5' class='star'>";
				str += "					<label for='5'>☆</label>"; 
				str += "				<input type='radio' name='rating' value='4' id='4' class='star'>";
				str += "					<label for='4'>☆</label>"; 
				str += "				<input type='radio' name='rating' value='3' id='3' class='star'>";
				str += "					<label for='3'>☆</label>"; 
				str += "				<input type='radio' name='rating' value='2' id='2' class='star'>";
				str += "					<label for='2'>☆</label>"; 
				str += "				<input type='radio' name='rating' value='1' id='1' class='star'>";
				str += "					<label for='1'>☆</label>";
				str += "			</div>";
				
				str += "			<div id='reviewContents'>";
										/* 리뷰 contents 출력하기 / 3줄 이상 더보기 적용 */
				str += "				${list.contents}";						
				str += "			</div>";
				str += "		</div>";
				
				str += "		<c:if test='${list.image1 != null && list.image2 != null}'>";
				str += "			<div id='rvImgDiv'>";
				str += "				<img id='rvImg' src='/resources/review_img/${list.image1}' alt='리뷰사진 1번'>";
				str += "				<img id='rvImg' src='/resources/review_img/${list.image2}' alt='리뷰사진 2번'>";
				str += "			</div>";
				str += "		</c:if>";
				str += "		<c:if test='${list.image1 != null && list.image2 == null}'>";
				str += "			<div id='rvImgDiv'>";
				str += "				<img id='rvImg' src='/resources/review_img/${list.image1}' alt='리뷰사진 1번'>";
				str += "			</div>";
				str += "		</c:if>";
				str += "		<c:if test='${list.image1 == null && list.image2 == null}'>";
				str += "			<div id='rvImgDiv'></div>";
				str += "		</c:if>";
				
				str += "		<div id='deleteBtn'>";
				str += "			<button>삭제하기</button>";
				str += "		</div>";
				str += "	</div>";
				str += "</c:forEach>";
				
				
				str += "<br><br><br><br><br><br><br><br>";
			}
			document.getElementById("formDiv").innerHTML = str;
		}
		
		
		
		function orderDate1(){
			let date1 = document.querySelector("input[id='date1']").value;
			
			return date1;
		}
		
		
		function orderDate2(){
			let date1 = "";
			let date2 = document.querySelector("input[id='date2']").value;
			
			date1 = orderDate1();
			
			
			if(date1 == null){
				alert("시작일을 먼저 선택해주세요.");
			}
			else{
				$.ajax({
					url: "/MyPage/myReview.do",
					type: "post",
					data: "date1="+date1+"&date2="+date2,
					ContentType: "json",
					success: function(data){
						console.log("리뷰목록 성공");
					},
					error: function(){
						alert("리뷰목록 에러");
					}
				});
			}
			
		}
		
		
		
		
		
		
		
		
		
		function uploadFile(){
			let files = document.querySelector("input[name='uploadBtn']").files;
			console.log("files : "+files);
			
			let image1 = files[0];
			let image2 = files[1];
			console.log("image1 : "+image1);
			console.log("image2 : "+image2);
			
			let formData = new FormData();
			formData.append("image1", image1);
			formData.append("image2", image2);
			
			$.ajax({
				url: "/MyPage/upload.do",
				type: "post",
				data: formData,
				// processData: true=> get방식, false => post방식
                dataType: "text",
                // contentType: true => application/x-www-form-urlencoded, 
                //                false => multipart/form-data
                processData: false,
                contentType: false,
                success: function(data){
                	if(data == "true"){
                		console.log("파일 업로드 성공");
                	}
                	else if(data == "false"){
                		console.log("지정된 이미지 파일이 아닙니다.");
                		console.log("파일 업로드 실패");
                    	alert("파일 업로드 실패");
                    	modalReset();
                	}
                }
			});
		}
		
		
		function contentsCheck(){
			//리뷰내용 가져오기(contents)
			let textArea1 = document.querySelector("textarea").value;
			let contents = "";
			
			if(textArea1 != null){
				contents = textArea1;
				if(contents.length<10){
					contents = "";
					Swal.fire({
						  icon: 'error',
						  title: '내용을 입력해주세요!',
						  text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
						});
				}
				else if(contents.length>500){
					contents = "";
					Swal.fire({
						  icon: 'error',
						  title: '내용을 입력해주세요!',
						  text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
						});
				}
				else if(contents.length>=10 && contents.length<=500){
					
				}
			}
			else if(textArea1 == null){
				Swal.fire({
					  icon: 'error',
					  title: '내용을 입력해주세요!',
					  text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
					});
				console.log("내용을 입력해주세요.");
				modalReset();
			}
			
			console.log("contentsCheck()에서 return값 : "+contents);
			return contents;
		}
		
		
		function reviewWrite(){
			//detail_idx 값 가져오기
			//console.log(event.currentTarget.value);
			//let detail_idx = event.currentTarget.value;
			
			//detail_idx 확인
			//console.log(idx);
			
			//console.log(event.currentTarget);
			//let detail_idx = event.currentTarget.value;
			
			
			//Uncaught TypeError: Cannot read properties of null (reading 'value')
			// -> JavaScript는 존재하지 않는 것의 값을 읽을 수 없어서 오류 발생
			
			//별점 value 가져오기(grade)
			let starRating = document.querySelector("input[name='rating']:checked");
			let grade = "";
			let contents = "";
			
			if(starRating != null){
				grade = document.querySelector("input[name='rating']:checked").value;
				console.log(grade);
				
				contents = contentsCheck();
				console.log("reviewWrite()에서 contentsCheck() 호출 후 return값 : "+contentsCheck());
			}
			else if(starRating == null){
				Swal.fire({
					  icon: 'error',
					  title: '별점을 선택해주세요!',
					  text: '별점은 1점부터 5점까지 선택 가능합니다.',
					});
				console.log("별점을 선택해주세요.");
				modalReset();
			}
			
			
			$.ajax({
				url: "/MyPage/reviewWrite.do",
				type: "post",
				data: "contents="+contents+"&grade="+grade,
				ContentType: "json",
				success: function(data){
					console.log("리뷰작성 성공");
					console.log(grade);
				},
				error: function(){
					console.log("!!!!!리뷰작성 에러!!!!!");
				}
			});
		}
		
		
		function modalReset(){
			//document.getElementById("textArea").value = "";
			//document.getElementById("uploadBtn").value = "";
			$("#modalForm")[0].reset();
			
		}
		
		
	</script>
	
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
	/* nav 메뉴 css */
	
	
	/* modal */
		/* modal 가운데 위치 */
		.modal {
	        text-align: center;
		}
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		/* modal 가운데 위치 */
	 
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		.modal-header{
			background-color: #CB7878;
		}
		.modal-title{
			color: #ffffff;
			font-size: 30px;
			position: relative;
			left: 175px;
		}
		#modalText1{
			text-align: center;
			font-weight: bold;
			font-size: 20px;
		}
		#textArea{
			width: 465px;
			height: 200px;
			resize: none;
			background-color: #C4C4C4;
			opacity: 0.5;
		}
		#textArea::placeholder{
			color: #000000;
		}
		#closeBtn{
			width: 80px;
			color: #000000;
			background-color: #ffffff;
			border: 2px solid #C4C4C4;
			position: relative;
			right: 150px;
		}
		#saveBtn{
			width: 80px;
			color: #ffffff;
			background-color: #CB7878;
			border: 2px solid #CB7878;
			position: relative;
			right: 150px;
		}
		#saveBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 2px solid #CB7878;
		}
		#uploadDiv{
			width: 465px;
			height: 40px;
			background-color: #CB7878;
		}
		#uploadBtn{
			display: none;
		}
		.fileBtn{
			width: 465px;
			height: 40px;
		}
		#fileBtnText{
			font-size: 18px;
			color: #ffffff;
		}
		.bi-camera::before{
			margin: 0px 10px 0px 0px;
			font-size: 23px;
		}
	/* modal */
	
	/* modal - star rating */
		.rating {
		    display: flex;
		    flex-direction: row-reverse;
		    justify-content: center
		}
		.rating>input {
		    display: none
		}
		.rating>label {
		    position: relative;
		    width: 1em;
		    font-size: 2vw;
		    color: #FF3A00;
		    cursor: pointer
		}
		.rating>label::before {
		    content: "\2605";
		    position: absolute;
		    opacity: 0
		}
		.rating>label:hover:before,
		.rating>label:hover~label:before {
		    opacity: 1 !important
		}
		.rating>input:checked~label:before {
		    opacity: 1
		}
		.rating:hover>input:checked~label:before {
		    opacity: 0.4
		}
		body {
		    background: #222225;
		    color: white
		}
		h1,p {
		    text-align: center
		}
		h1 {
		    margin-top: 150px
		}
		p {
		    font-size: 1.2rem
		}
		@media only screen and (max-width: 600px) {
		    h1 {
		        font-size: 14px
		    }
		    p {
		        font-size: 12px
		    }
		}
	/* modal - star rating */
	
	
/* -------------------------- article css -------------------------- */
	/* 		onload로 화면 출력		 */
		#noneReview{
			text-align: center;
		}
		#reviewDiv{
			display: block;
			width: 100%;
		}
		#prodImgDiv{
			width: 80px;
			height: 80px;
			display: inline-block;
		}
		#rvImgDiv{
			width: 150px;
			height: 80px;
			display: inline-block;
		}
		#rvImg{
			width: 70px;
			height: 70px;
			display: inline-block;
		}
		#prodData{
			width: 100px;
			display: inline-block;
		}
		#reviewData{
			width: 270px;
			display: inline-block;
		}
		#deleteBtn{
			width: 100px;
			display: inline-block;
		}
		#reviewContents{
			overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    line-height: 16px;    
		    max-height: 32px;     
		    -webkit-line-clamp: 4; /* 표시하고자 하는 라인 수 */
		    -webkit-box-orient: vertical;
		}
		
	/* 		onload로 화면 출력		 */	
	
		#secTitle{
			font-size: 30px;
			margin: 100px 0px 20px 0px;
		}
		#orderProgress{
			word-spacing: 10px;
		}
		.circle{
			width: 128px;
			height: 128px;
			display: inline-block;
			padding: 0.35em 0.65em;
			font-size: 0.75em;
			font-weight: 700;
			line-height: 1;
			color: #000000;
			text-align: center;
			white-space: nowrap;
			vertical-align: baseline;
			border-radius: 64px;
			border: 1px solid black;
			
		}
		.circleText1{
			position: relative;
			top: 50px;
			font-size: 15px;
		}
		.circleText2{
			position: relative;
			top: 60px;
			font-size: 15px;
		}
		.chevron{
			position: relative;
			top: 40px;
		}
		#orderMenu{
			border-bottom: 2px solid black;
			height: 40px;
		}
		#sectionCol{
			height: 1000px;
		}
		#th3{
			width: 255px;
			text-align: center;
		}
		#line{
			position: relative;
			left: 5px;
			color: #C4C4C4;
		}
		#leftLine{
			position: relative;
			right: 5px;
			color: #C4C4C4;
		}
		#review{
			cursor: pointer;
		}
		#reviewBtn{
			color: #000000;
			background-color: #ffffff;
			border: none;
		}
/* -------------------------- article css -------------------------- */
	</style>
	
</head>
<body onload="reviewList()">
	<!-- header -->
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	
	
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<h2><b>마이페이지</b></h2>
						<div id="basicInfo">
							<div><b>${sessionScope.UserVO.id}</b>님</div>
							<div>내 등급 : 
								<c:choose>
									<c:when test="${sessionScope.UserVO.grade == b}">
										<b>Bronze</b>
									</c:when>
									<c:when test="${sessionScope.UserVO.grade == s}">
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
						<div id="navMenu">
							<div id="menuHead">쇼핑정보</div>
							<div id="navSub">
								<div>
									<div>주문확인</div>
									<div>/배송조회</div>
								</div>
								<div>관심상품</div>
								<div>장바구니</div>
							</div>
						</div>
						<div id="navMenu">
							<div id="menuHead">나의 활동</div>
							<div id="navSub">
								<div>나의 리뷰</div>
								<div>나의 문의 내역</div>
							</div>
						</div>
						<div>
							<div id="menuHead">회원정보</div>
							<div id="navSub">
								<div>나의 정보/수정</div>
								<div>배송지 목록</div>
								<div>회원탈퇴</div>
							</div>
						</div>
					</div>
					
					<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
						<div id="secTitle">나의 리뷰 보기</div>
						<div id="reviewList">
							<div id="btnNdate">
								<button type="button">오늘</button>
								<button type="button">1개월</button>
								<button type="button">3개월</button>
								<button type="button">6개월</button>
								<button type="button">1년</button>
								<button type="button">3년</button>
								
								<input type="date" id="date1" onchange="orderDate1()" value="2021-10-29" min="2019-01-01" max="2021-12-31">
								~
								<input type="date" id="date2" onchange="orderDate2()" value="2021-10-29" min="2019-01-01" max="2021-12-31">
								<button>조회</button>
							</div>
						</div>
						
						<div id="formDiv">
							
						</div>
						
						<div>
							<!-- 페이징 : 처음 이전 1~10 다음 끝  -->
						</div>
					</div>
					
				</div>
			</div>
		</article>
	</section>
</body>
</html>