<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content ="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  위의 3가지는 먼저 와야 합니다. -->
<title>주문/결제하기</title>
<script src="/js/jquery-3.6.0.min.js"></script>
 <script src="/js/bootstrap.bundle.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

<!-- 주소 검색 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
<style>
/* 전반적인 크기에 관한 설정 */
	section, header {
		max-width:1008px;
		margin:  0px auto;
	}
	section {
    display: block;
	}
	h2{
	text-align: center;
	}
	.t1{
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:100%;
	}
	.gray{
		width:25%;
		background-color:#CB7878;
		padding-left:30px;
	}
	.line{
		border-bottom:1px solid #C4C4C4;
	}
	.fill{
		padding-left:20px;
	}
	.t {
		height:30px;
		border-radius: 5px;
		margin-left:20px;
		background-color:#6c757d;
		color:#fff;
	}
	#zip_code{
		width:100px;
		margin-bottom:3px;
	}
	.addr{
		width:400px;
		margin-bottom:3px;
	}
	.email{
		width:300px;
	}
	#addInfo{
		font-size:8pt;
		color:gray;
	}
	.white{
		color:#ffffff;
	}
	td{
		padding:5px;
	}
	.btn:focus {
    border-color: #ffffff;
	}
	#text{
	font-size:8pt;
	color:gray;
	margin-bottom:0px;
	}
	#content{
		margin-bottom:5px;
		margin-top:5px;
	}
	#checkall{
		font-size:14pt;
	}
	.red{color:#cd2828;}
	#btndiv{
		text-align: center;
	}
	.btn-light {
		width: 160px;
	}
	.btns{
		width: 160px;
	}
</style>
</head>
<body>
<header>
	<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
</header>
<section>
	<h2>주문/결제</h2>
	<br><br>
	<div class="container">
	<h5>구매자 정보</h5>
		<form>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill"><input type="text" name="name"></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">이메일</span></td>
					<td class="fill"><input type="email" name="email" class="email">
					<span id="addInfo">이메일 입력 시 주문 상품 정보와 배송 정보를 메일로 보내드립니다</span>
					</td>
				</tr>
				<tr>
					<td class="gray"><span class="white">휴대폰 번호</span></td>
					<td class="fill"><input type="text" name="phone">
					<span id="addInfo">숫자만 입력하세요</span>
					</td>
				</tr>
			</table>
		<br><br>
	<h5>받는 사람 정보</h5>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">이름</span></td>
					<td class="fill"><input type="text" name="name"></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">배송 주소</span></td>
					<td class="fill">
						<input type="text" name="zip_code" placeholder="우편번호" id="zip_code" readonly>
						<input type="button" class="t" value="주소검색" onclick="findmyaddr()"><br>
                        <input type="text" name="addr1" placeholder="기본주소" readonly class="addr" id="address2"><br>
                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요." class="addr">
					</td>
				</tr>
				<tr>
					<td class="gray"><span class="white">휴대폰 번호</span></td>
					<td class="fill"><input type="text" name="phone"></td>
				</tr>
			</table>
		<br><br>
	<h5>결제 정보</h5>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">총상품가격</span></td>
					<td class="fill"><div class="productprice"></div></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">배송비</span></td>
					<td class="fill"><div class="shipping"></div></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">적립금</span></td>
					<td class="fill"></td>
				</tr>
				<tr class="line">
					<td class="gray"><span class="white">총결제금액</span></td>
					<td class="fill"><div class="total"></div></td>
				</tr>
				<tr>
					<td class="gray"><span class="white">결제방법</span></td>
					<td class="fill">
						<div class="change">
						<label><input type="radio" name="payment" value="신용/체크카드" id="card" checked>신용/체크카드</label>
						<label><input type="radio" name="payment" value="계좌이체" id="transfer">실시간계좌이체</label>
						<label><input type="radio" name="payment" value="무통장입금" id="cwhiteit">무통장입금</label>
						
						<div id="content">
							<p id="text">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다</p>
						</div>
						
						</div>
					</td>
				</tr>
			</table>
		<br><br>
		<h5>비회원 주문조회 비밀번호</h5>
			<table class="t1">
				<tr class="line">
					<td class="gray"><span class="white">비밀번호</span></td>
					<td class="fill"><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td class="gray"><span class="white">비밀번호 확인</span></td>
					<td class="fill"><input type="password" name="pwd"></td>
				</tr>
			</table>
			</form>
		<br><br>
		<div class="agree">
			<p id="checkall" class="line"><input type="checkbox" name="all">모든 약관 동의</p>
			<p>
				<input type="checkbox" name="c1"><span class="red">[필수]</span>쇼핑몰 이용약관 동의
			</p>
			<p class="line">
				<input type="checkbox" name="c1"><span class="red">[필수]</span>비회원 구매시 개인정보 처리방침 동의
			<br><br>
			</p>
			<br><br>
		</div>
		<div id="btndiv">
		<button type="button" class="btn btn-secondary btns">결제하기</button> 
		<button type="button" class="btn btn-light">취소하기</button>
		</div>
		<br><br>
	</div>
</section>
<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer> 
<script>
$(document).ready(function(){
	$(".change input:radio").change(function(){
		var value = $(this).val();
		if(value=="무통장입금"){
			str="<p>입금은행 : 농협 123-05-456-789</p>";
			str+="입금자명 : <input type='text' name='name'>";
			$("#content").html(str);
		}
		else if(value=="신용/체크카드"){
			$("#content").html("<p id='text'>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다</p>");
		}
		else if(value=="계좌이체"){
			$("#content").html("예금주명 : <input type='text' name='name'>");
		}
	});
	
	$(".agree input[name='all']").change(function(){
		if($(this).is(":checked")){
			$(".agree input[name='c1']").prop("checked",true);
		}else{
			$(".agree input[name='c1']").prop("checked",false);
		}
	});
});

//주소 찾기 api
function findmyaddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip_code').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address2").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address2").value = jibunAddr;
            }
        }
    }).open();
}
</script>
</body>
</html>