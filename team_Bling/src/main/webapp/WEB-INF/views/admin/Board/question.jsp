<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 문의 게시판</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
/* 옆에 nav바  */
div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}
.content {position:relative;min-height:1000px;}

/* ----------------------------------*/
	/* 크기 */
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title{
		font-size:25px;
		font-weight:900;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title1{
		font-size:35px;
		font-weight:900;
	}
	/* 조회문자 */
	.title2{
		text-decoration: none;
		color:black;
	}	
	.title2:hover{
		color:#CB7878;
	}
	/* 조회문자 */
	.title3{
		text-decoration: none;
		color:#C4C4C4;
	}	
	.title3:hover{
		color: #CB7878;
	}
	/* 클래스 붙이면 문자 가운데 */
	.center{
		text-align:center;
	}
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor: pointer;
	}
	/* 모달 버튼 가운데로 오기*/
	#reply_write2 {
		justify-content: center;
	}		
	/* 모달 버튼 */
	#modal_button1, .bling_color{
		background-color: #CB7878;
	}
		
	/* 모달 버튼 크기*/
	#modal_button1, #modal_button2{
		width:120px;
	}
</style>
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
</header>

<section>
<!-- 옆 nav 바 -->
<div class="d1">
	<div class="quickmenu">
		  <ul>
		 	<li><a href="/Ad_board/question.do">문의게시판</a></li>
		    <li><a href="/Ad_board/board.do?page=1&type=T">공지&amp;문의</a></li>
		    <li><a href="#">이벤트</a></li>
		    <li><a href="#">리뷰관리</a></li> 
		  </ul>
	</div>
</div>

<!--여기서부터 본문-->
<div id="">
	<!-- 상단 내용 -->
	<div class="center">
	<span class="title1">문의 게시판</span>&nbsp;
	<select>
	<option>배송문의</option>
	<option>교환/환불/취소문의</option>
	<option>기타문의</option>
	<option>교환신청</option>
	<option>반품신청</option>
	<option>취소신청</option>
	</select>
	</div>
	<br>
	<div class="title center row">
		<div class="col"><a href="/Ad_board/question.do" class="title2"><span>일반문의</span></a></div>
		<div class="col"><a href="/Ad_board/question.do" class="title3"><span>제품문의</span></a></div>
	</div><br>	
	
	<!-- 문의 테이블  -->
  	<div>
  		<table class="table">
  			<thead class="center">
  				<tr>
  					<th style="width:50px;">번호</th>
  					<th style="width:170px;">타입</th>
  					<th style="width:80px;">유저번호</th>
  					<th>제목</th>
  					<th style="width:120px;">작성날짜</th>
  					<th style="width:120px;">버튼</th>
  				<tr>
  			</thead>
  			<tbody>
  			<c:forEach var="list" items="${list}">
  				<tr>
  					<td class="center"><b><c:out value="${list.originqidx}"/></b></td>
  					<td class="center">
  						<c:if test="${list.category == 'A'}">
  							배송문의
  						</c:if>
  						<c:if test="${list.category == 'B'}">
  							교환/환불/취소문의
  						</c:if>
  						<c:if test="${list.category == 'C'}">
  							기타
  						</c:if>
  						<c:if test="${list.category == 'D'}">
  							교환신청
  						</c:if>
  						<c:if test="${list.category == 'E'}">
  							환불신청
  						</c:if>
  						<c:if test="${list.category == 'F'}">
  							취소신청
  						</c:if>
  					</td>
  					<td class="center"><c:out value="${list.midx}"/></td>
  					
  					<td>
  						<c:if test="${list.depth == 0}">
  						<div class="accordion">
							<div class="accordion-item" style="border:0;">
								<div class="accordion-header" id="heading${list.qidx}">
						     		<span onclick="coll_fn(${list.qidx})" id="coll${list.qidx}" class="pointer">
						        		<b><c:out value="${list.title}"/></b>
						      		</span>
						    	</div>
						    	<div id="collapse${list.qidx}" class="accordion-collapse collapse">
							    	<div class="accordion-body">
							      		<c:out value="${list.content}"/>
							      	</div>
						    	</div>
							</div>
						</div>
  						</c:if>
  						<c:if test="${list.depth == 1}">
  	  					<div class="accordion">
							<div class="accordion-item" style="border:0;">
								<div class="accordion-header" id="heading${list.qidx}">
						     		<span onclick="coll_fn(${list.qidx})" id="coll${list.qidx}" class="pointer">
						        		&nbsp;<i class='bi bi-arrow-return-right bolder'></i>&nbsp;<span style="color:#1a7ed5;"><b><c:out value="${list.title}"/></b></span>
						      		</span>
						    	</div>
						    	<div id="collapse${list.qidx}" class="accordion-collapse collapse">
							    	<div class="accordion-body">
							      		<c:out value="${list.content}"/>
							      	</div>
						    	</div>
							</div>
						</div>
  						</c:if>
  					</td>
  					
  					<c:set var="date" value="${list.rdate}"/>
					<td class="center"><c:out value="${fn:substring(date,0,10)}"/></td>
					<td class="center">
						<c:if test="${list.depth == 0 && list.state == 'N'}">
							<c:if test="${list.order_idx != '' && list.detail_idx == ''}">
								<button class="btn btn-outline-primary" onclick="reply_fn('${list.qidx}','${list.category}','${list.order_idx}','0')">답글작성</button>
							</c:if>
							<c:if test="${list.detail_idx != ''  && list.order_idx == ''}">
								<button class="btn btn-outline-primary" onclick="reply_fn('${list.qidx}','${list.category}','0','${list.detail_idx}')">답글작성</button>
							</c:if>
							<c:if test="${list.detail_idx == '' && list.order_idx == ''}">
								<button class="btn btn-outline-primary" onclick="reply_fn('${list.qidx}','${list.category}','0','0')">답글작성</button>
							</c:if>		
						</c:if>
						<c:if test="${list.depth == 1 && list.state == 'Y'}">						
						<button class="btn btn-outline-success" onclick="modify_fn(${list.qidx})">수정</button>
						</c:if>
					</td>
  				</tr>
  			</c:forEach>
  			</tbody>
  		</table>
  	</div>
</div>

</section>

<!-- 답글 작성 모달창 -->
<div class="modal fade" id="reply_write" data-bs-backdrop="static"  aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title">답글달기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div id="reply_write1" style="margin-left:50px;">
      	<form name="reply_question" id="reply_question">
      	<table>
      		<tr style="height:50px;">
      			<td style="width:80px;">제목</td>
      			<td><input type="text" name="title" maxlength="30" style="width:491px;">
      				<input type="hidden" name="category" id="category">
      				<input type="text" style="display:none;">
      			</td>
      		</tr>
      		<tr>
      			<td>문의답변</td>
      			<td><textarea name="content" cols="60" rows="15"></textarea></td>
      		</tr>
      	</table>
      	</form>
      	</div>
      </div>
      <div class="modal-footer" id="reply_write2">
        <button type="button" class="btn btn-secondary" id="modal_button1" >확인</button>
        <button type="button" class="btn btn-secondary" id="modal_button2" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>

<script>
/* 문의 제목을 클릭하면 제옥 아래로 내용이 보였다가 사라졌다 한다 */
function coll_fn(qidx){
	let show = $("#collapse"+qidx).hasClass("show");
	if (show == false){
		$("#collapse"+qidx).addClass("show");
	}else if (show == true){
		$("#collapse"+qidx).removeClass("show");
	}
}

// 답글 작성 버튼을 누르면
function reply_fn(qidx,category,order_idx,detail_idx){
	
	$("#reply_question")[0].reset();
	$("#category").val(category);
	
	/*
	$.ajax({
		url:"/Ad_board/question_detail.do",
		type:"POST",
		data:{"qidx":qidx,"order_idx":order_idx,"detail_idx":detail_idx},
		success:function(data){
			if(order_idx == 0 && detail_idx == 0){
				
				
			}else{
				
				
			}
			
		},error:function(){
			alert("답글작성 오류")
		}
	});
	*/
	
	$("#reply_write").modal("show");
	
	
	
}


</script>
</html>