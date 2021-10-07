<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	#show{
		font-family: 'Gaegu';
		font-size: 1.3em;
		margin-top: 30px;
	}
</style>
</head>
<body>
<button type="button" class="btn btn-info" id="btn1">data1.json읽기</button>
<button type="button" class="btn btn-info" id="btn2">infotojson.jsp읽기</button>
<hr>
<div id="show"></div>
<script type="text/javascript">
	$("#btn1").click(function(){
		$.ajax({
			type:"get",
			url:"data1.json",
			dataType:"json",
			success:function(data){
				var s="";
				$.each(data, function(i, elt) {
					s+="<div class='alert alert-success' style='width:500px;'>";
					s+="index:"+i+"<br>";
					s+="과목명:"+elt.term+"<br>";
					s+="과목설명:"+(elt.definition==null?"설명없음":elt.definition)+"<br>";
					s+="과정:";
					if(elt.quote==null){
						s+="과정없음";
					}else{
						$.each(elt.quote, function(i2, elt2) {
							s+="["+elt2+"]";
						});
					}
					s+="<br>";
					s+="저자명:";
					if(elt.author==null)
						s+="작자미상";
					else
						s+=elt.author;					
					s+="</div>";
				});
				$("#show").html(s);
			}
		});
	});
	
	$("#btn2").click(function(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"../day0924_ajax/infotojson.jsp",
			success:function(data){
				var s="";
				$.each(data, function(i, elt) {
					s+="<div class='alert alert-danger' style='width:500px;'>";
					s+="Index:"+i+"<br>";
					s+="Num:"+elt.num+":이름:"+elt.name+"<br>";
					s+="핸드폰:"+elt.hp+"<br>";
					s+="나이:"+elt.age+"세<br>";
					s+="<img src='"+elt.photo+"' width='100'><br>";
					s+="</div>";
				});
				
				$("#show").html(s);
			}
		});
	});
</script>
</body>
</html>


















