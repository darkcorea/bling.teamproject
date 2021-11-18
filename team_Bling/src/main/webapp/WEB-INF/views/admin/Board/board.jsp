<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판관리</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

	<style>
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
		.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
		.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		
		.content {position:relative;min-height:1000px;}
		
	</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
<!-- 옆 nav 바 -->
	<div class="d1">
		<div class="quickmenu">
			  <ul>
			 	<li><a href="#">문의게시판</a></li>
			    <li><a href="#">공지사항</a></li>
				<li><a href="#">고객센터</a></li>
			    <li><a href="#">이벤트</a></li>
			    <li><a href="#">리뷰관리</a></li> 
			  </ul>
		</div>
	</div>

<!--여기서부터 본문-->
	<div id="notice_contents">
		<h1 class="text-center">공지사항</h1>
		<br>
		<!-- 게시글 검색 -->
		<div class="row">
			<div class="col-6">
			</div>
			<div class="col-6">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="게시글 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
				</div>
			</div>
		</div>
		<!-- 게시글 표 -->	
		<div id="notice_table">
			<table class="table">
				<thead>
				  <tr class="text-center">
					<th scope="col" style="width:5%">삭제</th>
					<th scope="col" style="width:5%">번호</th>
					<th scope="col" style="width:15%">
						<select class="form-select form-select-sm" aria-label="Default select example">
							<option selected>타입</option>
							<option value="1">기본공지사항(N)</option>
							<option value="2">중요공지사항(S)</option>
						  </select>
	
	
					</th>
					<th scope="col">제목</th>
					<th scope="col" style="width:15%">작성날짜</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td scope="row">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						</div>
					</td>
					<th class="text-center">1</th>
					<td>기본(N)</td>
					<td>Otto</td>
					<td class="text-center">2021-11-17 11:29</td>
				  </tr>
				  <tr>
					<td scope="row">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						</div>
					</td>
					<th class="text-center">2</th>
					<td>중요공지사항(S)</td>
					<td>Thornton</td>
					<td class="text-center">2021-11-16 23:00</td>
				  </tr>
				  <tr>
					<td scope="row">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						</div>
					</td>
					<th class="text-center">3</th>
					<td>고객센터(Q)</td>
					<td>Thornton</td>
					<td class="text-center">2021-11-15 10:00</td>
				  </tr>
				</tbody>
			  </table>
		</div>
	
		<br>
		<!-- 게시글 페이징 nav바 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			  <li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
				  <span aria-hidden="true">&laquo;</span>
				</a>
			  </li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
				  <span aria-hidden="true">&raquo;</span>
				</a>
			  </li>
			</ul>
		</nav>
	
		<!-- 게시글 등록/삭제 -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" class="btn btn-outline-primary" onclick="enrollment();">등록</button>
			<button type="button" class="btn btn-outline-danger">삭제</button>
		</div>
	
		<br>
	</div>
</body>

<script>
	function enrollment(){
		$("#notice_contents").html("");
		
	}
</script>
</html>