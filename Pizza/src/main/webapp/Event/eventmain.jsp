<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pizza camp</title>

<style type="text/css">
	ul{
		   list-style:none;
	
	}
	a{
		
		color: black;
		text-decoration-line : none;
	
	}
	ul.deco{
		position:absolute;
		top:300px;
		left: 140px;
	
	
	}
	
	.list{
		
   		margin-top: 30px;
    	margin-bottom: 30px;
    	margin-left: 30px;

	
	}
	
	img.event:hover{
		cursor: pointer;
		border: 7px outset; 	
		
	}
	
	span.event{
		position: absolute;
	
	}
	
	img.new{
		width:300px;
	
	}
	

body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  background:red;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:red;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: red;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

	
	
	

	
	
	

@font-face {
  font-family: neon;
  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
}



.neon {
  
  font-family: neon;
  color: #FB4264;
  font-size: 13px;
  
  text-shadow: 0 0  #F40A35;
 
}

.flux {
  font-family: neon;
  color: #426DFB;
  font-size: 13px;
  
  text-shadow: 0 0 3vw #2356FF;
}

.neon {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
}

@keyframes neon {
  0%,
  100% {
    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #FED128;
  }
  50% {
    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}

.flux {
  animation: flux 2s linear infinite;
  -moz-animation: flux 2s linear infinite;
  -webkit-animation: flux 2s linear infinite;
  -o-animation: flux 2s linear infinite;
}

@keyframes flux {
  0%,
  100% {
    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
    color: #28D7FE;
  }
  50% {
    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
    color: #146C80;
  }
}
 </style>

</head>

<body>
<div>
 <span class="list">
	<h2 style=" margin-bottom: 5px; margin-top: 5px; "><b>&nbsp;Event</b></h2>
	<ul style="padding-left: 10px; margin-left: 600px; display: flex; margin-top: 10px;">
		<li id="ev" style="cursor: pointer;  float:left; margin-right:50px;">진행 중인 이벤트
		<div class="flux">Click</div></li>
		<li id="new" style="cursor: pointer; ">신제품 소개<div class="neon">New </div></li>
	</ul>
</span> 





	
<div id="eventimg" style="padding-left: 0px; ">
	<img class="event" id="1" style="top:20px; left:20px; " src="Event/event1/1.jpg"/>
	<img class="event" id="2" style="top:20px; left:625px;" src="Event/event1/2.jpg"/>
	<img class="event" id="3" style="top:275px; left:625px;"  src="Event/event1/3.jpg"/>
	<img class="event" id="4" style="top:275px; left:20px;" src="Event/event1/4.jpg"/>
</div>

<div id="newimg" style=" padding-bottom: 10px;">
<figure style="float:left; padding-left: 210px; padding-right: 50px;">
   <img src="Event/pizzaimg/hotchicken.jpg" style="width: 300px; ">
   <figcaption>
      <div>
         <h3><b>캐롤라이나 핫치킨</b></h3>세상에서 가장 매운 고추 '캐롤라이나 리퍼'로<br>
 매콤한 미국 현지 맛을 담은 피자!<br><br>
 
      </div>
   </figcaption>
</figure>
<figure style="float:left; padding-right: 50px;">
   <img src="Event/pizzaimg/superdelux.jpg" style="width: 300px;">
   	<figcaption>
   	 <div>
         <h3><b>슈퍼디럭스</b></h3>쇠고기, 페퍼로니, 햄, 버섯, 피망, 양파, 올리브 등<br>
가장 많은 토핑이 들어가 풍부한 맛을 내는 피자!<br><br>

      </div>
      </figcaption>
</figure>
<figure style="width: 300px; height: 473px; float:left;">
   <img src="Event/pizzaimg/hawaiian.jpg" style="width: 300px;">
   	<figcaption>
   	 <div>
         <h3><b>하와이안 슈림프 피자</b></h3>하와이안 오리진에 케이준 슈림프로 식감과 맛을 꽉 채운 피자!<br>
<br>
 <button class="order">주문하러가기</button>
      </div>
      </figcaption>
</figure>
     
</div>
</div>
<hr style="clear: both">
<script>
	
	$("#newimg").hide();
	
	$("#ev").click(function(){
		console.log(111);
		$("#eventimg").show();
		$("#newimg").hide();
		
	});
	
	$("#new").click(function(){
		$("#eventimg").hide();
		$("#newimg").show();	
	});
	
	$(".order").click(function(){
		location.href='index.jsp?main=pizzamenu/menulist.jsp';
	});
	

</script>

</body>
</html>