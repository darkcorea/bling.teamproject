<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content ="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--  위의 3가지는 먼저 와야 합니다. -->
	<title>커스터마이징</title>
 	<script src="/js/jquery-3.6.0.min.js"></script>
 	<script src="/js/bootstrap.bundle.js"></script>
 	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- IE10, 11 지원을 위한 es6-promise --> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>

	<style type="text/css">
		
		 #select{
              width:200px;
              height:1000px;
          }
          #main{
              width:800px;
              height:800px;
          }
          #kind{
              width:200px;
              height:800px;
          }
          #typescroll{
              width:800px;
              height:200px;
          }
          #type{
              width: 180px;
              height:180px;
          }
          #chain{
              width: 700px;
              height: 700px;
          }
	
		.drag{
			position:relative;
			cursor:hand;
			z-index: 100;
		}
		.type{
			/* position:absolute; */
			width:700px;
			height:700px;
			/* z-index:1; */
		}
		#optionss{
			width:80px;
			height:80px;
		}
		table{
			border:1px solid black;
			border-collapse:collapse;
		}
		th,td{
			border:1px solid black;
		}
		#zz{
			width:200px;
            height:1000px;
			overflow-y:auto;
		}
	</style>
</head>
	
<body>
        <table style="margin-right: auto;margin-left: auto;">
            <h2 style="text-align: center;">커스터마이징</h2>
            <tr>
            <!-- 선택한옵션 -->
                <td id="select" rowspan="2">
                	<div id="zz">
	                	<h4>선택한 상품들</h4>
	                	<hr>
	                	<div id="selectoption"> 
	                		
	                	</div>
	                	<hr>
	                	<div id="total">
	                		
	                	</div>
                	</div>
                </td>
                 <!-- 커스터마이징 이미지 보이는 곳 -->
                <td id="main">
               		<div id="capture">
	                	<div style="position:relative">
	                		<div style="position:absolute" id="optiondiv">
	                		
	                		</div>
	                		<p id="maindiv"> </p>
	                	</div>
                	</div>
                </td>
                <td id="kind">
                    <div style="height: 800px;overflow: auto;">
                        목걸이 필수템들
                        <a style="cursor:pointer;" onclick="javascript:types(1)"><img src="/resources/custom/체인.JPG" id="type"></a>
                        <a style="cursor:pointer;" onclick="javascript:types(2)"><img src="/resources/custom/고리.jpg" id="type"></a>
                        <a style="cursor:pointer;" onclick="javascript:types(3)"><img src="/resources/custom/장식.jpeg" id="type"></a>
                    </div>
                </td>
            </tr>
            <tr>
           <!-- 선택한 종류들 -->
                <td id="typescroll">
                    <div style="height:200px;width: 800px; overflow: auto;" id="scroll">
                        
                    </div>
                </td>
                <td id="but">
                    <button type="button" class="btnScreenShot" id="shot">커마저장</button>
                </td>
            </tr>
        </table>
    </body>

    <script>
    
    var sum = 0;
    //타입별 종류들
        function types(type){
            var str = "";
            
            $.ajax({
            	url:"/Custom/customoption.do",
            	type:"post",
            	data:{"type":type},
            	dataType:'json',
            	success:function(data){
        			console.log(data[0].type);
        			console.log(data[0])
            		for(var i=0;i<data.length;i++){
            			if(data[0].type == 1){
            				str += "<a style='cursor:pointer;' onclick='main_option("+data[i].type+","+data[i].shape+")'><img src='/resources/custom/"+data[i].customimg+"' id='type'></a>";
            			}else{
            				str += "<a style='cursor:pointer;' onclick='options("+data[i].type+","+data[i].shape+")'><img src='/resources/custom/"+data[i].customimg+"' id='type'></a>";
            			}
            		}
            		 $('#scroll').html(str);
            	},error:function(){
            		alert("타입 불러오기 에러!");
            	}
            });
        }
        ////////////////////////////////////////////////가격스크롤/////////////////////////////////////////////
       //체인 고르기
        function main_option(type,shape){
    	   console.log(type);
    	   console.log(shape);
        	 $.ajax({
             	url:"/Custom/customshape.do",
             	type:"post",
             	data:{"type":type,"shape":shape},
             	dataType:'json',
             	success:function(data){
             		console.log(data);
             		//체인 고르면 이미지 나오게 함
             		var str_chain = "";
             		str_chain += "<img src='/resources/custom/"+data[0].customimg+"' class='type'>";
                	$('#maindiv').html(str_chain);
                	//선택옵션 글 나오게함
                	
                	var chainprice = $('#chainprice').val();
                	if(chainprice == 0 || chainprice == '' || chainprice == null){
                		var str2_chain = "";
                    	str2_chain += "<div class='chainprice'><h5>"+data[0].name + "</h5>";
                    	str2_chain += data[0].price + "원<hr>";
                    	str2_chain += "<input type='hidden' id='chainprice' value='"+data[0].price+"'></div>";
                    	$('#selectoption').append(str2_chain);
                		total(data[0].price);
                	}else{
                		//////////////////////////////////////////////이부분 고쳐야함...///////////////////////////////////////
                		var str2_chain = "";
                		$(".chainprice").detach();
                    	str2_chain += "<div class='chainprice'><h5>"+data[0].name + "</h5>";
                    	str2_chain += data[0].price + "원<hr>";
                    	str2_chain += "<input type='hidden' id='chainprice' value='"+data[0].price+"'></div>";
                		minus(chainprice,data[0].price);
                		$('#selectoption').append(str2_chain);
                	}
             	}
        	 });
        }
        
        //장식품들 고르면 드래그 가능 이미지 나옴
        function options(type,shape){
        	 $.ajax({
              	url:"/Custom/customshape.do",
              	type:"post",
              	data:{"type":type,"shape":shape},
              	dataType:'json',
              	success:function(data){
              		var str2 = "";
              		str2 += "<img src='/resources/custom/"+data[0].customimg+"' id='optionss' class='drag'>";
                	$('#optiondiv').append(str2);
                	//선택옵션 글 나오게함
                	var str2_option = "";
                	str2_option += "<h5>"+data[0].name + "</h5>";
                	str2_option += data[0].price + "원<hr>";
                	$('#selectoption').append(str2_option);
                	total(data[0].price);
              	}
        	});
        }
        
        //총 금액
        function total(price){
        	sum += price;
        	var str3 = "";
        	str3 += "<h5>총 금액 : "+sum+"원</h5>";
        	str3 += "<input type='hidden' id='totalprice' value='"+sum+"'>";
        	$('#total').html(str3);
        }
        
        function minus(minustot,plustot){
        	var mp = minustot + plustot
        	var minusprice = $('#totalprice').val() - mp;
        	str3 += "<h5>총 금액 : "+minusprice+"원</h5>";
        	str3 += "<input type='hidden' id='totalprice' value='"+minusprice+"'>";
        	$('#total').html(str3);
        }
        
        //드래그 객체
        var dragobject={
        		z: 0, 
        		x: 0, 
        		y: 0, 
        		offsetx : null, 
        		offsety : null, 
        		targetobj : null, 
        		dragapproved : 0,
        		initialize:function(){
				        		document.onmousedown=this.drag
				        		document.onmouseup=function(){
				        								this.dragapproved=0 
				        							}
			        		},
        		drag:function(e){
        				var evtobj=window.event? window.event : e
        				this.targetobj=window.event? event.srcElement : e.target
        				if (this.targetobj.className=="drag"){
        					this.dragapproved=1
        					if (isNaN(parseInt(this.targetobj.style.left))){
        						this.targetobj.style.left=0
        					}
        					if (isNaN(parseInt(this.targetobj.style.top))){
        						this.targetobj.style.top=0
        					}
        					this.offsetx=parseInt(this.targetobj.style.left)
        					this.offsety=parseInt(this.targetobj.style.top)
        					this.x=evtobj.clientX
        					this.y=evtobj.clientY
        					if (evtobj.preventDefault)
        						evtobj.preventDefault()
        						document.onmousemove=dragobject.moveit
        				}
        			},
        			moveit:function(e){
        					var evtobj=window.event? window.event : e
        					if (this.dragapproved==1){
        						this.targetobj.style.left=this.offsetx+evtobj.clientX-this.x+"px"
        						this.targetobj.style.top=this.offsety+evtobj.clientY-this.y+"px"
        						return false
        					}
        			}
        		}
       dragobject.initialize()
       
       //스크린샷 https://samanoske.tistory.com/94
       $(function(){
			$("#shot").on("click", function(){
				// 캡쳐 라이브러리를 통해서 canvas 오브젝트를 받고 이미지 파일로 리턴한다.
				html2canvas(document.querySelector("#capture")).then(canvas => {
					saveAs(canvas.toDataURL('image/png'),"capture-test.png");
				});
			});
			function saveAs(uri, filename) {
				// 캡쳐된 파일을 이미지 파일로 내보낸다.
				var link = document.createElement('a');
				if (typeof link.download === 'string') {
					link.href = uri;
					link.download = filename;
					document.body.appendChild(link);
					link.click();
					document.body.removeChild(link);
				} else {
					indow.open(uri);
				}
			}
		});


//스샷 파일을 db에 저장, 삭제버튼, 회전, 체인 바꿀때 추가 되는거, 제품 선택한거 db에 저장
       
    </script>
</html>
