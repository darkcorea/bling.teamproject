<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section {
		width:1008px;
		margin: 5px auto;
	}
	
	h2 {
		margin-left: 60px;
		font-weight: 900px;
	}
	
	/* 자주묻는 질문과 검색 버튼 */
	.research-question {
		margin : 20px auto;
		text-align:center;
	}
	
	/* 자주묻는 질문 텍스트 */
	#research-text {
		width:400px;
		height: 38px;
		vertical-align: middle;
	}
	
	/* 검색 버튼 */
	#research_question_btn{
		background-color: #CB7878;
		border: 1px solid #CB7878;
		width:80px;
	}
	
	/* 문의하기버튼 */
	#question_btn{
		background-color: #CB7878;
		border: 1px solid #CB7878;
		width:130px;
		float: right;
	}
	/*  페이징 번호들을 붙이기 위해서 */
	.page-item {
		padding: 0px;
	}
	
	/* 텍스트 가운데로 클래스 */
	.text_center{
		text-align:center;
	}
	
	/* 클래스 추가하면 가져다 대면 손모양 나옴*/
	.pointer {
		cursor: pointer;
	}
</style>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/views/header.jsp"%><BR>
	<br>
</header>

<section>
<h2>고객센터</h2>
<!-- 문의하기  텍스트와 검색버튼 -->
<div class="research-question">
<form name="frm" action="/Customer/main.do" method="post">
<input type="text" name="keyword" id="research-text" placeholder="자주 묻는 질문 검색">&ensp;
<input type="hidden" name="page" value="1">
<input type="text" style="display:none;">
<button type="button" class="btn btn-danger" id="research_question_btn" onclick="research_Fn(this.form)">검색</button>
</form>
</div>

<!-- 고객센터 글 리스트 -->
<table class="table">
	<thead>
		<tr class="text_center">
			<th style="width:6%;">번호</th>
			<th style="width:80%;">제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<!-- 고객센터 글 뿌려주기 -->
		<c:set var="num" value="1" />
		<c:forEach items="${question}" var="list">
		<tr>
			<td class="text_center"><c:out value="${num}"/></td>
			
			<c:set var="num" value="${num + 1}" />
			<td>
			<div class="accordion">
				<div class="accordion-item" style="border:0;">
					<div class="accordion-header" id="heading${list.nidx}">
			     		<span onclick="coll_fn(${list.nidx})" id="coll${list.nidx}" class="pointer">
			        		<c:out value="${list.subject}"/>
			      		</span>
			    	</div>
			    	<div id="collapse${list.nidx}" class="accordion-collapse collapse">
				    	<div class="accordion-body">
				      		<c:out value="${list.contents}"/>
				      	</div>
			    	</div>
				</div>
			</div>
			</td>
			
			<c:set var="rdate" value="${list.rdate}"/>
			<c:set var="date" value="${fn:substring(rdate,0,10)}"/>
			<td class="text_center"><c:out value="${date}"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 페이징 바 뿌려주기 -->
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<!-- 앞으로  가기 버튼 , 키워드 유지하면서 이동하기 -->
		<c:if test="${pm.prev == true}">
		<li class='page-item'>
		<c:set var="prev" value="${pm.startPage -1}"/>
			<a class='page-link' aria-label='Previous' href="/Customer/main.do?page=${prev}&keyword=${pm.scri.keyword}">
				<span aria-hidden='true' class='pointer' >&laquo;</span>
			</a>
		</li>
		</c:if>
		
		<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
		<c:set var="page" value="${pm.scri.page}"/>
		<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
			<c:if test = "${pageNum == page}">
			<li class="page-item active">	
				<a class="page-link pointer" href="/Customer/main.do?page=${pageNum}&keyword=${pm.scri.keyword}">
					<c:out value="${pageNum}"/>
				</a>
			</li>
			</c:if>
			<c:if test = "${pageNum != page}">
			<li class="page-item">	
				<a class="page-link pointer" href="/Customer/main.do?page=${pageNum}&keyword=${pm.scri.keyword}">
					<c:out value="${pageNum}"/>
				</a>
			</li>
			</c:if>
		</c:forEach>
		
		<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
		<c:if test="${pm.next && pm.endPage > 0}">
		<li class='page-item'>
			<a class='page-link' aria-label='Next' href="/Customer/main.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}">
				<span aria-hidden='true' class='pointer'>&raquo;</span>
			</a>
		</li>
		</c:if>
	</ul>
</nav>
<button type="button" class="btn btn-danger" id="question_btn" onclick="location.href='/Customer/question.do'">문의하기</button>

</section><br><br><br>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>

</body>
<script>
	/* 문의 제목을 클릭하면 제옥 아래로 내용이 보였다가 사라졌다 한다 */
	function coll_fn(nidx){
		let show = $("#collapse"+nidx).hasClass("show");
		console.log(show);
		if (show == false){
			$("#collapse"+nidx).addClass("show");
		}else if (show == true){
			$("#collapse"+nidx).removeClass("show");
		}
	}

	/* 검색어를 입력하고 검색 버튼을 눌렀을 떄 */
	function research_Fn(form) {

		let rform = document.frm;
		
		if(form.keyword.value == ""){
			alert("검색어를 입력해 주세요.");
			form.keyword.focus();
			return ;
		}
		
		rform.submit();
	}
	
</script>
</html>