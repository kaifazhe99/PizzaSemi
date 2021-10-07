<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num 읽기
	String num=request.getParameter("num");
	//dao 선언
	AjaxBoardDao db=new AjaxBoardDao();
	//num 에 해당하는 dto 얻기
	AjaxBoardDto dto=db.getData(num);
	//dto 를 json 으로 변환
	JSONObject ob=new JSONObject();
	//날짜 타입 문자열 지정
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	//json 에 데이타 추가하기
	ob.put("num",dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("avata",dto.getAvata());
	ob.put("writeday",sdf.format(dto.getWriteday()));	
%>
<%=ob.toString()%>





