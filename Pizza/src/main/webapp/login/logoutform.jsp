<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div style="margin-left: 100px; margin-top: 50px;">
	<img src="image/19.jpg" width="200" align="left" hspace="20">
	<%
		//세션으로부터 아이디를 얻는다
		String myid=(String)session.getAttribute("myid");
		//db로 부터 아이디에 해당하는 이름을 얻는다
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
	%>
	<br><br>
	<b><%=name %>님</b><br><br><br><br>
	<button type="button" class="btn btn-danger" style="width: 100px;"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
</div>

</body>
</html>