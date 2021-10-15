<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
   	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	//dao 선언
	MemberDao dao=new MemberDao();
	//비번체크후 맞을경우 삭제, 틀릴경우 경고후 이전페이지로 가기
	boolean b=dao.isPassEqual(num, pass);
	if(b){
		dao.deleteMember(num);
		response.sendRedirect("index.jsp");
		
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			history.back();
		</script>
	<%}
	
%>
