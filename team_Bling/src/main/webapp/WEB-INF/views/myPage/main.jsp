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
			console.log("orderInfo 실행됨");
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
				
				str += "		<c:if test='${ro.contents != null}'>";
				str += "			<td id='td7'><span id='t7'><input id='reviewWrite' data-bs-toggle='modal' data-bs-target='#staticBackdrop2' onclick='ridx(${ro.ridx})' value='리뷰 확인' readonly></span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.contents == null}'>";
				str += "			<td id='td7'><span id='t7'><input id='reviewWrite' data-bs-toggle='modal' data-bs-target='#staticBackdrop1' onclick='detailIdx(${ro.detail_idx})' value='리뷰 작성' readonly></span></td>";
				str += "		</c:if>";
				str += "	</tr>";
				str += "</c:forEach>";
				
				str += "<br><br><br><br><br><br><br><br>";
			}
			document.getElementById("formDiv").innerHTML = str;
		}
		
		
		function detailIdx(detail_idx){
			//console.log(event.currentTarget.value);
			
			$.ajax({
				url: "/MyPage/detailIdx.do",
				type: "post",
				data: "detail_idx="+detail_idx,
				ContentType: "json",
				success: function(data){
					console.log("detail_idx : "+detail_idx);
					
				},
				error: function(){
					alert("detai_idx 넘기기 에러");
				}
			});
		}
		
		
		function ridx(ridx){
			
			return ridx;
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
                		Swal.fire({
    						icon: 'error',
    						title: '지정된 이미지 파일이 아닙니다!',
    						text: 'jpg, jpeg, png 파일만 선택 가능합니다.',
    					});
                		pictureReset();
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
					window.location.replace("/MyPage/main.do");
				},
				error: function(){
					console.log("!!!!!리뷰작성 에러!!!!!");
				}
			});
		}
		
		
		function modalReset(){
			//document.getElementById("textArea").value = "";
			//document.getElementById("uploadBtn").value = "";
			//$("#modalForm")[0].reset();
			document.querySelector("form[id='modalForm']").reset();
			document.querySelector("form[id='pictureForm']").reset();
		}
		
		function pictureReset(){
			document.querySelector("form[id='pictureForm']").reset();
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
		.pa_top{
			padding-top:7px;
		}
		#myPageTitle{
			text-decoration: none;
			color: #000000;
		}
	/* nav 메뉴 css */
	
	
	/* modal */
		.modal {
	        text-align: center;
		}
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
		
	/* modal - star rating */
	
	
/* -------------------------- article css -------------------------- */
	/* --------------------onload로 화면 출력-------------------- */	
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
			width: 70px;
			text-align: center;
			font-size: 14px;
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
			width: 80px;
			text-align: center;
		}
	/* --------------------onload로 화면 출력-------------------- */	
	
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
		#reviewWrite{
			color: #000000;
			background-color: #ffffff;
			border: none;
			cursor: pointer;
			width: 70px;
		}
/* -------------------------- article css -------------------------- */
	</style>
	
</head>
<body onload="orderInfo()">
	<!-- header -->
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	
	<!-- 리뷰 작성 Modal -->
	<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="modalReset()"></button>
				</div>
				
				<div class="modal-body">
					<div id="modalText1">상품은 만족하셨나요?</div>
					<form id="modalForm">				
						<!-- star_rating -->
						<div class="rating">
							<input type="radio" name="rating" value="5" id="5" class="star">
								<label for="5">☆</label> 
							<input type="radio" name="rating" value="4" id="4" class="star">
								<label for="4">☆</label> 
							<input type="radio" name="rating" value="3" id="3" class="star">
								<label for="3">☆</label> 
							<input type="radio" name="rating" value="2" id="2" class="star">
								<label for="2">☆</label> 
							<input type="radio" name="rating" value="1" id="1" class="star">
								<label for="1">☆</label>
						</div>
						<br>
						<textarea id="textArea" placeholder="상품에 대한 후기를 남겨 주세요.&#13;&#10;사진은 2장까지 첨부 가능합니다."></textarea>
						<br>
					</form>
					<form id="pictureForm">
						<div id="uploadDiv">
						<!-- 파일을 업로드할 영역 -->
							<input type="file" id="uploadBtn" name="uploadBtn" multiple accept=".jpg, .jpeg, .png" onchange="uploadFile()">
							<label for="uploadBtn" class="fileBtn btn">
								<span id="fileBtnText">
									<i class="bi bi-camera"></i>사진 첨부하기
								</span>
							</label>
							<span id="fileName"></span>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal" onclick="modalReset()">닫기</button>
					<button type="button" class="btn btn-primary" id="saveBtn" data-bs-dismiss="modal" onclick="javascript:reviewWrite(); modalReset();">저장</button>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- 리뷰 확인 Modal -->
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="modalReset()"></button>
				</div>
				
				<div class="modal-body">
					<form id="modalForm">				
						<!-- star_rating -->
						<div class="rating">
							<input type="radio" name="rating" value="5" id="5" class="star">
								<label for="5">☆</label> 
							<input type="radio" name="rating" value="4" id="4" class="star">
								<label for="4">☆</label> 
							<input type="radio" name="rating" value="3" id="3" class="star">
								<label for="3">☆</label> 
							<input type="radio" name="rating" value="2" id="2" class="star">
								<label for="2">☆</label> 
							<input type="radio" name="rating" value="1" id="1" class="star">
								<label for="1">☆</label>
						</div>
						<br>
						<textarea id="textArea" placeholder="상품에 대한 후기를 남겨 주세요.&#13;&#10;사진은 2장까지 첨부 가능합니다."></textarea>
						<br>
					</form>
					<form id="pictureForm">
						<div id="uploadDiv">
						<!-- 파일을 업로드할 영역 -->
							<input type="file" id="uploadBtn" name="uploadBtn" multiple accept=".jpg, .jpeg, .png" onchange="uploadFile()">
							<label for="uploadBtn" class="fileBtn btn">
								<span id="fileBtnText">
									<i class="bi bi-camera"></i>사진 첨부하기
								</span>
							</label>
							<span id="fileName"></span>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal" onclick="">닫기</button>
					<button type="button" class="btn btn-primary" id="saveBtn" data-bs-dismiss="modal" onclick="">삭제</button>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<section>
		<article>
			<div class="container">
				<div class="row">
					<!-- nav바   -->
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
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
	
	<br><br><br><br>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
	
</body>
</html>