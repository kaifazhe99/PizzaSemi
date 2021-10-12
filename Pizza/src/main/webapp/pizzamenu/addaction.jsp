<%@page import="data.dao.PizzamenuDao"%>
<%@page import="data.dto.PizzamenuDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//이미지가 업로드될 실제 경로 구하기
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2;//2mb
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
		//(주의)request 가 아닌 multi 변수로 모든 폼데이타를 읽어야한다
		String pname=multi.getParameter("pname");
		String price=multi.getParameter("price");
		String content=multi.getParameter("content");
		String photoname=multi.getFilesystemName("photo");//실제 업로드된 파일명
		//dto 에 저장
		PizzamenuDto dto=new PizzamenuDto();
		dto.setPname(pname);
		dto.setPrice(price);
		dto.setContent(content);
		dto.setPhotoname(photoname);
		
		//dao 선언
		PizzamenuDao dao=new PizzamenuDao();
		//insert
		dao.insertPizza(dto);
		//방명록목록으로 이동
		response.sendRedirect("../index.jsp?main=pizzamenu/menuaddform.jsp?");
	}catch(Exception e){
		System.out.println("업로드오류:"+e.getMessage());
	}


%>