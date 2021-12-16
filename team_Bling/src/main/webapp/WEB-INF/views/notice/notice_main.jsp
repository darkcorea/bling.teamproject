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
				
				<!-- 게시글 표 -->	
				<div id="notice_table">
					<table class='table'>
						<thead>
						<tr class='text-center'>
							<th scope='col' style='width:10%'>번호</th>
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
		if(page == null) {page=1};
		
		$(function(){
			list_fn(page);
		});
		
		function list_fn(page){
			$.ajax({
				url:"${cPath}/Notice/list.do",
				type:"POST",
				data:{"page":page},
				dataType: 'json',
				success:function(data){
					
					let pm = data.pm;
					let prev = parseInt(pm.startPage - 1);
				  	let next = parseInt(pm.endPage + 1);
				  	
				  	var page = data.page;
				  	var pagenum = (page-1) * 10;
				  	
				  	console.log(page);
				  	console.log(prev);
				  	console.log(next);
				  	
				  	let str = "";
				  	let str2 = "";
				  	
				  	//첫페이지 S 3개
				  	if(page ==1){
				  		console.log(page);
					  	for(let i=0;i<data.special.length;i++){
					  		
					  		str +="<tr bgcolor='#FFEDED'>";
							str +="<th class='text-center'>중요</th>";
							str +="<td><a href='/team_Bling/Notice/detail.do?nidx="+data.special[i].nidx+"' class='link-dark' style='text-decoration:none'>"+data.special[i].subject+"</a>";
									
							//파일 있을시 파일아이콘 제목옆에 붙음
							if(data.special[i].imgfile != null){
								str += "&nbsp; <i class='bi bi-file-earmark-arrow-down text-primary'></i>";
							}
							//이미지 있을 시 아이콘 붙음
							if(data.special[i].imges != null){
								str += "&nbsp; <i class='bi bi-image text-success'></i>";
							}
							
							str += "</td>";
							str +="<td class='text-center'>"+data.special[i].rdate.substring(0,10)+"</td>";
							str +="</tr>";
					  	}
						//첫페이지 S,N 7개
					  	for(let i=0;i<data.firstpage.length;i++){
					  		str +="<tr>";
							str +="<th class='text-center'>"+(i+1)+"</th>";
							str +="<td><a href='/team_Bling/Notice/detail.do?nidx="+data.firstpage[i].nidx+"' class='link-dark' style='text-decoration:none'>"+data.firstpage[i].subject+"</a>";
									
							//파일 있을시 파일아이콘 제목옆에 붙음
							if(data.firstpage[i].imgfile != null){
								str += "&nbsp; <i class='bi bi-file-earmark-arrow-down text-primary'></i>";
							}
							//이미지 있을 시 아이콘 붙음
							if(data.firstpage[i].imges != null){
								str += "&nbsp; <i class='bi bi-image text-success'></i>";
							}
							
							str += "</td>";
							str +="<td class='text-center'>"+data.firstpage[i].rdate.substring(0,10)+"</td>";
							str +="</tr>";
					  	}
						
						//내용삽입
					  	$("#tbody_table").html(str);
					  	
				  	}else{
				  		for(let i=0;i<data.totalList.length;i++){
				  			console.log(page);
							str +="<tr>";
							str +="<th class='text-center'>"+(pagenum + i-2)+"</th>";
							str +="<td><a href='/team_Bling/Notice/detail.do?nidx="+data.totalList[i].nidx+"' class='link-dark' style='text-decoration:none'>"+data.totalList[i].subject+"</a>";
									
							//파일 있을시 파일아이콘 제목옆에 붙음
							if(data.totalList[i].imgfile != null){
								str += "&nbsp; <i class='bi bi-file-earmark-arrow-down text-primary'></i>";
							}
							//이미지 있을 시 아이콘 붙음
							if(data.totalList[i].imges != null){
								str += "&nbsp; <i class='bi bi-image text-success'></i>";
							}
							
							str += "</td>";
							str +="<td class='text-center'>"+data.totalList[i].rdate.substring(0,10)+"</td>";
							str +="</tr>";
						}
				  		
				  		//내용삽입
					  	$("#tbody_table").html(str);
				  	}
				  	
				  	///네비게이션 바

				  	str2 +="<nav aria-label='Page navigation example'>";
					str2 +="<ul class='pagination justify-content-center'>";
					str2 +="<li class='page-item'>";
				  	
					if ((pm.startPage - 1) != 0){
				  	     str2 += "<a class='page-link' aria-label='Previous' onclick='list_fn("+prev+")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
				  	 }
				  	 str2 += "</li>";
			  		 for (let k = pm.startPage; k<=(pm.endPage+1); k++ ){
			  			 
				  		 if(page == k){
				  			str2 += "<li class='page-item active'><a class='page-link pointer' onclick='list_fn("+k+")'>"+k+"</a></li>";    
				  		 }else{
				  			str2 += "<li class='page-item'><a class='page-link pointer' onclick='list_fn("+k+")'>"+k+"</a></li>";    
				  		 }
				  	 }
				  	
				  	 str2 += "<li class='page-item'>";
				  	
				  	 if(pm.next && pm.endPage > 0){
				  	     str2 += "<a class='page-link' aria-label='Next' onclick='list_fn("+next+")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
				  	 }
				  	 
				  	str2 += "</li>";
				  	str2 += "</ul>";
				  	str2 += "</nav>";
				  	 
				 	//네비게이션바 삽입
					$("#nav_bar").html(str2);
				  	
					
				},error:function(){
					alert("리스트 불러오기 에러!")
				}
			}); 
		}	 
	
	</script>
</html>