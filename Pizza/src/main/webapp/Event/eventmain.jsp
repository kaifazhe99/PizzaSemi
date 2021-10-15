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
	
	span.list{
		border: 1px solid;
		border-radius: 10px 10px 10px 10px;
	
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
	<h2 style=" margin-bottom: 5px; margin-top: 5px;"><b>Event</b></h2>
	<ul style=" padding-left: 20px;">	
		<li id="event" style="cursor: pointer;">진행 중인 이벤트<div class="neon">New </div></li>
		<li id="new" style="cursor: pointer;">신제품 소개<div class="flux">Click</div></li>
	</ul>
</span> 




	
<div id="eventimg">
	<img class="event" id="1" style="top:20px; left:20px; " src="Event/event1/1.jpg"/>
	<img class="event" id="2" style="top:20px; left:625px;" src="Event/event1/2.jpg"/>
	<img class="event" id="3" style="top:275px; left:625px;"  src="Event/event1/3.jpg"/>
	<img class="event" id="4" style="top:275px; left:20px;" src="Event/event1/4.jpg"/>
</div>
<div id="newimg">
<figure >
   <img src="Event/pizzaimg/hotchicken.jpg" style="width: 300px;">
   <figcaption>
      <div>
         <h3><b>캐롤라이나 핫치킨</b></h3><br>세상에서 가장 매운 고추 '캐롤라이나 리퍼'로<br>
 매콤한 미국 현지 맛을 담은 피자!
      </div>
   </figcaption>
</figure>
<figure></figure>
   <img src="Event/pizzaimg/superdelux.jpg" style="width: 300px;">
   <figcaption> <div>
         <h3><b>슈퍼디럭스</b></h3><br>쇠고기, 페퍼로니, 햄, 버섯, 피망, 양파, 올리브 등<br>
가장 많은 토핑이 들어가 풍부한 맛을 내는 피자!
      </div>
      </figcaption>
</figure>

</div>
</div>
<script>
	
	$("#newimg").hide();
	
	$("#event").click(function(){
		$("#eventimg").show();
		$("#newimg").hide();
		
	});
	
	$("#new").click(function(){
		$("#eventimg").hide();
		$("#newimg").show();	
	});
	

</script>

</body>
</html>