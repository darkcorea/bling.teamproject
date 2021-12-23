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
<title>나의 문의 내역</title>
<style>
	
	section{
		max-width:1008px;
		margin:  0px auto;
	}
	#secTitle{
			font-size: 30px;
			margin: 100px 0px 20px 0px;
		}
	.pointer{
		cursor: pointer;
		text-decoration-line: none;
		color: #854040;
		font-weight: bold ;
		padding-left:15px;
	}
	.title{
		font-size:25px;
		font-weight:900;
		width:60%;
		
	}
	.title1{
		font-size:23px;
		font-weight:900;
		width:100%;
		
	}
	/* 클래스 붙이면 문자 가운데 */
	.text_center{
		text-align:center;
	}
	.text_left{
		text-align:left;
	}
	.text_center1{
		text-align:right;
	}
	/* 조회문자 */
	.title2{
		text-decoration: none;
		color:black;
	}	
	.title2:hover{
		color:#C4C4C4;
	}
	/* 조회문자 */
	.title3{
		text-decoration: none;
		color:#d08686;
	}	
	.sub{
		float: left;
		width:40%;
		margin-left:5%;
		margin-right:5%;
		text-align:center;
	}
	.border1{
		border-bottom: 8px solid rgb(0 0 0 / 20%);
	}
	.tr1{
		border-top: 1px solid #444444;
		height:50px;
	}
	
	.tr2{
		border-top: 1px solid #CB7878;
		height:50px;
	}
	.tr4{
		border-top: 1px solid #CB7878;
		border-bottom: 1px solid #CB7878;
	}
	th{
		padding-left:30px;
		font-size:17px;
	}
	#btndiv{
		
		text-align:right;
	}
	.t{
		margin:5px;
	}
	#question_btn{
		background-color: #CB7878;
		border: 1px solid #CB7878;
		width:130px;
		float: right;
	}
	.page-item {
		padding: 0px;
	}
</style>
</head>
<body>
<header>
<%@ include file="/WEB-INF/views/header.jsp" %><BR>
</header>
<section>
	<div class="container">
 
 
		<div class="row">
			<!-- nav바   -->
			<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
				<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
			</div>
			
			<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9">
			<div class="title text_center1">나의 문의 내역</div><br>
				<div class="title1">
					<div class="sub border1"><span class="title3">1:1 문의</span></div>
					<div class="sub"><a href="/team_Bling/Customer/myquestion_product.do?page=1" class="title2"><span>제품 문의</span></a></div>
				</div>
				<br><br><br>
				<div id="content">
				<table class="table">
					<thead>
						<tr class="text_center">
							<th>번호</th>
							<th style='width:160px;'>유형</th>
							<th>제목</th>
							<th style='width:150px;'>작성일</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${list}" var="list">
						<tr style="vertical-align:middle;">
							<td class="text_center"><c:out value="${list.rownum}"/></td>
							<c:set var="category" value="${list.category}" />
								<td class="text_center">
								<c:choose>
								    <c:when test="${category eq 'A'}">
								       배송문의
								    </c:when>
								    <c:when test="${category eq 'B'}">
								        교환환불취소문의
								    </c:when>
								    <c:when test="${category eq 'D'}">
								        교환신청
								    </c:when>
								    <c:when test="${category eq 'E'}">
								        환불신청
								    </c:when>
								    <c:when test="${category eq 'F'}">
								        취소신청
								    </c:when>
								    <c:otherwise>
								        기타
								    </c:otherwise>
								</c:choose>
								</td>
							<td class="text_left">
								<a class="pointer" onclick="detail(${list.qidx})">
									<c:if  test="${list.depth == 1}">
									<span>
										<i class='bi bi-arrow-return-right'></i>
									</span>
									</c:if>
									<c:out value="${list.title}"/>
								</a>
							</td>
							<td class="text_center">
								<c:set var="rdate" value="${list.rdate}"/>
								<c:set var="date" value="${fn:substring(rdate,0,10)}"/>
								<c:out value="${date}"/>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						
						<c:if test="${pm.prev == true}">
						<li class='page-item'>
						<c:set var="prev" value="${pm.startPage -1}"/>
							<a class='page-link' aria-label='Previous' href="/team_Bling/Customer/my_qestion.do?page=${prev}">
								<span aria-hidden='true' class='pointer' >&laquo;</span>
							</a>
						</li>
						</c:if>
						<c:set var="page" value="${pm.scri.page}"/>
						<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
							<c:if test = "${pageNum == page}">
							<li class="page-item active">	
								<a class="page-link pointer" href="/team_Bling/Customer/my_qestion.do?page=${pageNum}">
									<c:out value="${pageNum}"/>
								</a>
							</li>
							</c:if>
							<c:if test = "${pageNum != page}">
							<li class="page-item">	
								<a class="page-link" href="/team_Bling/Customer/my_qestion.do?page=${pageNum}">
									<c:out value="${pageNum}"/>
								</a>
							</li>
							</c:if>
						</c:forEach>
						
						<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
						<c:if test="${pm.next && pm.endPage > 0}">
						<li class='page-item'>
							<a class='page-link' aria-label='Next' href="/team_Bling/Customer/my_qestion.do?page=${pm.endPage + 1}">
								<span aria-hidden='true' class='pointer'>&raquo;</span>
							</a>
						</li>
						</c:if>
					</ul>
				</nav>
				</div>
				<button type="button" class="btn btn-danger" id="question_btn" onclick="location.href='/team_Bling/Customer/question.do'">문의하기</button>
				<br><br><br>
			</div>
		</div>
	</div>
</section>

<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</footer>
</body>
<script>
	function detail(qidx){
		$.ajax({
			url:"/team_Bling/Customer/myquestion_detail.do",
			type:"POST",
			data:{"qidx":qidx},
			dataType:"json",
			success:function(data){
				if(data.oname==null){
					data.oname = "";
					data.pname = "";
				}
				var str = "";
				str += "<table>";
				str += "<tr class='tr1'>";
				str += "<th style='width:180px;'>제목</th>";
				str += "<td style='width:550px;'>"+data.title+"</td>";
				str += "</tr>";
				str += "<tr class='tr2'>";
				str += "<th>작성일</th>";
				str += "<td>"+data.rdate.substr(0, 10)+"</td>";
				str += "</tr>";
				str += "<tr class='tr2'>";
				str += "<th>문의 상품명</th>";
				str += "<td>"+data.pname+"<br>"+data.oname+"<span id='etc'></span></td>";
				str += "</tr>";
				str += "<tr class='tr4'>";
				str += "<th>본문</th>";
				str += "<td style='height:300px;'>"+data.content+"</td>";
				str += "</tr>";
				str += "</table><br><br>";
				str += "<div id='btndiv'>";
				str += "<button class='btn btn-secondary t' onclick='linkFn(); return false;'>돌아가기</button>";
				str += "<button class='btn btn-secondary' onclick='delFn("+data.originqidx+")'>삭제 하기</button>";
				str += "</div>";
				$("#content").html(str);
				if(data.count>1){
					$("#etc").html(" 등 "+data.count+"개");
				}
			},
			error:function(){
				alert("실행오류");
			}
		});
		
	}
	
	function linkFn(){
		location.href="/team_Bling/Customer/my_qestion.do?page=1"; 
	}
	function delFn(originqidx){
		$.ajax({
			url:"/team_Bling/Customer/myquestion_delete.do",
			type:"POST",
			data:{"originqidx":originqidx},
			dataType:"json",
			success:function(data){
				alert("삭제되었습니다");
				linkFn();
			},
			error:function(){
				alert("실행오류");
			}
		});
	}
</script>
</html>