<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>장바구니</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">

	<style>
		section {
			max-width:1008px;
			margin:  0px auto;
		}
		h2{
			text-align: center;
		}
		.btndiv{text-align: center;}
		.btndiv .t {
			background-color: #CB7878;
			border: 1px solid #CB7878;
			width: 160px;
		}
		.t1{
			width: 160px;
		}
		.img-fluid{
			width: 160px;
		}
		.tab{
			width:100%;
			border-top:1px solid  gray;
			border-bottom:1px solid  #E1DEDE;
		}
		.line{
			border-top:1px solid #EAE4E4;
			text-align: center;
		}
		.line1{
			text-align: center;
			background-color:#fafafa;
		}
		.deco{
			text-decoration-line: none;
			color: #854040;
			font-size:16pt;
			font-weight: bold ;
		}
		.th1{
			width:15%;
			padding:10px;
		}
		.th2{
			width:45%;
			padding:10px;
		}
		.td1{
			padding:20px;
			font-size:16pt;
			font-weight: bold ;
		}
		.btn2{
			background-color: #fff;
			border: 1px solid #E1DEDE;
			border-radius:4px;
			font-size:11pt;
			width:70px;
		}
		.btn1{
			background-color: #E1DEDE;
			border: 1px solid #E1DEDE;
			border-radius:4px;
			font-size:11pt;
			width:70px;
		}
		
	</style>	

</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	<section>
	<h2>장바구니</h2>
	<br><br>
	<div class="cartlist"></div>
	<br><br>
	<table class='tab'>
		<tr class='line1'>
			<th>총 상품금액</th>
			<th>배송비</th>
			<th>총 할인금액</th>
			<th class="th2">총 주문예정금액</th>
		</tr>
		<tr class='line'>
			<td><input type="text" id="price">원</td>
			<td><input type="text" id="shipping">원</td>
			<td><input type="text" id="discount">원</td>
			<td class="td1"><input type="text" id="total">원</td>
		</tr>
	</table>
	<br><br>
	<div class="btndiv">
		<button class="btn btn-secondary t">선택상품 주문</button>
		<button class="btn btn-secondary t1">선택상품 삭제</button>
	</div>
	<br><br>
	</section>
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer> 
	<script>
	$(document).ready(function(){
		
		let midx = "${sessionScope.UserVO.midx}";
		$.ajax({
			url:"/Basket/cartlist.do",
			type:"get",
			data:"midx="+midx,
			ContentType:"application/json",
			success:function(data){
				
				var str = "";
				str += "<table class='tab'>";
				str += "<tr class='line1'>";
				str += "	<th class='change'><input type='checkbox' name='all'></th>";
				str += "	<th>사진</th>";
				str += "	<th>제품명</th>";
				str += "	<th class='th1'>수량</th>";
				str += "	<th>상품가격</th>";
				str += "	<th>할인금액</th>";
				str += "	<th>결제금액</th>";
				str += "	<th>취소</th>";
				str += "</tr>";
				for(var i=0; i<data.length;i++){
					var item = data[i];
					var price = item.price+item.addprice;
					var discount = item.price-item.saleprice;
					var tot_price = price-discount;
					
					str += "<tr class='line'>";
					str += "	<td class='agree'><input type='checkbox' name='c1'></td>";
					str += "	<td><img class='img-fluid' src='/resources/image/"+item.main+"'></td>";
					str += "	<td><a class='deco' href='javascript:view("+item.pidx+")'>"+item.pname+"</a>";
					str += "		<p>옵션명 : "+item.oname+"</p>";
					str += "	</td>";
					str += "	<td>"+item.quantity+"<br><button class='btn1'>수정</button></td>";
					str += "	<td>"+price+"원</td>";
					str += "	<td>"+discount+"원</td>";
					str += "	<td>"+tot_price+"원</td>";
					str += "	<td><button class='btn2'>삭제</button></td>";
					str += "</tr>";
				}
				
				str += "</table>";
				$(".cartlist").html(str);
			},
			error:function(){
				alert("실행오류");
			}
		});
		
		$(".change input[name='all']").change(function(){
			
			
		});
		
	});
	</script>
</body>
</html>