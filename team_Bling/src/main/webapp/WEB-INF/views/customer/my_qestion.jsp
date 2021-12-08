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
				<div id="list"></div>	
			</div>
			
		</div>
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>
	$(function(){
		
		let midx = "${sessionScope.UserVO.midx}";
		/* $.ajax({
			url:"/Customer/myQuestion_list.do",
			type:"get",
			data:"midx="+midx,
			ContentType:"application/json",
			success:function(data){
				if(data.length>0){
				var str = "";
				str += "<table class='tab'>";
				str += "<tr class='line1'>";
				str += "	<th>번호</th>";
				str += "	<th>제목</th>";
				str += "	<th>작성자</th>";
				str += "	<th>작성일</th>";
				str += "</tr>";
				for(var i=0; i<data.length;i++){
					var item = data[i];
					str += "<tr class='line'>";
					str += "<td>"+item.qidx+"</td>";
					str += "<td>"+item.title+"</td>";
					str += "<td>"+item.content+"</td>";
					str += "<td>"+item.rdate+"</td>";
					str += "</tr>";
				}
				str += "</table>";
				$("#list").html(str);
				
				}else{
					var str="";
					str += "<table class='tab'>";
					str += "<tr class='line1'>";
					str += "	<th><input type='checkbox' name='all' onclick='checkAll(this)'></th>";
					str += "	<th>사진</th>";
					str += "	<th>제품명</th>";
					str += "	<th class='th1'>수량</th>";
					str += "	<th>상품가격</th>";
					str += "	<th>할인금액</th>";
					str += "	<th>결제금액</th>";
					str += "	<th>취소</th>";
					str += "</tr>";
					str += "</table>";
					$("#list").html(str);
				}
			},
			error:function(){
				alert("실행오류");
			}
		}); */
		
	});
</script>
</html>