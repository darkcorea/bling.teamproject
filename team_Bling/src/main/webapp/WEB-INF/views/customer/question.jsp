<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 문의 하기</title>
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	section {
		width:750px;
		margin:0px auto;
	}
	
	/* 색상 레드*/
	.red{
		color:red;
	}
	
	/* 문의 테이블 크기 */
	table {
		width:100%;
		margin:15px 0px;
	}
	/* 테이블 tr11 */
	.tr1{
		border-top: 1px solid #444444;
		height:50px;
	}
	
	/* 삼품 선택 셀릭트 박스 크기 */
	#form-select{
		width:30%;
		font-size:16px;
		padding-top:2px;
		padding-bottom:2px;
	}
	
	/* 테이블 tr2 */
	.tr2{
		border-top: 1px solid #CB7878;
		height:50px;
	}
	
	/* 테이블 tr3 */
	.tr3{
		border-top: 1px solid #CB7878;
		height:50px;
	}
	
	.tr4{
		border-top: 1px solid #CB7878;
		border-bottom: 1px solid #CB7878;
	}
	
	
	.mar20 {
		margin: 20px 0px;
		resize:none;
	}
	
	/* 버튼들 위치 가운데 */
	.btn-two {
		text-align: center;
	}
	
	/* 상품선택 버튼 크기와  색상 */
	.tr3 .btn-danger {
	background-color: #CB7878;
	border: 1px solid #CB7878;
	width: 100px;
	}
	
	/* 저장버튼 크기와 색상*/
	.btn-two .btn-danger {
	background-color: #CB7878;
	border: 1px solid #CB7878;
	width: 80px;
	}
	
	/* 이전 버튼 크기 */
	.btn-light {
	width: 80px;
	}
	
	/* 클래스 붙이면 백그라운드 색상이 블링 색으로 */
	.bling_color {
		background-color: #CB7878;
	}
	
	/* 모달창 크기 설정*/
	.modal-content{
		width:800px;
		height:900px;
	}

	/* 모달창에 있는 상품 나오는 div크기*/
	#product_select1{
		width:80%;
		margin:5px auto;
	}
	
	/* 상품 결제날짜 나오는 곳*/
	.date_1	{
		margin:15px 0px 5px 0px;
	}
	
	/* 모달창에 나오는 체크박스에 관한 */
	.modal-body .margin-center{
		margin:40px 15px;
		width:25px;
		height:25px;
	}
	
	/* 모달창에 나오는 상품 이미지 크기  */
	.image_main{
		width:100px;
		height:100px;
		display:inline;
	}
	
	/* 모달창에 나오는 상품 설명 텍스트들*/
	.product_names{
		display:inline-block;
		margin-left: 15px;
	}

	/* 모달 버튼 가운데로 오기*/
	#product_select2 {
		justify-content: center;
	}
		
	/* 모달 버튼 */
	#modal_button1{
	background-color: #CB7878;
	}
		
	/* 모달 버튼 크기*/
	#modal_button1, #modal_button2{
		width:120px;
	}
	
	
</style>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/views/header.jsp"%><BR>
	<br>
</header>

<section>
	<h2>문의하기</h2>
	<form name="question" action="/Customer/question_write.do" method="POST">
	<table>
		<tr class="tr1">
			<td style="width:180px;"><span class="red">*</span>문의사항 구분</td>
			<td>
				<select name="category" class="form-select" id="form-select" aria-label="Default select">
					<option value="A" selected>배송</option>
	  				<option value="B">취소,교환,반품</option>
	  				<option value="C">기타</option>
				</select>
			</td>
		</tr>
		<tr class="tr2">
			<td style="width:180px;"><span class="red">*</span>제목</td>
			<td><input type="text" name="title" style="width:90%" maxlength="30"></td>
		</tr>
		<tr class="tr3">
			<td>상품선택</td>
			<td>
				<button type="button" class="btn btn-danger" onclick="product_select()">상품선택</button>
				<div id="product_selected">
				<input type="hidden" name="detail_idx" value="0">
				<input type="hidden" name="midx" value="${sessionScope.UserVO.midx}">
				<input type="text" style="display:none;">
				</div>
			</td>
			
		</tr>
		<tr class="tr4">
			<td><span class="red">*</span>본문</td>
			<td>
			<textarea id="content" name="content" cols="60" rows="15" class="mar20"></textarea>
			<div id="content_cnt">(0 / 1000)</div>	
			</td>
		</tr>
	</table>
	<div class="btn-two">
	<button type="button" class="btn btn-danger" onclick="qustionFn(this.form)">저장</button>&ensp;
	<button type="button" class="btn btn-light" onclick="history.go(-1)">이전</button>
	</div>
	</form>
</section><br><br><br>

<footer>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</footer>

<!-- 상품선택을 하면 나오는 모달창 -->
<div class="modal fade" id="product_select" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header bling_color">
        <h5 class="modal-title">상품선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<!-- 최근 2개월간 주문한 상품을 옵션별로 나오게 하기 -->
      	<div  id="product_select1">
      
      	</div>
      </div>
      <div class="modal-footer" id="product_select2">
        <button type="button" class="btn btn-secondary" id="modal_button1" data-bs-dismiss="modal" onclick="modal_button1()">확인</button>&ensp;&ensp;
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modal_button2">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
$(document).ready(function() {
    
    // 글자수 1000자로 제한
    $('#content').on('keyup', function() {
        $('#content_cnt').html("("+$(this).val().length+" / 1000)");
 
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0, 1000));
            $('#content_cnt').html("(1000 / 1000)");
        }
    });
});
	/* 상품 선택 버튼을 클릭할 때 */
	function product_select(){
		
		let midx= "${sessionScope.UserVO.midx}";
		$.ajax({
			url:"product_select.do",
			data:{"midx":midx},
			dataType:"json",
			type:"POST",
			success:function(data){
				//console.log(data);
				if(data.length == 0) {
					alert("최근 2개월간 상품 구매내역이 없습니다.");	
					
				}else{
				
					let str = "";
					str += "<div>";
					str += "<hr>";
					str += "<h3>문의상품 선택하기<h3>";
					str += "<hr>";
					str += "</div>";
					
					/* 매퍼에서 최근 날짜 순으로 가져 옴 */
					/* 맨처음에 있는 날짜를 요일까지 자른 후 요일과 옵션번호에 맞는 상품 내용을 뿌려준다 */
					let date_one = data[0].rdate.slice(0,10);
					// 날짜에 맞는 요일 나오게 하는 function 사용
					var getdate =  getDate(date_one);
					// 옵션 이름에서 가격 나오는 부분 잘르기
					var opName = data[0].oname.split("+")[0];
					str += "<div class='date_1'>";
					str += "<b>주문일 : "+date_one+" "+getdate+"</b>";
					str += "</div>";
					str += "<div style='margin-bottom:10px;'>";
					str += "<input class='margin-center' type='checkbox' name='detail_idx' value='"+data[0].detail_idx+"'>";
					str += "<img class='image_main' src='/resources/image/"+data[0].main+"'>";
					str += "<div class='product_names'><span style='color:#CB7878;'>"+data[0].pname+"</span><br><b>제품선택 : "+opName+"</b></div>";
					str += "</div>";
					
					/* 그 뒤에 날짜가 같으면 상품에 대한 정보만 뿌려주고 그렇지 않으면 날짜를 다시 뿌리고 다른 요일이 나오기 전까지 상품정보만 뿌려준다.*/
					for (let i =1; i<data.length; i++){
	
						let date = data[i].rdate.slice(0,10);
						getdate =  getDate(date);
						opName = data[i].oname.split("+")[0];
						
						if(date_one == date){
							str += "<div style='margin-bottom:10px;'>";
							str += "<input class='margin-center' type='checkbox' name='detail_idx' value='"+data[i].detail_idx+"'>";
							str += "<img class='image_main' src='/resources/image/"+data[i].main+"'>";
							str += "<div class='product_names'><span style='color:#CB7878;'>"+data[i].pname+"</span><br><b>제품선택 : "+opName+"</b></div>";
							str += "</div>";
						}else{
							str += "<div class='date_1'>";
							str += "<b>주문일 : "+date+" "+getdate+"</b>";
							str += "</div>";
							str += "<div style='margin-bottom:10px;'>";
							str += "<input class='margin-center' type='checkbox' name='detail_idx' value='"+data[i].detail_idx+"'>";
							str += "<img class='image_main' src='/resources/image/"+data[i].main+"'>";
							str += "<div class='product_names'><span style='color:#CB7878;'>"+data[i].pname+"</span><br><b>제품선택 : "+opName+"</b></div>";
							str += "</div>";
							date_one = date;
						}
					}
					
					$("#product_select1").html(str);
					$("#product_select").modal("show");
					
					// 하. 화면이 변환 뒤에는 제이쿼리가 작동이 안되었던 거였음 ㅜㅜ
					// 그래서 화면이 변한 후에 작동 시키기 위해서 여기에 넣음
					// 체크박스에서 1가지만 선택할 수 있게 함.
					$('input[name=detail_idx]').click(function(){          
					
						if($(this).prop('checked')){
						     $('input[type="checkbox"][name="detail_idx"]').prop('checked',false);
						     $(this).prop('checked',true);
						    }
					});
					
				}
			},
			error:function(){
				alert("상품선택 버튼 에러입니다.");
			}
		});
		
	}
	
	
	/* 특정한 날짜 요일 구하는 fuction */
	function getDate(type){
		let week = ["(일)", "(월)", "(화)", "(수)", "(목)", "(금)", "(토)"];
		let dayOfWeek = week[new Date(type).getDay()];
		return dayOfWeek;
	}
	
	
	/* 모달창에서 상품을 선택하고 확인 버튼을 누르면 문의하기 페이지에 있는 상품선택 버튼 아래 쪽에 선택한 상품들이 나옴  */
	// 여러가지 오더디테일을 선택할 수 있었는데 1가지 오더 디테일만 선택 가능하게 변경
	// 그러나 이 기능이 아까워서 그대로 나둠.
	function modal_button1(){
		
		let list = new Array();
		
		// 체크된 모든 체크박스를 검색해서 detail_idx를 리스트에 담아서 컨트롤러로 보냄
		$("input[name=detail_idx]:checked").each(function(){
			let detail_idx = $(this).val();
			list.push(detail_idx);
		});
		
		$.ajax({
			url:"detail_idx_select.do",
			data:{"list":list},
			dataType:"json",
			type:"POST",
			success:function(data){
				//console.log(data)
				
				let str = "";
				for (let i = 0; i<data.length; i++){
					var oname = data[i].oname.split("+")[0];
					str += data[i].pname+" : "+oname+"<br>";
					str += "<input type='hidden' name='detail_idx' value='"+data[i].detail_idx+"'>";
					str += "<input type='hidden' name='midx' value='"+${sessionScope.UserVO.midx}+"'>";
				}
				
				$("#product_selected").html(str);
				
			},
			erorr:function(){
				alert("상품선택 에러 입니다. 로그인 해주세요");
			}
		
		});	
	}
	
	
	/* 저장하기 버튼을 눌렀을 때 통신하기 */
	function qustionFn(form){
		
		let Qform = document.question;

		if(form.title.value == ""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return ;
		}
		
		if(form.content.value == ""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return ;
		}
		
		let uid= "${sessionScope.UserVO.id}";
		if(uid == ""){
			alert("로그인을 해주세요");
		}
		
		alert("문의 내용이 등록되었습니다.");
		Qform.submit();
	}

</script>
</html>