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
<title>관리자 리뷰 게시판</title>
<style>

/* ----------------------------------*/
	/* 크기 */
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title{
		font-size:35px;
		font-weight:900;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title1{
		font-size:25px;
		font-weight:900;
	}
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor: pointer;
	}
	
	/* 클래스 붙이면 문자 가운데 */
	.center{
		text-align:center;
	}
	/* 리뷰 이미지 사진 */
	.image {
		width:78px;
		height:78px;
	}
	/* 리뷰 점수 */
	.bi-star-fill{
	color: #FF3A00;
	font-size: 15px;
	}

</style>
</head>
<body>

<header>
	<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
</header>

<section>
	<!-- 타이틀 -->
	<div class="center">
	<span class="title">리뷰 게시판</span>&nbsp;
	<select name="kind" id="kind" onchange="location.href=this.value">
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=Z">모든 리뷰</option>
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=A">별점 1</option>
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=B">별점 2</option>
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=C">별점 3</option>
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=D">별점 4</option>
	<option value="/team_Bling/Ad_board/review.do?page=1&kind=E">별점 5</option>
	</select>
	</div><br><br>
	
	
	<!-- 문의 테이블  -->
	<c:if test="${fn:length(list) == 0}">
	<div class="center title1">
		<br>해당 별점에 대한 리뷰가 없습니다.
	</div>
	</c:if>
	
	<!--  리뷰 리스트 테이블 -->
	<c:if test="${fn:length(list) != 0}">
	<div>
	<table class="table">
  			<thead class="center">
  				<tr>
  					<th style="width:50px;">번호</th>
  					<th style="width:50px;">유저</th>
  					<th style="width:50px;">제품</th>
  					<th style="width:180px;">사진</th>
  					<th>내용</th>
  					<th style="width:120px;">작성날짜</th>
  					<th style="width:80px;">버튼</th>
  				<tr>
  			</thead>
  			<tbody>
  			<c:forEach var="list" items="${list}">
  				<tr>
  					<!-- 리뷰번호 -->
  					<td class="center"><b><c:out value="${list.ridx}"/></b></td>
  					<!-- 유저번호 -->
  					<td class="center"><c:out value="${list.midx}"/></td>
  					<!-- 제품번호 -->
  					<td class="center"><c:out value="${list.pidx}"/></td>
  					<!--  사진 -->
  					<td class="center">
  						<c:if test="${list.image1 != null}">
  							<img class="image img-thumbnail" src="/team_Bling/resources/review_img/${list.image1}">
  						</c:if>
  						<c:if test="${list.image2 != null}">
  							<img class="image img-thumbnail" src="/team_Bling/resources/review_img/${list.image2}">	
  						</c:if>
  					</td>
  					
  					<!-- 내용 벌점 -->
  					<td>
  						<c:if test="${list.grade == 1}">
  							<i class='bi bi-star-fill'></i>
  						</c:if>
  						<c:if test="${list.grade == 2}">
  							<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>
  						</c:if>
  						<c:if test="${list.grade == 3}">
  							<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>
  						</c:if>
  						<c:if test="${list.grade == 4}">
  							<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>
  						</c:if>
  						<c:if test="${list.grade == 5}">
  							<i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i><i class='bi bi-star-fill'></i>
  						</c:if>
  						<br><c:out value="${list.contents}"/>
  					</td>
  					
  					<!-- 작성날짜 -->
  					<c:set var="date" value="${list.rdate}"/>
					<td class="center"><c:out value="${fn:substring(date,0,10)}"/></td>
					
					<!-- 버튼 -->
					<td><button class="btn btn-outline-primary D" onclick="delete_fn(${list.ridx})">삭제</button>	</td>
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
					<a class='page-link' aria-label='Previous' href="/team_Bling/Ad_board/review.do?page=${prev}">
						<span aria-hidden='true' class='pointer' >&laquo;</span>
					</a>
				</li>
				</c:if>
				
				<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
				<c:set var="page" value="${pm.scri.page}"/>
				<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
					<c:if test = "${pageNum == page}">
					<li class="page-item active">	
						<a class="page-link pointer" href="/team_Bling/Ad_board/review.do?page=${pageNum}">
							<c:out value="${pageNum}"/>
						</a>
					</li>
					</c:if>
					<c:if test = "${pageNum != page}">
					<li class="page-item">	
						<a class="page-link pointer" href="/team_Bling/Ad_board/review.do?page=${pageNum}">
							<c:out value="${pageNum}"/>
						</a>
					</li>
					</c:if>
				</c:forEach>
				
				<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
				<c:if test="${pm.next && pm.endPage > 0}">
				<li class='page-item'>
					<a class='page-link' aria-label='Next' href="/team_Bling/Ad_board/review.do?page=${pm.endPage + 1}">
						<span aria-hidden='true' class='pointer'>&raquo;</span>
					</a>
				</li>
				</c:if>
			</ul>
		</nav>
	</div>
	</c:if>

</section>	
</body>

<script>
//셀렉트 박스 선택
function proselected(){
	let kind = "<c:out value='${pm.kind}'/>";
	if(kind == "A"){
	    $("#kind option:eq(1)").attr("selected", "selected");
	}
	if(kind == "B"){
	    $("#kind option:eq(2)").attr("selected", "selected");
	}
	if(kind == "C"){
	    $("#kind option:eq(3)").attr("selected", "selected");
	}
	if(kind == "D"){
	    $("#kind option:eq(4)").attr("selected", "selected");
	}
	if(kind == "E"){
	    $("#kind option:eq(5)").attr("selected", "selected");
	}
	if(kind == "Z"){
	    $("#kind option:eq(0)").attr("selected", "selected");
	}
}
proselected();

function delete_fn(ridx){
	
	$.ajax({
		url:"/team_Bling/Ad_board/review_delete.do",
		type:"POST",
		data:{"ridx":ridx},
		success:function(data){
			alert("리뷰가 삭제 되었습니다.");
			location.reload();
		},error:function(){
			alert("리뷰삭제 오류");
		}
	});
	
}

$(function(){
	disabled();
});

</script>
</html>