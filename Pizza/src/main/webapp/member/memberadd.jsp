
<%@page import="MemberDao.MemberDao"%>
<%@page import="MemberDto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
	//데이터 읽어서 dto 넣기
	MemberDto dto=new MemberDto();
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addressName1")+","+request.getParameter("addressName2");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass);
	dto.setAddr(addr);
	dto.setEmail(email);
	dto.setHp(hp);
	
	//dao 선언후 insert 메서드 호출
	MemberDao dao=new MemberDao();
	dao.insertMember(dto);
	
	//gaipsuccess.jsp로 이동
	response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
%>












