<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항등록</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.bundle.js"></script>
	<script src="/js/summernote/summernote-lite.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/css/bootstrap.css">

		<style>
			div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
			a {text-decoration:none;}
			
			.quickmenu {position:absolute;width:120px;height:500px;top:20%;margin-top:-50px;left:50px;background:#cb7878;padding:20px;}
			.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;}
			.quickmenu ul li {float:left;width:100%;text-align:center;display:inline-block;*display:inline;}
			.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:30px;text-align:center;color:#fff;font-size:12pt;}
			.quickmenu ul li a:hover {color:#000;}
			.quickmenu ul li:last-child {border-bottom:0;}
			
			.content {position:relative;min-height:1000px;}
			
		</style>
	</head>
	<body>
		<header>
			<%@ include file="/WEB-INF/views/admin/ad_header.jsp" %><BR>
		</header>
	<!-- 옆 nav 바 -->
		<div class="d1">
			<div class="quickmenu">
				  <ul>
				 	<li><a href="#">문의게시판</a></li>
				    <li><a href="/Ad_board/board.do?page=1&type=T">공지&문의</a></li>
				    <li><a href="#">이벤트</a></li>
				    <li><a href="#">리뷰관리</a></li> 
				  </ul>
			</div>
		</div>
		
	<!-- 공지사항 등록 -->
		
		<h2 class="text-center">공지사항 등록</h2> <br>
	
		<form method="post" action="/Ad_board/confirm.do" id="frm_write" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th class="head">제목</th>
					<td colspan="3">
						<input type="text" name="subject" id="subject" style="width:941px ; height:30px">
					</td>
				</tr>
				<tr>
					<th class="head">타입</th>
					<td colspan="3">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="type" id="type" value="N">
						  <label class="form-check-label" for="inlineRadio1">기본(N)</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="type" id="type" value="S">
						  <label class="form-check-label" for="inlineRadio2">중요공지사항(S)</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="type" id="type" value="Q">
						  <label class="form-check-label" for="inlineRadio3">고객센터(Q)</label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="head">내용	</th>
					<td colspan="3" height="294.8">
						<textarea id="summernote" name="contents" id="summernote"></textarea>
						<input type="hidden" name="imges" id="imges">
					</td>
				</tr>
				<tr>
					<th class="head">파일</th>
					<td colspan="3">
						<input type="file" name="file" id="files">
					</td>
				</tr>
			</table>
			
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			   <input type="submit" class="btn btn-primary" value="등록하기">
			  <button class="btn btn-outline-secondary" type="button" onclick="location.href='/Ad_board/board.do?page=1&type=T'">취소하기</button>
			</div>
			
           	<br>
            <br>
            <br>
           	
		</form>
		
	</body>
	<script>
		var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 표만들기
    		    ['table', ['table']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    ['para', ['paragraph']],
    		    // 줄간격
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']],
    		    // 코드보기, 확대해서보기, 도움말
    		    ['view', ['codeview','fullscreen']]
    		  ],
    		  // 추가한 글꼴
    		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    		 // 추가한 폰트사이즈
    		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
        
        
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/Ad_board/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
					$('#imges').val(data.imges);
				}
			});
		}
	</script>
</html>