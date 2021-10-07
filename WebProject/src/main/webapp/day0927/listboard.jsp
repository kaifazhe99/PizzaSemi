<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AjaxBoardDao db=new AjaxBoardDao();
	ArrayList<AjaxBoardDto> list=db.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	//json 라이브러리 이용해서 json 데이타 생성하기
	JSONArray arr=new JSONArray();
	for(AjaxBoardDto dto:list)
	{
		JSONObject ob=new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("writer",dto.getWriter());
		ob.put("subject",dto.getSubject());
		ob.put("content",dto.getContent());
		ob.put("avata",dto.getAvata());
		ob.put("writeday",sdf.format(dto.getWriteday()));		
		arr.add(ob);		
	}	
%>
<%=arr.toString()%>


