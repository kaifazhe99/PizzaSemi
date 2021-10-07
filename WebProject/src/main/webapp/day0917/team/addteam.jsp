<%@page import="team.TeamDto"%>
<%@page import="team.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
	//입력값 읽기
	String name=request.getParameter("name");
	String driver=request.getParameter("driver");
	//System.out.println(driver);//확인,체크안할경우 null,체크할경우 on
	String addr=request.getParameter("addr");
	
	//dto 선언
	TeamDto dto=new TeamDto();
	dto.setName(name);
	dto.setDriver(driver==null?"없음":"있음");
	dto.setAddr(addr);
	
	//dao 선언
	TeamDao dao=new TeamDao();
	//insert 메서드 호출
	dao.teamInsert(dto);
	
	//목록파일로 이동
	response.sendRedirect("teamlist.jsp");//해당파일로 이동
%>




