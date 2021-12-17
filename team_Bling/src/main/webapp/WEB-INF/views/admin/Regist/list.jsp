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
<title>관리자 상품 리스트</title>


<style>
	section {
		max-width:1008px;
		margin:  5px auto;
	}
	
	.line{border-bottom:1px solid gray;}
	
	th,td{text-align:center;}

	
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
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	<section>
	<div class="container">
		
		<div style="text-align:center;">
		<span class="title">상품 리스트&ensp;</span>
		<select name="kind" id="kind" onchange="location.href=this.value">
			<option value="/team_Bling/Ad_regist/list.do?page=1&kind=A">모든 제품</option>
			<option value="/team_Bling/Ad_regist/list.do?page=1&kind=R">반지</option>
			<option value="/team_Bling/Ad_regist/list.do?page=1&kind=E">귀걸이</option>
			<option value="/team_Bling/Ad_regist/list.do?page=1&kind=N">목걸이</option>
			<option value="/team_Bling/Ad_regist/list.do?page=1&kind=B">팔찌</option>
		</select>
		<span> 상품 갯수 : <c:out value="${count}" />개</span>
		</div>
		<br><br><br>
		
			<div>
			<table>
				<tr class="line">
					<th>제품번호</th>
					<th>이미지</th>
					<th>상품종류</th>
					<th>상품이름</th>
					<th>판매가격</th>
					<th>판매상태</th>
					<th>등록일</th>
					<th>수정</th>
				</tr>
			<!-- 상품 리스트 뿌려주기 -->	
			<c:forEach items="${list}" var="list">
			<tr class="line">
				<!-- 상품번호 -->
				<td><c:out value="${list.pidx}"/></td>
				
				<!-- 상품이미지 -->
				<td><a href="/team_Bling/Ad_regist/modify.do?pidx=${list.pidx}"><img class="img-thumbnail image" src="/team_Bling/resources/image/${list.main}"></a></td>
				
				<!-- 상품종류 -->
				<td>
					<c:if test="${list.kind == 'R'}">
						반지
					</c:if>
					<c:if test="${list.kind == 'N'}">
						목걸이
					</c:if>
					<c:if test="${list.kind == 'E'}">
						귀걸이
					</c:if>
					<c:if test="${list.kind == 'B'}">
						팔찌
					</c:if>
				</td>
				
				<!-- 상품이름 -->
				<td>
					<a href="/team_Bling/Ad_regist/modify.do?pidx=${list.pidx}">
						<span style="color:#cb7878" data-bs-toggle="tooltip" title="수정하기">
							<c:out value="${list.pname}"/>
						</span>
					</a>
					<c:set var="pidx" value="${list.pidx}"/>
						<c:forEach items="${oblist}" var="oblist">
						<c:set var="opidx" value="${oblist.pidx}"/>
							<c:if test="${pidx == opidx}">
							<br>
							<c:out value="${oblist.oname}"/>,&nbsp;
								
								<c:if test="${oblist.stock == '0' }">
								<span class="red">재고없음</span>,&nbsp;
								</c:if>
								<c:if test="${oblist.stock != '0' }">
								<c:out value="${oblist.stock}"/>,&nbsp;
								</c:if>
							
								<c:if test="${oblist.saleyn == 'Y' }">
								판매
								</c:if>
								<c:if test="${oblist.saleyn == 'N' }">
								<span class="red">중지</span>
								</c:if>
							</c:if>
						</c:forEach>
				</td>
				
				<!-- 판매가격 -->
				<td>
					<span class="saleprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.saleprice}"/>원</span>
				</td>
				
				<!-- 판매상태 -->
				<td>
					<c:if test="${list.saleyn == 'Y' }">
					판매중
					</c:if>
					<c:if test="${list.saleyn == 'N' }">
					<span class="red">판매중지</span>
					</c:if>
				</td>
				
				<!-- 등록일 -->
				<c:set var="date" value="${list.rdate}"/>
				<td><c:out value="${fn:substring(date,0,10)}"/></td>
				
				<!-- 수정 -->
				<td><button type="button" class="btn btn-white btn-sm" onclick="location.href='/team_Bling/Ad_regist/modify.do?pidx=${list.pidx}'">수정</button></td>
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
}
proselected();


</script>
</html>