<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	span.pizzafont{
		font-size: 30pt;
		font-family: "Black Han Sans";
		color: red;
	}
	
	div{
	font-family: "Noto Sans KR";
	}

</style>
</head>
<% 
	String mainPage="layout/main.jsp";//기본페이지
	//url을 통해서 main 값을 읽어 메인페이지에 출력한다.
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
%>
<body>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%= mainPage %>"/>
</div>
<div class="layout foot">
	<jsp:include page="layout/foot.jsp"/>
</div>

</body>
</html>