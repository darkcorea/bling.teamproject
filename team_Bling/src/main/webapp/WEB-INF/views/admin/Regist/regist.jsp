<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 상품 등록</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

<style>
	section {
		max-width:1008px;
		margin:  0px auto;
		display: block;
	}

	.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
	.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
	.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
	.quickmenu ul li a:hover {color:#000;}
	.quickmenu ul li:last-child {border-bottom:0;}
	
	.t {background-color:#cb7878;}
	
	.d1 {margin-left:30px;
		margin-top:30px;
		margin-bottom:40px;
		}
		
	/* 경고 문구 */	
	.warning {
		font-size:12px;
		color:red;
	}
	
	/* 제목 */
	.title {
		font-size:1.75rem;
		font-weight:500;
	}
	
	/* 글씨체 두껍게*/
	.bold {
		font-weight:bold;
	}
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	

<section>
	
	<div class="container d1">
		<!-- 옆 nav 바 -->	
		<div class="quickmenu">
			  <ul>
			    <li><a href="/Ad_regist/list.do?page=1">리스트</a></li>
			    <li><a href="/Ad_regist/regist.do">상품 등록</a></li>
			    <li><a href="#">품절상품</a></li> 
			  </ul>
		</div>
		
		<!-- 상품등록들과 관련된  -->
		<div class="d2">
			<!-- 상품등록  -->
			<h2>상품 등록</h2><br>
			<form name="frm">
				<table style="width:700px;height:150px">
					<tr>
						<th width="100px">상품 이름 : </th>
						<td width="300px"><input type="text" name="pname" size="23"></td>
						<th  width="100px">상품 종류 : </th>
						<td  width="200px">
							<select name="kind">
								<option value="R">반지</option>
								<option value="E">귀걸이</option>
								<option value="B">팔찌</option>
								<option value="N">목걸이</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품 가격 : </th>
						<td><input type="number" name="price" id="price"> 원</td>
						<th>할 인 율 : </th>
						<td><input type="number" name="discount" id="discount" style="width:60px">%</td>
					</tr>
					<tr>
						<th>할인 가격 : </th>
						<td><input type="number" name="saleprice" id="saleprice"> 원</td>
					</tr>	
				</table>
			<div style="text-align:center;width:700px">		
		 		<p><br><button type="button" class="btn btn-secondary t" onclick="insertPro(this.form)">저장</button></p>
			</div>
			</form>
			
			<!-- 옵션 등록 -->
			<h3>옵션1</h3>
			<form name="frm1" id="frm1">
				<br>
				<table style="width:700px;height:150px">
					<tr class="change">
						<th>색상 : </th>
						<td><label><input type="radio" name="color" value="골드" class="color_frm1">골드</label>
						<label><input type="radio" name="color" value="핑크골드" class="color_frm1">핑크골드</label></td>
						<th>재질 : </th>
						<td><label><input type="radio" name="texture" value="14k" class="texture_frm1">14k</label>
						<label><input type="radio" name="texture" value="18k" class="texture_frm1">18k</label></td>
						<th>사이즈 : </th>
						<td><label><input type="radio" name="sizes" value="소" class="size_frm1">소</label>
		      			<label><input type="radio" name="sizes" value="중"  class="size_frm1">중</label>
						<label><input type="radio" name="sizes" value="대"  class="size_frm1">대</label></td>
					</tr>	
					<tr>
						<th>추가 가격 : </th>
						<td colspan="3"><input type="number" name="addprice" size="13" class="addprice_frm1">  원</td>
						<th>재고 수량 : </th>
						<td><input type="number" name="stock" size="8" id="stock_frm1"></td>
					</tr>
					<tr>
						<th>옵션 이름 : </th>
						<td colspan="5"><input type="text" name="oname" id="result_frm1" size="35"></td>
					</tr>
					<tr>
						<th>제품 번호 : </th>
						<td colspan="3"><input type="number" name="pidx" class="pidx" size="35" id="pidx_frm1"></td>
					</tr>
				</table>
			</form>
			
			<div style="text-align:center;width:700px">
			<button class="btn btn-secondary" onclick="select_fn('frm1')">선택</button>
			<button onclick="insertOpt('frm1')" class="t btn btn-secondary">저장</button><br><br>
			</div>
			
			<!-- 옵션 등록 -->
			<h3>옵션2</h3>
			<form name="frm2" id="frm2">
				<br>
				<table style="width:700px;height:150px">
					<tr>
						<th>색상 : </th>
						<td><label><input type="radio" name="color" value="골드" class="color_frm2">골드</label>
						<label><input type="radio" name="color" value="핑크골드"  class="color_frm2">핑크골드</label></td>
						<th>재질 : </th>
						<td><label><input type="radio" name="texture" value="14k" class="texture_frm2">14k</label>
						<label><input type="radio" name="texture" value="18k" class="texture_frm2">18k</label></td>
						<th>사이즈 : </th>
						<td><label><input type="radio" name="sizes" value="소" class="size_frm2">소</label>
		      			<label><input type="radio" name="sizes" value="중"  class="size_frm2">중</label>
						<label><input type="radio" name="sizes" value="대"  class="size_frm2">대</label></td>
					</tr>	
					<tr>
						<th>추가 가격 : </th>
						<td colspan="3"><input type="number" name="addprice" size="13" class="addprice_frm2"> 원</td>
						<th>재고 수량 : </th>
						<td><input type="number" name="stock" size="8" id="stock_frm2"></td>
					</tr>
					<tr>
						<th>옵션 이름 : </th>
						<td colspan="5"><input type="text" name="oname" id="result_frm2" size="35"></td>
					</tr>
					<tr>
						<th>제품 번호 : </th>
						<td colspan="3"><input type="number" name="pidx" class="pidx" size="35" id="pidx_frm2"></td>
					</tr>
				</table>
			</form>
			
			<div style="text-align:center;width:700px">
				<button class="btn btn-secondary" onclick="select_fn('frm2')">선택</button>
				<button onclick="insertOpt('frm2')" class="btn btn-secondary t">저장</button>
			</div>
			
			<!-- 옵션 등록 -->
			<h3>옵션3</h3>
			<form name="frm3" id="frm3">
				<br>
				<table style="width:700px;height:150px">
					<tr>
						<th>색상 : </th>
						<td><label><input type="radio" name="color" value="골드" class="color_frm3">골드</label>
						<label><input type="radio" name="color" value="핑크골드"  class="color_frm3">핑크골드</label></td>
						<th>재질 : </th>
						<td><label><input type="radio" name="texture" value="14k" class="texture_frm3">14k</label>
						<label><input type="radio" name="texture" value="18k" class="texture_frm3">18k</label></td>
						<th>사이즈 : </th>
						<td><label><input type="radio" name="sizes" value="소" class="size_frm3">소</label>
		      			<label><input type="radio" name="sizes" value="중"  class="size_frm3">중</label>
						<label><input type="radio" name="sizes" value="대"  class="size_frm3">대</label></td>
					</tr>	
					<tr>
						<th>추가 가격 : </th>
						<td colspan="3"><input type="number" name="addprice" size="13" class="addprice_frm3"> 원</td>
						<th>재고 수량 : </th>
						<td><input type="number" name="stock" size="8" id="stock_frm3"></td>
					</tr>
					<tr>
						<th>옵션 이름 : </th>
						<td colspan="5"><input type="text" name="oname" id="result_frm3" size="35"></td>
					</tr>
					<tr>
						<th>제품 번호 : </th>
						<td colspan="3"><input type="number" name="pidx" class="pidx" size="35" id="pidx_frm3"></td>
					</tr>
				</table>
			</form>
			
			<div style="text-align:center;width:700px">
				<button class="btn btn-secondary" onclick="select_fn('frm3')">선택</button>
				<button onclick="insertOpt('frm3')" class="btn btn-secondary t">저장</button>
			</div>
			

			
			<!-- 이미지 등록 -->
			<br><br>
			<form name="iamge_fn1" action="/Ad_regist/insertImg.do" method="post" enctype="multipart/form-data">
				<span class="title">이미지 </span><span class="warning"> *사진을 순서에 맞에 넣어주세요.</span>
				<br><br>
				<div>
					제품 번호 : <input type="number" name="pidx" class="pidx">
				</div><br>
				<div class="mb-3">
  					<label class="form-label bold">메인 이미지
				 	<input class="form-control" type="file" name="main" accept="image/*"></label>
				</div>
				<div class="mb-3">
  					<label class="form-label bold">상세 이미지1
				 	<input class="form-control" type="file" name="detail1" accept="image/*"></label>
				 	<input id="detail_add" type="button" value="파일 추가" onclick="plusFn()" class="btn btn-secondary">
				</div>
				<div id="result"></div>
				<div class="mb-3">
  					<label class="form-label bold">설명 이미지1
				 	<input class="form-control" type="file" name="showing1" accept="image/*"></label>
					<input id="showing_add" type="button" value="파일 추가" onclick="plusFn2()" class="btn btn-secondary">
				</div>
				<div id="result2"></div>
				<div style="text-align:center;width:700px">
				<button type="button" class="btn btn-secondary t" onclick="iamge_fn(this.form)">등록</button>
				</div>
			</form>	
		</div>
	</div>	
</section>

</body>

<script>
$(document).ready(function () {
	
	/* 할인가격 자동 계산 */
	 $( "#discount" ).blur(function(){
	        var price = $("#price").val();
	        var discount = $("#discount").val();
	        // 할인가격 반올림해서 정수로 나오게 하기
	        var saleprice = Math.round(price*((100-discount)/100));
	        if(price == ""){
	            $('#saleprice').val("0");
	        }else{
	            $('#saleprice').val(saleprice);
	        }    
	    });

    
    /*NAV바에 관한 스크롤 옵션*/
    var currentPosition = parseInt($(".quickmenu").css("top")); 
    $(window).scroll(function() {
    	var position = $(window).scrollTop(); 
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000); 
    });
    
    
    
  });
 
 
/* 삼품 등록 버튼을 눌렀을 때  에이작스*/
function insertPro(form){
	
	// 유효성 검사
	if(form.pname.value == ""){
		alert("제품명을 입력하세요.");
		form.pname.focus();
	}else if(form.price.value == ""){
		alert("가격을 입력하세요.");
		form.price.focus();
		
	}else if(form.discount.value == ""){
		alert("할인율을 입력하세요.");
		form.discount.focus();
		
	}else if(form.saleprice.value == ""){
		alert("할인 가격을 입력하세요.");
		form.saleprice.focus();
	}else{
		
		// 유효성 검사가 끝나면 에이작스
		let formData = $("form[name=frm]").serialize();
			$.ajax({
				cache:false,
				url:"/Ad_regist/registPro.do",
				type:"POST",
				data:formData,
				ContentType:"application/json",
				success:function(data){
				alert("제품을 등록하였습니다. 옵션을 입력해 주세요");
				// 옵션과 이미지에 제품번호 추가
				for(let i = 0; i<12; i++){
					document.getElementsByClassName("pidx")[i].value=data;
				}
				},
				error:function(){
					alert("제품 등록 오류");
				}
			});
	}
	
}


/* 옵션에 대한 값을 입력하고 선택을 누르면 옵션이름이 자동으로 나옴*/
function select_fn(type){
	 let radioVal = $(".color_"+type+":checked").val();
	 radioVal += " ";
     radioVal += $(".size_"+type+":checked").val();
     radioVal += " ";
     radioVal += $(".texture_"+type+":checked").val();
     radioVal += " ";
     radioVal += "+";
     radioVal += $(".addprice_"+type).val();
     radioVal += "원 ";
     
     document.getElementById("result_"+type).value=radioVal;
     
     let stock = $("#stock_"+type).val();
     if(stock == 0){
    	 $("#stock_"+type).val(99999);
     }
	
}


/* 옵션  등록 버튼을 눌렀을 떄 에이작스 */
function insertOpt(type){

	 var formData = $("form[name="+type+"]").serialize();
		$.ajax({
			cache:false,
			url:"/Ad_regist/insertOpt.do",
			type:"POST",
			data:formData,
			ContentType:"application/json",
			success:function(data){
			  alert("저장되었습니다");
			  // 폼 리셋
			  $("#"+type)[0].reset();
			},
			error:function(){
				alert("옵션 등록 오류. 입력값을 전부 입력해 주세요");
			}
		});
	}


/* 상세이미지 파일 추가 버튼을 눌렀을 떄*/
function plusFn(){
	var str = "";
	for(i=2;i<4;i++){
	str += "<div class='mb-3'><label class='form-label'>상세 이미지"+i;
	str += "<input accept='image/*' class='form-control' type='file' name='detail"+i+"'></label>";
	str += "</div>";
	}
	 $("#result").append(str);
	 $("#detail_add").hide();
}


/* 설명이미지 파일 추가 버튼을 눌렀을 떄*/
function plusFn2(){
	var str = "";
	for(i=2;i<6;i++){
		str += "<div class='mb-3'><label class='form-label'>설명 이미지"+i;
		str += "<input accept='image/*' class='form-control' type='file' name='showing"+i+"'></label>";
		str += "</div>";
	}
	 $("#result2").append(str);
	 $("#showing_add").hide();
}

/* 이미지 등록 버튼을 눌렀을 때 폼태그 */
function iamge_fn(form){
	
	let iform = document.iamge_fn1;
	
	if(form.pidx.value == ""){
		alert("제품번호를 입력하세요.");
		form.pidx.focus();
		return;
	}
	if(form.main.value == ""){
		alert("메인 이미지를 등록하세요.");
		form.main.focus();
		return;
	}
	if(form.showing1.value == ""){
		alert("설명이미지를 등록하세요.");
		form.showing1.focus();
		return;
	}
	alert("제품 이미지들이 등록되었습니다.");
	iform.submit();
}


</script>
</html>