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
	<title>페이징 연습</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
<p>페이징 연습</p>

<table border="1" class="table">
	<thead>
		<tr>
			<th style="width:100px;">작성자</th>
			<th style="width:500px;">내용</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${page}" var="list">
		<tr>
			<td><c:out value="${list.uname}"/></td>
			<td><c:out value="${list.contents}"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table><br>
<table>
	<tr>
		<td>
			<c:if test="${pm.prev == true }">
			<c:set var="prev" value="${pm.startPage -1}"/>
			<a href="/Review/list.do?page=${prev}">이전</a>
			</c:if>
		</td>
		<td style="width:400px;text-align:center;">
			<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
				<a href="/Review/list.do?page=${pageNum}">
				<c:out value="${pageNum}"/></a>&nbsp;
			</c:forEach>
		</td>
		<td>
			<c:if test="${pm.next && pm.endPage > 0}">
			<a href="/Review/list.do?page=${pm.endPage + 1}">다음</a>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>