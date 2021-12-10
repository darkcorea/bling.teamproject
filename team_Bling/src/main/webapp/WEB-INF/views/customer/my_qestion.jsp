<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 문의 내역</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	#secTitle{
			font-size: 30px;
			margin: 100px 0px 20px 0px;
		}
	.pointer{
		cursor: pointer;
		text-decoration-line: none;
		color: #854040;
		font-weight: bold ;
	}
	#title{
		width:100%;
		text-align: center;
	}
	h4{
		float: left;
		width:50%;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div class="container">
		<div class="row">
			<!-- nav바   -->
			<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
				<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
			</div>
			<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9">
				<div id="secTitle">나의 문의 내역</div>
				<div id="title"><h4>1:1 문의</h4><h4>제품 문의</h4></div>
				<table class="table">
					<thead>
						<tr class="text_center">
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="num" value="1" />
						<c:forEach items="${list}" var="list">
						<tr style="vertical-align:middle;">
							<td class="text_center"><c:out value="${list.rownum}"/></td>
							<td class="text_center"><a class="pointer" onclick="detail(${list.qidx})"><c:out value="${list.title}"/></a></td>
							<td class="text_center"><c:out value="${list.rdate}"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>
	function detail(qidx){
		$.ajax({
			url:"/Customer/myquestion_detail.do",
			type:"POST",
			data:{"qidx":qidx},
			dataType:"json",
			success:function(data){
				console.log(data);
			},
			error:function(){
				alert("실행오류");
			}
		});
		
	}
	
</script>
</html>