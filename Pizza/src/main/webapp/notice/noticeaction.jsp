<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	//엔코딩
	request.setCharacterEncoding("utf-8");
	String myid=(String)session.getAttribute("myid");
	//데이터 읽어서 dto에 넣기
	NoticeDto dto=new NoticeDto();

	dto.setMyid(myid);
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	//db insert
	NoticeDao dao=new NoticeDao();
	dao.insertNotice(dto);
	
	//일단 목록으로 간 다음 나중에 detail 페이지로 가는걸로 수정
	/* String path="../index.jsp?main=customer/customerlist.jsp";
	response.sendRedirect(path); */
	
	//방금 추가된 num 값 얻기
	String num=dao.getMaxNum();
	String path="../index.jsp?main=notice/noticelist.jsp?num="+num;
	response.sendRedirect(path);
%>