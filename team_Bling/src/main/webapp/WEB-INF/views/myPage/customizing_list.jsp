<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커스터마이징 리스트</title>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<style>
			section{
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
		</header>
		
		<section>
			<div class="container">
				<div class="row">
					<!-- nav바   -->
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
					</div>
					
					<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9">
						<button type="button" class="btn btn-primary" onclick="location.href='${cPath}/Custom/ssss.do'">커스터마이징 만들기</button>
						<br><br>
						
						<!-- 커마 리스트 -->
						<div id="cardlist">
						
						</div>
						<!-- 커마 리스트 -->
						
					</div>
				</div>
			</div>
		</section>
		
		<footer>
				<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>
	</body>
	
	<script>
		var page = 1;
		
		if(page == null){page = 1};
	
		$(function(){
			list(1);
		});
		
		
		
		function list(page){
			
			$.ajax({
				url:"${cPath}/Custom/listajax.do",
				type:"POST",
				data:{"page":page},
				dataType:'json',
				success:function(data){
					var str = "";
					let pm = data.pm;
					let prev = parseInt(pm.startPage - 1) ;
				  	let next = parseInt(pm.endPage + 1) ;
				  	
					//본문
					if(data.length < 4){
						str += threelist(0,3,data);
					}else if(3 < data.list.length < 7){
						str += threelist(0,3,data);
						str += threelist(3,6,data);
					}
					
					str+="<br>";
					
					//네비게이션바
					str +="<nav aria-label='Page navigation example'>";
					str +="<ul class='pagination justify-content-center'>";
					str +="<li class='page-item'>";
					
					if ((pm.startPage - 1) != 0){
				  	     str += "<a class='page-link' aria-label='Previous' onclick='list("+prev+")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
				  	 }
				  	 str += "</li>";
				  	 
				  	 for (let k = pm.startPage; k<=pm.endPage; k++ ){
				  		 if(page == k){
				  			str += "<li class='page-item active'><a class='page-link pointer' onclick='list("+k+")'>"+k+"</a></li>";    
				  		 }else{
				  			str += "<li class='page-item'><a class='page-link pointer' onclick='list("+k+")'>"+k+"</a></li>";    
				  		 }
				  	 }
				  	 
				  	 str += "<li class='page-item'>";
				  	
				  	 if(pm.next && pm.endPage > 0){
				  	     str += "<a class='page-link' aria-label='Next' onclick='list("+next+")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
				  	 }
				  	 
				  	 str += "</li>";
				  	 str += "</ul>";
				  	 str += "</nav>";
				  	 
				  	 
				  	 // div에 모든 내용 뿌려주기
					 $("#cardlist").html(str);
				  
				  
				},error:function(){
					alert("리스트 불러오기 에러!");
				}
			});
			
		}
		
		function threelist( start,end,data){
			let str = "";
			str+="<div class='card-group'>";
			for(let i=start ; i<end ; i++){
				str+="<div class='card'>";
				if(data.list[i] == null){
					str+="<img src='/team_Bling/resources/usercustomizing/기본.JPG' class='card-img-top'>";
					str+="<div class='card-body'>";
					str+="<h5 class='card-title'>커스터마이징을 해보세요</h5>";
				}else{
					str+="<img src='/team_Bling/resources/usercustomizing/"+data.list[i].customimg+"' class='card-img-top'>";
					str+="<div class='card-body'>";
					str+="<h5 class='card-title'>"+data.list[i].name+"</h5>";
					str+=" <p class='card-text'>"+data.list[i].price+"원</p>";
					str+="<a href='/team_Bling/Basket/custominsert.do?cuidx="+data.list[i].cuidx+"' class='btn btn-outline-dark'>장바구니에 담기</a>";
					str+="<button type='button' class='btn btn-outline-danger' onclick='del("+data.list[i].cuidx+")'>삭제하기</a>";
				}
				str+="</div>";
				str+="</div>";
			}
			str+="</div>";
			return str;
		}
		
		function del(cuidx){
			if(confirm("정말 삭제하시겠습니까?") == true){
				$.ajax({
					url:"${cPath}/Custom/del.do",
					type:"POST",
					data:{"cuidx":cuidx},
					dataType:'json',
					success:function(data){
						alert("삭제되었습니다.");
					},error:function(data){
					}
				});
			}else{
				return false;
			}
		}
	</script>
</html>