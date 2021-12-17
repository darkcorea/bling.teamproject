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
	
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>

		
	<!-- 내용 -->
		<div>
			<h2 class='text-center'>${detail.subject }</h2>
			<hr>
			<table class="table">
				<tr>
					<td class='text-left'>
						타입 : 
						<c:if test="${detail.type eq 'N'}"> 
							기본(N)
						</c:if>
						<c:if test="${detail.type eq 'S'}"> 
							중요공지사항(S)
						</c:if>
						<c:if test="${detail.type eq 'Q'}"> 
							고객센터(Q)
						</c:if>
					</td>
					<td id="detailrdate">${detail.rdate }</td>
				</tr>
				<tr>
					<td colspan="2">
						${detail.contents}
					</td>
				</tr>
				
				<c:if test="${detail.imgfile != null}">
				<tr>
					<td colspan="2">
						<a href="/team_Bling/Ad_board/fileDownLoad.do?fileName=${detail.imgfile}">
						파일 다운로드 : 
						<i class="bi bi-file-earmark-arrow-down"></i>
						${detail.imgfile}
						</a>
					</td>
				</tr>
				</c:if>
				
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-outline-primary" type="button" onclick="location.href='/team_Bling/Ad_board/bf_modify.do?nidx=${detail.nidx}'">수정하기</button>
			  <button class="btn btn-outline-danger" type="button" onclick="detail_del(${detail.nidx})">삭제하기</button>
			  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/team_Bling/Ad_board/board.do?page=1&type=T'">목록가기</button>
			</div>
		</div>
		<br>
	</body>
	<script>
		function detail_del(nidx){
			
			if(confirm("해당 게시물을 삭제하시겠습니까?")){
				alert(nidx+"번 게시물을 삭제합니다");
				
				$.ajax({
					url:"/team_Bling/Ad_board/detail_del.do",
					type:"POST",
					data:{"nidx":nidx},
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
</html>