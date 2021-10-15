
<%@page import="data.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String idx=request.getParameter("idx");
	CommentDao dao=new CommentDao();
	dao.deleteComment(idx);
%>