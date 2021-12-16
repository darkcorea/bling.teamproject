<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
	
		<style>
			/* 전반적인 크기에 관한 설정 */
			section, header {
				max-width:1008px;
				margin:  0px auto;
			}
			.page-item{
				padding:0;
			}
			#research_question_btn{
				background-color: #CB7878;
				border: 1px solid #CB7878;
				width:80px;
				float: right;
				color:white;
			}
			#find{
				width:380px;
				height:40px;
			}
			#detail_rdate{
				text-align: right;
			}
		</style>
	</head>
	<body>
		<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><BR>
		</header><br>
		
		<section>
			<div>
				<h2 class='text-center'>${detail.subject }</h2>
				<div id="detail_rdate">
					${detail.rdate }
				</div>
				<hr>
				<table class="table">
					<tr>
						<td colspan="2">
							${detail.contents}
						</td>
					</tr>
					
					<c:if test="${detail.imgfile != null}">
					<tr>
						<td colspan="2">
							<a href="${cPath}/Notice/fileDownLoad.do?fileName=${detail.imgfile}">
							파일 다운로드 : 
							<i class="bi bi-file-earmark-arrow-down"></i>
							${detail.imgfile}
							</a>
						</td>
					</tr>
					</c:if>
					
				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/team_Bling/Notice/notice_main.do?page=1&type=T'">목록가기</button>
				</div>
			</div>
			<br>
		</section>
		<footer>
			<%@ include file="/WEB-INF/views/footer.jsp" %>
		</footer>	
	</body>
</html>