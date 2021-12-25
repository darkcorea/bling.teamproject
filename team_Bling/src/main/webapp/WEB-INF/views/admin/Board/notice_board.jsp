<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content ="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>공지사항관리</title>
		</head>
	<body>
		
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	
	<!--여기서부터 본문-->
		<div id="notice_contents">
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
						<th scope='col' style='width:5%'>삭제</th>
						<th scope='col' style='width:5%'>번호</th>
						<th scope='col' style='width:15%'>
					
						<select class='form-select form-select-sm' aria-label='Default select example' id='type' onchange='changeselect()'>
						
							<option selected>타입</option>
							<option value='N'>기본공지사항(N)</option>
							<option value='S'>중요공지사항(S)</option>
							<option value='Q'>고객센터(Q)</option>
							<option value='T'>전체(T)</option>
						
						</select>
						
						</th>
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
		
			<!-- 게시글 등록/삭제 -->
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button type="button" class="btn btn-outline-primary D" onclick="location.href='/team_Bling/Ad_board/regist.do'">등록</button>
				<button type="button" class="btn btn-outline-danger D" onclick="deleteArry()">삭제</button>
			</div>
		
			<br>
		</div>
	</body>
	
	<script>
		var page = 1;
		var type = null;
			
		if(page == null) {page=1};
		if(type == null) {type="T"};
		
		$(function(){
			list_fn(page,type);
			disabled();
		});
		
		
		function list_fn(page,type,keyword){
				$.ajax({
					url:"/team_Bling/Ad_board/list.do",
					type:"POST",
					data:{"page":page, "type":type,"keyword":keyword},
					dataType: 'json',
					success:function(data){
						
						let notice_list = data.totalList;
						let pm = data.pm;
						let prev = parseInt(pm.startPage - 1) ;
					  	let next = parseInt(pm.endPage + 1) ;
					  	
					  	var keyword = document.getElementById("searchsomething").value;
					  	var page = data.page;
					  	var pagenum = (page-1) * 10;
					  	
					  	let str = "";
					  	let str2 = "";
					  	
					  	console.log("///////////"+data.totalList);
					  	
						if(data.totalList == ""){
							str += "<tr><td colspan='5'><h2 class='text-center'>검색 결과가 없습니다.</h2></td></tr>";
							 $("#tbody_table").html(str);
						}else{
							
						  	
						  	console.log("start"+pm.startPage);
						  	console.log("end"+pm.endPage);
						  	console.log("!!!!!!!"+data.totalList[0].imgfile);
						  	
							for(let i=0;i<data.totalList.length;i++){
								str +="<tr>";
								str +="<td scope='row'>";
								str +="<div class='form-check'>";
								str +="<input class='form-check-input' type='checkbox' value='"+data.totalList[i].nidx+"' id='flexCheckDefault' name='checkname'>";
								str +="</div>";
								str +="</td>";
								str +="<th class='text-center'>"+(pagenum + i+1)+"</th>";
								str +="<td class='text-center'>"+data.totalList[i].type+"</td>";
								str +="<td><a href='/team_Bling/Ad_board/detail.do?nidx="+data.totalList[i].nidx+"' class='link-dark'>"+data.totalList[i].subject+"</a>";
										
								//파일 있을시 파일아이콘 제목옆에 붙음
								if(data.totalList[i].imgfile != null){
									str += "&nbsp; <i class='bi bi-file-earmark-arrow-down text-primary'></i>";
								}
								//이미지 있을 시 아이콘 붙음
								if(data.totalList[i].imges != null){
									if(data.totalList[i].imges != 0){
										str += "&nbsp; <i class='bi bi-image text-success'></i>";
									}
								}
								
								str += "</td>";
								str +="<td class='text-center'>"+data.totalList[i].rdate+"</td>";
								str +="</tr>";
								
							}
							// div에 모든 내용 삽입
							 $("#tbody_table").html(str);
							
							str2 +="<nav aria-label='Page navigation example'>";
							str2 +="<ul class='pagination justify-content-center'>";
							str2 +="<li class='page-item'>";
							
							if ((pm.startPage - 1) != 0){
						  	     str2 += "<a class='page-link' aria-label='Previous' onclick='list_fn("+prev+",\""+type+"\",\""+keyword+"\")'><span aria-hidden='true' class='pointer' >&laquo;</span></a>";
						  	 }
						  	 str2 += "</li>";
						  	 
						  	 for (let k = pm.startPage; k<=pm.endPage; k++ ){
						  		 if(page == k){
						  			str2 += "<li class='page-item active'><a class='page-link pointer' onclick='list_fn("+k+",\""+type+"\",\""+keyword+"\")'>"+k+"</a></li>";    
						  		 }else{
						  			str2 += "<li class='page-item'><a class='page-link pointer' onclick='list_fn("+k+",\""+type+"\",\""+keyword+"\")'>"+k+"</a></li>";    
						  		 }
						  	 }
						  	 
						  	 str2 += "<li class='page-item'>";
						  	
						  	 if(pm.next && pm.endPage > 0){
						  	     str2 += "<a class='page-link' aria-label='Next' onclick='list_fn("+next+",\""+type+"\",\""+keyword+"\")'><span aria-hidden='true' class='pointer'>&raquo;</span></a>";
						  	 }
						  	 
						  	 str2 += "</li>";
						  	 str2 += "</ul>";
						  	 str2 += "</nav>";
							
						  	//네비게이션바 삽입
						  	$("#nav_bar").html(str2);
						}
						
					},error:function(){
						alert("리스트 불러오기 에러!")
					}
				}); 
			}	
		
		// 타입 변경
		function changeselect(){
			var selectid = document.getElementById("type");
			var selectvalue = selectid.options[selectid.selectedIndex].value;
			
			//console.log(selectvalue);
			
			list_fn(1,selectvalue);
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
				url:"/team_Bling/Ad_board/deleteArry.do",
				data:{"checkbox":checkbox},
				success:function(){
					location.reload();
				},error:function(){
					alert("글 지우기 에러!")
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


















