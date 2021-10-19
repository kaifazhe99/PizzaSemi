<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
	
	String currentPage=request.getParameter("currentPage");
	//데이터 읽어서 dto 에 넣기
	NoticeDto dto=new NoticeDto();
	String num=request.getParameter("num");
	String myid=(String)session.getAttribute("myid");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	dto.setNum(num);
	dto.setMyid(myid);
	dto.setSubject(subject);
	dto.setContent(content);
	
	NoticeDao dao=new NoticeDao();
	dao.updateNotice(dto);
	
	response.sendRedirect("../index.jsp?main=notice/detail.jsp?num="+num+"&currentPage="+currentPage);
%>