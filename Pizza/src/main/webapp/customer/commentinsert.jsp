<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	CommentDto dto=new CommentDto();
	dto.setNum(request.getParameter("num"));
	dto.setMyid(request.getParameter("myid"));
	dto.setContent(request.getParameter("content"));
	
	String currentPage=request.getParameter("currentPage");
	
	CommentDao dao=new CommentDao();
	dao.insertComment(dto);
	
	String path="../index.jsp?main=customer/detail.jsp?currentPage="+currentPage;
	response.sendRedirect(path);
%>