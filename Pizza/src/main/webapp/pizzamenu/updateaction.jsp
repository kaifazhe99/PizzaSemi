<%@page import="data.dao.PizzamenuDao"%>
<%@page import="data.dto.PizzamenuDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션으로부터 db 에 저장할 아이디 얻기
	String myid=(String)session.getAttribute("myid");
	//이미지가 업로드될 실제 경로 구하기
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2;//2mb
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
		//(주의)request 가 아닌 multi 변수로 모든 폼데이타를 읽어야한다
		String num=multi.getParameter("num");
		
		
		
		PizzamenuDao dao=new PizzamenuDao();
		String gu_photoname=dao.getData(num).getPhotoname();
		
		String pname=multi.getParameter("pname");
		String price=multi.getParameter("price");
		String content=multi.getParameter("content");
		String photoname=multi.getFilesystemName("photo");
		
		//dto 에 저장
		PizzamenuDto dto=new PizzamenuDto();
		dto.setNum(num);
		dto.setMyid(myid);
		dto.setPname(pname);
		dto.setPrice(price);
		dto.setContent(content);
		dto.setPhotoname(photoname==null?gu_photoname:photoname);
		
		//update
		dao.updatePizzamenu(dto);
		//방명록목록으로 이동
		String path="../index.jsp?main=pizzamenu/menulist.jsp";
		response.sendRedirect(path);
	}catch(Exception e){
		System.out.println("업로드오류:"+e.getMessage());
	}
 %>