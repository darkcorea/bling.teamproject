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
              background-color: cornflowerblue;
          }
          #main{
              width:800px;
              height:800px;
              background-color: yellow;
          }
          #kind{
              width:200px;
              height:800px;
              background-color: orange;
          }
          #typescroll{
              width:800px;
              height:200px;
              background-color: burlywood;
          }
          #but{
              background-color: coral;
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
	</style>
</head>
	
<body>
        <table style="margin-right: auto;margin-left: auto;">
            <h2 style="text-align: center;">커스터마이징</h2>
            <tr>
                <td id="select" rowspan="2">
                    선택한옵션
                </td>
                <td id="main">
                	<div id="maindiv">
                	 
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
                <td id="typescroll">
                    <div style="height:200px;width: 800px; overflow: auto;" id="scroll">
                        
                    </div>
                </td>
                <td id="but">
                    <button type="button" class="btnScreenShot" id="btnScreenShot">커마저장</button>
                </td>
            </tr>
        </table>
    </body>

    <script>
        function types(type){
            var str = "";
            if(type == 1){
            	for(var i = 1;i<4;i++){
            		str += "<a style='cursor:pointer;' onclick='javascript:main_option(1,"+i+")'><img src='/resources/custom/체인"+i+".png' id='type'></a>";
            	}
            }else if(type == 2){
            	for(var j = 1;j<7;j++){
            		str += "<a style='cursor:pointer;' onclick='javascript:options(2,"+j+")'><img src='/resources/custom/고리"+j+".png' id='type'></a>";
            	}
            }else if(type == 3){
            	for(var k = 1;k<6;k++){
            		str += "<a style='cursor:pointer;' onclick='javascript:options(3,"+k+")'><img src='/resources/custom/장식"+k+".png' id='type'></a>";
            	}
            }

            $('#scroll').html(str);
        }
        
        
        function main_option(type,option){
        	
        	var str_chain = "";
        	str_chain += "<img src='/resources/custom/체인"+option+".png' class='type'>";
        	$('#maindiv').html(str_chain);
        }
        
        
        function options(type,option){
        	var str2 = "";
        	if(type == 3){
        		str2 += "<div ><img src='/resources/custom/장식"+option+".png' id='optionss' class='drag'><button type='button'>X</button></div>";
        	}else{
        		str2 += "<img src='/resources/custom/고리"+option+".png' id='optionss' class='drag'>";
        	}
        	
        	$('#maindiv').prepend(str2);
        }
        
        
        
        
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
       
       $("#btnScreenShot").on("click",function(){
    	   html2canvas(document.getElementById("scroll"), {
    		    backgroundColor: "#000000"
    		}).then(function(canvas) {
    		    var base64image = canvas.toDataURL("image/png");
    		    window.open(base64image , "_blank");  // Open the image in a new window
    		});
       });
    </script>
</html>
