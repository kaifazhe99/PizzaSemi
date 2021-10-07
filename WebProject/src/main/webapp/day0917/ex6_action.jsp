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
</head>
<%
	//get방식일경우 톰켓8부터는 한글 변환 안해도 안깨짐
	//폼 데이타 읽기
	String name=request.getParameter("name");
	//name=new String(name.getBytes("8859_1"),"UTF-8"); //한글깨지는사람만(get방식)

	String pass=request.getParameter("pass");
%>
<body>
<h2>이름:<%=name%></h2>
<h2>비밀번호:<%=pass%></h2>
<a href="ex6_form.html">다시 입력</a><br>
<a href="javascript:history.back()">다시 입력</a>
</body>
</html>




