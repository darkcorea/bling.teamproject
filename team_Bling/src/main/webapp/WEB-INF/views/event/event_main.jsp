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
		<title>이벤트</title>
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
			#option:hover{
				background-color: #FFEDED;
				cursor:pointer;
			}
			.link-dark{
				text-decoration-line:none;
			}
			.text-center{
				width:100%;
				position:relative;
				z-index:1;
				height:100%;
			}
			.spinner-border{
				display:block;
				position:fixed;
				top:calc(50%-(58px/2));
				right:calc(50%-(58px/2));
			}
		</style>
	</head>
	<body>
		
		<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><BR>
		</header><br>
	
	<!--여기서부터 본문-->
		<section>
			<div class="container margin15">
				<h1 class="text-center">이벤트</h1>
				<br>
				<!-- 이벤트 표 -->	
				<div id="event_table">
					<div class="text-center loading">
						<div class="spinner-border text-danger" role="status">
						  <span class="visually-hidden">Loading...</span>
						</div>
					</div>
				</div>
			
			</div>
			
			<footer>
				<%@ include file="/WEB-INF/views/footer.jsp" %>
			</footer>
		</section>	
	</body>
	
	<script>
		var page = 1;
		var types = 1;
			
			if(page == null) {page=1};
			if(types == null) {types=1};
		
		$(function(){
			list_fn(1,1);
		});
		
		function list_fn(page,types){
				$.ajax({
					url:"/Event/eventlist.do",
					type:"POST",
					data:{"page":page, "types":types},
					dataType: 'json',
					async:false,
					success:function(data){
						
						//let notice_list = data.totalList;
						let pm = data.pm;
						let prev = parseInt(pm.startPage - 1) ;
					  	let next = parseInt(pm.endPage + 1) ; 
					  	
					  	let str = "";
					  	
					  	//console.log(data.count_tot);
					  	
					  	//console.log("start"+pm.startPage);
					  	//console.log("end"+pm.endPage);
					  	
					  	
					  	str += "<hr />";
					  	if(types == 1){
					  		str += "<a onclick='list_fn(1,1);' id='option' style='background-color:#FFEDED'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}else if(types==2){
					  		str += "<a onclick='list_fn(1,1);' id='option'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option' style='background-color:#FFEDED'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}else if(types==3){
					  		str += "<a onclick='list_fn(1,1);' id='option'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option' style='background-color:#FFEDED'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}
					  	
					  	str += "<hr />";
					  	
						str += "<table class='table align-middle'>";
						str += "<tbody>";
						
						for(let i=0;i<data.totalList.length;i++){
							str +="<tr>";
							str +="<td scope='row'>";
							//사진
							str +="<td>";
							str +="<a href='/Event/detail.do?eidx="+data.totalList[i].eidx+"' class='link-dark'>"
							str +="<img src='/resources/event/"+data.totalList[i].banner+"' class='d-block w-100' style='height:256px;'>";
							str +="</a>"
							str +="</td>";
							//내용 3개
							str +="<td>";
							str +="<a href='/Event/detail.do?eidx="+data.totalList[i].eidx+"' class='link-dark'>"
							//제목
							str += "<p class='text-center fs-3'>"+data.totalList[i].subject+"</p>";
							//간단내용
							str +="<p class='fs-5'>"+data.totalList[i].contents+"</p>";
							//기간
							str +="<p class='text-end'>"+data.totalList[i].event_start.substring(0,10);
							str +="&nbsp ~ &nbsp";
							str +=data.totalList[i].event_end.substring(0,10)+"</p>";
							str +="</a>"
							str +="<br>";
							
							//str +="</a>";
							str +="</td>";
							
							str +="</tr>";
							
						} 
						
						str +="</tbody>";
						str +="</table>";
						
						str +="<br>";
						
						//네이게이션바
						str +="<nav aria-label='Page navigation example'>";
						str +="<ul class='pagination justify-content-center'>";
						str +="<li class='page-item'>";
						
						if ((pm.startPage - 1) != 0){
					  	     str += "<a class='page-link' aria-label='Previous' onclick='list_fn("+prev+",\""+data.types+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
					  	 }
					  	 str += "</li>";
					  	 
					  	 for (let k = pm.startPage; k<=pm.endPage; k++ ){
					  		 if(page == k){
					  			str += "<li class='page-item active'><a class='page-link pointer' onclick='list_fn("+k+",\""+data.types+"\")'>"+k+"</a></li>";    
					  		 }else{
					  			str += "<li class='page-item'><a class='page-link pointer' onclick='list_fn("+k+",\""+data.types+"\")'>"+k+"</a></li>";    
					  		 }
					  	 }
					  	 
					  	 str += "<li class='page-item'>";
					  	
					  	 if(pm.next && pm.endPage > 0){
					  	     str += "<a class='page-link' aria-label='Next' onclick='list_fn("+next+",\""+data.types+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
					  	 }
					  	 
					  	 str += "</li>";
					  	 str += "</ul>";
					  	 str += "</nav>";
						
						
						
					  	 // 리뷰 div에 모든 내용 뿌려주기
						 $("#event_table").html(str);
						
					},error:function(){
						alert("리스트 불러오기 에러!")
					}
				}); 
			}	
		
	
		
	</script>
</html>


















