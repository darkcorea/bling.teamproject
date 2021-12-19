
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
<title>관리자 제품문의 게시판</title>
<style>
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
	#modal_button1, .bling_color, #modal_button3{
		background-color: #CB7878;
	}
	/* 모달 버튼 크기*/
	#modal_button1, #modal_button2,#modal_button3, #modal_button4{
		width:120px;
	}
	/* 모달창에 나오는 상품 이미지 크기  */
	.image_main{
		width:100px;
		height:100px;
	}
</style>
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
</header>

<section>
	<!-- 상단 내용 -->
	<div class="center">
	<span class="title1">문의 게시판</span>&nbsp;
	<select name="kind" id="kind" onchange="location.href=this.value">
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=A">모든 문의</option>
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=R">반지</option>
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=E">귀걸이</option>
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=N">목걸이</option>
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=B">팔찌</option>
	<option value="/team_Bling/Ad_board/question_product.do?page=1&kind=Z">답변 미완료</option>
	</select>
	</div>
	<br>
	<div class="title center row">
		<div class="col"><a href="/team_Bling/Ad_board/question.do" class="title3"><span>일반문의</span></a></div>
		<div class="col"><a href="/team_Bling/Ad_board/question_product.do" class="title2"><span>제품문의</span></a></div>
	</div><br>
	
	<!-- 문의 테이블  -->
	<c:if test="${fn:length(list) == 0}">
	<div class="center title">
		<br>모든 문의에 답변을 달았습니다.
	</div>
	</c:if>
	
	<!-- 문의 테이블  -->
	<c:if test="${fn:length(list) != 0}">
  	<div>
  		<table class="table">
  			<thead class="center">
  				<tr>
  					<th style="width:50px;">번호</th>
  					<th style="width:170px;">종류</th>
  					<th style="width:80px;">유저번호</th>
  					<th>제목</th>
  					<th style="width:120px;">작성날짜</th>
  					<th style="width:120px;">버튼</th>
  				<tr>
  			</thead>
  			<tbody>
  			<c:forEach var="list" items="${list}">
  				<tr>
  					<td class="center"><b><c:out value="${list.originpqidx}"/></b></td>
  					<td class="center">
  						<c:if test="${list.kind == 'R'}">
  							반지(<c:out value="${list.pidx}"/>)
  						</c:if>
  						<c:if test="${list.kind == 'E'}">
  							귀걸이(<c:out value="${list.pidx}"/>)
  						</c:if>
  						<c:if test="${list.kind == 'N'}">
  							목걸이(<c:out value="${list.pidx}"/>)
  						</c:if>
  						<c:if test="${list.kind == 'B'}">
  							팔찌(<c:out value="${list.pidx}"/>)
  						</c:if>
  					</td>
  					<td class="center"><c:out value="${list.midx}"/></td>
  					
  					<td>
  						<c:if test="${list.depth == 0}">
  						<div class="accordion">
							<div class="accordion-item" style="border:0;">
								<div class="accordion-header" id="heading${list.pqidx}">
								<c:if test="${list.show_yn == 'Y' }">
						     		<span onclick="coll_fn(${list.pqidx})" id="coll${list.pqidx}" class="pointer">
						        		<b><c:out value="${list.title}"/></b>
						      		</span>
						      	</c:if>
						      	<c:if test="${list.show_yn == 'N' }">
						     		<span onclick="coll_fn(${list.pqidx})" id="coll${list.pqidx}" class="pointer">
						        		&nbsp;<i class="bi bi-file-lock"></i>&nbsp;<b><c:out value="${list.title}"/></b>
						      		</span>
						      	</c:if>
						    	</div>
						    	<div id="collapse${list.pqidx}" class="accordion-collapse collapse">
							    	<div class="accordion-body">
							      		<c:out value="${list.comments}"/>
							      	</div>
						    	</div>
							</div>
						</div>
  						</c:if>
  						<c:if test="${list.depth == 1}">
  	  					<div class="accordion">
							<div class="accordion-item" style="border:0;">
								<div class="accordion-header" id="heading${list.pqidx}">
								<c:if test="${list.show_yn == 'Y' }">
						     		<span onclick="coll_fn(${list.pqidx})" id="coll${list.pqidx}" class="pointer">
						        		&nbsp;&nbsp;&nbsp;<i class='bi bi-arrow-return-right bolder'></i>&nbsp;<span id="modify_title${list.pqidx}" style="color:#1a7ed5;"><b><c:out value="${list.title}"/></b></span>
						      		</span>
					      		</c:if>
					      		<c:if test="${list.show_yn == 'N' }">
						     		<span onclick="coll_fn(${list.pqidx})" id="coll${list.pqidx}" class="pointer">
						        		&nbsp;&nbsp;&nbsp;<i class="bi bi-file-lock"></i>&nbsp;<i class='bi bi-arrow-return-right bolder'></i>&nbsp;<b><span id="modify_title${list.pqidx}" style="color:#1a7ed5;"><c:out value="${list.title}"/></span></b>
						      		</span>
					      		</c:if>
						    	</div>
						    	<div id="collapse${list.pqidx}" class="accordion-collapse collapse">
							    	<div class="accordion-body" id="modify_comments${list.pqidx}">
							      		<c:out value="${list.comments}"/>
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
							<button class="btn btn-outline-primary" onclick="reply_fn('${list.midx}','${list.pqidx}','${list.pidx}','${list.show_yn}','${list.kind}')">답글작성</button>
						</c:if>
						<c:if test="${list.depth == 1 && list.state == 'Y'}">						
						<button class="btn btn-outline-success" onclick="modify_fn(${list.pqidx})">수정</button>
						</c:if>
					</td>
  				</tr>
  			</c:forEach>
  			</tbody>
  		</table>
  	</div><br><br>
  	
  	<!-- 페이징 바 뿌려주기 -->
	<div>
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<!-- 앞으로  가기 버튼 , 키워드 유지하면서 이동하기 -->
				<c:if test="${pm.prev == true}">
				<li class='page-item'>
				<c:set var="prev" value="${pm.startPage -1}"/>
					<a class='page-link' aria-label='Previous' href="/team_Bling/Ad_board/question_product.do?page=${prev}&kind=${pm.kind}">
						<span aria-hidden='true' class='pointer' >&laquo;</span>
					</a>
				</li>
				</c:if>
				
				<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
				<c:set var="page" value="${pm.scri.page}"/>
				<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
					<c:if test = "${pageNum == page}">
					<li class="page-item active">	
						<a class="page-link pointer" href="/team_Bling/Ad_board/question_product.do?page=${pageNum}&kind=${pm.kind}">
							<c:out value="${pageNum}"/>
						</a>
					</li>
					</c:if>
					<c:if test = "${pageNum != page}">
					<li class="page-item">	
						<a class="page-link pointer" href="/team_Bling/Ad_board/question_product.do?page=${pageNum}&kind=${pm.kind}">
							<c:out value="${pageNum}"/>
						</a>
					</li>
					</c:if>
				</c:forEach>
				
				<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
				<c:if test="${pm.next && pm.endPage > 0}">
				<li class='page-item'>
					<a class='page-link' aria-label='Next' href="/team_Bling/Ad_board/question_product.do?page=${pm.endPage + 1}&kind=${pm.kind}">
						<span aria-hidden='true' class='pointer'>&raquo;</span>
					</a>
				</li>
				</c:if>
			</ul>
		</nav>
	</div>
  	</c:if>
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
      			<td><input type="text" name="title" maxlength="30" style="width:400px;" id="title_write">
      				<input type="hidden" name="pqidx" id="pqidx_add">
      				<input type="hidden" name="midx" id="midx_add">
      				<input type="hidden" name="kind" id="kind_add">
      				<input type="hidden" name="pidx" id="pidx_add">
      				<input type="hidden" name="show_yn" id="show_yn_add">
      				<input type="text" style="display:none;">
      			</td>
      		</tr>
      		<tr>
      			<td>문의답변</td>
      			<td><textarea name="comments" cols="60" rows="10"  id="comments_write"></textarea></td>
      		</tr>
      	</table>
      	</form>
      	</div>
      	<div id="delivery1">
      	
      	</div>
      </div>
      <div class="modal-footer" id="reply_write2">
        <button type="button" class="btn btn-secondary" id="modal_button1" onclick="reply_write()">작성</button>
        <button type="button" class="btn btn-secondary" id="modal_button2" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 답글 수정 모달창 -->
<div class="modal fade" id="reply_modify" data-bs-backdrop="static"  aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title">답글수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div id="reply_modify1" style="margin-left:50px;">
      	<form name="reply_modify2" id="reply_modify2">
      	<table>
      		<tr style="height:50px;">
      			<td style="width:80px;">제목</td>
      			<td><input type="text" name="title" maxlength="30" style="width:400px;" id="title_modify">
        				<input type="hidden" name="pqidx" id="pqidx_modify">
      	      				<input type="text" style="display:none;">
      			</td>
      		</tr>
      		<tr>
      			<td>문의답변</td>
      			<td><textarea name="comments" cols="60" rows="10"  id="comments_modify"></textarea></td>
      		</tr>
      	</table>
      	</form>
      	</div>
      </div>
      <div class="modal-footer" id="reply_modify3">
        <button type="button" class="btn btn-secondary" id="modal_button3" onclick="reply_modify5()">수정완료</button>
        <button type="button" class="btn btn-secondary" id="modal_button4" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

</body>
<script>
/* 문의 제목을 클릭하면 제옥 아래로 내용이 보였다가 사라졌다 한다 */
function coll_fn(pqidx){
	let show = $("#collapse"+pqidx).hasClass("show");
	if (show == false){
		$("#collapse"+pqidx).addClass("show");
	}else if (show == true){
		$("#collapse"+pqidx).removeClass("show");
	}
}

//답글 작성 버튼을 누르면
function reply_fn(midx,pqidx,pidx,show_yn,kind){
	
	$("#reply_question")[0].reset();
	$("#title_write").val("상품 문의 답변입니다.");
	$("#midx_add").val(midx);
	$("#pqidx_add").val(pqidx);
	$("#pidx_add").val(pidx);
	$("#show_yn_add").val(show_yn);
	$("#kind_add").val(kind);
	
	$("#reply_write").modal("show");

	 // 상품 정보를 가져 오기
	$.ajax({
		url:"/team_Bling/Ad_board/product_detail.do",
		type:"POST",
		data:{"pidx":pidx},
		success:function(data){
			    let str = "";
			    let kind = "";
			    if(data[0].kind == "R"){kind = "반지"};
			    if(data[0].kind == "E"){kind = "귀걸이"};
			    if(data[0].kind == "N"){kind = "목걸이"};
			    if(data[0].kind == "B"){kind = "팔찌"};
			    let price = data[0].saleprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			    
			  	str += "<br><table>";
			    str += "<tr>";
			    str += "<td style='width:130px;'>";
			    str += "<a href='/team_Bling/Product/detail.do?pidx="+data[0].pidx+"'>";
			    str += "<img class='image_main img-thumbnail' src='/team_Bling/resources/image/"+data[0].main+"'></a></td>";
			    str += "<td style='width:100px;'><b>"+kind+"</b><td>";
			    str += "<td><a href='/team_Bling/Product/detail.do?pidx="+data[0].pidx+"'>";
			    str += "<span style='font-weight:bold;font-size:20px;color:#cb7878;'>"+data[0].pname+"</span></a><br>";
			    for (let i =0 ; i<data.length; i++){
					str += "<span>"+data[i].oname+"</span>&nbsp;<span>"+data[i].stock+"</span>&nbsp;개<br>";
			    }
			    str += "</td>";
			    
			    str += "<td>&nbsp;&nbsp;&nbsp;<b>"+price+"원</b></td>";
			    str += "</tr>";
			    str += "</table><br><br>";

				$("#delivery1").html(str);
				$("#reply_write").modal("show");
		},error:function(){
			alert("답글작성 불러오기 오류");
		}
	});
}


//답글 작성
function reply_write(){
    
    let formData = $("form[name=reply_question]").serialize();
    let title = $("#title_write").val();
    let comments = $("#comments_write").val();
    
    if(title == ""){
		alert("제목을 입력하세요");
    }else if(comments ==""){
		alert("내용을 입력하세요");
    }else{
		// 답글 작성 에이작스
		$.ajax({
			url:"/team_Bling/Ad_board/question_product_write.do",
			type:"POST",
			data:formData,
			success:function(data){
			    $("#reply_write").modal("hide");
			    location.reload();
			    alert("답글작성 완료");
			},error:function(){
				alert("답글작성 오류");
			}
		});
    } 
}

//작성한 답글 수정하는 모달창 열기
function modify_fn(pqidx){
    $("#reply_modify2")[0].reset();
	
    let title = $("#modify_title"+pqidx).text().trim();
    let comments = $("#modify_comments"+pqidx).text().trim();
    
    $("#title_modify").val(title);
    $("#comments_modify").val(comments);
    $("#pqidx_modify").val(pqidx);

    $("#reply_modify").modal("show");
}


//답변하기 수정
function reply_modify5(){
	
	let formData = $("form[name=reply_modify2]").serialize();
	
	$.ajax({
		url:"/team_Bling/Ad_board/question_product_modify.do",
		type:"POST",
		data:formData,
		success:function(data){
			 $("#reply_modify").modal("hide");
			 alert("답글 수정이 완료 되었습니다.");
			 location.reload();
		},error:function(){
			alert("답글 수정 오류");
		}
	});
}

//셀렉트 박스 선택
function proselected(){
	let kind = "<c:out value='${pm.kind}'/>";
	if(kind == "A"){
	    $("#kind option:eq(0)").attr("selected", "selected");
	}
	if(kind == "R"){
	    $("#kind option:eq(1)").attr("selected", "selected");
	}
	if(kind == "E"){
	    $("#kind option:eq(2)").attr("selected", "selected");
	}
	if(kind == "N"){
	    $("#kind option:eq(3)").attr("selected", "selected");
	}
	if(kind == "B"){
	    $("#kind option:eq(4)").attr("selected", "selected");
	}
	if(kind == "Z"){
	    $("#kind option:eq(5)").attr("selected", "selected");
	}
}
proselected();

</script>
</html>