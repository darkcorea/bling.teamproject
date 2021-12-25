<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 상품 수정</title>

<style>
	section {
		max-width:1008px;
		margin:  0px auto;
		display: block;
	}
	
	/* 버튼 */
	.t {background-color:#cb7878;}
	
	/* 이미지 버튼 */
	.t1 {
		background-color:#cb7878;
		height:30px;
		width:50px;
		padding:0px;
		margin-top:5px;
		font-size:13px;
	}
	
	/* 클래스 넣으면 빨간 글씨 */
	.red {
		color:red;
	}
	
	/* 제목 */
	.title {
		font-size:1.75rem;
		font-weight:500;
	}
	
	/* 가상요소 부여하여  float: left 해제*/
	#image1:after, #showing-image:after{
	 	display:block;
	 	clear:both;
	 	content:"";
	 }
	 
	 /* 상품 이미지들 */
	.image2 {
		width: 100px;
		height: 100px;
		float: left;
		margin: 5px;
	}
	
	/* 상품설명 이미지들 */
	.image3 {
		width: 300px;
		float: left;
		margin: 10px;
	}
	
	/* 글씨체 두껍게*/
	.bold {
		font-weight:bold;
	}
	
	.center {
		text-align:center;
	}
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
	

<section>
	
	<div class="container">

		<!-- 상품수정 테이블 -->
		<h2>상품 수정</h2><br>
			<form name="frm">
				<table style="width:700px;height:150px">
					<tr>
						<th width="100px">상품 이름 : </th>
						<td width="300px">
							<input type="text" name="pname" size="23" id="panme" value="${product.pname}">
							<input type="hidden" name="pidx" value="${product.pidx}">
						</td>
						<th width="100px">상품 종류 : </th>
						<td width="200px">
							<select name="kind" id="kind">
								<option value="R">반지</option>
								<option value="E">귀걸이</option>
								<option value="B">팔찌</option>
								<option value="N">목걸이</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품 가격 : </th>
						<td><input type="number" name="price" id="price" value="${product.price}"> 원</td>
						<th>할 인 율 : </th>
						<td><input type="number" name="discount" id="discount" style="width:60px" value="${product.discount}">%</td>
					</tr>
					<tr>
						<th>할인 가격 : </th>
						<td><input type="number" name="saleprice" id="saleprice" value="${product.saleprice}"> 원</td>
						<th>판매 유무 : </th>
						<td>
							<select name="saleyn" id="saleyn">
							<c:if test="${product.saleyn == 'Y' }">
								<option value="Y" selected>판매</option>
								<option value="N" class="red">판매중지</option>
							</c:if>
							<c:if test="${product.saleyn == 'N' }">
								<option value="Y">판매</option>
								<option value="N" class="red" selected>판매중지</option>
							</c:if>
							</select>
						</td>
					</tr>	
				</table>
			<div style="text-align:center;width:700px">		
		 		<p><br><button type="button" class="btn btn-secondary t D" onclick="updatePro(this.form)">상품수정</button></p>
			</div>
			</form>
			
			<!-- 옵션 수정 테이블 -->
			<c:set var="obnum" value="1"/>
			<c:forEach items="${oblist}" var="oblist">
			<div id="frm${obnum}">
				<span class="title">옵션<c:out value="${obnum}"/></span>&ensp;&ensp;
				<c:if test="${oblist.stock  == 0}">
				<span class="red">*재고가 없습니다.</span>
				</c:if>
				<c:if test="${oblist.stock > 0 and oblist.stock < 30 }">
				<span class="red">*재고가 부족합니다.</span>
				</c:if>
				<br><br>
				<form name="frm${obnum}">
					<br>
					<table style="width:700px;height:150px">
						<tr class="change">
							<th>색상 : </th>
							<td>
							<c:if test="${oblist.color == '골드'}">
							<label><input type="radio" name="color" value="골드" class="color_frm${obnum}" checked>골드</label>
							<label><input type="radio" name="color" value="핑크골드" class="color_frm${obnum}">핑크골드</label>
							</c:if>
							<c:if test="${oblist.color == '핑크골드'}">
							<label><input type="radio" name="color" value="골드" class="color_frm${obnum}">골드</label>
							<label><input type="radio" name="color" value="핑크골드" class="color_frm${obnum}" checked>핑크골드</label>
							</c:if>
							</td>
							
							<th>재질 : </th>
							<td>
							<c:if test="${oblist.texture == '14k'}">
							<label><input type="radio" name="texture" value="14k" class="texture_frm${obnum}" checked>14k</label>
							<label><input type="radio" name="texture" value="18k" class="texture_frm${obnum}">18k</label>
							</c:if>
							<c:if test="${oblist.texture == '18k'}">
							<label><input type="radio" name="texture" value="14k" class="texture_frm${obnum}">14k</label>
							<label><input type="radio" name="texture" value="18k" class="texture_frm${obnum}" checked>18k</label>
							</c:if>
							</td>
							
							<th>사이즈 : </th>
							<td>
							<c:if test="${oblist.sizes == '소'}">
							<label><input type="radio" name="sizes" value="소" class="size_frm${obnum}" checked>소</label>
			      			<label><input type="radio" name="sizes" value="중"  class="size_frm${obnum}">중</label>
							<label><input type="radio" name="sizes" value="대"  class="size_frm${obnum}">대</label>
							</c:if>
							<c:if test="${oblist.sizes == '중'}">
							<label><input type="radio" name="sizes" value="소" class="size_frm${obnum}">소</label>
			      			<label><input type="radio" name="sizes" value="중"  class="size_frm${obnum}" checked>중</label>
							<label><input type="radio" name="sizes" value="대"  class="size_frm${obnum}">대</label>
							</c:if>
							<c:if test="${oblist.sizes == '대'}">
							<label><input type="radio" name="sizes" value="소" class="size_frm${obnum}">소</label>
			      			<label><input type="radio" name="sizes" value="중"  class="size_frm${obnum}">중</label>
							<label><input type="radio" name="sizes" value="대"  class="size_frm${obnum}" checked>대</label>
							</c:if>
							</td>
						</tr>	
						<tr>
							<th>추가 가격 : </th>
							<td colspan="3">
							<input type="number" name="addprice" size="13" class="addprice_frm${obnum}" value="${oblist.addprice}">  원
							</td>
							<th>재고 수량 : </th>
							<td><input type="number" name="stock" size="8" value="${oblist.stock}"></td>
						</tr>
						<tr>
							<th>옵션 이름 : </th>
							<td colspan="3">
							<input type="text" name="oname" id="result_frm${obnum}" size="35"  value="${oblist.oname}">
							<input type="hidden" name="oidx" value="${oblist.oidx}">
							</td>
							<th>판매 유무 : </th>
							<td>
							<select name="saleyn" id="saleyn">
							<c:if test="${oblist.saleyn == 'Y' }">
								<option value="Y" selected>판매</option>
								<option value="N" class="red">판매중지</option>
							</c:if>
							<c:if test="${oblist.saleyn == 'N' }">
								<option value="Y">판매</option>
								<option value="N" class="red" selected>판매중지</option>
							</c:if>
							</select>
							</td>
						</tr>
					</table>
				</form>
				
				<div style="text-align:center;width:700px">
				<button class="btn btn-secondary" onclick="select_fn('frm${obnum}')">선택</button>&ensp;
				<button onclick="updateOpt('frm${obnum}')" class="t btn btn-secondary D">옵션수정</button>&ensp;&ensp;
				<button onclick="deleteOpt('frm${obnum}', '${oblist.oidx}')" class="btn btn-secondary D">옵션삭제</button><br><br>
				</div>
			<c:set var="obnum" value="${obnum + 1}"/>	
			</div>
			</c:forEach><br><br>
			
			<!-- 사진 수정 테이블 -->
			<h2>제품 이미지 수정</h2><br>
			<div id="image">
				
				<!-- 이미지들 보여주고 삭제 -->
				<h4>제품 이미지들</h4>
				<div id="image1">
					<img src="/team_Bling/resources/image/${image.main}" class="img-thumbnail image2" id="image-main" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기  main">
					<c:if test="${image.detail1 ne null}">
						<div class="image2 center" id="detail1">
						<img src="/team_Bling/resources/image/${image.detail1}" class="img-thumbnail" id="detail1" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기  detail1">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('detail1','${image.detail1}')">삭제</button>
						</div>					
					</c:if>
					<c:if test="${image.detail2 ne null}">
						<div class="image2 center" id="detail2">
						<img src="/team_Bling/resources/image/${image.detail2}" class="img-thumbnail" id="detail1" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기  detail2">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('detail2','${image.detail2}')">삭제</button>
						</div>
						</c:if>
					<c:if test="${image.detail3 ne null}">
						<div class="image2 center" id="detail3">
						<img src="/team_Bling/resources/image/${image.detail3}" class="img-thumbnail" id="detail1" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기  detail3">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('detail3','${image.detail3}')">삭제</button>
						</div>	
					</c:if>
				</div>
				<br><br>
				<h4>상품 설명 이미지들</h4>
				<div id="showing-image">
					<img src="/team_Bling/resources/simage/${image.showing1}" class="img-thumbnail image3" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기 showing1">
					<c:if test="${image.showing2 ne null}">
						<div class="image3 center" id="showing2">
						<img src="/team_Bling/resources/simage/${image.showing2}" class="img-thumbnail image3" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기 showing2">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('showing2','${image.showing2}')">삭제</button>
						</div>
					</c:if>
					<c:if test="${image.showing3 ne null}">
						<div class="image3 center" id="showing3">
						<img src="/team_Bling/resources/simage/${image.showing3}" class="img-thumbnail image3" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기 showing3">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('showing3','${image.showing3}')">삭제</button>
						</div>
					</c:if>
					<c:if test="${image.showing4 ne null}">
						<div class="image3 center" id="showing4">
						<img src="/team_Bling/resources/simage/${image.showing4}" class="img-thumbnail image3" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기 showing4">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('showing4','${image.showing4}')">삭제</button>
						</div>
					</c:if>
					<c:if test="${image.showing5 ne null}">
						<div class="image3 center" id="showing5">
						<img src="/resources/simage/${image.showing5}" class="img-thumbnail image3" data-bs-toggle="tooltip" title="클릭시 새창으로 이미지 띄우기 showing5">
						<br><button class="t1 btn btn-secondary D" onclick="deleteImg_fn('showing5','${image.showing5}')">삭제</button>
						</div>
					</c:if>
				</div>
				<br><br>
				
				<!-- 이미지 수정  -->
				<span class="title">이미지 </span><span class="red"> *사진 변경 및 추가</span>
				<br><br>
				<form name="iamge_fn1" action="/team_Bling/Ad_regist/modifyImg.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pidx" value="${product.pidx}" >
					<div class="mb-3">
	  					<label class="form-label bold">메인 이미지
					 	<input class="form-control D" type="file" name="main" accept="image/*"></label>
					</div>
					<div class="mb-3">
	  					<label class="form-label bold">상세 이미지
					 	<input class="form-control D" type="file" name="detail1" accept="image/*"></label>
					 	<input id="detail_add" type="button" value="파일 추가" onclick="plusFn()" class="btn btn-secondary D">
					</div>
					<div id="result"></div>
					<div class="mb-3">
	  					<label class="form-label bold">설명 이미지
					 	<input class="form-control D" type="file" name="showing1" accept="image/*"></label>
						<input id="showing_add" type="button" value="파일 추가" onclick="plusFn2()" class="btn btn-secondary D">
					</div>
					<div id="result2"></div>
					<div style="text-align:center;width:700px"></div>
				</form>
				<button type="button" class="btn btn-secondary t D" onclick="iamge_fn(this.form)">수정</button>
			</div>
	</div>	
</section>

</body>

<script>
//새창에 이미지 띄우 스크립트
let img = document.getElementsByTagName("img");
for (let x = 0; x < img.length; x++) {
  img.item(x).onclick=function() {window.open(this.src)}; 
}


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
    
    // 제품 kind 선택 셀렉트 박스
    proselected();
  
    disabled();
});


/* 삼품 수정 버튼을 눌렀을 때  에이작스*/
function updatePro(form){
	
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
				url:"/team_Bling/Ad_regist/updatePro.do",
				type:"POST",
				data:formData,
				ContentType:"application/json",
				success:function(data){
				alert("제품을 수정하였습니다.");
				},
				error:function(){
					alert("제품 수정 오류");
				}
			});
	}	
}

// 제품이 kind 셀렉트 박스
function proselected(){
	let kind = "<c:out value='${product.kind}'/>";
	if(kind == "R"){
		$("#kind option:eq(0)").attr("selected", "selected");
	}
	if(kind == "E"){
		$("#kind option:eq(1)").attr("selected", "selected");
	}
	if(kind == "B"){
		$("#kind option:eq(2)").attr("selected", "selected");
	}
	if(kind == "N"){
		$("#kind option:eq(3)").attr("selected", "selected");
	}
}


/* 옵션수정 버튼을 눌렀을 떄 에이작스 */
function updateOpt(type){

	 var formData = $("form[name="+type+"]").serialize();
		$.ajax({
			cache:false,
			url:"/team_Bling/Ad_regist/updateOpt.do",
			type:"POST",
			data:formData,
			ContentType:"application/json",
			success:function(data){
			  alert("옵션이 수정되었습니다");
			  // 화면 새로 고침
			  location.reload();
			},
			error:function(){
				alert("옵션 등록 오류. 입력값을 전부 입력해 주세요");
			}
		});
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
	
}

/* 옵션삭제 버튼을 눌렀을 떄 에이작스 */
function deleteOpt(type,oidx){
	
	if (!confirm("옵션을 삭제 하시겠습니까?")) {
         
     } else {
    	 
    	 $.ajax({
    			cache:false,
    			url:"/team_Bling/Ad_regist/deleteOpt.do",
    			type:"POST",
    			data:{"oidx":oidx},
    			ContentType:"application/json",
    			success:function(data){
    			  alert("옵션이 삭제되었습니다.");
    			  $("#"+type).html("");
    			},
    			error:function(){
    				alert("옵션 삭제 오류");
    			}
    	});
     }
}


/* 이미지 아래에 있는 삭제 버튼을 눌렀을 때 에이작스 */
function deleteImg_fn(kind,fileName){
	
	let pidx = "<c:out value='${product.pidx}'/>";
	
	if (!confirm(kind+" 사진을 삭제 하시겠습니까?")) {
        
    } else {
   	 
   	 $.ajax({
   			url:"/team_Bling/Ad_regist/deleteImg.do",
   			type:"POST",
   			data:{"pidx":pidx, "kind":kind, "fileName":fileName},
   			success:function(data){
   			  alert("사진이 삭제되었습니다.");
   			  $("#"+kind).html("");
   			},
   			error:function(){
   				alert("옵션 삭제 오류");
   			}
   	});
    }
	
}

/* 상세이미지 파일 추가 버튼을 눌렀을 떄*/
function plusFn(){
	let str = "";
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
	let str = "";
	for(i=2;i<6;i++){
		str += "<div class='mb-3'><label class='form-label'>설명 이미지"+i;
		str += "<input accept='image/*' class='form-control' type='file' name='showing"+i+"'></label>";
		str += "</div>";
	}
	 $("#result2").append(str);
	 $("#showing_add").hide();
}


/* 이미지 수정 버튼을 눌렀을 때 폼태그 */
function iamge_fn(form){
	
	let iform = document.iamge_fn1;
	
	alert("제품 이미지들이 수정되었습니다.");
	iform.submit();
}






</script>
</html>