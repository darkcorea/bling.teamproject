<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
	<!-- SweetAlert2(alert,modal창) -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	<script>
		function orderInfo(){
			console.log("orderInfo 실행됨");
			var str = "";
			
			if(${recentOrder == []}){
				str += "<tr><td colspan='7'><span id='noneOrder'>최근 주문내역이 없습니다.</span></td></tr>";
			} else{
				str += "<c:forEach items='${recentOrder}' var='ro'>";
				
				str += "	<tr id='tableRow'>";
				str += "		<td id='td1'><span id='t1'>${ro.rdate}</span></td>";
				str += "		<td id='td2'><span id='t2'>${ro.order_idx}</span></td>";
				str += "<c:if test='${ro.cuidx == 0}'>";
				str += "		<td id='td3'><span id='t3'><a id='prodLink' href='/team_Bling/Product/detail.do?pidx=${ro.pidx}'>${ro.pname} <br> ${ro.oname}</a></span></td>";
				str += "</c:if>";
				str += "<c:if test='${ro.cuidx != 0}'>";
					str += "		<td id='td3'><span id='t3'><a id='prodLink' href='/team_Bling/Custom/list.do'>${ro.pname} / ${ro.oname}</a></span></td>";
				str += "</c:if>";
				str += "		<td id='td4'><span id='t4'><fmt:formatNumber value='${(ro.saleprice+ro.addprice)*ro.quantitySum}' pattern='#,###' />원</span></td>";
				str += "		<td id='td5'><span id='t5'>${ro.quantitySum}</span></td>";
				
				//	\(backslash)를 붙이면 해당 문자로만 인식한다. -> \"는 문자열을 나타내는 큰따옴표의 역할만 할 뿐, 쿼리문을 구분짓는 역할은 하지 않는다.
				str += "		<c:if test='${ro.deli_stat == \"N\"}'>";
				str += "			<c:if test='${ro.cancel == \"Y\"}'>";
				str += "				<td id='td6'><span id='t6'>취소완료</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.cancel==\"N\" && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>취소 진행중</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.cancel==null && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>결제대기</span></td>";
				str += "			</c:if>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"Y\"}'>";
				str += "			<c:if test='${ro.cancel == \"Y\"}'>";
				str += "				<td id='td6'><span id='t6'>취소완료</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.cancel==\"N\" && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>취소 진행중</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.cancel==null && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>결제완료</span></td>";
				str += "			</c:if>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"A\"}'>";
				str += "			<td id='td6'><span id='t6'>상품준비중</span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"B\"}'>";
				str += "			<td id='td6'><span id='t6'>배송중</span></td>";
				str += "		</c:if>";
				str += "		<c:if test='${ro.deli_stat == \"C\"}'>";
				str += "			<c:if test='${ro.refund == \"N\" && ro.cancel==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>반품 진행중</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.refund == \"Y\" && ro.cancel==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>반품완료</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.exchange == \"N\" && ro.cancel==null && ro.refund==null}'>";
				str += "				<td id='td6'><span id='t6'>교환 진행중</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.exchange == \"Y\" && ro.cancel==null && ro.refund==null}'>";
				str += "				<td id='td6'><span id='t6'>교환완료</span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.cancel==null && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td6'><span id='t6'>배송완료</span></td>";
				str += "			</c:if>";
				str += "		</c:if>";
				
				/* 배송완료 후 7일 이전 리뷰 작성 가능 */
				str += "		<c:if test='${ro.date_differ <= 7}'>";
				/* 7일 이내 리뷰 내용이 있다면 -> 리뷰 확인 */
				str += "			<c:if test='${ro.contents != null}'>";
				str += "				<td id='td7'><span id='t7'><input id='reviewWrite2' data-bs-toggle='modal' data-bs-target='#staticBackdrop2' onclick='reviewDetail(${ro.ridx})' value='리뷰 확인' readonly></span></td>";
				str += "			</c:if>";
				/* 7일 이내 리뷰 내용이 없고 배송완료(C) 상태가 아니라면 -> 공백 */
				str += "			<c:if test='${ro.contents == null && ro.deli_stat != \"C\"}'>";
				str += "				<td id='td7'></td>";
				str += "			</c:if>";
				/* 7일 이내 리뷰 내용이 없고 배송완료(C) 상태 & 취소/반품/교환 상태가 아니라면 -> 리뷰 작성 */
				str += "			<c:if test='${ro.contents == null && ro.deli_stat == \"C\" && ro.cancel==null && ro.refund==null && ro.exchange==null}'>";
				str += "				<td id='td7'><span id='t7'><input id='reviewWrite1' data-bs-toggle='modal' data-bs-target='#staticBackdrop1' onclick='detailIdx(${ro.detail_idx})' value='리뷰 작성' readonly></span></td>";
				str += "			</c:if>";
				/* 7일 이내 리뷰 내용이 없고 배송완료(C) 상태 & 취소/반품/교환 중 1가지 상태라면 -> 공백 */
				str += "			<c:if test='${ro.contents == null && ro.deli_stat == \"C\" && ((ro.cancel==\"N\" || ro.cancel==\"Y\") || (ro.refund==\"N\" || ro.refund==\"Y\") || (ro.exchange==\"N\" || ro.exchange==\"Y\"))}'>";
				str += "				<td id='td7'></td>";
				str += "			</c:if>";
				str += "		</c:if>";
				/* 배송완료 후 7일 이후 리뷰 작성 불가 */
				str += "		<c:if test='${ro.date_differ > 7}'>";
				str += "			<c:if test='${ro.contents == null}'>";
				str += "				<td id='td7'><span id='t7'><input id='reviewWrite3' value='구매 확정' readonly></span></td>";
				str += "			</c:if>";
				str += "			<c:if test='${ro.contents != null}'>";
				str += "				<td id='td7'><span id='t7'><input id='reviewWrite2' data-bs-toggle='modal' data-bs-target='#staticBackdrop2' onclick='reviewDetail(${ro.ridx})' value='리뷰 확인' readonly></span></td>";
				str += "			</c:if>";
				str += "		</c:if>";
				str += "	</tr>";
				str += "</c:forEach>";
				
				str += "<br>";
			}
			document.getElementById("formDiv").innerHTML = str;
		}
		
		
		
		function detailIdx(detail_idx){
			//console.log(event.currentTarget.value);
			
			$.ajax({
				url: "/team_Bling/MyPage/detailIdx.do",
				type: "post",
				data: "detail_idx="+detail_idx,
				ContentType: "json",
				success: function(data){
					console.log("detail_idx : "+detail_idx);
					
				},
				error: function(){
					alert("detail_idx 넘기기 에러");
				}
			});
		}
		
		
		function reviewDetail(ridx){
			$.ajax({
				url: "/team_Bling/MyPage/reviewDetail.do",
				type: "post",
				data: "ridx="+ridx,
				ContentType: "json",
				success: function(data){
					console.log("ridx에 해당하는 리뷰내용 가져오기");
					console.log(data);
					let prodData = data.rvData;
					
					let str1 = "";
					let str2 = "";
					let str3 = "";
					let str4 = "";
					let oname = prodData.oname.split("+")[0].trim();
					let str5 = "";
					let grade = prodData.grade;
					let star1 = "<i class='bi bi-star'></i>";
					let star2 = "<i class='bi bi-star-fill'></i>";
					 
					
					
					str1 += "<img id='prodImg' src='"+data.imgPath+"\/"+prodData.main+"'>";
					str2 += "<img class='rvImg' src='"+data.path+"\/"+prodData.image1+"'>";
					str3 += "<img class='rvImg' src='"+data.path+"\/"+prodData.image2+"'>";
					str4 += "[옵션] "+oname;
					
					if(grade == 1){
						str5 += 	star2+" "+star1+" "+star1+" "+star1+" "+star1;	
					}
					else if(grade == 2){
						str5 += 	star2+" "+star2+" "+star1+" "+star1+" "+star1;	
					}
					else if(grade == 3){
						str5 += 	star2+" "+star2+" "+star2+" "+star1+" "+star1;	
					}
					else if(grade == 4){
						str5 += 	star2+" "+star2+" "+star2+" "+star2+" "+star1;	
					}
					else if(grade == 5){
						str5 += 	star2+" "+star2+" "+star2+" "+star2+" "+star2;	
					}
					

					
					document.querySelector("div[id='prodName']").innerHTML = prodData.pname;
					document.querySelector("div[id='prodQty']").innerHTML = "[수량] "+prodData.quantity+"개";
					document.querySelector("textarea[id='textArea2']").innerHTML = prodData.contents;
					
					
					document.querySelector("div[id='prodPic']").innerHTML = str1;
					if(prodData.image1 != null && prodData.image2 != null){
						document.querySelector("div[id='rvPic1']").innerHTML = str2;
						document.querySelector("div[id='rvPic2']").innerHTML = str3;
					}else if(prodData.image1 != null && prodData.image2 == null){
						document.querySelector("div[id='rvPic1']").innerHTML = str2;
					}else if(prodData.image1 == null && prodData.image2 == null){
						
					}
					
					document.querySelector("div[id='prodOption']").innerHTML = str4;
					document.querySelector("div[id='starRating']").innerHTML = str5;
					document.querySelector("button[id='delBtn']").value = ridx;
				},
				error: function(){
					alert("ridx 넘기기 에러");
				}
			});
			
		}
		
		
		function uploadFile(){
			const upInput = document.querySelector("input[name='uploadBtn']");
			let files = upInput.files;
			console.log("files : "+files);
			
			let image1 = files[0];
			let image2 = files[1];
			console.log("image1 : "+image1);
			console.log("image2 : "+image2);
			
			let formData = new FormData();
			formData.append("image1", image1);
			formData.append("image2", image2);
			
			$.ajax({
				url: "/team_Bling/MyPage/upload.do",
				type: "post",
				data: formData,
				// processData: true=> get방식, false => post방식
                dataType: "text",
                // contentType: true => application/x-www-form-urlencoded, 
                //                false => multipart/form-data
                processData: false,
                contentType: false,
                success: function(data){
                	if(data == "true"){
                		console.log("파일 업로드 성공");
                		//같은 파일을 다시 선택할 경우 input value가 변경된게 아니기 때문에 change 이벤트가 발생되지 않는다.
                		//파일이 선택된 후 처리해줄 로직이 끝난 뒤에, 아래와 같이 input 요소의 value 값을 비워주면 된다.
                		upInput.value = '';
                	}
                	else if(data == "false"){
                		console.log("지정된 이미지 파일이 아닙니다.");
                		console.log("파일 업로드 실패");
                		Swal.fire({
    						icon: 'error',
    						title: '지정된 이미지 파일이 아닙니다!',
    						text: 'jpg, jpeg, png 파일만 선택 가능합니다.',
    					});
                		delPreview(0);
                	}
                }
			});
		}
		
		
		function contentsCheck(){
			//리뷰내용 가져오기(contents)
			let textArea1 = document.querySelector("textarea").value;
			let contents = "";
			
			if(textArea1 != null){
				contents = textArea1;
				if(contents.length<10){
					contents = "";
					Swal.fire({
						icon: 'error',
						title: '내용을 입력해주세요!',
						text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
					});
				}
				else if(contents.length>500){
					contents = "";
					Swal.fire({
						icon: 'error',
						title: '내용을 입력해주세요!',
						text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
					});
				}
				else if(contents.length>=10 && contents.length<=500){
					
				}
			}
			else if(textArea1 == null){
				Swal.fire({
					icon: 'error',
					title: '내용을 입력해주세요!',
					text: '최소 10자부터 최대 500자까지 입력 가능합니다.',
				});
				console.log("내용을 입력해주세요.");
				modalReset();
				delPreview(0);
			}
			
			console.log("contentsCheck()에서 return값 : "+contents);
			return contents;
		}
		
		
		function reviewWrite(){
			//detail_idx 값 가져오기
			//console.log(event.currentTarget.value);
			//let detail_idx = event.currentTarget.value;
			
			//detail_idx 확인
			//console.log(idx);
			
			//console.log(event.currentTarget);
			//let detail_idx = event.currentTarget.value;
			
			
			//Uncaught TypeError: Cannot read properties of null (reading 'value')
			// -> JavaScript는 존재하지 않는 것의 값을 읽을 수 없어서 오류 발생
			
			//별점 value 가져오기(grade)
			let starRating = document.querySelector("input[name='rating']:checked");
			let grade = "";
			let contents = "";
			
			if(starRating != null){
				grade = starRating.value;
				console.log(grade);
				
				contents = contentsCheck();
				console.log("reviewWrite()에서 contentsCheck() 호출 후 return값 : "+contentsCheck());
				if(contents == ""){
					console.log("reviewWrite()에서 contents가 없음");
					return ;
				}
			}
			else if(starRating == null){
				Swal.fire({
					icon: 'error',
					title: '별점을 선택해주세요!',
					text: '별점은 1점부터 5점까지 선택 가능합니다.',
				});
				console.log("별점을 선택해주세요.");
				modalReset();
				delPreview(0);
			}
			
			
			$.ajax({
				url: "/team_Bling/MyPage/reviewWrite.do",
				type: "post",
				data: {"contents":contents,"grade":grade},
				success: function(data){
					$("#staticBackdrop1").modal("hide");
					Swal.fire({
						icon: 'info',
						title: '리뷰가 작성되었습니다.'
					}).then((result) => {
						if(result.isConfirmed){
							window.location.replace("/team_Bling/MyPage/main.do?page="+${pm.scri.page}+"");
						}else if (result.isDenied) {
						}
					});
				},
				error: function(){
					console.log("!!!!!리뷰작성 에러!!!!!");
				}
			});
		}
		
		
		function modalReset(){
			//document.getElementById("textArea").value = "";
			//document.getElementById("uploadBtn").value = "";
			//$("#modalForm")[0].reset();
			document.querySelector("form[id='modalForm']").reset();
		}
		
		
		
		
		function delQ(){
			let ridx = document.querySelector("button[id='delBtn']").value;
			
			Swal.fire({
				icon: 'question',
				text: '작성하신 리뷰를 정말 삭제하시겠습니까?',
				showCancelButton: true
			}).then((result) => {
				  /* Read more about isConfirmed, isDenied below */
				  if (result.isConfirmed) {
				    delReview(ridx);
				  } else if (result.isDenied) {
			   }
			});
		}
		
		function delReview(ridx){
			console.log("delReview-ridx : "+ridx);
			
			$.ajax({
				url: "/team_Bling/MyPage/delete.do",
				type: "post",
				data: {"ridx":ridx},
				ContentType: "json",
				success:function(){
					console.log("리뷰삭제 성공");
					Swal.fire('리뷰가 삭제되었습니다!', '', 'success');
					Swal.fire({
						icon: 'success',
						text: '리뷰가 삭제되었습니다!',
					}).then((result) => {
						  /* Read more about isConfirmed, isDenied below */
						  if (result.isConfirmed) {
							   window.location.replace("/team_Bling/MyPage/main.do?page="+${pm.scri.page}+"");
						  } else if (result.isDenied) {
					   }
					});
				},
				error:function(){
					console.log("리뷰삭제 에러");
				}
			});
		}
		
		//업로드할 사진 thumbnail
		//id속성.src=~ 는 되는데 class속성.src=~는 적용되지 않았음
		function preview(){
			let pic = event.target.files;
			
			if(pic.length==1){
				if($("#previewImg1").attr("src") == ""){
					console.log("preview()-사진1");
					previewImg1.src=URL.createObjectURL(pic[0]);
					//메모리 누수(?)가 있을 수 있으므로 이미지 로드 후 삭제
					previewImg1.onload = function(){
						URL.revokeObjectURL(this.src);
					}
					$("#badge1").css("display","unset");
				}else if($("#previewImg1").attr("src") != ""){
					console.log("preview()-사진2");
					previewImg2.src=URL.createObjectURL(pic[0]);
					previewImg2.onload = function(){
						URL.revokeObjectURL(this.src);
					}
					$("#badge2").css("display","unset");
				}
				//URL.revokeObjectURL(previewImg1.src);		blob 객체 image 주소 제거
				//URL.revokeObjectURL($("#previewImg1").attr("src"));	위와 동일하게 blob 객체 image 주소 제거 가능
			}
			else if(pic.length==2){
				previewImg1.src=URL.createObjectURL(pic[0]);
				previewImg2.src=URL.createObjectURL(pic[1]);
				
				$("#badge1,#badge2").css("display","unset");
				
				previewImg1.onload = function(){
					URL.revokeObjectURL(this.src);
				}
				previewImg2.onload = function(){
					URL.revokeObjectURL(this.src);
				}
			}
			
		}

		function delPreview(number){
			let num = number;
			
			if(num==1){
				$("#previewImg1").attr("src","");
				$("#badge1").css("display","none");
			}else if(num==2){
				$("#previewImg2").attr("src","");
				$("#badge2").css("display","none");
			}else if(num==0){
				$("#previewImg1").attr("src","");
				$("#badge1").css("display","none");
				$("#previewImg2").attr("src","");
				$("#badge2").css("display","none");
			}
			
			$.ajax({
				url: "/team_Bling/MyPage/cancel.do",
				type: "post",
				data: {"num":num},
				success:function(data){
					if(data=="pic1"){
						console.log("썸네일 1번 삭제 성공");
					}else if(data=="pic2"){
						console.log("썸네일 2번 삭제 성공");
					}else if(data=="all"){
						console.log("썸네일 모두 삭제 성공");
					}
				},
				error:function(){
					console.log("썸네일 삭제 에러");
				}
			});
			
		}
		
		
		function delPreview2(){
			$("#previewImg1").attr("src","");
			$("#badge1").css("display","none");
			$("#previewImg2").attr("src","");
			$("#badge2").css("display","none");
		}
		
	</script>
	
	<style>
		section{
			max-width:1008px;
			margin:  0px auto;
		}
	/* nav 메뉴 css */
		#basicInfo{
			background-color: #CB7878;
			opacity: 0.5;
			margin: 30px 0px 30px 0px;
			padding: 20px 0px 0px 15px;
			color: #ffffff;
			font-size: 20px;
			width: 190px;
			height: 130px;
		}
		#navMenu{
			margin-bottom: 40px;
		}
		#navSub{
			color: #C1B2B2;
		}
		#menuHead{
			font-weight: bold;
			font-size: 20px;
		}
		.navA{
			text-decoration: none;
			color: #C1B2B2;
		}
		.navA:hover{
			color: #CB7878;
		}
		.pa_top{
			padding-top:7px;
		}
		#myPageTitle{
			text-decoration: none;
			color: #000000;
		}
	/* nav 메뉴 css */
	
	
	/* modal */
		.modal {
	        text-align: center;
		}
		/* 모달창 배경색 */
		.modal-backdrop {
			background-color: #000000 !important;
			opacity: 0.3 !important;
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
			left: 175px;
		}
		#modalText1{
			text-align: center;
			font-weight: bold;
			font-size: 20px;
		}
		#textArea1,#textArea2{
			width: 465px;
			height: 200px;
			resize: none;
			background-color: #C4C4C4;
			opacity: 0.5;
		}
		#textArea::placeholder{
			color: #000000;
		}
		#closeBtn{
			width: 80px;
			color: #000000;
			background-color: #ffffff;
			border: 2px solid #C4C4C4;
			position: relative;
			right: 150px;
		}
		#saveBtn{
			width: 80px;
			color: #ffffff;
			background-color: #CB7878;
			border: 2px solid #CB7878;
			position: relative;
			right: 150px;
		}
		#saveBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 2px solid #CB7878;
		}
		#delBtn{
			width: 80px;
			color: #ffffff;
			background-color: #CB7878;
			border: 2px solid #CB7878;
			position: relative;
			right: 150px;
		}
		#delBtn:hover{
			color: #CB7878;
			background-color: #ffffff;
			border: 2px solid #CB7878;
		}
		#uploadDiv{
			width: 465px;
			height: 40px;
			background-color: #CB7878;
		}
		#preview{
			width: 465px;
			height: 110px;
			border: 1px dashed;
			padding: 5px;
		}
		.previewD1,.previewD2{
			display: inline-block;
			position: relative;
		}
		.previewImg{
			height: 100px;
			margin-right: 5px;
		}
		#badge1,#badge2{
			display: none;
			transform: translate(80px,0px);
			color: red;
			cursor: pointer;
		}
		#uploadBtn{
			display: none;
		}
		.fileBtn{
			width: 465px;
			height: 40px;
		}
		#fileBtnText{
			font-size: 18px;
			color: #ffffff;
		}
		.bi-camera::before{
			margin: 0px 10px 0px 0px;
			font-size: 23px;
		}
		/* modal 2 */
		#rvPicDiv{
			width: 465px;
			height: 100px;
		}
		#rvPic1,#rvPic2{
			width: 100px;
			height: 100px;
			display: inline-block;
		}
		img{
			vertical-align: baseline !important;
		}
		.rvImg{
			width: 100%;
			height: 100%;
		}
		#prodData{
			width: 465px;
			height: 80px;
			display: inline-block;
		}
		#prodPic{
			width: 100px;
			height: 100px;
			display: inline-block;
		}
		#prodImg{
			width: 100%;
			height: 100%;
		}
		#prodDetail{
			width: 170px;
			height: 100px;
			display: inline-block;
		}
		#prodName{
			font-weight: bold;
		}
		#prodOption{
			color: #CB7878;
		}
		#prodQty{
			color: #CB7878;
		}
		#starRating{
			display: inline-block;
		}
		.bi-star{
			font-size: 20px;
		}
		.bi-star-fill{
			color: #FF3A00;
			font-size: 20px;
		}
		/* modal 2 */
	/* modal */
	
	/* modal - star rating */
		.rating {
		    display: flex;
		    flex-direction: row-reverse;
		    justify-content: center
		}
		.rating>input {
		    display: none
		}
		.rating>label {
		    position: relative;
		    width: 1em;
		    font-size: 2vw;
		    color: #FF3A00;
		    cursor: pointer
		}
		.rating>label::before {
		    content: "\2605";
		    position: absolute;
		    opacity: 0
		}
		.rating>label:hover:before,
		.rating>label:hover~label:before {
		    opacity: 1 !important
		}
		.rating>input:checked~label:before {
		    opacity: 1
		}
		.rating:hover>input:checked~label:before {
		    opacity: 0.4
		}
		
	/* modal - star rating */
	
	
/* -------------------------- article css -------------------------- */
	/* --------------------onload로 화면 출력-------------------- */	
		#noneOrder{
			position: relative;
			left: 280px;
		}
		#tableRow{
			border-bottom: 1px solid black;
		}
		#t1,#t4{
			width: 100px;
			height: 20px;
			font-size: 14px;
		}
		#t2{
			width: 15px;
			font-size: 14px;
		}
		#t5{
			width: 30px;
			font-size: 14px;
		}
		#t3{
			width: 400px;
			font-size: 14px;
		}
		#t6{
			width: 100px;
			font-size: 14px;
		}
		#t7{
			width: 70px;
			text-align: center;
			font-size: 14px;
		}
		#td1{
			width: 80px;
			text-align: center;
		}
		#td2{
			width: 80px;
			text-align: center;
		}
		#td3{
			width: 255px;
			position: relative;
			left: 10px;
		}
		#td4{
			width: 85px;
			text-align: center;
		}
		#td5{
			width: 40px;
			text-align: center;
		}
		#td6{
			width: 90px;
			text-align: center;
		}
		#td7{
			width: 80px;
			text-align: center;
		}
		#prodLink{
			text-decoration: none;
			color: #000000;
		}
	/* --------------------onload로 화면 출력-------------------- */	
	
		#secTitle{
			font-size: 30px;
			margin: 100px 0px 20px 0px;
		}
		#orderProgress{
			word-spacing: 10px;
		}
		.circle{
			width: 128px;
			height: 128px;
			display: inline-block;
			padding: 0.35em 0.65em;
			font-size: 0.75em;
			font-weight: 700;
			line-height: 1;
			color: #000000;
			text-align: center;
			white-space: nowrap;
			vertical-align: baseline;
			border-radius: 64px;
			border: 1px solid black;
			
		}
		.circleText1{
			position: relative;
			top: 50px;
			font-size: 15px;
		}
		.circleText2{
			position: relative;
			top: 60px;
			font-size: 15px;
		}
		.chevron{
			position: relative;
			top: 40px;
		}
		#orderMenu{
			border-bottom: 2px solid black;
			height: 40px;
		}
		#th3{
			width: 255px;
			text-align: center;
		}
		#line{
			position: relative;
			left: 5px;
			color: #C4C4C4;
		}
		#leftLine{
			position: relative;
			right: 5px;
			color: #C4C4C4;
		}
		#review{
			cursor: pointer;
		}
		#reviewWrite1{
			color: #CB7878;
			background-color: #ffffff;
			border: none;
			cursor: pointer;
			width: 70px;
		}
		#reviewWrite2{
			color: #000000;
			background-color: #ffffff;
			border: none;
			cursor: pointer;
			width: 70px;
		}
		#reviewWrite3{
			color: #C1B2B2;
			background-color: #ffffff;
			border: none;
			width: 70px;
		}
		.page-item{
            padding:0;
        }
/* -------------------------- article css -------------------------- */
	</style>
	
</head>
<body onload="orderInfo()">
	<!-- header -->
	<header>
		<%@ include file="/WEB-INF/views/header.jsp" %><br><br>
	</header>
	
	<!-- 리뷰 작성 Modal -->
	<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰 작성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="javascript:modalReset();delPreview(0);"></button>
				</div>
				
				<div class="modal-body">
					<div id="modalText1">상품은 만족하셨나요?</div>
					<form id="modalForm">				
						<!-- star_rating -->
						<div class="rating">
							<input type="radio" name="rating" value="5" id="5" class="star">
								<label for="5">☆</label> 
							<input type="radio" name="rating" value="4" id="4" class="star">
								<label for="4">☆</label> 
							<input type="radio" name="rating" value="3" id="3" class="star">
								<label for="3">☆</label> 
							<input type="radio" name="rating" value="2" id="2" class="star">
								<label for="2">☆</label> 
							<input type="radio" name="rating" value="1" id="1" class="star">
								<label for="1">☆</label>
						</div>
						<br>
						<textarea id="textArea1" placeholder="상품에 대한 후기를 남겨 주세요.(10자 이상, 500자 이하)&#13;&#10;사진은 2장까지 첨부 가능합니다."></textarea>
						<div id="textArea1_cnt">0/500</div>
						<br>
					</form>
					<form id="pictureForm">
						<div id="uploadDiv">
						<!-- 파일을 업로드할 영역 -->
							<input type="file" id="uploadBtn" name="uploadBtn" multiple accept=".jpg, .jpeg, .png" onchange="javascript:uploadFile();preview();">
							<label for="uploadBtn" class="fileBtn btn">
								<span id="fileBtnText">
									<i class="bi bi-camera"></i>사진 첨부하기
								</span>
							</label>
							<span id="fileName"></span>
						</div>
					</form>
					<br>
					<div id="preview">
						<div class="previewD1">
							<i id="badge1" class="bi bi-dash-circle position-absolute" onclick="delPreview(1)"></i>
							<img class="previewImg" id="previewImg1" src="">
						</div>
						<div class="previewD2">
							<i id="badge2" class="bi bi-dash-circle position-absolute" onclick="delPreview(2)"></i>
							<img class="previewImg" id="previewImg2" src="">
						</div>						
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal" onclick="javascript:modalReset();delPreview(0);">닫기</button>
					<button type="button" class="btn btn-primary" id="saveBtn" data-bs-dismiss="modal" onclick="javascript:reviewWrite(); modalReset();delPreview2();">저장</button>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- 리뷰 확인 Modal -->
	<div class="modal fade" id="staticBackdrop2" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="javascript:modalReset();delPreview(0);"></button>
				</div>
				
				<div class="modal-body">
					<form id="modalForm">
						<div id="prodData">
							<div id="prodPic">
								
							</div>
							<div id="prodDetail">
								<div id="prodName"></div>
								<div id="prodOption"></div>
								<div id="prodQty"></div>
							</div>
									
							<!-- star_rating -->
							<div id="starRating">
								
							</div>
						</div>
						<br><br>
						<textarea id="textArea2" readonly></textarea>
						<br>
					</form>
					<form id="pictureForm">
						<div id="rvPicDiv">
						<!-- 리뷰사진 영역 -->
							<div id="rvPic1"></div>
							<div id="rvPic2"></div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="delBtn" data-bs-dismiss="modal" onclick="delQ()">삭제</button>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<section>
		<article>
			<div class="container">
				<div class="row">
					<!-- nav바   -->
					<div class="col-3 col-sm-3 col-md-3 col-lg-3 col-xl-3">
						<%@ include file="/WEB-INF/views/myPage/nav.jsp" %>
					</div>
					
					<div class="col-9 col-sm-9 col-md-9 col-lg-9 col-xl-9" id="sectionCol">
						<div id="secTitle">진행중인 주문</div>
						<div id="orderProgress">
							<span class="circle">
								<span class="circleText1">결제완료</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statY.deliStatCnt != null}">
											<c:out value="${statY.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">상품준비중</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statA.deliStatCnt != null}">
											<c:out value="${statA.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">배송중</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statB.deliStatCnt != null}">
											<c:out value="${statB.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="none"
							 	stroke="currentcolor" class="bi bi-chevron-right chevron" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 
								.708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
							</svg>
							<span class="circle">
								<span class="circleText1">배송완료</span>
								<br>
								<span class="circleText2">
									<c:choose>
										<c:when test="${statC.deliStatCnt != null}">
											<c:out value="${statC.deliStatCnt}" />
										</c:when>
										<c:otherwise>
											<c:out value="0" />
										</c:otherwise>
									</c:choose>
								</span>
							</span>
						</div>
						<div id="secTitle">최근 주문 정보</div>
						<div>
						<table>
							<tr id="orderMenu">
								<th id="td1"><span>주문일자</span><span id="line">|</span></th>
								<th id="td2"><span>주문번호</span><span id="line">|</span></th>
								<th id="th3"><span>상품명/옵션</span></th>
								<th id="td4"><span id="leftLine">|</span><span>상품금액</span><span id="line">|</span></th>
								<th id="td5"><span>수량</span><span id="line">|</span></th>
								<th id="td6"><span>주문상태</span><span id="line">|</span></th>
								<th id="td7"><span>확인/리뷰</span></th>
							</tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
							<tr><td colspan="7"></td></tr>
						</table>
						<table id="formDiv">
							
						</table>
						</div>	
						
						<!-- 페이징 바 뿌려주기 -->
						<div>
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<!-- 앞으로  가기 버튼 , 키워드 유지하면서 이동하기 -->
								<c:if test="${pm.prev == true}">
								<li class='page-item'>
								<c:set var="prev" value="${pm.startPage -1}"/>
									<a class='page-link' aria-label='Previous' href="${cPath}/MyPage/main.do?page=${prev}">
										<span aria-hidden='true' class='pointer' >&laquo;</span>
									</a>
								</li>
								</c:if>
								
								<!-- 페이징 번호, 키워드 유지하면서 이동 하기  -->
								<c:set var="page" value="${pm.scri.page}"/>
								<c:forEach var="pageNum" begin="${pm.startPage}" end="${pm.endPage}">
									<c:if test = "${pageNum == page}">
									<li class="page-item active">	
										<a class="page-link pointer" href="${cPath}/MyPage/main.do?page=${pageNum}">
											<c:out value="${pageNum}"/>
										</a>
									</li>
									</c:if>
									<c:if test = "${pageNum != page}">
									<li class="page-item">	
										<a class="page-link pointer" href="${cPath}/MyPage/main.do?page=${pageNum}">
											<c:out value="${pageNum}"/>
										</a>
									</li>
									</c:if>
								</c:forEach>
								
								<!-- 뒤로 가기 버튼 , 키워드 유지하면서 이동하기 -->
								<c:if test="${pm.next && pm.endPage > 0}">
								<li class='page-item'>
									<a class='page-link' aria-label='Next' href="${cPath}/MyPage/main.do?page=${pm.endPage + 1}">
										<span aria-hidden='true' class='pointer'>&raquo;</span>
									</a>
								</li>
								</c:if>
									</ul>
								</nav>
							</div>					
						</div>
				</div>
			</div>
		</article>
	</section>
	
	<br><br><br><br>
	
	<footer>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</footer>
	
</body>

<script>
	$(function(){
		// 글자수 500자로 제한
	    $('#textArea1').on('keyup', function() {
	        $('#textArea1_cnt').html("(<b>"+$(this).val().length+"</b> / 500)");
	
	        if($(this).val().length > 500) {
	            $(this).val($(this).val().substring(0, 500));
	            $('#textArea1_cnt').html("(<b>500</b> / 500)");
	        }
	    });
	});
</script>
</html>