<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비회원 주문 조회 디테일</title>
<!-- SweetAlert2(alert,modal창) -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	/* 크기 */
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	/* 클래스 붙이면 문자 크기 조정 */
	.title{
		font-size:25px;
		font-weight:900;
	}
	/* 제품 이미지 */
	.image_main{
		width:80px;
		height:80px;
	}
	.title4{
	text-decoration: none;
	color: #CB7878;	
	}	
	.title4:hover{
		color:#C4C4C4;
	}
	/* 배송조회, 배송중  */
	.deli{
		text-decoration-line: none;
		color: #000000;
	}
	
	.deli:hover{
		text-decoration-line: none;
		color: #989191;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
<div style="margin:50px 30%;">
	<div> 
	<p><span class='title'>배송정보</span></p> 
		 <table> 
			 <tr> 
				 <td style='width:80px;'><b>받는사람</b></td> 
				 <td><c:out value="${list[0].recipient}"/></td> 
			 </tr> 
			 <tr> 
				 <td><b>연 락 처</b></td> 
				 <td><c:out value="${list[0].rphone}"/></td> 
			 </tr> 
			 <tr> 
				  <td><b>받는주소</b></td> 
				 <td>(<c:out value="${list[0].zip_code}"/>) <c:out value="${list[0].addr1}"/> <c:out value="${list[0].addr2}"/>
				 </td> 
			 </tr>
			 <tr> 
				  <td><b>주문일자</b></td> 
				 <td>${fn:substring(list[0].rdate,0,10)}</td> 
			 </tr>
			 <tr> 
				 <td><b>주문번호</b></td> 
				 <td><c:out value="${list[0].orderid}"/></td> 
			 </tr>
			 <tr> 
				 <td><b>배송상태</b></td> 
				 <td>
				 	<c:if test="${list[0].deli_stat == 'N'}"> 입금전</c:if>
				 	<c:if test="${list[0].deli_stat == 'Y'}"> 입금후</c:if>
				 	<c:if test="${list[0].deli_stat == 'A'}"> 배송준비중</c:if>
				 	<c:if test="${list[0].deli_stat == 'B'}">
				 	<a class="deli" href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list[0].invoice_num}" target="_blank">배송중</a>
				 	</c:if>
				 	<c:if test="${list[0].deli_stat == 'C'}">
				 	<a class="deli"href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=${list[0].invoice_num}" target="_blank">배송완료</a>
				 	</c:if>
				 </td>
			 </tr> 
		 </table> 
	</div> 
	<div style='margin-top:30px;'> 	
		 <table>
		 <tr>
			 <td style='width:150px;'> 
				 <a href='/team_Bling/Product/detail.do?pidx=${list[0].pidx}'><img class='image_main' src='${cPath}/resources/image/${list[0].main}'></a> 	
			 </td> 	
			 <td style='width:300px;'> <a href='/team_Bling/Product/detail.do?pidx=${list[0].pidx}' class='title4'>
				 <span><b><c:out value="${list[0].pname}"/></b></span></a>
				 <c:forEach items="${list}" var="option">
				 <c:set var = "oname1" value ="${fn:split(option.oname, '+')[0]}" />
				 <br><span><c:out value="${oname1}"/></span>(수량: <span><c:out value="${option.quantity}"/></span>)
				 </c:forEach>	
			 </td> 	
		 </tr>
		 </table> 
	</div> 
	<div style='margin-top:30px;'> 
	<span class='title'>결제금액 : </span><span class='title'><c:out value="${list[0].tot_price}"/></span> 
	</div><br><br>
	<div>
		취소 / 교환 / 반품은 고객센터에 문의해 주세요.
	</div>
</div><br><br><br>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
	
</body>
<script>

	
	
</script>
</html>