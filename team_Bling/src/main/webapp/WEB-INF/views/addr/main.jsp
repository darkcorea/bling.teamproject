<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송지목록</title>
			<!-- Bootstrap core CSS -->
		  		<link href="/resources/css/bootstrap.css" rel="stylesheet">
		  	<!-- Bootstrap core JavaScript -->
		  		<script src="/resources/js/jquery-3.6.0.min.js"></script>
				<script src="/resources/js/bootstrap.bundle.js"></script>
			<!-- SweetAlert2(alert,modal창) -->
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<!-- 주소 검색 api -->
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
		<style>
		/* 본문 css */
		#dateBtn1{
			background-color: #CB7878;
			border: none;
			color: #ffffff;
			padding: 6px 3px;
		}
		#dateBtn1:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 1px solid #CB7878;
			padding: 6px 3px;
		}
		th{
			margin-left: auto;
  			margin-right: auto;
		}
		.btn-light{
			padding:3px;
		}
		.page-item{
			padding:0;
		}
		/* 모달창 CSS */
		.modal {
        	text-align: center;
		}
		.modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
		}
		.modal-header{
			background-color: #CB7878;
		}
		.modal-title{
			color: #ffffff;
			font-size: 30px;
			position: relative;
			left: 150px;
		}
		#form{
			width:430px;
			height:350px;
			margin: 0 auto;
		}
		.red{
			color:red;
		}
		.modal-backdrop{
			background-color: #000000 !important;
			opacity: 0.3 !important;
		}
		</style>
	</head>
	<body>
	<!-- header -->
		<header>
			<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
		</header>
	
		
		<section>
			<article>
				<div class="container">
					<div class="row">
					
						<!-- nav바   -->
						<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
							<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
						</div>
						
						<!-- 본문 -->
						<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
							<h2 >배송지 목록</h2>
							<button type="button" class="btn" id="dateBtn1" style="float: right;" data-bs-toggle="modal" data-bs-target="#exampleModal">배송지 등록</button>
							<br>
							<br>
							
							<table class="table">
							  <thead>
							    <tr class='text-center'>
							      <th scope="col">배송지<br>수령인</th>
							      <th scope="col">주소</th>
							      <th scope="col">연락처</th>
							      <th scope="col">수정/삭제</th>
							    </tr>
							  </thead>
							  <tbody>
							    <!-- 기본배송지가 있으면  -->
							    <c:if test="${one[0].addr_name ne null }">
							    	<c:if test="${page eq 1 }">
								    	<tr>
								    		<td scope="row" align="center" valign="middle">
										      	<span style="font-weight: bold;">${one[0].addr_name}</span><br>
										      	<span>${one[0].name }</span><br>
										      	<div style="border:1px solid #CB7878; border-radius: 2em;">기본배송지</div>
									      	</td>
									    	<td>
										      	<span class="text-black-50">${one[0].zip_code}</span><br>
										      	<span>${one[0].addr1 }</span><br>
										      	<span>${one[0].addr2 }</span>
									    	</td>
									    	<td align="center" valign="middle">${one[0].rphone}</td>
									    	<td align="center" valign="middle">
										      	<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modify" onclick="modify(${one[0].addr_idx })">수정</button>
										      	<button type="button" class="btn btn-light"  onclick="location.href='/Addr/delete.do?addr_idx=${one[0].addr_idx }'">삭제</button>
									    	</td>
									    </tr>
								    </c:if>
							    </c:if>
							    
							    <!-- 기본배송지가 아닌 것들 -->
							    <c:forEach var="list" items="${list}">
							    	<tr>
								    	<td scope="row" align="center" valign="middle">
								      		<span style="font-weight: bold;"> ${list.addr_name }</span><br>
								     		${list.name}
								    	</td>
								    	<td>
									      	<span class="text-black-50">${list.zip_code}</span><br>
									      	<span>${list.addr1}</span><br>
									      	<span>${list.addr2}</span>
								    	</td>
									    <td align="center" valign="middle">${list.rphone}</td>
									    <td align="center" valign="middle">
									      	<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modify" onclick="modify(${list.addr_idx })">수정</button>
									      	<button type="button" class="btn btn-light" onclick="location.href='/Addr/delete.do?addr_idx=${list.addr_idx }'">삭제</button>
									    </td>
									 </tr>
							    </c:forEach>
							  </tbody>
							</table>
							
					
							<nav aria-label='Page navigation example'>
							    	<ul class='pagination justify-content-center'>
							    		<li class='page-item'>
							    			<c:if test="${pm.prev == true }">
							    				<a class='page-link' aria-label='Previous' href="/Addr/main.do?page=${pm.startPage-1}">
							    					<span aria-hidden='true' class='pointer' >&laquo;</span>
							    				</a>
							    			</c:if>
							    		</li>
						    			<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
						    				<c:if test="${pageNum == page }">
							    				<li class='page-item active'>
							    					<a class='page-link pointer' href="/Addr/main.do?page=${pageNum}">
							    						<c:out value="${pageNum}"/>
							    					</a>
							    				</li>
						    				</c:if>
						    				<c:if test="${pageNum != page }">
							    				<li class='page-item'>
							    					<a class='page-link pointer' href="/Addr/main.do?page=${pageNum}">
							    						<c:out value="${pageNum}"/>
							    					</a>
							    				</li>
						    				</c:if>
										</c:forEach>
										<li class='page-item'>
											<c:if test="${pm.next && pm.endPage > 0}">
												<a class='page-link' aria-label='Next' href="/Addr/main.do?page=${pm.endPage + 1}">
													<span aria-hidden='true' class='pointer'>&raquo;</span>
												</a>
											</c:if>
							    		</li>
							    	</ul>
							 </nav>
						</div>
					</div>
				</div>
			</article>
		</section>
		
		<br>
		<br>
		<br>
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>		
		
		<!-- 주소록 등록 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">배송지 등록</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <div id="form">
			      		<hr/>
				        	<h4>배송지 상세 정보</h4>
				        <hr/>
				        
				        <table style="margin-left: auto; margin-right: auto;" width="430">
				        	<tr>
				        		<td>
				        			<h5>배송지명<span class="red">*</span></h5>
				        		</td>
				        		<td>
				        			<input type="text" id="addr_name" style="width:310px;height:30px;" placeholder="예시)집, 직장" >
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<h5>수령인<span class="red">*</span></h5>
				        		</td>
				        		<td>
				        			<input type="text" id="name" style="width:310px;height:30px;">
				        		</td>
				        	</tr>
				        	<tr>
				        		<td rowspan="3" valign="top" style="margin-top:3px">
				        			<h5>주소<span class="red">*</span></h5>
				        		</td>
				        		<td>
				        			<input type="text" id="zip_code" style="width:220px;height:30px;" >
				        			<input type="button" class="button id" value="주소검색" onclick="findmyaddr()">
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<input type="text" id="addr1" style="width:310px;height:30px;">
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<input type="text" id="addr2" style="width:310px;height:30px;" placeholder="상세주소(동,호수)를 적어주세요">
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td>
				        			<h5>연락처<span class="red">*</span></h5>
				        		</td>
				        		<td>
				        			<input type="text" id="rphone" style="width:310px;height:30px;" placeholder="- 를 뺀 숫자만 적어주세요">
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<h5></h5>
				        		</td>
				        		<td>
				        			<div class="form-check">
									  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkbasic">
									  <label class="form-check-label" for="flexCheckChecked">
									    	기본배송지로 설정
									  </label>
									</div>
				        		</td>
				        	</tr>
			      		
		        		</table>
		        
			      </div>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="address()">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<!-- 주소록 수정 모달 -->
		<div class="modal fade" id="modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">배송지 등록</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			      <div id="form">
			      		<hr/>
				        	<h4>배송지 상세 정보</h4>
				        <hr/>
				        
				        <table style="margin-left: auto; margin-right: auto;" width="430">
				        	<tr>
				        		<td>
				        			<h5>배송지명<span class="red">*</span></h5>
				        		</td>
				        		<td id="addr_name_value">
				        			<input type='text' id='addr_name1' style='width:310px;height:30px;' placeholder='예시)집, 직장' >
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<h5>수령인<span class="red">*</span></h5>
				        		</td>
				        		<td id="name_value">
				        			<input type='text' id='name1' style='width:310px;height:30px;' >
				        		</td>
				        	</tr>
				        	<tr>
				        		<td rowspan="3" valign="top" style="margin-top:3px">
				        			<h5>주소<span class="red">*</span></h5>
				        		</td>
				        		<td id="zip_code_value">
				        			<input type='text' id='zip_code1' style='width:220px;height:30px;'>
				        			<input type='button' class='button id' value='주소검색' onclick='findmyaddr()'>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td id="addr1_value">
				        			<input type='text' id='addr11' style='width:310px;height:30px;'>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td id="addr2_value">
				        			<input type='text' id='addr21' style='width:310px;height:30px;' placeholder='상세주소(동,호수)를 적어주세요' >
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td>
				        			<h5>연락처<span class="red">*</span></h5>
				        		</td>
				        		<td id="rphone_value">
				        			<input type='text' id='rphone1' style='width:310px;height:30px;' placeholder='- 를 뺀 숫자만 적어주세요'>
				        			<input type='hidden' id='addr_idx1'>
				        			<input type='hidden' id='midx1' >
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<h5></h5>
				        		</td>
				        		<td>
				        			<div class="form-check">
									  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkbasic1">
									  <label class="form-check-label" for="flexCheckChecked">
									    	기본배송지로 설정
									  </label>
									</div>
				        		</td>
				        	</tr>
			      		
		        		</table>
		        
			      </div>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="Remodify()">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		
		
		<script>
			//주소 찾기 api
			function findmyaddr(){
				new daum.Postcode({
			        oncomplete: function(data) {
			            var roadAddr = data.roadAddress; // 도로명 주소 변수
			            var jibunAddr = data.jibunAddress; // 지번 주소 변수
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('zip_code').value = data.zonecode;
			            document.getElementById('zip_code1').value = data.zonecode;
			            if(roadAddr !== ''){
			                document.getElementById("addr1").value = roadAddr;
			                document.getElementById("addr11").value = roadAddr;
			            } 
			            else if(jibunAddr !== ''){
			                document.getElementById("addr1").value = jibunAddr;
			                document.getElementById("addr11").value = roadAddr;
			            }
			        }
			    }).open();
			}
			
			//주소 저장
			function address(){
				var addr_name = $('#addr_name').val();
				var name = $('#name').val();
				var zip_code = $('#zip_code').val();
				var addr1 = $('#addr1').val();
				var addr2 = $('#addr2').val();
				var rphone = $('#rphone').val();
				var basic_addr = 0;
				
				if($("input:checkbox[name=checkbasic]").is(":checked") == true) {
					basic_addr = 1;
				}
				
				$.ajax({
					url:"/Addr/insert.do",
					type:"post",
					data:{"addr_name":addr_name,"name":name,"zip_code":zip_code,
						"addr1":addr1,"addr2":addr2,"rphone":rphone,"basic_addr":basic_addr},
					ContentType:"json",
					success:function(data){
						window.location.replace("/Addr/main.do?page=1");
					},error:function(){
						alert("주소저장에러!");
					}
				});
			}
			
			//주소 정보 가져오기
			function modify(addr_idx){
				console.log(addr_idx); 
				$.ajax({
					url:"/Addr/modify.do",
					type:"post",
					data:{"addr_idx":addr_idx},
					ContentType:"json",
					success:function(data){
						
						$('#addr_name1').val(data.addr_name);
						$('#name1').val(data.name);
						$('#zip_code1').val(data.zip_code);
						$('#addr11').val(data.addr1);
						$('#addr21').val(data.addr2);
						$('#rphone1').val(data.rphone);
						$('#addr_idx1').val(data.addr_idx);
						$('#midx1').val(data.midx);
						
					},error:function(){
						
					}
				 });
			}
			
			//주소 수정하기
			function Remodify(){
				var midx = $('#midx1').val()
				var addr_idx = $('#addr_idx1').val();
				var addr_name = $('#addr_name1').val();
				var name = $('#name1').val();
				var zip_code = $('#zip_code1').val();
				var addr1 = $('#addr11').val();
				var addr2 = $('#addr21').val();
				var rphone = $('#rphone1').val();
				var basic_addr = 0;
				
				if($("input:checkbox[name=checkbasic1]").is(":checked") == true) {
					basic_addr = 1;
				}
				
				$.ajax({
					url:"/Addr/Remodify.do",
					type:"post",
					data:{"addr_idx":addr_idx,"midx":midx,"addr_name":addr_name,"name":name,"zip_code":zip_code,
						"addr1":addr1,"addr2":addr2,"rphone":rphone,"basic_addr":basic_addr},
					ContentType:"json",
					success:function(data){
						window.location.replace("/Addr/main.do?page=1");
					},error:function(){
						alert("주소저장에러!");
					}
				});
			}
			
		</script>
	</body>
</html>