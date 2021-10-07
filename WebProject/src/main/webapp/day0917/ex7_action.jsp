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
	div.box{
		float: left;
		width: 50px;
		height: 50px;
		border-radius: 100px;
		margin-right: 10px;
	}
</style>
</head>
<body>
<%
	//post방식일경우 한글깨짐현상은 읽기전에 아래의 코드를 추가한다

	request.setCharacterEncoding("utf-8");
	String sang=request.getParameter("sang"); 
	String []scolor=request.getParameterValues("scolor");//선택을 안햇을경우 null
	String ssize=request.getParameter("ssize");
	String chuga=request.getParameter("schuga");
%>
<h3>상품명 : <%=sang %></h3>
<h3>상품색상 : <br>
	<%
	if(scolor==null){%>
		<b>선택한 색상 없음</b>
	<%}else{
		for(String s:scolor){%>
			<div style="background-color: <%=s%>" class="box"></div>
		<%}
	}
	%>
</h3><br><br>
 <h3>사이즈 : <%=ssize%> Size</h3>
 <h3>추가상품 : <%=chuga %></h3>
</body>
</html>











