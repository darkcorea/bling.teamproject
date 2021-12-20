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
		.tot_order{
			width: 18px;
			height: 18px;
			cursor: pointer;
			position: relative;
 			top: 4px;
		}
		.cart_idx{
			width: 18px;
			height: 18px;
			cursor: pointer;
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
	
		<input type="hidden" name="price" id="price">
		<input type="hidden" id="discount" name="discount">
		<input type="hidden" id="total" name="total">
	<table class='tab'>
		<tr class='line1'>
			<th>총 상품금액</th>
			<th>총 할인금액</th>
			<th class="th2">총 주문예정금액</th>
		</tr>
		<tr class='line'>
			<td class="price">0원</td>
			<td class="discount">0원</td>
			<td class="td1 total">0원</td>
		</tr>
	</table>
	<br><br>
	<div class="btndiv">
		<button type="button" class="btn btn-secondary t" onclick="check_order()">선택상품 주문</button>
		<button type="button" class="btn btn-secondary t1" onclick="check_del()">선택상품 삭제</button>
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
			url:"/team_Bling/Basket/cartlist.do",
			type:"get",
			data:"midx="+midx,
			ContentType:"application/json",
			success:function(data){
				if(data.length>0){
				var str = "";
				str += "<table class='tab'>";
				str += "<tr class='line1'>";
				str += "	<th><input type='checkbox' name='all' class='tot_order' onclick='checkAll(this)'></th>";
				str += "	<th>사진</th>";
				str += "	<th>제품명</th>";
				str += "	<th class='th1'>수량</th>";
				str += "	<th>상품금액</th>";
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
					str += "	<td class='pre'><input class='cart_idx' type='checkbox' name='cart_idx' value='"+item.cart_idx+"'>";
					str += "	<input type='hidden' name='oidx' value='"+item.oidx+"'>";
					str += "	<input type='hidden' name='quantity' value='"+item.quantity+"' id='qun_"+item.cart_idx+"'>";
					str += "	<input type='hidden' name='pname' value='"+item.pname+"'>";
					str += "	<input type='hidden' name='stock1' value='"+item.stock+"'>";
					str += "	</td>";
					console.log(item.cuidx);
					if(item.cuidx != 0){
						str += "	<td><img class='img-fluid' src='/team_Bling/resources/usercustomizing/"+item.main+"'></td>";
					}else{
						str += "	<td><img class='img-fluid' src='/team_Bling/resources/image/"+item.main+"'></td>";
					}
					str += "	<td><a class='deco' href='/team_Bling/Product/detail.do?pidx="+item.pidx+"'>"+item.pname+"</a>";
					str += "		<p>옵션명 : "+item.oname+"</p>";
					str += "	<input type='hidden' name='stock' value='"+item.stock+"' id='s_"+item.cart_idx+"'>";
					str += "	</td><td>";
					str += "	<input type='hidden' id='price_"+item.cart_idx+"' value='"+item.price+"'>";
					str += "	<input type='hidden' id='add_"+item.cart_idx+"' value='"+item.addprice+"'>";
					str += "	<input type='hidden' id='sale_"+item.cart_idx+"' value='"+item.saleprice+"'>";
					str += "	<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='minus("+item.cart_idx+")' value='-'/>";
					str += "	<span class='quantity' id='q_"+item.cart_idx+"'>"+item.quantity+"</span>"
					str += "	<input type='button' class='btn btn-light p-0 size27 align-middle' onclick='plus("+item.cart_idx+")' value='+'/>";
					str += "	<br><button class='btn1' onclick='updateFn("+item.cart_idx+")'>수정</button></td>";
					str += "	<td class='price1'><span id='pr_"+item.cart_idx+"'>"+price+"</span><span>원</span></td>";
					str += "	<td class='discount1'><span id='dis_"+item.cart_idx+"'>"+discount+"</span><span>원</span></td>";
					str += "	<td class='tot_price1'><span id='tot_"+item.cart_idx+"'>"+tot_price+"</span><span>원</span></td>";
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
		
		 $(".cart_idx").each(function(e){
	
            if ($(this).is(":checked") == true) {
                var tot_price = parseInt($(this).parent().siblings(':eq(3)').text());
				var tot_discount = parseInt($(this).parent().siblings(':eq(4)').text());
				var total = parseInt($(this).parent().siblings(':eq(5)').text());
                price_sum = price_sum + tot_price;
                discount_sum = discount_sum + tot_discount;
                total_sum = total_sum + total;
            	
            		$("#shipping1").val("");
            		$(".shipping").text("+0원");
            		$(".price").text(price_sum.toLocaleString()+"원");
            		$("#price").val(price_sum);
                    $(".price").text(price_sum.toLocaleString()+"원");
                    $("#discount").val(discount_sum);
                    $(".discount").text("-"+discount_sum.toLocaleString()+"원");
            		$("#total").val(total_sum);
            		$(".total").text("="+total_sum.toLocaleString()+"원");
            }
            else{
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
	
	
	$(document).on('change', '.tot_order',function(event){
		
		var sum=0;
		var dis_sum=0;
		var tot_sum=0;
		var price = $(".price1").text();
		var discount = $(".discount1").text();
		var tot_price = $(".tot_price1").text();
		var price1 = price.split("원");
		var discount1 = discount.split("원");
		var tot_price1 = tot_price.split("원");
		var c = price1.map(Number);
		var dis = discount1.map(Number);
		var tot = tot_price1.map(Number);
		
		if ($(this).is(":checked") == true){
		
			for(i=0;i<c.length;i++){
				sum = sum+c[i];
			}
			for(i=0;i<dis.length;i++){
				dis_sum = dis_sum+dis[i];
			}
			for(i=0;i<tot.length;i++){
				tot_sum = tot_sum+tot[i];
			}
			
			$(".price").text(sum.toLocaleString()+"원");
     		$("#price").val(sum);
     		 $("#discount").val(dis_sum);
             $(".discount").text("-"+dis_sum.toLocaleString()+"원");
     		$("#total").val(tot_sum);
     		$(".total").text("="+tot_sum.toLocaleString()+"원");
     		
		}else{
			$(".price").text("0원");
     		$("#price").val("");
     		 $("#discount").val("");
             $(".discount").text("-0원");
     		$("#total").val("");
     		$(".total").text("=0원");
		}
		
	});
	function checkAll(checkAll){
	      let checkboxs = document.getElementsByName("cart_idx");
	     
	      checkboxs.forEach((checkbox) => {
	    	
	         checkbox.checked = checkAll.checked;
	     
	      });
	   }	
	
	function plus(cart_idx){
		var stock =  $("#s_"+cart_idx).val();
		var qt = $("#q_"+cart_idx).text();
		var price = $("#price_"+cart_idx).val();
		var add = $("#add_"+cart_idx).val();
		var sale = $("#sale_"+cart_idx).val();
		
		var quantity = parseInt(qt);
		var price1=parseInt(price);
		var add1 = parseInt(add);
		var sale1 = parseInt(sale);
		
		var plus1 = quantity+1;
		
		if(quantity<stock){
		$("#q_"+cart_idx).text(plus1);
		var t = $("#q_"+cart_idx).text();
		var pr = (price1+add1)*t;
		var dis = (price-sale)*t;
		var tot = pr-dis;
		
		$("#pr_"+cart_idx).text(pr);
		$("#dis_"+cart_idx).text(dis);
		$("#tot_"+cart_idx).text(tot);
		$("#qun_"+cart_idx).val(plus1);
		}else{
			alert("재고가 부족합니다");
		}
	}
	function minus(cart_idx){
		var qt = $("#q_"+cart_idx).text();
		var price = $("#price_"+cart_idx).val();
		var add = $("#add_"+cart_idx).val();
		var sale = $("#sale_"+cart_idx).val();
		
		var quantity = parseInt(qt);
		var price1=parseInt(price);
		var add1 = parseInt(add);
		var sale1 = parseInt(sale);
		
		var minus1 = quantity-1;
		
		if(quantity > 1){
			$("#q_"+cart_idx).text(minus1);
			var t = $("#q_"+cart_idx).text();
			var pr = (price1+add1)*t;
			var dis = (price-sale)*t;
			var tot = pr-dis;
			
			$("#qun_"+cart_idx).val(minus1);
			$("#pr_"+cart_idx).text(pr);
			$("#dis_"+cart_idx).text(dis);
			$("#tot_"+cart_idx).text(tot);
			}
	}
	
	function updateFn(cart_idx){
		var quantity = $("#q_"+cart_idx).text();
		$.ajax({
			url:"/team_Bling/Basket/cartupdate.do",
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
			url:"/team_Bling/Basket/cartdelete.do",
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
	      var list = [];
	      if(len > 1){
	         $(".cart_idx:checked").each(function(e){      
	              let value =  $(this).val();
	              list.push(value);
	          });
	         
	         $.ajax({
					url:"/team_Bling/Basket/check_delete.do",
					data:{"list":list},
					dataType:"json",
					type:"POST",
					success:function(data){
						location.reload();
					},
					erorr:function(){
						alert("삭제 에러입니다");
					}
				});
	         
	         
	      }else{
	          let cart_idx = $(".cart_idx:checked").val();
	          
	          $.ajax({
	  			url:"/team_Bling/Basket/cartdelete.do",
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
	function check_order(){
		
		var tot_price = $("#total").val();
		var pnameList = [];
		 let List = new Array;
		 let len = $(".cart_idx:checked").length;
	    
	      if(len < 1){
	        alert("상품을 선택하세요");
	         
	      }else{
	         
	          $(".cart_idx:checked").each(function(e){      
	              let oidx = $(this).siblings(':eq(0)').val();
	              let quantity = $(this).siblings(':eq(1)').val();
	              let pname = $(this).siblings(':eq(2)').val();
	              let stock = $(this).siblings(':eq(3)').val();
	              
	              console.log(stock);
	              var data = new Object();
	              data.oidx = oidx;
	 	         data.quntity = quantity;
	 	         data.stock = stock;
	 	         List.push(data);
	             pnameList.push(pname);
	          });
	          let jsonData = JSON.stringify(List);
	         
	          var frm = document.createElement("form");
		      frm.name = 'frm';
		      frm.method = 'post';
		      frm.action = '/team_Bling/Order/memberorder.do';
		      
		      var input1 = document.createElement("input");
		     
		      var input2 = document.createElement("input");
		    
		      var input3 = document.createElement("input");
		     
		      input1.setAttribute("type","hidden");
		      input1.setAttribute("name","jsonData");
		      input1.setAttribute("value",jsonData);
		      
		      input2.setAttribute("type","hidden");
		      input2.setAttribute("name","tot_price");
		      input2.setAttribute("value",tot_price);
		   
		      input3.setAttribute("type","hidden");
		      input3.setAttribute("name","productname");
		      input3.setAttribute("value",pnameList);
		      
		      frm.appendChild(input1);
		      frm.appendChild(input2);
		      frm.appendChild(input3);
		      document.body.appendChild(frm);
				frm.submit();
	          
	       }
	}	
	
	</script>
</body>
</html>