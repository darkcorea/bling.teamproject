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
		</style>
	</head>
	<body>
		<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><BR>
		</header><br>
		
		<section>
			<div class="container margin15">
				<h1 class="text-center">공지사항</h1>
				<br>
				<!-- 게시글 검색 -->
				<div class="row">
				<div class="col-6">
				</div>
				<div class="col-6">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="게시글 제목 검색" aria-label="Recipient's username" aria-describedby="button-addon2" id="searchsomething">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="searchword()">검색</button>
 					</div>
				</div>
				</div>
				<!-- 게시글 표 -->	
				<div id="notice_table">
					<table class='table'>
						<thead>
						<tr class='text-center'>
							<th scope='col' style='width:10%'>번호</th>
							<th scope='col' style='width:10%'>타입</th>
							<th scope='col'>제목</th>
							<th scope='col' style='width:20%'>작성날짜</th>
						</tr>
						</thead>
						<tbody id="tbody_table">
							
						</tbody>
					</table>
					<br>
					<div id="nav_bar">
							
					</div>
				</div>
			
				<br>
			</div>
		</section>
		
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>	
	</body>
	
	<script>
		var page = 1;
		var type = "T";
		
		$(function(){
			list_fn(page,type);
		});
		
		function list_fn(page,type,keyword){
				$.ajax({
					url:"/Notice/list.do",
					type:"POST",
					data:{"page":page, "type":type,"keyword":keyword},
					dataType: 'json',
					success:function(data){
						
						let notice_list = data.totalList;
						let pm = data.pm;
						let prev = parseInt(pm.startPage - 1) ;
					  	let next = parseInt(pm.endPage + 1) ;
					  	
					  	var page = data.page;
					  	var pagenum = (page-1) * 10;
					  	
					  	let str = "";
					  	let str2 = "";
					  	
					  	console.log("start"+pm.startPage);
					  	console.log("end"+pm.endPage);
					  	
						for(let i=0;i<data.totalList.length;i++){
							str +="<tr>";
							str +="<th class='text-center'>"+(pagenum + i+1)+"</th>";
							str +="<td class='text-center'>"+data.totalList[i].type+"</td>";
							str +="<td><a href='/Notice/detail.do?nidx="+data.totalList[i].nidx+"' class='link-dark' style='text-decoration:none'>"+data.totalList[i].subject+"</a>";
									
							//파일 있을시 파일아이콘 제목옆에 붙음
							if(data.totalList[i].imgfile != null){
								str += "&nbsp; <i class='bi bi-file-earmark-arrow-down text-primary'></i>";
							}
							//이미지 있을 시 아이콘 붙음
							if(data.totalList[i].imges != null){
								str += "&nbsp; <i class='bi bi-image text-success'></i>";
							}
							
							str += "</td>";
							str +="<td class='text-center'>"+data.totalList[i].rdate+"</td>";
							str +="</tr>";
							
						}
						// 리뷰 div에 모든 내용 뿌려주기
						 $("#tbody_table").html(str);
						
						str2 +="<nav aria-label='Page navigation example'>";
						str2 +="<ul class='pagination justify-content-center'>";
						str2 +="<li class='page-item'>";
						str2 +="<a class='page-link' href='#' aria-label='Previous'>";
						str2 +="<span aria-hidden='true'>&laquo;</span>";
						str2 +="</a>";
						str2 +="</li>";
						
						if ((pm.startPage - 1) != 0){
					  	     str2 += "<a class='page-link' aria-label='Previous' onclick='list_fn("+prev+",\""+type+"\",\""+keyword+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
					  	 }
					  	 str2 += "</li>";
					  	 
					  	 for (let k = pm.startPage; k<=pm.endPage; k++ ){
					  		 if(page == k){
					  			str2 += "<li class='page-item active'><a class='page-link pointer' onclick='list_fn("+k+",\""+type+"\",\""+keyword+"\")'>"+k+"</a>";    
					  		 }else{
					  			str2 += "<li class='page-item'><a class='page-link pointer' onclick='list_fn("+k+",\""+type+"\",\""+keyword+"\")'>"+k+"</a>";    
					  		 }
					  	 }
					  	 
					  	 str2 += "<li class='page-item'>";
					  	
					  	 if(pm.endPage+1 && pm.endPage > 0){
					  	     str2 += "<a class='page-link' aria-label='Next' onclick='list_fn("+next+",\""+type+"\",\""+keyword+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
					  	 }
					  	 
					  	 str2 += "</li>";
					  	 str2 += "</ul>";
					  	 str2 += "</nav>";
						
					  	 // 리뷰 div에 네비게이션바 뿌려주기
					  	$("#nav_bar").html(str2);
						
					},error:function(){
						alert("리스트 불러오기 에러!")
					}
				}); 
			}	
		
		function searchword(){
			var keyword = document.getElementById("searchsomething").value;
			//console.log(keyword);
			list_fn(1,'T',keyword);			
		}
	</script>
</html>