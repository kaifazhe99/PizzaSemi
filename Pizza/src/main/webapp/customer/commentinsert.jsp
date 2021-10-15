<%@page import="data.dao.CommentDao"%>
<%@page import="data.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String currentPage=request.getParameter("currentPage");
	String num=request.getParameter("num");
	
	CommentDto dto=new CommentDto();
	dto.setNum(num);
	dto.setMyid(request.getParameter("myid"));
	dto.setContent(request.getParameter("content"));
	
	CommentDao dao=new CommentDao();
	dao.insertComment(dto);
	
	response.sendRedirect("../index.jsp?main=customer/detail.jsp?num="+num+"&currentPage="+currentPage);
%>