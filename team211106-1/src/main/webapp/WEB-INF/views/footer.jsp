<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.6.0.min.js"></script>
 	<script src="/js/bootstrap.bundle.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
<style>

.logo{
	 height:75px;
	 width: 77px;
}
footer {
  width: 100%;
  height: 90px;
  bottom: 0px;
/*  position: absolute; */
/*  border-top: 1px solid #c4c4c4; */
  padding-top: 15px;
  color: #808080;
  font-size: 11px;
}

 ul{
   list-style:none;
   padding-left:0px;
   }
ul > li {
    display: table-cell;
    box-sizing: border-box;
    list-style:none;
   padding-left:20px;
  
}
.lo{
	width:120px;
}
.company{
	width:278px;
}
.exchange,.account,.customer{
	 width: 240px;
}
.d1{text-align: center;}
.d2{display: inline-block;}
.info{text-align: left;}
#tel{font-size:25pt;
	color:black;
}
.time{font-size:10pt;}
.num{font-size:14pt;
	color:black;}
.ex{
	font-size:10pt;
}
</style>
</head>
<body>

	<footer>
        <div class="d1">
        	<div class="d2">
        	<ul>
        		<li class="lo"><img src="/resources/simage/logo1.png" alt="" class="logo"></li>
        		<li class="company">
        			<div class="info">
        			<h5>회사 정보</h5>
        			<p>상호 : (주)블링</p>
        			<p>대표 : 유광영</p>
        			<p>사업자틍록번호 : 105-12-34567</p>
        			<p>주소 : 전라북도 전주시 덕진구 백제대로 572 5층</p>
        			<p>개인정보관리 책임자 : 유광영</p>
        			<p>이메일 : bling@naver.com</p>
        			</div>
        		</li>
        		<li class="account">
        		<div class="info">
        		<h5>입금 은행 안내</h5>
        			
        			<p class="time">은행명 : 이젠은행</p>
        			<p class="time">예금주 : (주)블링</p>
        			<p class="num">032123-04-003344</p>
        			</div>
        		</li>
        		<li class="exchange">
        		<div class="info">
        		<h5>교환&#183;반품 주소</h5>
        			
        			<p class="ex">전주시 덕진구 백제대로 572 5층 (주)블링</p>
        			<p class="ex">우편번호 : 54930</p>
        			<p class="ex">담당자 : 이은정</p>
        			<p class="ex">연락처 : 010-1234-5678</p>
        			</div>
        		</li>
        		<li class="customer">
        		<div class="info">
        		<h5>고객센터</h5>
        			
        			<p id="tel">1588-0001</p>
        			<p class="time">AM 10:00 ~ PM 05:00</p>
        			<p class="time">점심시간 PM 12:00 ~ 1:00</p>
        			<p class="time">토/일/공휴일 휴무</p>
        			</div>
        		</li>
        	</ul>
        	</div>
        </div>
	</footer>

</body>
</html>