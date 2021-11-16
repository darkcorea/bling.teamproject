<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 문의 하기</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section {
		width:750px;
		margin:0px auto;
	}
	
	/* 색상 레드*/
	.red{
		color:red;
	}
	
	table {
		width:100%;
		margin:15px 0px;
	}
	.tr1{
		border-top: 1px solid #444444;
		height:50px;
	}
	
	#form-select{
		width:30%;
		font-size:16px;
		padding-top:2px;
		padding-bottom:2px;
	}
	
	
	.tr2{
		border-top: 1px solid #CB7878;
		height:50px;
	}
	
	.tr3{
		border-top: 1px solid #CB7878;
		height:50px;
	}
	
	.tr4{
		border-top: 1px solid #CB7878;
		border-bottom: 1px solid #CB7878;
	}
	
	
	.mar20 {
		margin: 20px 0px;
		resize:none;
	}
	
	/* 버튼들 위치 가운데 */
	.btn-two {
		text-align: center;
	}
	
	.tr3 .btn-danger {
	background-color: #CB7878;
	border: 1px solid #CB7878;
	width: 100px;
	}
	
	.btn-two .btn-danger {
	background-color: #CB7878;
	border: 1px solid #CB7878;
	width: 80px;
	}
	
	.btn-light {
	width: 80px;
	}
	
</style>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/views/header.jsp"%><BR>
	<br>
</header>

<section>
	<h2>문의하기</h2>
	<form name="question" action="/" method="POST">
	<table>
		<tr class="tr1">
			<td style="width:180px;"><span class="red">*</span>문의사항 구분</td>
			<td>
				<select name="category" class="form-select" id="form-select" aria-label="Default select">
					<option value="A" selected>배송</option>
	  				<option value="B">취소,교환,반품</option>
	  				<option value="C">기타</option>
				</select>
			</td>
		</tr>
		<tr class="tr2">
			<td style="width:180px;"><span class="red">*</span>제목</td>
			<td><input type="text" name="title" style="width:90%"></td>
		</tr>
		<tr class="tr3">
			<td>상품선택</td>
			<td><button type="button" class="btn btn-danger">상품선택</button></td>
		</tr>
		<tr class="tr4">
			<td><span class="red">*</span>본문</td>
			<td><textarea id="comments" name="comments" cols="60" rows="15" class="mar20"></textarea></td>
		</tr>
	</table>
	<div class="btn-two">
	<button type="button" class="btn btn-danger" onclick="qustionFn(this.form)">저장</button>&ensp;
	<button type="button" class="btn btn-light" onclick="history.go(-1)">이전</button>
	</div>
	</form>
</section><br><br><br>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>
</body>
<script>
	function qustionFn(form){
		
		let Qform = document.question;

		if(form.title.value == ""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return ;
		}
		
		if(form.comments.value == ""){
			alert("내용을 입력하세요.");
			form.comments.focus();
			return ;
		}
		
		alert("문의 내용이 등록되었습니다.");
		Qform.submit();
	}

</script>
</html>