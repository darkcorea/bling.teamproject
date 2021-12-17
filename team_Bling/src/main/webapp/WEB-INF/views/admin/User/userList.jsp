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
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		
		.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
		.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		
		.content {position:relative;min-height:1000px;}
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
		#info{
			font-size:8pt;
			color:#cd2828;
		}
		
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
				 	<li><a>회원리스트</a></li>
				    <li><a href="#">탈퇴회원 리스트</a></li> 
				  </ul>
			</div>
		</div>
	
	<!--여기서부터 본문-->
		<div>
			<h1 class="text-center">회원 리스트</h1>
			<br>
			<table>
				<tr class="line">
					<th class="center" style='width:100px;'>번호</th>
					<th class="center" style='width:140px;'>아이디</th>
					<th class="center" style='width:140px;'>이름</th>
					<th class="center">
						<select name="grade" id="grade" onchange="location.href=this.value">
							<option value="/team_Bling/Ad_user/userList.do?page=1&grade=A">모든 등급</option>
							<option value="/team_Bling/Ad_user/userList.do?page=1&grade=B">브론즈(B)</option>
							<option value="/team_Bling/Ad_user/userList.do?page=1&grade=S">실버(S)</option>
							<option value="/team_Bling/Ad_user/userList.do?page=1&grade=G">골드(G)</option>
						</select>
					</th>
					<th class="center" style='width:110px;'>마일리지</th>
					<th class="center" style='width:110px;'>주문금액</th>
					<th class="center" style='width:140px;'>회원가입일</th>
					<th class="center" style='width:140px;'>최종로그인</th>
					
				</tr>
				<c:set var="page1" value="${pm.scri.page}"/>
				<c:set var="num" value="${total-((page1-1)*20)}" />
				<c:forEach items="${list}" var="list" >
					<tr class="line">
						<td><c:out value="${num}"/></td>
						<c:set var="num" value="${num - 1}" />
					
						<td><c:out value="${list.id}"/></td>
						<td><c:out value="${list.uname}"/></td>
						<td><c:out value="${list.grade}"/></td>
						<td>
						<fmt:formatNumber value="${list.mileage}" type="number"/></td>
						
						<td>
						<fmt:formatNumber value="${list.sum}" type="number"/></td>
						<td><c:set var="rdate" value="${list.rdate}"/>
								<c:set var="date" value="${fn:substring(rdate,0,10)}"/>
								<c:out value="${date}"/></td>
						<td><c:set var="rdate1" value="${list.rdate1}"/>
								<c:set var="date1" value="${fn:substring(rdate1,0,10)}"/>
								<c:out value="${date1}"/></td>
						
					</tr>
				</c:forEach>
			</table>
			<br><br>
			<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						
						<c:if test="${pm.prev == true}">
						<li class='page-item'>
						<c:set var="prev" value="${pm.startPage -1}"/>
							<a class='page-link' aria-label='Previous' href="/team_Bling/Ad_user/userList.do?page=${prev}&grade=${pm.grade}">
								<span aria-hidden='true' class='pointer' >&laquo;</span>
							</a>
						</li>
						</c:if>
						<c:set var="page" value="${pm.scri.page}"/>
						<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
							<c:if test = "${pageNum == page}">
							<li class="page-item active">	
								<a class="page-link pointer" href="/team_Bling/Ad_user/userList.do?page=${pageNum}&grade=${pm.grade}">
									<c:out value="${pageNum}"/>
								</a>
							</li>
							</c:if>
							<c:if test = "${pageNum != page}">
							<li class="page-item">	
								<a class="page-link" href="/team_Bling/Ad_user/userList.do?page=${pageNum}&grade=${pm.grade}">
									<c:out value="${pageNum}"/>
								</a>
							</li>
							</c:if>
						</c:forEach>
						
						<c:if test="${pm.next && pm.endPage > 0}">
						<li class='page-item'>
							<a class='page-link' aria-label='Next' href="/team_Bling/Ad_user/userList.do?page=${pm.endPage + 1}&&grade=${pm.grade}">
								<span aria-hidden='true' class='pointer'>&raquo;</span>
							</a>
						</li>
						</c:if>
					</ul>
				</nav>
			<br>
		</div>
	<script>
	function proselected(){
		let grade = "<c:out value='${pm.grade}'/>";
		console.log(grade);
		if(grade == "B"){
			$("#grade option:eq(1)").attr("selected", "selected");
		}
		if(grade == "S"){
			$("#grade option:eq(2)").attr("selected", "selected");
		}
		if(grade == "G"){
			$("#grade option:eq(3)").attr("selected", "selected");
		}
		
	}
	proselected();

	
	</script>
</body>
</html>