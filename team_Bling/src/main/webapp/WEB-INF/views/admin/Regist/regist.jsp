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
<script>
$(document).ready(function () {
	
	
	 $( "#discount" ).blur(function(){
	        var price = $("#price").val();
	        var discount = $("#discount").val();
	        var saleprice = price*((100-discount)/100);
	        if(price == ""){
	            $('#saleprice').val("0");
	        }else{
	            $('#saleprice').val(saleprice);
	        }    
	    });
	
    $('#select').click(function () {
        
        var radioVal = $('input[name="color"]:checked').val();
		  radioVal += " ";
          radioVal += $('input[name="sizes"]:checked').val();
          radioVal += " ";
          radioVal += $('input[name="texture"]:checked').val();
          radioVal += " ";
          radioVal += "+";
          radioVal += $('input[name="addprice"]').val();
          radioVal += "원 ";
          
          document.getElementsByClassName("result")[0].value=radioVal;
        });
    
    
   
    $('#select1').click(function () {
        
        var radioVal = $('.color:checked').val();
		  radioVal += " ";
          radioVal += $('.size:checked').val();
          radioVal += " ";
          radioVal += $('.texture:checked').val();
          radioVal += " ";
          radioVal += "+";
          radioVal += $('.addprice').val();
          radioVal += "원 ";
          
          document.getElementsByClassName("result1")[0].value=radioVal;
        });  
    
    $('.addname').click (function () {                                        
        $('#add').append (                     
            '<form><br><table style="width:700px;height:150px"><tr><th>색상 : </th><td><label><input type="radio" name="color" value="골드">골드</label><label><input type="radio" name="color" value="핑크골드">핑크골드</label></td>'
			+'<th>재질 : </th><td><label><input type="radio" name="texture" value="14k">14k</label><label><input type="radio" name="texture" value="18k">18k</label></td><th>사이즈 : </th>'
			+'<td><label><input type="radio" name="sizes" value="소">소</label><label><input type="radio" name="sizes" value="중">중</label><label><input type="radio" name="sizes" value="대">대</label></td></tr>'
			+'<tr><th>추가 가격 : </th><td colspan="3"><input type="text" name="addprice" size="13" id="addprice">원</td><th>재고 수량 : </th><td><input type="text" name="stock" size="8"></td></tr>'
			+'<tr><th>옵션 이름 : </th><td colspan="5"><input type="text" name="name" class="result" size="35"></td></tr></table><input type="hidden" name="pidx" class="pidx"><br><br></form>'
			+'<div style="text-align:center;width:700px"><button class="btn btn-secondary" id="select2">선택</button>'
			+'<button onclick="insertOpt()" class="btn btn-secondary t">저장</button><br><br></div>'	
        )
    });
    
    var currentPosition = parseInt($(".quickmenu").css("top")); 
    
    $(window).scroll(function() {
    	var position = $(window).scrollTop(); 
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000); 
    });
  });
  
function insertPro(){
	 var formData = $("form[name=frm]").serialize();
		$.ajax({
			cache:false,
			url:"/Ad_regist/registPro.do",
			type:"POST",
			data:formData,
			ContentType:"application/json",
			success:function(data){
			alert("저장되었습니다");
			document.getElementsByClassName("pidx")[0].value=data;
			document.getElementsByClassName("pidx")[1].value=data;
			},
			error:function(){
				alert("실행오류");
			}
		});
	}
function insertOpt(){
	 var formData = $("form[name=frm2]").serialize();
		$.ajax({
			cache:false,
			url:"/Ad_regist/insertOpt.do",
			type:"POST",
			data:formData,
			ContentType:"application/json",
			success:function(data){
			  alert("저장되었습니다");
			  $.reset();
			},
			error:function(){
				alert("실행오류");
			}
		});
	}
function insertOpt2(){
	 var formData = $("form[name=frm3]").serialize();
		$.ajax({
			cache:false,
			url:"/Ad_regist/insertOpt.do",
			type:"POST",
			data:formData,
			ContentType:"application/json",
			success:function(data){
			  alert("저장되었습니다");
			},
			error:function(){
				alert("실행오류");
			}
		});
	}
function plusFn(){
	var str = "";
	for(i=2;i<4;i++){
	str += "<div class='mb-3'><label class='form-label'>";
	str += "<input class='form-control' type='file' name='detail"+i+"'></label>";
	str += "</div>";
	}
	 $("#result").append(str);
}
function plusFn2(){
	var str = "";
	for(i=2;i<6;i++){
		str += "<div class='mb-3'><label class='form-label'>";
		str += "<input class='form-control' type='file' name='showing"+i+"'></label>";
		str += "</div>";
	}
	
	 $("#result2").append(str);
}
$.reset = function(){
	$("#fm2")[0].reset();
}

</script>

<style>
	div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}

.content {position:relative;min-height:1000px;}

	
</style>
</head>
<body>
	
	<header>
		<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
	</header>
<!-- 옆 nav 바 -->		
	<div class="d1">
		<div class="quickmenu">
			  <ul>
			 	<li><a href="#">홈</a></li>
			    <li><a href="/Ad_regist/list.do">리스트</a></li>
			    <li><a href="#">상품 등록</a></li>
			    <li><a href="#">품절상품</a></li> 
			  </ul>
		</div>
		<div class="d2">
			<h2>상품 등록</h2>
			<form name="frm">
				<br>
				<table style="width:700px;height:150px">
					<tr>
						<th width="100px">상품 이름 : </th>
						<td width="300px"><input type="text" name="name" size="23"></td>
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
						<td><input type="number" name="price" id="price">원</td>
						<th>할 인 율 : </th>
						<td><input type="number" name="discount" id="discount" style="width:60px">%</td>
					</tr>
					<tr>
						<th>할인 가격 : </th>
						<td><input type="number" name="saleprice" id="saleprice">원</td>
						<th>배 송 비 : </th>
						<td><input type="text" name="shipping" size="10">원</td>
					</tr>	
				</table>
			</form>
			<div style="text-align:center;width:700px">		
		 		<p><br><button class="btn btn-secondary t" onclick="insertPro()">저장</button></p>
			</div>	
			<h3>옵션1</h3>
			<form name="frm2" id="fm2">
				<br>
				<table style="width:700px;height:150px">
					<tr class="change">
						<th>색상 : </th>
						<td><label><input type="radio" name="color" value="골드">골드</label>
						<label><input type="radio" name="color" value="핑크골드">핑크골드</label></td>
						<th>재질 : </th>
						<td><label><input type="radio" name="texture" value="14k">14k</label>
						<label><input type="radio" name="texture" value="18k">18k</label></td>
						<th>사이즈 : </th>
						<td><label><input type="radio" name="sizes" value="소">소</label>
		      			<label><input type="radio" name="sizes" value="중">중</label>
						<label><input type="radio" name="sizes" value="대">대</label></td>
					</tr>	
					<tr>
						<th>추가 가격 : </th>
						<td colspan="3"><input type="text" name="addprice" size="13" id="addprice">원</td>
						<th>재고 수량 : </th>
						<td><input type="text" name="stock" size="8"></td>
					</tr>
					<tr>
						<th>옵션 이름 : </th>
						<td colspan="5"><input type="text" name="name" class="result" size="35"></td>
					</tr>
				</table>
					<input type="number" name="pidx" class="pidx"><br><br>
			</form>
			<div style="text-align:center;width:700px">
			<button class="btn btn-secondary" id="select">선택</button>
			<button onclick="insertOpt()" class="t btn btn-secondary">저장</button><br><br>
			</div>
			<h3>옵션2</h3>
			<form name="frm3" id="frm3">
				<br>
				<table style="width:700px;height:150px">
					<tr>
						<th>색상 : </th>
						<td><label><input type="radio" name="color" value="골드" class='color'>골드</label>
						<label><input type="radio" name="color" value="핑크골드"  class='color'>핑크골드</label></td>
						<th>재질 : </th>
						<td><label><input type="radio" name="texture" value="14k" class='texture'>14k</label>
						<label><input type="radio" name="texture" value="18k" class='texture'>18k</label></td>
						<th>사이즈 : </th>
						<td><label><input type="radio" name="sizes" value="소" class='size'>소</label>
		      			<label><input type="radio" name="sizes" value="중"  class='size'>중</label>
						<label><input type="radio" name="sizes" value="대"  class='size'>대</label></td>
					</tr>	
					<tr>
						<th>추가 가격 : </th>
						<td colspan="3"><input type="text" name="addprice" size="13" class="addprice">원</td>
						<th>재고 수량 : </th>
						<td><input type="text" name="stock" size="8"></td>
					</tr>
					<tr>
						<th>옵션 이름 : </th>
						<td colspan="5"><input type="text" name="name" class="result1" size="35"></td>
					</tr>
				</table>
					<input type="number" name="pidx" class="pidx"><br><br>
			</form>
			
			<div style="text-align:center;width:700px">
				<button class="btn btn-secondary" id="select1">선택</button>
				<button onclick="insertOpt2()" class="btn btn-secondary t">저장</button>
			</div>
			<div style="text-align:right;width:700px">
			<button class="addname btn btn-secondary">옵션추가</button></div>
			
			<div id="add"></div>
			<form action="/Ad_regist/insertImg.do" method="post" enctype="multipart/form-data">
				<h3>이미지</h3>
					<div class="mb-3">
	  					<label class="form-label">메인 이미지
					 	<input class="form-control" type="file" name="main"></label>
					</div>
					<div class="mb-3">
	  					<label class="form-label">상세 이미지
					 	<input class="form-control" type="file" name="detail1"></label>
					 	<input type="button" value="파일 추가" onclick="plusFn()" class="btn btn-secondary">
					</div>
					<div id="result"></div>
					<div class="mb-3">
	  					<label class="form-label">설명 이미지
					 	<input class="form-control" type="file" name="showing1"></label>
						<input type="button" value="파일 추가" onclick="plusFn2()" class="btn btn-secondary">
					</div>
					<div id="result2"></div>
					<input type="hidden" name="pidx" class="pidx"><br><br>
					<br>
					<div style="text-align:center;width:700px">
					<input type="submit" value="등록" class="btn btn-secondary t">
					</div>
			</form>	
		</div>
	</div>	
	
</body>
</html>