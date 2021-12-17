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
		<title>이벤트관리</title>
		</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	<!-- 옆 nav 바 -->
		<div class="d1">
		</div>	
		<div>
			<h2 class='text-center'>${detail.subject }</h2>
			<div id="detail_rdate">
				${fn:substring(detail.event_start,0,10)} ~ ${fn:substring(detail.event_end,0,10)}
			</div>
			<hr>
			<table class="table">
				<tr>
					<td colspan="2">
						<img src='/team_Bling/resources/event/${detail.image}' class='d-block w-100'>
					</td>
				</tr>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-outline-danger" type="button" onclick="detail_del(${detail.eidx})">삭제하기</button>
			  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/team_Bling/Ad_board/event.do'">목록가기</button>
			</div>
		</div>
		<br>

	<script>
		function detail_del(eidx){
			
			if(confirm("해당 게시물을 삭제하시겠습니까?")){
				alert(eidx+"번 게시물을 삭제합니다");
				
				$.ajax({
					url:"/team_Bling/Ad_board/event_detail_del.do",
					type:"POST",
					data:{"eidx":eidx},
					ContentType:"application/json",
					success:function(data){
						location.reload();
						window.history.back();
					},error:function(){
						alert("상품삭제 에러!")
					}
				});
			}else{
				alert("취소하였습니다.");
			}
			
		}
	</script>
</body>
</html>