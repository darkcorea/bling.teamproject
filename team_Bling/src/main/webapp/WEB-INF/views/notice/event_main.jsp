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
	
	<!--여기서부터 본문-->
		<div id="notice_contents">
			<h1 class="text-center">이벤트</h1>
			<br>
			<!-- 이벤트 표 -->	
			<div id="notice_table">
				
			</div>
		
		</div>
		
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>	
	</body>
	
	<script>
		var page = 0;
		var type = 0;
			
			if(page == null) {page=1};
			if(type == null) {type=1};
		
		$(function(){
			list_fn(page,type);
		});
		
		function list_fn(page,type){
				$.ajax({
					url:"/Ad_board/eventlist.do",
					type:"POST",
					data:{"page":page, "type":type},
					dataType: 'json',
					success:function(data){
						
						let notice_list = data.totalList;
						let pm = data.pm;
						let prev = parseInt(pm.startPage - 1) ;
					  	let next = parseInt(pm.endPage + 1) ;
					  	
					  	let str = "";
					  	
					  	console.log("start"+pm.startPage);
					  	console.log("end"+pm.endPage);
					  	
					  	
					  	str += "<hr />";
					  	str += "<a onclick='list_fn(1,1)'>전체"+data.sum+"</a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	str += "<a onclick='list_fn(1,2)'>진행중 이벤트"+data.sum+"</a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	str += "<a onclick='list_fn(1,3)'>종료된 이벤트"+data.sum+"</a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	
					  	
						str +="<table class='table'>";
						str +="<thead>";
						str +="<tr class='text-center'>";
						str +="<th scope='col'>배너</th>";
						str +="<th scope='col'>내용</th>";
						str +="</tr>";
						str +="</thead>";
						str +="<tbody>";
						
						for(let i=0;i<data.totalList.length;i++){
							str +="<tr height='400'>";
							str +="<td scope='row'>";
							//사진
							str +="<td>";
							str +="<a href='/Ad_board/detail.do?nidx="+data.totalList[i].nidx+"' class='link-dark'>"+data.totalList[i].subject+"</a>";
							str +="</td>";
							//내용 3개
							str +="<td>";
							str +="<a href='/Ad_board/detail.do?nidx="+data.totalList[i].nidx+"' class='link-dark'>"
							//제목
							str += data.totalList[i].subject;
							str +="<br>";
							//간단내용
							str +=data.totalList[i].contents;
							str +="<br>";
							//기간
							str +="이벤트 기간 :"
							str +=data.totalList[i].event_start;
							str +="&nbsp ~ &nbsp";
							str +=data.totalList[i].event_end;
							str +="<br>";
							
							str +="</a>";
							str +="</td>";
							
							str +="</tr>";
							
						}
						
						str +="</tbody>";
						str +="</table>";
						
						str +="<br>";
						
						str +="<nav aria-label='Page navigation example'>";
						str +="<ul class='pagination justify-content-center'>";
						str +="<li class='page-item'>";
						str +="<a class='page-link' href='#' aria-label='Previous'>";
						str +="<span aria-hidden='true'>&laquo;</span>";
						str +="</a>";
						str +="</li>";
						
						if ((pm.startPage - 1) != 0){
					  	     str += "<a class='page-link' aria-label='Previous' onclick='list_fn("+prev+",\""+type+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
					  	 }
					  	 str += "</li>";
					  	 
					  	 for (let k = pm.startPage; k<=pm.endPage; k++ ){
					  	 	str += "<li class='page-item'><a class='page-link pointer' onclick='list_fn("+k+",\""+type+"\")'>"+k+"</a>";      
					  	 }
					  	 
					  	 str += "<li class='page-item'>";
					  	
					  	 if(pm.endPage+1 && pm.endPage > 0){
					  	     str += "<a class='page-link' aria-label='Next' onclick='list_fn("+next+",\""+type+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
					  	 }
					  	 
					  	 str += "</li>";
					  	 str += "</ul>";
					  	 str += "</nav>";
						
					  	 // 리뷰 div에 모든 내용 뿌려주기
						 $("#notice_table").html(str);
						
					},error:function(){
						alert("리스트 불러오기 에러!")
					}
				}); 
			}	
		
	
		
	</script>
</html>


















