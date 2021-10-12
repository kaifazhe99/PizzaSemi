<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
	//세션값 얻기
	String saveok=(String)session.getAttribute("saveok");
	String myid="";
	if(saveok!=null) {
	myid=(String)session.getAttribute("myid");
}
%>

<body>
<h3 style="margin-left: 50px; margin-top: 50px; font-family: Black Han Sans;" >로그인</h3>
<div style="margin-left: 580px; margin-top: 50px;">
	<form action="login/loginaction.jsp" method="post" class="form-inline">
		<table class="table" style="width: 500px; border-bottom-color: white;">
			<tr>
				<td>
					<input type="text" name="id" class="form-control"
					autofocus="autofocus" required="required"
					style="width: 500px; height:60px;" placeholder="아이디를 입력해주세요" value="<%=myid%>">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 500px; height:60px;" placeholder="비밀번호를 입력해주세요">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="checkbox" name="cbsave" style="text-align: left;"
					<%=saveok==null?"":"checked" %>>아이디 저장
				</td>
			</tr>
			</table>
			<button type="submit" class="btn btn-danger" style="width: 500px; height:60px;
				border: 1px solid black; color:white;" >로그인</button><br><br>
			<button type="submit" class="btn btn-type-brd5" style="width: 500px; height:60px; border: 1px solid black;"
				onclick="location.href='index.jsp?main=member/memberform.jsp'">회원가입</button>
	</form>
</div>
<br>

</body>
</html>