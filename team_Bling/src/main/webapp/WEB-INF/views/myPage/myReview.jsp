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
			
			/*
				${reviewList}는 배열이기 때문에 ${reviewList == null}로 조건은 설정하면 적용되지 않는다.
				if(${reviewList == []})와 같이 빈 배열로 조건을 설정하면 적용된다.
			*/
			if(${reviewList == []}){
				str += "<div id='noneReview'>기간내 등록된 리뷰가 없습니다.</div>";
			} else{
				str += "<c:forEach items='${reviewList}' var='list' varStatus='status' begin='0' end='20'>";
				str += "	<c:set var='oname' value='${fn:substringBefore(list.oname, \" +\")}' />";
				str += "	<div id='reviewDiv'>";
								/* <div> inline-block 적용하기 */
				str += "		<div id='prodImgDiv'>";
				str += "			<img id='rvImg' src='/resources/image/${list.main}' alt='제품 대표 사진'>";
				str += "		</div>";
				str += "		<div id='prodData'>";
				str += "			${list.pname}<br>";
				str += "			<span id='textColor'>[옵션] ${oname}</span><br>";
				str += "			<span id='textColor'>[수량] ${list.quantity}개</span>";
				str += "		</div>";
				
				str += "		<div id='reviewData'>";
									/* star_rating */
				str += "			<c:if test='${list.grade == 5}'>";
				str += "				<div class='rating'>";
				str += "					<input type='radio' name='rating${status.index}' id='5' value='5' class='star' onclick='return(false)' checked>";
				str += "						<label for='5'>☆</label>";
				str += "					<input type='radio' name='rating' value='4' id='4' class='star' onclick='return(false)'>";
				str += "						<label for='4'>☆</label>";
				str += "					<input type='radio' name='rating' value='3' id='3' class='star' onclick='return(false)'>";
				str += "						<label for='3'>☆</label>";
				str += "					<input type='radio' name='rating' value='2' id='2' class='star' onclick='return(false)'>";
				str += "						<label for='2'>☆</label>";
				str += "					<input type='radio' name='rating' value='1' id='1' class='star' onclick='return(false)'>";
				str += "						<label for='1'>☆</label>";
				str += "				</div>";
				str += "			</c:if>";
				str += "			<c:if test='${list.grade == 4}'>";
				str += "				<div class='rating'>";
				str += "					<input type='radio' name='rating' value='5' id='5' class='star' onclick='return(false)'>";
				str += "						<label for='5'>☆</label>";
				str += "					<input type='radio' name='rating${status.index}' value='4' id='4' class='star' onclick='return(false)' checked>";
				str += "						<label for='4'>☆</label>";
				str += "					<input type='radio' name='rating' value='3' id='3' class='star' onclick='return(false)'>";
				str += "						<label for='3'>☆</label>";
				str += "					<input type='radio' name='rating' value='2' id='2' class='star' onclick='return(false)'>";
				str += "						<label for='2'>☆</label>";
				str += "					<input type='radio' name='rating' value='1' id='1' class='star' onclick='return(false)'>";
				str += "						<label for='1'>☆</label>";
				str += "				</div>";
				str += "			</c:if>";
				str += "			<c:if test='${list.grade == 3}'>";
				str += "				<div class='rating'>";
				str += "					<input type='radio' name='rating' value='5' id='5' class='star' onclick='return(false)'>";
				str += "						<label for='5'>☆</label>";
				str += "					<input type='radio' name='rating' value='4' id='4' class='star' onclick='return(false)'>";
				str += "						<label for='4'>☆</label>";
				str += "					<input type='radio' name='rating${status.index}' value='3' id='3' class='star' onclick='return(false)' checked>";
				str += "						<label for='3'>☆</label>";
				str += "					<input type='radio' name='rating' value='2' id='2' class='star' onclick='return(false)'>";
				str += "						<label for='2'>☆</label>";
				str += "					<input type='radio' name='rating' value='1' id='1' class='star' onclick='return(false)'>";
				str += "						<label for='1'>☆</label>";
				str += "				</div>";
				str += "			</c:if>";
				str += "			<c:if test='${list.grade == 2}'>";
				str += "				<div class='rating'>";
				str += "					<input type='radio' name='rating' value='5' id='5' class='star' onclick='return(false)'>";
				str += "						<label for='5'>☆</label>";
				str += "					<input type='radio' name='rating' value='4' id='4' class='star' onclick='return(false)'>";
				str += "						<label for='4'>☆</label>";
				str += "					<input type='radio' name='rating' value='3' id='3' class='star' onclick='return(false)'>";
				str += "						<label for='3'>☆</label>";
				str += "					<input type='radio' name='rating${status.index}' value='2' id='2' class='star' onclick='return(false)' checked>";
				str += "						<label for='2'>☆</label>";
				str += "					<input type='radio' name='rating' value='1' id='1' class='star' onclick='return(false)'>";
				str += "						<label for='1'>☆</label>";
				str += "				</div>";
				str += "			</c:if>";
				str += "			<c:if test='${list.grade == 1}'>";
				str += "				<div class='rating'>";
				str += "					<input type='radio' name='rating' value='5' id='5' class='star' onclick='return(false)'>";
				str += "						<label for='5'>☆</label>";
				str += "					<input type='radio' name='rating' value='4' id='4' class='star' onclick='return(false)'>";
				str += "						<label for='4'>☆</label>";
				str += "					<input type='radio' name='rating' value='3' id='3' class='star' onclick='return(false)'>";
				str += "						<label for='3'>☆</label>";
				str += "					<input type='radio' name='rating' value='2' id='2' class='star' onclick='return(false)'>";
				str += "						<label for='2'>☆</label>";
				str += "					<input type='radio' name='rating${status.index}' value='1' id='1' class='star' onclick='return(false)' checked>";
				str += "						<label for='1'>☆</label>";
				str += "				</div>";
				str += "			</c:if>";
				
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
				str += "			<button class='btn' id='delBtn' onclick='delQ(${list.ridx})'>삭제하기</button>";
				str += "		</div>";
				str += "	</div>";
				str += "</c:forEach>";
				
				
				str += "<br><br><br><br><br><br><br><br>";
			}
			document.getElementById("formDiv").innerHTML = str;
		}
		
		

		/* 텍스트 접기/더보기 */
		
		
		
		function delQ(ridx){
			console.log("dqlQ-ridx : "+ridx);
			
			Swal.fire({
				icon: 'question',
				text: '작성하신 리뷰를 정말 삭제하시겠습니까?',
				showCancelButton: true
			}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
				    delReview(ridx);
				  } else if (result.isDenied) {
			   }
			});
		}
		
		function delReview(ridx){
			console.log("delReview-ridx : "+ridx);
			
			$.ajax({
				url: "/MyPage/delete.do",
				type: "post",
				data: {"ridx":ridx},
				ContentType: "json",
				success:function(){
					console.log("리뷰삭제 성공");
					Swal.fire('리뷰가 삭제되었습니다!', '', 'success');
					Swal.fire({
						icon: 'success',
						text: '리뷰가 삭제되었습니다!',
					}).then((result) => {
						  /* Read more about isConfirmed, isDenied below */
						  if (result.isConfirmed) {
							   window.location.replace("/Review/myReview.do");
						  } else if (result.isDenied) {
					   }
					});
				},
				error:function(){
					console.log("리뷰삭제 에러");
				}
			});
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
	
	
	/* star rating */
		/* 위치변경 : .rating{justify-content} */
		.rating {
		    display: flex;
		    flex-direction: row-reverse;
		    justify-content: flex-end;
		}
		.rating>input {
		    display: none
		}
		/* 크키조절 : .rating>label{font-size} */
		.rating>label {
		    position: relative;
		    width: 1em;
		    font-size: 1.1vw;
		    color: #FF3A00;
		    cursor: pointer
		}
		.rating>label::before {
		    content: "\2605";
		    position: absolute;
		    opacity: 0
		}
		.rating>input:checked~label:before {
		    opacity: 1
		}
	/* star rating */
	
	
/* -------------------------- article css -------------------------- */
	/* --------------------onload로 화면 출력-------------------- */	
		#noneReview{
			text-align: center;
			position: relative;
			top: 30px;
		}
		#reviewDiv{
			width: 100%;
		}
		#prodImgDiv{
			width: 70px;
			height: 70px;
			display: inline-block;
		}
		#rvImgDiv{
			width: 150px;
			height: 70px;
			display: inline-block;
		}
		#rvImg{
			width: 70px;
			height: 70px;
			display: inline-block;
		}
		#prodData{
			width: 130px;
			display: inline-block;
			position: relative;
			top: 25px;
		}
		#textColor{
			color: #CB7878;
			font-size: 12px;	
		}
		#reviewData{
			width: 270px;
			display: inline-block;
			position: relative;
			top: 10px;
		}
		#deleteBtn{
			width: 80px;
			display: inline-block;
		}
		#reviewContents{
			overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;	/* 표시하고자 하는 라인 수 */
		    -webkit-box-orient: vertical; 
		}
		#delBtn{
			background-color: #CB7878;
			border: none;
			color: #ffffff;
			padding: 0px 6px;
			width: 80px;
			height: 30px;
		}
		#delBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			padding: 0px 6px;
			width: calc(81px - 1px);
			height: calc(31px - 1px);
		}
		
		
		/* ----------더보기/접기---------- */
		
        /* ----------더보기/접기---------- */
		
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
		#date1,#date2{
			width: 140px;
		}
		#btnNdate{
			word-spacing: 1px;
		}
		#dateBtn1{
			background-color: #CB7878;
			border: none;
			color: #ffffff;
			padding: 6px 3px;
			width: 48px;
			height: 36px;
		}
		#dateBtn1:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			padding: 6px 3px;
			width: calc(49px - 1px);
			height: calc(37px - 1px);
		}
		#dateBtn2{
			background-color: #CB7878;
			border: none;
			color: #ffffff;
			padding: 6px 6px;
			width: 63px;
			height: 36px;
		}
		#dateBtn2:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			padding: 6px 6px;
			width: calc(64px - 1px);
			height: calc(37px - 1px);
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
					<!-- nav바   -->
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
					</div>
					
					<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
						<div id="secTitle">나의 리뷰 보기</div>
						<div id="reviewList">
							<div id="btnNdate">
								<button type="button" class="btn" id="dateBtn1" onclick="day_fn('A')">오늘</button>
								<button type="button" class="btn" id="dateBtn2" onclick="day_fn('B')">1개월</button>
								<button type="button" class="btn" id="dateBtn2" onclick="day_fn('C')">3개월</button>
								<button type="button" class="btn" id="dateBtn2" onclick="day_fn('D')">6개월</button>
								<button type="button" class="btn" id="dateBtn1" onclick="day_fn('E')">1년</button>
								<button type="button" class="btn" id="dateBtn1" onclick="day_fn('F')">3년</button>
								
								<input type="date" id="date1" value="${date.rdate1}" >
								~
								<input type="date" id="date2" value="${date.rdate2}" >
								<button class="btn" id="dateBtn1" onclick="day_fn('G')">조회</button>
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
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
	
</body>

<script>
	function day_fn(type){
		let frm = document.createElement("form");
		
		frm.name = "frm";
		frm.method = "post";
		frm.action = "/Review/myReview.do";
		
		let input1 = document.createElement("input");
		input1.setAttribute("type","hidden");
	    input1.setAttribute("name","kind");
	    input1.setAttribute("value",type);
	    frm.appendChild(input1);
	    
	    if(type == "G"){
	    	let date1 = document.querySelector("input[id='date1']").value;
	    	
	    	let input2 = document.createElement("input");
			input2.setAttribute("type","hidden");
		    input2.setAttribute("name","rdate1");
		    input2.setAttribute("value",date1);
		    frm.appendChild(input2);
		    
		    let date2 = document.querySelector("input[id='date2']").value;
		    
		    let input3 = document.createElement("input");
			input3.setAttribute("type","hidden");
		    input3.setAttribute("name","rdate2");
		    input3.setAttribute("value",date2);
		    frm.appendChild(input3);
	    }
	    
	    document.body.appendChild(frm);
		frm.submit();
		
	}
</script>
</html>