<%@page import="data.dao.PizzamenuDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//주의: db삭제뿐만 아니라 업로드된 파일도 삭제해보자
	//num받아오기
	String num=request.getParameter("num");
	
	//db로부터 저장된 이미지명 얻기
	PizzamenuDao dao=new PizzamenuDao();
	String photoname=dao.getData(num).getPhotoname();
	
	//db삭제
	dao.deletePizzamenu(num);
	//파일삭제
	String realPath=getServletContext().getRealPath("/save");
	//파일 객체 생성
	File file=new File(realPath+"\\"+photoname);
	//파일삭제
	file.delete();
	
	
	//보던페이지로 이동
	String go="../index.jsp?main=pizzamenu/menulist.jsp";
	response.sendRedirect(go);
%>