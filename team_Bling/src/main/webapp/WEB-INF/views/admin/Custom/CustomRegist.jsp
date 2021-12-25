<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content ="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>커스텀 추가</title>
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="/team_Bling/js/summernote/summernote-lite.js"></script>
		<script src="/team_Bling/js/summernote/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="/team_Bling/css/summernote/summernote-lite.css">
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
		
	<!-- 이벤트 등록 -->
	
		<h2 class="text-center">커스텀 재료 추가</h2> <br>
	
		<form method="post" action="/team_Bling/Ad_regist/customregist.do" id="frm_write" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th class="head" width="100px">이름</th>
					<td >
						<input type="text" name="name" id="name" style="width:300px ; height:30px">
					</td>
				</tr>
				<tr>
					<th class="head" width="100px">kind</th>
					<td>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="kind" id="kind1" value="1" checked>
						  <label class="form-check-label" for="kind">
						    	목걸이 
						  </label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="head" width="100px">type</th>
					<td >
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="type" value="1" id="type1">
						  <label class="form-check-label" for="type">
						    	체인
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="type" value="2" id="type2">
						  <label class="form-check-label" for="type">
						    	고리
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="type" value="3" id="type3" checked>
						  <label class="form-check-label" for="type">
						    	장식
						  </label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="head" width="100px">사진</th>
					<td >
						<div class="mb-3">
		  					<label class="form-label bold">메인 이미지
						 	<input class="form-control D" type="file" name="customimg" accept="image/*"></label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="head" width="100px">가격</th>
					<td >
						<input type="text" name="price" id="price" style="width:300px ; height:30px">
					</td>
				</tr>
			</table>
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			   <input type="submit" class="btn btn-primary D" value="등록하기">
			  <button class="btn btn-outline-secondary D" type="button" onclick="location.href='/team_Bling/Ad_regist/custom_list.do?page=1&kind=0&type=0'">취소하기</button>
			</div>
			
			<br>
            <br>
            <br>
		</form>
	</body>
	
	<script>
		$("form").submit(function(){
			var check = true;
			var type = $('input:radio[name=type]').is(':checked');
			if(type == false){
				alert("type을 선택해주세요.");
				check = false;
			}else if($("#name").val() == null || $("#name").val() == ""){
				alert("이름을 적어주세요");
				check = false;
			}else if($("#price").val() == null || $("#price").val() == ""){
				alert("가격을 적어주세요");
				check = false;
			}else if($("#customimg").val() == null || $("#customimg").val() == ""){
				alert("사진을 올려주세요");
				check = false;
			}
			return check;
		});
		
		$(function(){
			disabled();
		});
	</script>
</html>