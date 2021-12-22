<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="com.project.bling.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 커스톰 리스트</title>


<style>
	section {
		max-width:1008px;
		margin:  5px auto;
	}
	
	/* 제목 */
	.title {
		font-size:1.75rem;
		font-weight:500;
	}
	
	/* 테이블 정의 */
	table {
		width:1008px;
		margin:5px auto;
	}
	
	/* 세일 가격 */
	.saleprice{
		font-size:18px;
		font-weight: 900px;
	}
	
	.red {
		color:red;
	}
	
	.image {
		width:78px;
		height:78px;
	}
	
	.btn-white {
		border:1px solid #CCCCCC;
	}
	.center {
		text-align:center;
	}
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	<section>
	<div class="container">
		
		<div style="text-align:center;">
		<span class="title">커스텀 리스트&ensp;</span>
		<select name="kind" id="kind" onchange="location.href=this.value">
			<option value="/team_Bling/Ad_regist/custom_list.do?page=1&kind=0&type=0">모든 제품</option>
			<option value="/team_Bling/Ad_regist/custom_list.do?page=1&kind=1&type=1">체인</option>
			<option value="/team_Bling/Ad_regist/custom_list.do?page=1&kind=2&type=2">고리</option>
			<option value="/team_Bling/Ad_regist/custom_list.do?page=1&kind=3&type=3">장식</option>

		</select>
		<span> 상품 갯수 : <c:out value="${count}" />개</span>
		</div>
		<br><br><br>
		
			<div>
			<table>
				<tr class="line center">
					<th>제품번호</th>
					<th>이미지</th>
					<th>상품종류</th>
					<th>상품타임</th>
					<th>상품이름</th>
					<th>판매가격</th>
					<th>삭제</th>
				</tr>
			<!-- 상품 리스트 뿌려주기 -->	
			<c:forEach items="${list}" var="list">
			<tr class="line center">
				<!-- 상품번호 -->
				<td><c:out value="${list.coidx}"/></td>
				
				<!-- 상품이미지 -->
				<td><img class="img-thumbnail image" src="/team_Bling/resources/custom/${list.customimg}"></td>
				
				<!-- 상품종류 -->
				<td>
					<c:if test="${list.kind == '1'}">
						목걸이
					</c:if>
					<c:if test="${list.kind == '2'}">
						반지
					</c:if>
					<c:if test="${list.kind == '3'}">
						귀걸이
					</c:if>
					<c:if test="${list.kind == '4'}">
						팔찌
					</c:if>
				</td>
				
				<!-- 상품타입 -->
				<td>
					<c:if test="${list.type == '1'}">
						체인
					</c:if>
					<c:if test="${list.type == '2'}">
						고리
					</c:if>
					<c:if test="${list.type == '3'}">
						장식
					</c:if>
				</td>
				
				<!-- 상품이름 -->
				<td>
					<span style="color:#cb7878"><c:out value="${list.name}"/></span>
				</td>
				
				<!-- 판매가격 -->
				<td>
					<span class="saleprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}"/>원</span>
				</td>
				<!-- 삭제 -->
				<td><button type="button" class="btn btn-outline-primary btn-sm" onclick="del_fn(${list.coidx},'${list.customimg}')">삭제</button></td>
			</tr>
			</c:forEach>
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
						<a class='page-link' aria-label='Previous' href="/team_Bling/Ad_regist/list.do?page=${prev}&kind=${pm.kind}">
							<span aria-hidden='true' class='pointer' >&laquo;</span>
						</a>
					</li>
					</c:if>
					
					<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
					<c:set var="page" value="${pm.scri.page}"/>
					<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
						<c:if test = "${pageNum == page}">
						<li class="page-item active">	
							<a class="page-link pointer" href="/team_Bling/Ad_regist/list.do?page=${pageNum}&kind=${pm.kind}">
								<c:out value="${pageNum}"/>
							</a>
						</li>
						</c:if>
						<c:if test = "${pageNum != page}">
						<li class="page-item">	
							<a class="page-link pointer" href="/team_Bling/Ad_regist/list.do?page=${pageNum}&kind=${pm.kind}">
								<c:out value="${pageNum}"/>
							</a>
						</li>
						</c:if>
					</c:forEach>
					
					<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
					<c:if test="${pm.next && pm.endPage > 0}">
					<li class='page-item'>
						<a class='page-link' aria-label='Next' href="/team_Bling/Ad_regist/list.do?page=${pm.endPage + 1}&kind=${pm.kind}">
							<span aria-hidden='true' class='pointer'>&raquo;</span>
						</a>
					</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>	
	</section>	
</body>
<script>

//셀렉트 박스 선택
function proselected(){
	let kind = "<c:out value='${pm.kind}'/>";
	if(kind == "0"){
		$("#kind option:eq(0)").attr("selected", "selected");
	}
	if(kind == "1"){
		$("#kind option:eq(1)").attr("selected", "selected");
	}
	if(kind == "2"){
		$("#kind option:eq(2)").attr("selected", "selected");
	}
	if(kind == "3"){
		$("#kind option:eq(3)").attr("selected", "selected");
	}
}
proselected();

// 커스텀 삭제
function del_fn(coidx,customimg){
	
	$.ajax({
		url:"/team_Bling/Ad_regist/custom_delete.do",
		type:"POST",
		data:{"coidx":coidx,"customimg":customimg},
		success:function(data){
			alert("커스텀 이 삭제되었습니다.");
			location.reload();
		},error:function(){
			alert("커스텀 삭제 오류");
		}
	});
}

</script>
</html>