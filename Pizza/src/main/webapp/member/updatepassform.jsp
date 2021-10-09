<%@page import="MemberDao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String key=request.getParameter("key");
	String num=request.getParameter("num");
	if(key==null){//form
	%>
		<div style="margin-left: 200px;">
			<form action="member/updatepassform.jsp" method="post">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="key" value="yes">
				<b>수정시 필요한 비밀번호를 입력해주세요</b>
				<br><br>
				<div class="form-inline">
					<input type="password" name="pass" class="form-control"
					style="width: 120px;" required="required" autofocus="autofocus">
					<button type="submit" class="btn btn-info">확인</button>
				</div>
			</form>
		</div>
		
	<%}else{//action 처리
		//비번읽기
		String pass=request.getParameter("pass");
		//비번이 맞는지 체크
		MemberDao dao=new MemberDao();
		boolean b=dao.isPassEqual(num, pass);
		if(b){
			String path="../index.jsp?main=member/updateform.jsp?num="+num;
			response.sendRedirect(path);
		}else{%>
			<script type="text/javascript">
				alert("비밀번호는 틀렸어요");
				history.back();
			</script>
		<%}
				
	}
%>
</body>
</html>









