<%@page import="data.dao.NCommentDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String idx=request.getParameter("idx");
	NCommentDao dao=new NCommentDao();
	dao.deleteNComment(idx);
%>