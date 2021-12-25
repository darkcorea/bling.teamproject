<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!--여기서부터 본문-->
		<div id="notice_contents">
			<h1 class="text-center">이벤트</h1>
			<br>
			<!-- 이벤트 표 -->	
			<div id="notice_table">
				
			</div>
		
			<!-- 게시글 등록/삭제 -->
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button type="button" class="btn btn-outline-primary D" onclick="location.href='/team_Bling/Ad_board/event_regist.do'">등록</button>
				<button type="button" class="btn btn-outline-danger D" onclick="deleteArry()">삭제</button>
			</div>
		
			<br>
		</div>
	</body>
	
	<script>
		var page = 1;
		var types = 1;
			
			if(page == null) {page=1};
			if(types == null) {types=1};
		
		$(function(){
			list_fn(1,1);
			disabled();
		});
		
		function list_fn(page,types){
				$.ajax({
					url:"/team_Bling/Ad_board/eventlist.do",
					type:"POST",
					data:{"page":page, "types":types},
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
					  	if(types == 1){
					  		str += "<a onclick='list_fn(1,1);' id='option' style='background-color:#FFEDED'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option' style='cursor:pointer;'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option' style='cursor:pointer;'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}else if(types==2){
					  		str += "<a onclick='list_fn(1,1);' id='option' style='cursor:pointer;'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option' style='background-color:#FFEDED'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option' style='cursor:pointer;'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}else if(types==3){
					  		str += "<a onclick='list_fn(1,1);' id='option' style='cursor:pointer;'>전체 ("+data.count_tot+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,2);' id='option' style='cursor:pointer;'>진행중 이벤트 ("+data.count_ing+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
						  	str += "<a onclick='list_fn(1,3);' id='option' style='background-color:#FFEDED'>종료된 이벤트 ("+data.count_end+") </a> &nbsp;&nbsp; | &nbsp;&nbsp; ";
					  	}
					  	str += "<hr />";
					  	
					  	str += "<table class='table align-middle'>";
						str +="<thead>";
						str +="<tr class='text-center'>";
						str +="<th scope='col' style='width:5%'>삭제</th>";
						str +="<th scope='col'>배너</th>";
						str +="<th scope='col'>내용</th>";
						str +="</tr>";
						str +="</thead>";
						str +="<tbody>";
						
						for(let i=0;i<data.totalList.length;i++){
							str +="<tr height='250'>";
							str +="<td scope='row'>";
							//삭제버튼
							str +="<div class='form-check'>";
							str +="<input class='form-check-input' type='checkbox' value='"+data.totalList[i].eidx+"' id='flexCheckDefault' name='checkname'>";
							str +="</div>";
							str +="</td>";
							//사진
							str +="<td>";
							str +="<a href='/team_Bling/Ad_board/eventdetail.do?eidx="+data.totalList[i].eidx+"' class='link-dark'>"
							str +="<img src='/team_Bling/resources/event/"+data.totalList[i].banner+"' class='d-block w-100' style='height:200px;'>";
							str +="</a>"
							str +="</td>";
							//내용 3개
							str +="<td>";
							str +="<a href='/team_Bling/Ad_board/eventdetail.do?eidx="+data.totalList[i].eidx+"' class='link-dark'>"
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
						 $("#notice_table").html(str);
						
					},error:function(){
						alert("리스트 불러오기 에러!")
					}
				}); 
			}	
		
		
		
		//글 삭제
		function deleteArry(){
			alert("정말로 삭제하시겠습니까?");
			var checkbox = [];
			$("input:checkbox[name='checkname']:checked").each(function(){
				checkbox.push($(this).val());
				//console.log(checkbox);
			})
			
			$.ajax({
				type:"POST",
				url:"/team_Bling/Ad_board/deleteArryEvent.do",
				data:{"checkbox":checkbox},
				success:function(){
					location.reload();
				},error:function(){
					alert("글 지우기 에러!")
				}
			});
		} 
		
		
	</script>
</html>


















