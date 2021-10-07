<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식으로 보낼것임
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String content=request.getParameter("ucontent");
	String avata=request.getParameter("uavata");
	
	//dto 선언
	AjaxBoardDto dto=new AjaxBoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setAvata(avata);
	
	//update
	AjaxBoardDao db=new AjaxBoardDao();
	db.updateBoard(dto);
%>




