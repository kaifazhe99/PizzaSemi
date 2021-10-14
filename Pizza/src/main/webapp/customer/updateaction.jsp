<%@page import="data.dao.CustomerDao"%>
<%@page import="data.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이터 읽어서 dto 에 넣기
	CustomerDto dto=new CustomerDto();
	String num=request.getParameter("num");
	String myid=(String)session.getAttribute("myid");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setSubject(subject);
	dto.setContent(content);
	
	CustomerDao dao=new CustomerDao();
	dao.updateCustomer(dto);
	
	response.sendRedirect("../index.jsp?main=customer/customerlist.jsp");
%>