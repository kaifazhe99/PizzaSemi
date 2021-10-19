<%@page import="MemberDto.MemberDto"%>
<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이타 읽어서 dto 에 넣기
	MemberDto dto=new MemberDto();
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String pass=request.getParameter("pass");
	String addr=request.getParameter("addr");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	
	dto.setNum(num);
	dto.setName(name);	
	dto.setAddr(addr);
	dto.setPass(pass);
	dto.setEmail(email);
	dto.setHp(hp);
	
	//dao 선언후 update 메서드 호출
	MemberDao dao=new MemberDao();
	dao.updateMember(dto);
	//목록으로 이동
	response.sendRedirect("index.jsp");
%>