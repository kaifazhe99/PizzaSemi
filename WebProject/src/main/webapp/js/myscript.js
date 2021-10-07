function randomColor(){
	//rgb 색상 얻기
	var r=parseInt(Math.random()*256);
	var g=parseInt(Math.random()*256);
	var b=parseInt(Math.random()*256);
	var color="rgb("+r+","+g+","+b+")";
	return color;
}