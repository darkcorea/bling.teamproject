<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content ="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>이벤트 게시글 추가</title>
		<script src="/team_Bling/js/summernote/summernote-lite.js"></script>
		<script src="/team_Bling/js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/team_Bling/css/summernote/summernote-lite.css">
		
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
				 	<li><a href="/team_Bling/Ad_board/question.do">문의게시판</a></li>
				    <li><a href="/team_Bling/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
				    <li><a href="/team_Bling/Ad_board/event.do">이벤트</a></li>
				    <li><a href="#">리뷰관리</a></li> 
				  </ul>
			</div>
		</div>
		
	<!-- 이벤트 등록 -->
	
		<h2 class="text-center">이벤트 등록</h2> <br>
	
		<form method="post" action="/team_Bling/Ad_board/event_regist_all.do" id="frm_write" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th class="head">제목</th>
					<td >
						<input type="text" name="subject" id="subject" style="width:941px ; height:30px">
					</td>
				</tr>
				<tr>
					<th class="head">내용	</th>
					<td colspan="3" height="294.8">
						<textarea name="contents" style="width:100%;height:100%;"></textarea>
					</td>
				</tr>
				<tr>
					<th class="head">배너사진</th>
					<td >
						<input type="file" name="banner" id="banner" accept="image/*">
					</td>
				</tr>
				<tr>
					<th class="head">메인사진</th>
					<td >
						<input type="file" name="image" id="image" accept="image/*">
					</td>
				</tr>
				<tr>
					<th class="head">이벤트시작</th>
					<td >
						<input type="date" name="event_start">
					</td>
				</tr>
				<tr>
					<th class="head">이벤트끝</th>
					<td >
						<input type="date" name="event_end">
					</td>
				</tr>
			</table>
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			   <input type="submit" class="btn btn-primary" value="등록하기">
			  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/team_Bling/Ad_board/event.do'">취소하기</button>
			</div>
			
			<br>
            <br>
            <br>
		</form>
	</body>
</html>