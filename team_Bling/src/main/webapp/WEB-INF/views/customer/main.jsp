<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.research-question .research-text {
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
	
	.text_center{
		text-align:center;
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
<input type="text" name="research_question" class="research-text" placeholder="자주 묻는 질문 검색">&ensp;
<button type="button" class="btn btn-danger" id="research_question_btn" onclick="">검색</button>
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
		<tr class="text_center"></tr>
		<tr></tr>
		<tr class="text_center"></tr>
	</tbody>
</table>



<button type="button" class="btn btn-danger" id="question_btn" onclick="">문의하기</button>

</section><br><br><br>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>
</body>
<script>
</script>
</html>