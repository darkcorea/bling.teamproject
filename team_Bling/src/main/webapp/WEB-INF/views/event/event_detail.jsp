<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>이벤트</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		
		<style>
			/* 전반적인 크기에 관한 설정 */
			section, header {
				max-width:1008px;
				margin:  0px auto;
			}
			.page-item{
				padding:0;
			}
			#research_question_btn{
				background-color: #CB7878;
				border: 1px solid #CB7878;
				width:80px;
				float: right;
				color:white;
			}
			#find{
				width:380px;
				height:40px;
			}
			#detail_rdate{
				text-align: right;
			}
		</style>
	
	</head>
	<body>
		<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><BR>
		</header><br>
		
		<section>
			<div>
				<h2 class='text-center'>${detail.subject }</h2>
				<div id="detail_rdate">
					${fn:substring(detail.event_start,0,10)} ~ ${fn:substring(detail.event_end,0,10)}
				</div>
				<hr>
				<table class="table">
					<tr>
						<td colspan="2">
							<img src='/resources/event/${detail.image}' class='d-block w-100'>
						</td>
					</tr>
				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/Event/main.do'">목록가기</button>
				</div>
			</div>
			<br>
		</section>
		
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>	
	</body>
</html>