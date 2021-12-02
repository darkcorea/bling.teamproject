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
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
			border-bottom:1px solid #EAE4E4;
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
		.size27 {
			height: 27px;
			width: 27px;
		}
		.price, .shipping, .discount{
			font-size:14pt;
		}
		.discount{
			color:red;
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
	<br><br><br><br>
	<form name="form">
		<input type="hidden" name="price" id="price">
		<input type="hidden" id="shipping">
		<input type="hidden" id="discount">
		<input type="hidden" id="total">
	<table class='tab'>
		<tr class='line1'>
			<th>총 상품금액</th>
			<th>배송비</th>
			<th>총 할인금액</th>
			<th class="th2">총 주문예정금액</th>
		</tr>
		<tr class='line'>
			<td class="price">0원</td>
			<td class="shipping">0원</td>
			<td class="discount">0원</td>
			<td class="td1 total">0원</td>
		</tr>
	</table>
	<br><br>
	<div class="btndiv">
		<button type="submit" class="btn btn-secondary t">선택상품 주문</button>
		<button type="button" class="btn btn-secondary t1" onclick="check_del()">선택상품 삭제</button>
	</div>
	</form>
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
				if(data.length>0){
				var str = "";
				str += "<table class='tab'>";
				str += "<tr class='line1'>";
				str += "	<th><input type='checkbox' name='all' onclick='checkAll(this); totalFn();'></th>";
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
					var price = (item.price+item.addprice)*item.quantity;
					var discount = (item.price-item.saleprice)*item.quantity;
					var tot_price = price-discount;
					
					str += "<tr class='line'>";
					str += "	<td class='pre'><input class='cart_idx' type='checkbox' name='cart_idx' value='"+item.cart_idx+"'></td>";
					str += "	<td><img class='img-fluid' src='/resources/image/"+item.main+"'></td>";
					str += "	<td><a class='deco' href='javascript:view("+item.pidx+")'>"+item.pname+"</a>";
					str += "		<p>옵션명 : "+item.oname+"</p>";
					str += "	<input type='hidden' name='stock' value='"+item.stock+"' id='s_"+item.cart_idx+"'>";
					str += "	</td><td>";
					str += "	<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='minus("+item.cart_idx+")' value='-'/>";
					str += "	<span class='quantity' id='q_"+item.cart_idx+"'>"+item.quantity+"</span>"
					str += "	<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='plus("+item.cart_idx+")' value='+'/>";
					str += "	<br><button class='btn1' onclick='updateFn("+item.cart_idx+")'>수정</button></td>";
					str += "	<td class='price'>"+price+"<span>원</span></td>";
					str += "	<td>"+discount+"<span>원</span></td>";
					str += "	<td>"+tot_price+"<span>원</span></td>";
					str += "	<td><button class='btn2' onclick='deleteFn("+item.cart_idx+")'>삭제</button></td>";
					str += "</tr>";
				}
				str += "</table>";
				$(".cartlist").html(str);
				
				}else{
					var str="";
					str += "<table class='tab'>";
					str += "<tr class='line1'>";
					str += "	<th><input type='checkbox' name='all' onclick='checkAll(this)'></th>";
					str += "	<th>사진</th>";
					str += "	<th>제품명</th>";
					str += "	<th class='th1'>수량</th>";
					str += "	<th>상품가격</th>";
					str += "	<th>할인금액</th>";
					str += "	<th>결제금액</th>";
					str += "	<th>취소</th>";
					str += "</tr>";
					str += "</table>";
					$(".cartlist").html(str);
				}
			},
			error:function(){
				alert("실행오류");
			}
		});
	});
	
	$(document).on('change', '.cart_idx',function(event){
		
		var price_sum = 0;
		var discount_sum = 0;
		var total_sum = 0;
		const shipping = 2500;
		var ship = $("#shipping").val();
		var tot_ship = parseInt(ship);
		 $(".cart_idx").each(function(e){

            if ($(this).is(":checked") == true) {
                var tot_price = parseInt($(this).parent().siblings(':eq(3)').text());
				var tot_discount = parseInt($(this).parent().siblings(':eq(4)').text());
				var total = parseInt($(this).parent().siblings(':eq(5)').text());
                price_sum = price_sum + tot_price;
                discount_sum = discount_sum + tot_discount;
                total_sum = total_sum + total;
            	if(price_sum<100000){
            		$("#shipping").val(2500);
            		$(".shipping").text("+"+shipping.toLocaleString()+"원");
            		$("#price").val(price_sum);
                    $(".price").text(price_sum.toLocaleString()+"원");
                    $("#discount").val(discount_sum);
                    $(".discount").text("-"+discount_sum.toLocaleString()+"원");
            		$("#total").val(total_sum+2500);
            		$(".total").text("="+(total_sum+2500).toLocaleString()+"원");
            	}else{
            		$("#shipping").val("");
            		$(".shipping").text("+0원");
            		 $(".price").text(price_sum.toLocaleString()+"원");
            		$("#price").val(price_sum);
                    $(".price").text(price_sum.toLocaleString()+"원");
                    $("#discount").val(discount_sum);
                    $(".discount").text("-"+discount_sum.toLocaleString()+"원");
            		$("#total").val(total_sum);
            		$(".total").text("="+total_sum.toLocaleString()+"원");
            		
            	}
            }
            else{
            	$("#shipping").val("");
        		$(".shipping").text("+0원");
        		 $(".price").text(price_sum.toLocaleString()+"원");
        		$("#price").val(price_sum);
                $(".price").text(price_sum.toLocaleString()+"원");
                $("#discount").val(discount_sum);
                $(".discount").text("-"+discount_sum.toLocaleString()+"원");
        		$("#total").val(total_sum);
        		$(".total").text("="+total_sum.toLocaleString()+"원");
        		
            }
        });
        
        
	});
	function checkAll(checkAll){
	      let checkboxs = document.getElementsByName("cart_idx");
	      let price = document.getElementsByClassName("price");
	      checkboxs.forEach((checkbox) => {
	         checkbox.checked = checkAll.checked;
	        console.log();
	      });
	   }
	function totalFn(){
		
	}
	function plus(cart_idx){
		var stock =  $("#s_"+cart_idx).val();
		var qt = $("#q_"+cart_idx).text();
		var quantity = parseInt(qt);
		var plus1 = quantity+1;
		if(quantity<stock){
		$("#q_"+cart_idx).text(plus1);
		}
	}
	function minus(cart_idx){
		var qt = $("#q_"+cart_idx).text();
		var quantity = parseInt(qt);
		var minus1 = quantity-1;
		if(quantity > 1){
			$("#q_"+cart_idx).text(minus1);
			}
	}
	
	function updateFn(cart_idx){
		var quantity = $("#q_"+cart_idx).text();
		$.ajax({
			url:"/Basket/cartupdate.do",
			data:{"cart_idx":cart_idx, "quantity":quantity},
			dataType:"JSON",
			type:"POST",
			success:function(data){
				alert("수정되었습니다");
				location.reload();
			},
			error:function(){
				alert("실행오류");
			}
		});
	}
	function deleteFn(cart_idx){
		$.ajax({
			url:"/Basket/cartdelete.do",
			data:{"cart_idx":cart_idx},
			type:"post",
			dataType:"JSON",
			success:function(data){
				alert("삭제되었습니다");
				location.reload();
				
			},
			error:function(){
				alert("실행오류");
			}
		});
		
	}
	
	function check_del(){
	      let len = $(".cart_idx:checked").length;
	      
	      if(len > 1){
	         $(".cart_idx:checked").each(function(e){      
	              let value =  $(this).val();
	              
	          });
	         
	      }else{
	          let cart_idx = $(".cart_idx:checked").val();
	          
	          $.ajax({
	  			url:"/Basket/cartdelete.do",
	  			data:{"cart_idx":cart_idx},
	  			type:"post",
	  			dataType:"JSON",
	  			success:function(data){
	  				alert("삭제되었습니다");
	  				location.reload();
	  				
	  			},
	  			error:function(){
	  				alert("실행오류");
	  			}
	  		});
	       }
	   }
	</script>
</body>
</html>