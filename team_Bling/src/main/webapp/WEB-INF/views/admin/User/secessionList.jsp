<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 관리</title>
	<style>
		
		td{
			text-align:center;
		}
		.center{
			text-align:center;
		}
		
		table{
			border-top:solid 1px black;
			
		}
		.line{
		border-bottom:solid 1px #C4C4C4;
		}
		.title{
			text-align:center;
			font-size: 30px;
		}
	</style>
</head>
	<body>
		
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	
	
	<!--여기서부터 본문-->
		<div>
			<br>
			<div class="title">탈퇴 회원 리스트</div>
			<br><br>
			<table>
				<tr class="line">
					<th class="center" style='width:100px;'>번호</th>
					<th class="center" style='width:150px;'>아이디</th>
					<th class="center" style='width:150px;'>이름</th>
					<th class="center" style='width:80px;'>등급</th>
					<th class="center" style='width:200px;'>가입일</th>
					<th class="center" style='width:300px;'>탈퇴 사유</th>
				</tr>
				<c:set var="num" value="1" />
				<c:forEach items="${list}" var="list">
				<tr class="line">
					<td><c:out value="${num}"/></td>
					<c:set var="num" value="${num + 1}" />
					<td><c:out value="${list.id}"/></td>
					<td><c:out value="${list.uname}"/></td>
					<td><c:out value="${list.grade}"/></td>
					<td><c:out value="${list.rdate}"/></td>
					<td><c:out value="${list.quit}"/></td>
				</c:forEach>
			</table>
			<br><br>
		</div>
	<script>
	
	
	</script>
</body>
</html>