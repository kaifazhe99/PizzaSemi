<%@page import="data.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String idx=request.getParameter("idx");
	CustomerDao dao=new CustomerDao();
	dao.deleteCustomer(idx);
%>