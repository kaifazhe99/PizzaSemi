<%@page import="data.dao.NCommentDao"%>
<%@page import="data.dto.NCommentDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String currentPage=request.getParameter("currentPage");
	String num=request.getParameter("num");
	
	NCommentDto dto=new NCommentDto();
	dto.setNum(num);
	dto.setMyid(request.getParameter("myid"));
	dto.setContent(request.getParameter("content"));
	
	NCommentDao dao=new NCommentDao();
	dao.insertNComment(dto);
	
	response.sendRedirect("../index.jsp?main=notice/detail.jsp?num="+num+"&currentPage="+currentPage);
%>