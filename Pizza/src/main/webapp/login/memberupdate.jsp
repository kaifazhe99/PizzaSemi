<%@page import="MemberDao.MemberDao"%>
<%@page import="MemberDto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이터 읽어서 dto 넣기
	MemberDto dto=new MemberDto();
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addressName1")+","+request.getParameter("addressName2");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	dto.setNum(num);
	dto.setName(name);
	dto.setPass(pass);
	dto.setAddr(addr);
	dto.setHp(hp);
	dto.setEmail(email);
	
	//dao 선언후 update 메서드 호출
	MemberDao dao=new MemberDao();
	dao.updateMember(dto);
	
	String path="../index.jsp?main=login/mypageform.jsp?num="+num;
	
	response.sendRedirect(path);
%>

	
