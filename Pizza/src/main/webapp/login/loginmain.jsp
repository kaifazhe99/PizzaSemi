<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션에 저장된 loginok를 읽는다
	//로그인 성공시 저장하고 로그아웃시 제거한다
	String loginok=(String)session.getAttribute("loginok");
	if(loginok==null)
	{%>
		<jsp:include page="loginform.jsp"></jsp:include>
	<%}else{ %>
		<jsp:include page="logoutform.jsp"></jsp:include>
	<%}
%>
</body>
</html>