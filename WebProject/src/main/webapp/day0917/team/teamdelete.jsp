<%@page import="team.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num 읽기
	String num=request.getParameter("num");
	//dao 선언
	TeamDao dao=new TeamDao();
	//삭제 메서드 호출
	dao.teamDelete(num);
	//teamlist.jsp 로 이동
	response.sendRedirect("teamlist.jsp");
%>