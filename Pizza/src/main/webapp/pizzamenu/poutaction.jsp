<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	//loginok라는 세션 제거
	session.removeAttribute("loginok");
	//loginmain으로 이동
	String path="../index.jsp?main=pizzamenu/menulist.jsp";
	response.sendRedirect(path);
%>