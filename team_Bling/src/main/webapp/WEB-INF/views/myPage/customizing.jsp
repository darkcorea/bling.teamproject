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
 	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- IE10, 11 지원을 위한 es6-promise --> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
	<!-- jQuery -->
  	<script src="/team_Bling/js/jquery-3.6.0.min.js"></script>
  	<!-- bootstrap js -->
 	<script src="/team_Bling/js/bootstrap.bundle.js"></script>
 	<!-- bootstrap css -->
 	<link rel="stylesheet" href="/team_Bling/css/bootstrap.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<style type="text/css">
		section{
			margin:auto;
			width:1200px;
		}
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
		.drag{
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
		.bi-x-lg{
			color: red;
		}
		div:focus{
			background-color: orange;
		}
		#mr{
			margin-left:10px;
		}
	</style>
	
</head>
	
<body>
	<section>
        <table style="margin-right: auto;margin-left: auto;">
            <h2 style="text-align: center;">커스터마이징</h2>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/team_Bling/Custom/list.do'" style="float: right;" id="mr">커스터마이징 리스트</button>
            <button type="button" class="btn btn-outline-warning" onclick="location.href='/'" style="float: right;">홈</button>
            <br>
            <tr>
            <!-- 선택한옵션 -->
                <td id="select" rowspan="2">
                	<div id="zz">
	                	<h4>선택한 상품들</h4>
	                	<div id="cnt"> </div>
	                	<input type="hidden" id="cntval">
	                	<hr>
	                	<div id="selectchain">
	                	
	                	</div>
	                	<div id="selectoption"> 
	                		
	                	</div>
	                	<div id="total">
	                		
	                	</div>
                	</div>
                </td>
                 <!-- 커스터마이징 이미지 보이는 곳 -->
                <td id="main">
               		<div id="capture" style="height:800px;width: 800px;">
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
                        <a style="cursor:pointer;" onclick="javascript:types(1)"><img src="/team_Bling/resources/custom/체인.JPG" id="type"></a>
                        <a style="cursor:pointer;" onclick="javascript:types(2)"><img src="/team_Bling/resources/custom/고리.jpg" id="type"></a>
                        <a style="cursor:pointer;" onclick="javascript:types(3)"><img src="/team_Bling/resources/custom/장식.jpeg" id="type"></a>
                    </div>
                </td>
            </tr>
            <tr>
           <!-- 선택한 종류들 -->
                <td id="typescroll">
                    <div style="height:200px;width: 800px; overflow: auto;" id="scroll">
                        
                    </div>
                    <input type="hidden" id="totalname">
                </td>
                <td id="but">
                	* 커스터마이징한 제품의 <br>이름을 지어주세요.
                	<br><br>
                	<input type="text" id="name">
                	<br><br><hr>
                    <button type="button" class="btn btn-warning btnScreenShot" id="shot">커스터마이징저장</button>
                </td>
            </tr>
        </table>
    </section>
</body>
    <script>
	/* function rangedeg(coidx,deg){
    	document.getElementById("img"+coidx).rotate(deg);
    } */
   /* $("#textarea").click(function(e){
	  if(!$(e.target).hasClass("area")){
		  alert("영역밖입니다.");
	  } 
   }); */
   var count = 0;
   //옵션 카운트
   function cnt(){
	   count++;
	   var str="";
	   str += "선택한 옵션 개수 : "+count+"개";
	   $('#cnt').html(str);
	   document.getElementById("cntval").value = count;
   }
   
   
   
   //글 선택시 
    function test(coidx){
    	//alert("테스트");
    	var imgname = document.getElementById(coidx);
    	console.log(coidx);
    	$("#img"+coidx).css({
    		"background-color":"blue"
    	});
    }
   //x표시 누르면 이미지 삭제
   function deleteimg(coidx){
	   $("#img"+coidx).remove();
	   $(".text"+coidx).remove();
   }
    
    var sum = 0;
    //타입별 종류들
        function types(type){
            var str = "";
            
            $.ajax({
            	url:"/team_Bling/Custom/customoption.do",
            	type:"post",
            	data:{"type":type},
            	dataType:'json',
            	success:function(data){
        			console.log(data[0].type);
        			console.log(data[0])
            		for(var i=0;i<data.length;i++){
            			if(data[0].type == 1){
            				str += "<a style='cursor:pointer;' onclick='main_option("+data[i].type+","+data[i].shape+")'><img src='/team_Bling/resources/custom/"+data[i].customimg+"' id='type'></a>";
            			}else{
            				str += "<a style='cursor:pointer;' onclick='options("+data[i].type+","+data[i].shape+")'><img src='/team_Bling/resources/custom/"+data[i].customimg+"' id='type'></a>";
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
             	url:"/team_Bling/Custom/customshape.do",
             	type:"post",
             	data:{"type":type,"shape":shape},
             	dataType:'json',
             	success:function(data){
             		console.log(data);
             		var str_chain = "";
             		//체인 고르면 이미지 나오게 함
             		str_chain += "<img src='/team_Bling/resources/custom/"+data[0].customimg+"' class='type'>";
                	$('#maindiv').html(str_chain);
                	//선택옵션 글 나오게함
                	if($('#chainprice').val() != null){
                		var dataprice = data[0].price-$('#chainprice').val();
                		total(dataprice);
                	}else{
                		total(data[0].price);
                	}
                	
                	var str2_chain = "";
                	str2_chain += "<div class='chainpricename'><h5>"+data[0].name + "</h5>";
                	str2_chain += data[0].price + "원<hr>";
                	str2_chain += "<input type='hidden' id='chainprice' value='"+data[0].price+"'></div>";
                	str2_chain += "<input type = 'hidden' id='chainname' value='"+data[0].coidx+"'>";
                	
                	$('#selectchain').html(str2_chain);
                	
             	}
        	 });
        }
        
        
/////////////////////////////////////////////제품 삭제시 총 금액도 제해야함.////////////////////////////////////////
        //장식품들 고르면 드래그 가능 이미지 나옴
        function options(type,shape){
			if($(".chainpricename").length){
				$.ajax({
	              	url:"/team_Bling/Custom/customshape.do",
	              	type:"post",
	              	data:{"type":type,"shape":shape},
	              	dataType:'json',
	              	success:function(data){
	              		var str2 = "";
	              		str2 += "";
	              		str2 += "<img src='/team_Bling/resources/custom/"+data[0].customimg+"' id='img"+data[0].coidx+"' class='drag'>";
	                	$('#optiondiv').append(str2);
	                	//선택옵션 글 나오게함
	                	var str2_option = "";
	                	str2_option += "<div id='textarea text"+data[0].coidx+"' onclick='test("+data[0].coidx+")' class='text"+data[0].coidx+"' tabindex='1' class='area'><h5>"+data[0].name + "&nbsp;";
	                	str2_option += "<i class='bi bi-x-lg' onclick='deleteimg("+data[0].coidx+")'></i></h5>";
	                	/*  */
	                	str2_option += data[0].price + "원";
	                	str2_option += "<input type='range' value='0' min='0' max='360' class='form-range' id='customRange"+data[0].coidx+"' oninput='document.getElementById('value999')'><hr></div>";
	                	str2_option += "<span id='value999'></span>"
	                	str2_option += "<input type = 'hidden' id='optionname' value='"+data[0].coidx+"'>";
	                	$('#selectoption').append(str2_option);
	                	total(data[0].price);
	                	cnt();
	              	}
	        	});
			}else{
				alert("체인을 먼저 선택해주세요");
			}
        	 
        }
        
      /*   function showslidervalue(value){
        	var number = document.getElementById("slider_value");
        	number.innerHTML = value;
        } */
        
        
       // var rangeslider = function(){
        	//var range = $('.form-range').val();
        	//console.log(range);
        	//rotates(range);
        	/* range.on('input',function(){
        		showslidervalue(this.value);
        	}); */
        //};
        
        //rangeslider();
        //회전
       // function rotates(range){
       // 	 $("#img").rotate(range);
      //  }
       
       
        //총 금액
        function total(price){
        	sum += price;
        	var str3 = "";
        	str3 += "<h5>총 금액 : "+sum+"원</h5>";
        	str3 += "<input type='hidden' id='totalprice' value='"+sum+"'>";
        	$('#total').html(str3);
        }
        
        
        //옵션빼기
        function minus(minustot,plustot){
        	var str3 = "";
        	var minusprice = $('#totalprice').val() - minustot + plustot;
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
       
       $("#shot").on("click", function(){
			scrshot($("#capture"));
		});
       function scrshot(target){
    	   if(target != null && target.length > 0){
    		   var t = target[0];
    		   html2canvas(t).then(function(canvas){
    			   var myImg = canvas.toDataURL("image/png");
    			   
    			   //제품 coidx 리스트 정렬
    			   var list = new Array();
    			   $("input[id=optionname]").each(function(index,item){
    				   list.push($(item).val());
    			   });
    			   list.push(document.getElementById("chainname").value);
    			   $("#totalname").val(list);
    			   
    			   myImg = myImg.replace("'data:image/png;base64,",""); //제품 사진 customimg
    			   var name = document.getElementById("name").value; //제품이름 name
    			   var countval = document.getElementById("cntval").value; //옵션개수(체인뺀) cntoption
    			   var total = document.getElementById("totalprice").value //총가격 	price
    			   var totalname = document.getElementById("totalname").value; //옵션 coidx sumcoidx
    			   
    			   $.ajax({
    					type:"POST",
    					data:{"imgSrc":myImg,"name":name,"countval":countval,
    						"total":total,"totalname":totalname},
    					dataType:"text",
    					url:"/team_Bling/Custom/scrshot.do",
    					success:function(data){
    						alert("커스터마이징이 완료되었습니다.");
    						location.href="/team_Bling/Custom/list.do";
    						console.log(data);
    					},error:function(a,b,c){
    						alert("error");
    					}
    			   });
    		   });
    	   }
       }
       
    </script>
</html>
