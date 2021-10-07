var first=false;//첫번째 누른 숫자인지 체크하기 위한 변수
var dot=false;//소숫점을 찍었는지 확인하기 위한 변수
var op;//연산자를 저장하기 위한 변수
var su1,su2;//숫자를 저장하기 위한 변수
var s;//출력창

window.onload=function(){
	var calc=document.getElementById("calc");
	s=document.getElementById("show");
	//보이기 버튼
	document.getElementById("btnshow").onclick=function(){
		calc.style.visibility='visible';		
		//calc.style.display='block';
	}
	document.getElementById("btnhide").onclick=function(){
		calc.style.visibility='hidden';//숫겨지지만 자리는 차지함
		//calc.style.display='none';//자리차지하지 않음
	}
}

//사용자 함수
function goNum(num){
	//alert(num);	
	
	var out=s.innerHTML;
	if(!first || out=='0'){//first가 false일경우에는 새로 출력,true면 이어서출력
		s.innerHTML=num;
		first=true;
		
		if(num=='00')
		   s.innerHTML="0";	
	}else{
		s.innerHTML+=num;
	}
}

function goDot(){
	//dot==false   !dot
	//dot==true    dot
	if(!dot && first){//먼저 숫자를 누른후 도트를 눌러야함
		s.innerHTML+=".";
		dot=true;
	}
}

function goOper(oper){
	op=oper;//연산자 저장
	su1=s.innerHTML;//현재 숫자를 su1에 저장
	first=false;//다시 숫자를 누르면 새로 써지도록 초기화
	dot=false;//소숫점도 다시 누를수 잇도록 초기화	
}

function goResult(){
	//현재창의 값을 su2 에 저장
	su2=s.innerHTML;
	//연산후 결과는 다시 su1 에 저장
	su1=eval(su1+op+su2);
	//su1의 결과를 결과창에 출력
	s.innerHTML=su1;
	//변수들 초기화
	first=false;
	dot=false;	
}

function goBack(){
	var str=s.innerHTML;
	var len=str.length;
	//alert(len);
	//마지막 글자
	var last=str.charAt(len-1);
	//alert(last);
	if(last=='.'){
		dot=false;
	}
	//1글자 빼고 추출
	var data=str.substring(0,len-1);
	s.innerHTML=data;
	if(data.length==0){
		first=false;
		s.innerHTML="0";
	}
}

function goSign(){
	var str=s.innerHTML*-1;
	s.innerHTML=str;
}

function goCE(){
	s.innerHTML="0";
	first=false;
	dot=false;
	su2="";
}

function goC(){
	s.innerHTML="0";
	first=false;
	dot=false;
	su1="";
	su2="";
	op="";
}







