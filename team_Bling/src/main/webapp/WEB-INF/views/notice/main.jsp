<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content ="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>공지사항</title>
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
		</style>
	</head>
	<body>
		<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><BR>
		</header><br>
		
		<section>
			<div class="container margin15">
				<h3 class="text-center"> 공지사항 </h3>
				<br>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #EBB7B7">
							<tr class="text-center">
								<th scope="col" style="width:10%">번호</th>
								<th scope="col" style="width:70%">제목</th>
								<th scope="col" style="width:20%">작성자</th>
							</tr>
						</thead>
						<tbody>
							<tr class="table-secondary">
								<th scope="row" class="text-center">중요</th>
								<td>ddㄴㅇㄹj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row" class="text-center">중요</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row" class="text-center">중요</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">6</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">5</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">4</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">3</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">2</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
							<tr>
								<th scope="row" class="text-center">1</th>
								<td>dfslj</td>
								<td class="text-center">작성자1</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<br>
				
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
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				    <li class="page-item"><a class="page-link" href="#">5</a></li>
				    <li class="page-item"><a class="page-link" href="#">6</a></li>
				    <li class="page-item"><a class="page-link" href="#">7</a></li>
				    <li class="page-item"><a class="page-link" href="#">8</a></li>
				    <li class="page-item"><a class="page-link" href="#">9</a></li>
				    <li class="page-item"><a class="page-link" href="#">10</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
				
			</div>
		</section>
		
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer> 
	</body>
</html>