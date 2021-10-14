<%@page import="data.dao.CustomerDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	CustomerDao dao=new CustomerDao();
	
	dao.deleteCustomer(num);
	
	String realPath=getServletContext().getRealPath("/save");
	String cl="../index.jsp?main=customer/customerlist.jsp?currentPage="+currentPage;
	response.sendRedirect(cl);
%>