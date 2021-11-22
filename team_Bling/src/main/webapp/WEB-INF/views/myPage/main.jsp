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
		function orderInfo(){
			var str = "";
			
			if(${recentOrder == null}){
				str += "<td colspan='7' id='noneOrder'><span>최근 주문내역이 없습니다.</span></td>";
			} else{
				str += "<c:forEach items='${recentOrder}' var='ro'>";
				
				str += "<c:set var='rdate1' value='${ro.rdate}' />";
				str += "<c:set var='rdate2' value='${fn:substring(rdate1, 2, 11)}' />";
				
				str += "<c:set var='oname1' value='${ro.oname}' />";
				str += "<c:set var='plus' value='+' />";
				str += "<c:set var='oname2' value='${fn:substringBefore(oname1, plus)}' />";
				
				str += "	<tr>";
				str += "		<td id='td1'><span id='t1'>${rdate2}</span></td>";
				str += "		<td id='td2'><span id='t2'>${ro.order_idx}</span></td>";
				str += "		<td id='td3'><span id='t3'>${ro.pname} / ${oname2}</span></td>";
				str += "		<td id='td4'><span id='t4'><fmt:formatNumber value='${(ro.saleprice+ro.addprice)*ro.quantitySum}' pattern='#,###' />원</span></td>";
				str += "		<td id='td5'><span id='t5'>${ro.quantitySum}</span></td>";
				
				//	\(backslash)를 붙이면 해당 문자로만 인식한다. -> \"는 문자열을 나타내는 큰따옴표의 역할만 할 뿐, 쿼리문을 구분짓는 역할은 하지 않는다.
				str += "		<c:if test='${ro.deli_stat == \"Y\"}'>";
				str += "			<td id='td6'><span id='t6'>결제완료</span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"A\"}'>";
				str += "			<td id='td6'><span id='t6'>상품준비중</span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"B\"}'>";
				str += "			<td id='td6'><span id='t6'>배송중</span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"C\"}'>";
				str += "			<td id='td6'><span id='t6'>배송완료</span></td>";
				str += "		</c:if>";
				
				str += "		<td id='td7'><span id='t7'><button class='btn btn-primary' id='reviewBtn' data-bs-toggle='modal' data-bs-target='#staticBackdrop' onclick='javascript:upload(); detailIdx();' value='${ro.detail_idx}' >리뷰 작성</button></span></td>";
				str += "	</tr>";
				str += "</c:forEach>";
				
				str += "<br><br><br><br><br><br><br><br>";
			}
			document.getElementById("formDiv").innerHTML = str;
		}
		
		
		function detailIdx(){
			console.log(event.currentTarget.value);
			let detail_idx = event.currentTarget.value;
			
			$.ajax({
				url: "/MyPage/detailIdx.do",
				type: "post",
				data: "detail_idx="+detail_idx,
				ContentType: "json",
				success: function(data){
					console.log(detail_idx);
				},
				error: function(){
					alert("리뷰작성 에러");
				}
			});
		}
		
		function uploadBtn(){
			event.preventDefault();
		    let files = event.target.files;
		    var file = files[0];
		    
			//console.log(file);
			/*
				파일은 아무 형태로나 서버로 전달할 수 없다. 위에서 받아온 file도 그 형태 그대로 전달 할 수 없다.
				때문에 formData 라는 것을 사용하게 된다.
			*/
			let formData = new FormData();
			formData.append("file", file);
			
			
		    //formData.append("file", file);
			 /* console.log(files);
			 console.log(files[0]);
			 console.log(formData);
			 console.log(formData.getAll("files")); */
			
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
                    alert(data);
                    uploadBtn2(files[1]);
                }
            });
		}
		
		function uploadBtn2(files){
			
		    let file = files;
			/*
				파일은 아무 형태로나 서버로 전달할 수 없다. 위에서 받아온 file도 그 형태 그대로 전달 할 수 없다.
				때문에 formData 라는 것을 사용하게 된다.
			*/
			let formData = new FormData();
			formData.append("file", file);
			
			
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
                    alert(data);
                }
            });
		}
		
		//drag&drop file upload
		function upload(){
	        $(".fileDrop").on("dragenter dragover", function(event){
	            event.preventDefault(); // 기본효과를 막음
	        });
	        // event : jQuery의 이벤트
	        // originalEvent : javascript의 이벤트
	        $(".fileDrop").on("drop", function(event){
	            event.preventDefault(); // 기본효과를 막음
	            // 드래그된 파일의 정보
	            var files = event.originalEvent.dataTransfer.files;
	            // 첫번째 파일
	            var file = files[0];
	            // 콘솔에서 파일정보 확인
	            console.log(file);

	            // ajax로 전달할 폼 객체
	            var formData = new FormData();
	            // 폼 객체에 파일추가, append("변수명", 값)
	            formData.append("file", file);


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
	                    alert(data);
	                    upload2(files[1]);
	                }
	            });
	        });
		}
		
		
		//drag&drop file upload
		function upload2(files){
	        
            // 두번째 파일
            var file = files;
            // 콘솔에서 파일정보 확인
            //console.log(file);

            // ajax로 전달할 폼 객체
            var formData = new FormData();
            // 폼 객체에 파일추가, append("변수명", 값)
            formData.append("file", file);


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
                    alert(data);
                }
            });
		}

		
		function reviewWrite(){
			//detail_idx 값 가져오기
			//console.log(event.currentTarget.value);
			//let detail_idx = event.currentTarget.value;
			
			//detail_idx 확인
			//console.log(idx);
			
			//console.log(event.currentTarget);
			//let detail_idx = event.currentTarget.value;
			
			
			
			//별점 value 가져오기(grade)
			let grade = document.querySelector("input[name='rating']:checked").value;
			console.log(grade);
			
			
			//리뷰내용 가져오기(contents)
			let contents = document.querySelector("textarea").value;
			console.log(contents);
			
			
			//사진파일 가져오기(image1)
			//let image1 = document.querySelector("input[name='image1']").value;
			//console.log(image1);
			
			//사진파일 가져오기(image2)
			//let image2 = document.querySelector("input[name='image2']").value;
			//console.log(image2);
			
						
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
					alert("리뷰작성 에러");
				}
			});
		}
		
		
		
		
		//별점(star_rating, 라디오 버튼으로 생성) 값 가져오기
		/* function ratingFn(){
			let starRating = "";
			
			starRating = document.querySelector('input[name="rating"]:checked').value;
			
			console.log(starRating);
		} */
		
		
		
		/* sweetalert2로 텍스트, 파일업로드 2개 하는게 잘 안 돼서 부트스트랩 모달로 전환
		function reviewWrite(){
			//detail_idx 값 가져오기
			console.log(event.currentTarget.value);
			let detail_idx = event.currentTarget.value;
			
			Swal.fire({
				allowOutsideClick: false,
				customClass: {
					title: "title",
					input: "textarea",
					button: "cancelButton"
				},
				
				width: "600px",
				height: "600px",
				
				title: "리뷰작성",
				
				inputLabel: "상품을 사용해보셨나요?",
						
						
				template: "#star_rating",
				
				input: "textarea",
				inputAttributes: {
					placeholder: "상품에 대한 후기를 남겨주세요.\n사진은 2장까지 첨부 가능합니다."
				  
				},
				
				
				
				showCloseButton: true,
				showCancelButton: true,
				cancelButtonText: "닫기",
				showConfirmButton: true,
				confirmButtonText: "저장",
				confirmButtonColor: "#CB7878",
				reverseButtons: true
			}).then(function(result) {
				//별점 value 가져오기(grade)
				let grade = document.querySelector("input[name='rating']:checked").value;
				
				//detail_idx 확인
				//console.log(detail_idx);
				
				console.log(event.currentTarget);
				//let detail_idx = event.currentTarget.value;
				
				//sweetalert2 input textarea에 입력된 데이터 가져오기
				console.log(result.value);
				let contents = result.value;
				
				
				$.ajax({
					url: "/MyPage/reviewWrite.do",
					type: "post",
					data: "contents="+contents+"&grade="+grade+"&image1=hand with ring.jpg&image2=ring_main_1.jpg&detail_idx="+detail_idx,
					ContentType: "json",
					success: function(data){
						console.log(grade);
					},
					error: function(){
						alert("리뷰작성 에러");
					}
				});
			}, function(dismiss){
				if(dismiss == "cancel"){
					// function when cancel button is clicked	
				}
			});
		} */
		
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
	/* nav 메뉴 css */
	
	/* sweetalert2 css */
		/* .title{
			color: #ffffff;
			background-color: #CB7878;
			font-size: 30px;
			position: relative;
		}
		.textarea{
			width: 370px;
			height: 160px;
			resize: none;
			position: relative;
			left: 80px;
		} */
		
	/* sweetalert2 css */
	
	
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
	
	
	
	/* modal - drag&drop image upload */
		.fileDrop {
	        width: 465px;
	        height: 20px;
	        border: 1px dotted blue;
	    }
	    small {
	        margin-left: 3px;
	        font-weight: bold;
	        color: gray;
	    }
	/* modal - drag&drop image upload */
	
	
	/* article css  */
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
		#noneOrder{
			text-align: center;
		}
		#t1,#t4{
			width: 100px;
			height: 20px;
			font-size: 14px;
		}
		#t2{
			width: 15px;
			font-size: 14px;
		}
		#t5{
			width: 30px;
			font-size: 14px;
		}
		#t3{
			width: 400px;
			font-size: 14px;
		}
		#t6{
			width: 100px;
			font-size: 14px;
		}
		#t7{
			width: 100px;
			text-align: center;
			font-size: 14px;
		}
		#sectionCol{
			height: 1000px;
		}
		#td1{
			width: 80px;
			text-align: center;
		}
		#td2{
			width: 80px;
			text-align: center;
		}
		#td3{
			width: 255px;
			position: relative;
			left: 10px;
		}
		#td4{
			width: 85px;
			text-align: center;
		}
		#td5{
			width: 40px;
			text-align: center;
		}
		#td6{
			width: 90px;
			text-align: center;
		}
		#td7{
			width: 100px;
			text-align: center;
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
	/* article css  */
	</style>
	
</head>
<body onload="orderInfo()">
	<!-- header -->
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<div id="modalText1">상품을 사용해보셨나요?</div>
									
					<!-- star_rating -->
					<div class="rating">
						<input type="radio" name="rating" value="5" id="5">
							<label for="5">☆</label> 
						<input type="radio" name="rating" value="4" id="4">
							<label for="4">☆</label> 
						<input type="radio" name="rating" value="3" id="3">
							<label for="3">☆</label> 
						<input type="radio" name="rating" value="2" id="2">
							<label for="2">☆</label> 
						<input type="radio" name="rating" value="1" id="1">
							<label for="1">☆</label>
					</div>
					<br>
					<textarea id="textArea" placeholder="상품에 대한 후기를 남겨 주세요.&#13;&#10;사진은 2장까지 첨부 가능합니다."></textarea>
					<br>
					<!-- 파일을 업로드할 영역 -->
					<div class="fileDrop"></div>
					<input type="file" id="uploadBtn" name="uploadBtn" multiple onchange="uploadBtn(this)">
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveBtn" data-bs-dismiss="modal" onclick="reviewWrite()">저장</button>
				</div>
				
			</div>
		</div>
	</div>
	
	
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
										<b><c:out value="${'Bronze'}" /></b>
									</c:when>
									<c:when test="${sessionScope.UserVO.grade == s}">
										<b><c:out value="${'Silver'}" /></b>
									</c:when>
									<c:otherwise>
										<b><c:out value="${'Gold'}" /></b>
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
						<div id="secTitle">진행중인 주문</div>
						<div id="orderProgress">
							<span class="circle">
								<span class="circleText1">결제완료</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statY.deliStatCnt != null}">
											<c:out value="${statY.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">상품준비중</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statA.deliStatCnt != null}">
											<c:out value="${statA.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">배송중</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statB.deliStatCnt != null}">
											<c:out value="${statB.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">배송완료</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statC.deliStatCnt != null}">
											<c:out value="${statC.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
						</div>
						<div id="secTitle">최근 주문 정보</div>
						<table>
							<tr id="orderMenu">
								<th id="td1"><span>주문일자</span><span id="line">|</span></th>
								<th id="td2"><span>주문번호</span><span id="line">|</span></th>
								<th id="th3"><span>상품명/옵션</span></th>
								<th id="td4"><span id="leftLine">|</span><span>상품금액</span><span id="line">|</span></th>
								<th id="td5"><span>수량</span><span id="line">|</span></th>
								<th id="td6"><span>주문상태</span><span id="line">|</span></th>
								<th id="td7"><span>확인/리뷰</span></th>
							</tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
						</table>
						<table id="formDiv">
							
						</table>
						
						
					</div>
				</div>
			</div>
		</article>
	</section>
</body>
</html>