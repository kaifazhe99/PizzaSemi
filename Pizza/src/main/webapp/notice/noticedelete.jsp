<%@page import="data.dao.NoticeDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	NoticeDao dao=new NoticeDao();
	
	dao.deleteNotice(num);
%>