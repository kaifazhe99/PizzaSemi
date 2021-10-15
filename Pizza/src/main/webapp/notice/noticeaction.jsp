<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩
	request.setCharacterEncoding("UTF-8");
	String myid=(String)session.getAttribute("myid");
	//데이터 읽어서 dto에 넣기
	NoticeDto dto=new NoticeDto();
	
	dto.setMyid(myid);
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	//db insert
	NoticeDao dao=new NoticeDao();
	dao.insertNotice(dto);
	
	//일단 목록으로 간다음 나중에 detail 페이지로 가는거로 수정하기
	/*String path="../index.jsp?main=board/boardlist.jsp";
	response.sendRedirect(path);*/
	
	//방금 추가된 num값 얻기
	String num=dao.getMaxNum();
	String path="../index.jsp?main=board/detail.jsp?num="+num;
	response.sendRedirect(path);
%>