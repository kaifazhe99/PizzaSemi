<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
    String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave");//체크안하면 null
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPass(id, pass);
	//아이디와 비번이 맞으면 3개의 세션을 저장하고
	//로그인 메인으로 이동
	if(b){
		//세션유지시간(생략시 기본 30분)
		session.setMaxInactiveInterval(60*60*4);//4시간
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		//메인으로 이동
		response.sendRedirect("../index.jsp");
	}else{%>
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 맞지 않습니다");
			history.back();
		</script>
	
	<%}		
%>
