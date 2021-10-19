
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
<%
	//id를 읽는다
	String id=request.getParameter("id");
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 대한 이름을 얻는다
	String name=dao.getName(id);
%>
<div style="margin-left:590px; width: 100%">
	<img src="member/good.png">
	<br>
	<b><%=name %>님의 회원가입을 축하합니다</b>
	<br><br>
	<button type="button" class="btn btn-info" style="margin-left: 200px; background-color: red; color: white;"
	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	
	<button type="button" class="btn btn-info" style="background-color: red; color: white;"
	onclick="location.href='index.jsp'">메인페이지</button>
	
</div>
<br><br>
</body>
</html>