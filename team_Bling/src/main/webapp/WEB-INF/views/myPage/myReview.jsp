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
		var page = 1;
		if(page == null) {page=1};
	
		$(function(){
			reviewList(1);
	     });
	
		function reviewList(page,type,date1,date2){
			console.log(page);
			$.ajax({
				url:"/Review/reviewlist.do",
				type:"POST",
				data:{"page":page,"type":type,"date1":date1,"date2":date2},
				dataType: 'json',
				success:function(data){
					let pm = data.pm;
					let prev = parseInt(pm.startPage - 1) ;
				  	let next = parseInt(pm.endPage + 1) ; 
				  	
				  	let str = "";
				  	console.log(data);
				  	console.log(data.reviewList);
				  	
				    //var page = data.page;
                    //var pagenum = (page-1) * 5;
                    
				  	if(data.reviewList.length == 0){
				  		str += "<br>";
				  		str += "<tr id='noneReview'><td id='noneTd' colspan='5'>기간내 등록된 리뷰가 없습니다.</td></tr>";
				  	}else{
				  		str += "<table id='reviewTable'>"
				  		for(var a = 0 ; a < data.reviewList.length ; a++){
				  			var list = data.reviewList[a];
				  			var oname = list.oname.split("+")[0];
				  		
						str += "	<tr id='reviewTr'>";
						/*
						1번부터 오름차순 번호기입
						str += a+1+pagenum;
						*/
						
						//사진 옆에 ridx
						//str += list.ridx;
						
						str += "		<td id='prodImgTr'>";
						str += "			<img id='rvImg' src='/resources/image/"+list.main+"' alt='제품 대표 사진'>";
						str += "		</td>";
						str += "		<td id='prodDataTr'>";
						str += "			<div id='prodData'>";
						str += 					list.pname+"<br>";
						str += "				<span id='textColor'>[옵션] "+oname+"</span><br>";
						str += "				<span id='textColor'>[수량] "+list.quantity+"개</span>";
						str += "			</div>";
						str += "		</td>";
						
						str += "		<td id='reviewDataTr'>";
						str += "			<div id='reviewData'>";
												/* star_rating */
						str += "				<div class='rating'>";
						
						
						// grade에 따른 별점 출력
						for(var b = 5; b > 0;b--){
							if(b == list.grade){
								str += "			<input type='radio' name='rating "+a+"' id='"+b+"' value='"+b+"' class='star' onclick='return(false)' checked>";
								str += "				<label for='"+b+"'>☆</label>";
							}
							else{
								str += "			<input type='radio' name='rating' id='"+b+"' value='"+b+"' class='star' onclick='return(false)'>";
								str += "				<label for='"+b+"'>☆</label>";
							}
						}
						
						str += "				</div>";
							
						str += "				<div id='reviewContents"+list.ridx+"'>";
													/* 리뷰 contents 출력하기 / 3줄 이상 더보기 적용 */
						str += 						list.contents;
						str += "				</div>";
						str += "				<div id='review_btn"+list.ridx+"'></div>";
						str += "			</div>";
						str += "		</td>";
						
						
						//리뷰사진 개수에 따라 화면출력 조정
						if(list.image1 != null && list.image2 != null){
							str += "			<td id='rvImgTr'>";
							str += "				<img id='rvImg' src='/resources/review_img/"+list.image1+"' alt='리뷰사진 1번'>";
							str += "				<img id='rvImg2' src='/resources/review_img/"+list.image2+"' alt='리뷰사진 2번'>";
							str += "			</td>";
						}
						else if(list.image1 != null && list.image2 == null){
							str += "			<td id='rvImgTr'>";
							str += "				<img id='rvImg' src='/resources/review_img/"+list.image1+"' alt='리뷰사진 1번'>";
							str += "			</td>";
						}
						else if(list.image1 == null && list.image2 == null){
							str += "			<td id='rvImgTr'></td>";
						}	
						
						
						str += "		<td id='deleteBtn'>";
						str += "			<button class='btn' id='delBtn' onclick='delQ("+list.ridx+")'>삭제하기</button>";
						str += "		</td>";
						str += "	</tr>";
				  		}
				  		
				  		str += "</table>";
				  		
				  		str += "<br><br><br>";
				  		
				  		
						// 페이징 할 수 있는 번호 나오는 곳 뿌려 주기
					  	str += "	<nav aria-label='Page navigation'>";
					  	str += "	<ul class='pagination justify-content-center'>";
					  	str += "	<li class='page-item'>";
					  	
					  	//console.log(prev);
					  	if(pm.prev == true){
					  	    str += "<a class='page-link' aria-label='Previous' onclick='reviewList("+prev+")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
					  	}
					  	
					  	str += "	</li>";
					  	let startPage = parseInt(pm.startPage);
					  	let endPage = parseInt(pm.endPage);
					  	
					  	for (let k = pm.startPage; k<=pm.endPage; k++ ){
					  		 if(page == k){
					  			str += "<li class='page-item active'><a class='page-link pointer' onclick='reviewList("+k+")'>"+k+"</a></li>";    
					  		 }else{
					  			str += "<li class='page-item'><a class='page-link pointer' onclick='reviewList("+k+")'>"+k+"</a></li>";    
					  		 }
					  	 }
					  	 
					  	 str += "	<li class='page-item'>";
					  	
					  	 if(pm.next && pm.endPage > 0){
					  	     str += "<a class='page-link' aria-label='Next' onclick='reviewList("+next+")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
					  	 }
					  	 
					  	 str += "	</li>";
					  	 str += "	</ul>";
					  	 str += "	</nav>";
					  	 
					  	//날짜 화면출력
					  	/* let date1 = data.date.rdate1;
					  	console.log(date1);
					  	let date2 = data.date.rdate2;
					  	document.querySelector("input[id='date1']").value = date1;
					  	document.querySelector("input[id='date2']").value = date2; */
					  	
						
					}
					document.getElementById("formTable").innerHTML = str;
					
					// 리뷰가 길면 자르고 더보기 버튼을 추가하고 그렇지 않으면 그대로 둔다.
					// .offsetHeight >90  보여지는 부분이 90px를 넘어가면, 보여지는 높이 조절하기 어려움 clientHeight
					// .length >= 100  텍스트 길이가 100보다 크거나 같으면
					// .split('\n').length; 줄바꿈이 되었을 때 줄바꿈 안하면 소용이 없음
					// word-break: keep-all; 한글일 경우 띄어쓰기 기준으로 줄바꿈 해줌 스타일로 적용
				  	for (let m=0; m<data.reviewList.length ; m++){
				  	let ridx = data.reviewList[m].ridx;
				  	let re = $("#reviewContents"+ridx);
				  	let re_txt = $("#reviewContents"+ridx).text();
				    let re_height = document.getElementById("reviewContents"+ridx).clientHeight;
				 	
				    console.log(re_height);
				    let re_html = $("#reviewContents"+ridx).html();
				    let re_txt_short = re_txt.substring(0,30)+"...";
				  	
				 	// 더보기 버튼 추가 void(0)는 이동을 하지 않고 그곳에서 만 움직이겠다는 뜻
				    let btn_more = $('<a href="javascript:void(0)" class="more" style="text-decoration:none;">더보기</a>');
				    $("#review_btn"+ridx).append(btn_more);
				    
				 	// 텍스트 길이가 길면 자르고 길이가 짧으면 더보기 버튼을 감춘다.
				   		if(re_height >= 50){
					  		re.html(re_txt_short);
				                
				    	}else {
				            btn_more.hide()
				    	}
				 	
				 	// 더보기 버튼 클릭할 때 작동하는 function 만들기
			   		btn_more.click(toggle_content);
				      
			            function toggle_content(){
			                if($(this).hasClass('short')){
			                    // 접기 상태
			                    $(this).text('더보기');
			                    re.html(re_txt_short); // 텍스트 자르기
			                    $(this).removeClass('short');
			                }else{
			                    // 더보기 상태
			                    $(this).text('접기');
			                    re.html(re_html); // 텍스트 크기 원상복귀
			                    $(this).addClass('short');
			                }
			          	}
			            
				  	}
				  	
				  	
				},error:function(){
					alert("리스트 불러오기 에러!")
				}
			}); 
		}
		
			/*
				${reviewList}는 배열이기 때문에 ${reviewList == null}로 조건은 설정하면 적용되지 않는다.
				if(${reviewList == []})와 같이 빈 배열로 조건을 설정하면 적용된다.
			*/
		
		
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
	.page-item{
         padding:0;
      }
	
/* -------------------------- article css -------------------------- */
	/* --------------------onload로 화면 출력-------------------- */
		#noneReview{
			text-align: center;
		}
		#noneTd{
			width: 756px;
		}
		#reviewTr{
			width: 100%;
			height: 120px;
			position: relative;
		}
		#prodImgTr{
			width: 80px;
			height: 70px;
			position: relative;
		}
		#rvImgTr{
			width: 160px;
			height: 70px;
			position: relative;
		}
		#rvImg{
			width: 70px;
			height: 70px;
			position: absolute;
			top: 20px;
		}
		#rvImg2{
			width: 70px;
			height: 70px;
			position: absolute;
			top: 20px;
			left: 80px;
		}
		#prodDataTr{
			width: 140px;
			position: relative;
		}
		#prodData{
			position: absolute;
			top: 20px;
		}
		#textColor{
			color: #CB7878;
			font-size: 12px;	
		}
		#reviewDataTr{
			width: 270px;
		}
		#deleteBtn{
			width: 80px;
			position: relative;
		}
		
		#delBtn{
			background-color: #CB7878;
			border: none;
			color: #ffffff;
			padding: 0px 6px;
			width: 80px;
			height: 30px;
			position: absolute;
			top: 50px;
		}
		#delBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			padding: 0px 6px;
			width: calc(81px - 1px);
			height: calc(31px - 1px);
			position: absolute;
			top: 50px;
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
<body>
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
								
								<input type="date" id="date1">
								~
								<input type="date" id="date2">
								<button class="btn" id="dateBtn1" onclick="day_fn('G')">조회</button>
							</div>
						</div>
						
						<div id="formTable">
							
						</div>
						
						<br><br><br><br><br><br><br><br>
						
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
		
		let date1 = "아무거나";
		let date2 = "아무거나";
		
		if(type == "G"){
	    	date1 = document.querySelector("input[id='date1']").value;
	    	date2 = document.querySelector("input[id='date2']").value;
	    	console.log("여기저기"+date1);
	    	console.log("여기저기"+date2);
		}
		
		$.ajax({
			url: "/Review/type.do",
			type: "post",
			data: {"type":type,"date1":date1,"date2":date2},
			success:function(data){
				
				console.log(data);
				console.log("dfsfsdfds"+data.date1);
				console.log("dfsfsdfds"+data.date2);
				
				document.querySelector("input[id='date1']").value = data.date1;
				document.querySelector("input[id='date2']").value = data.date2;
				
			},
			error:function(){
				alert("실패");
			}
		});
		
		reviewList(1,type,date1,date2);
	}
</script>
</html>